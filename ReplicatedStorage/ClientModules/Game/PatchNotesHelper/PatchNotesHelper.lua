--// ReplicatedStorage.ClientModules.Game.PatchNotesHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("CloudValues")
local v_u_5 = v_u_1("ColorThemeManager")
local v_u_6 = v_u_1("LocalizationCommon")
local v_u_7 = v_u_1("Maid")
local v_u_8 = v_u_1("new:PatchNotesFormatter")
local v_u_9 = v_u_1("new:PatchNotesSpecific")
local v_u_10 = v_u_1("new:RichTextHelper")
local v_u_11 = v_u_1("ServerType")
local v_u_12 = v_u_1("package:Sift")
local v13 = v2("PatchNotesHelper")
function v13.__init(p_u_14, p15, p16)
    p_u_14.parent = p15
    p_u_14.templates = p16
    p_u_14.formatter = v_u_8.new()
    p_u_14.block_index = 0
    p_u_14.locale_id = game.Players.LocalPlayer.LocaleId
    v_u_5.get_theme_changed_signal():Connect(function()
        p_u_14.formatter = v_u_8.new()
    end)
    p_u_14.maid = v_u_7.new()
end
function v13.has_patch_notes(_)
    if not v_u_4:getValue("patch_notes", "show_on_production") and v_u_11.use_production_behavior() then
        return false
    end
    local v17 = v_u_4:getValue("patch_notes", "patch_notes")
    return next(v17) ~= nil
end
function v13.get_latest_id(p18)
    if p18:has_patch_notes() then
        return v_u_4:getValue("patch_notes", "patch_notes")[1]._id
    else
        return nil
    end
end
function v13.get_latest_viewed_id(_)
    return v_u_3.get("last_viewed_patch_notes")
end
function v13.render_patch_notes(p19)
    p19:cleanup()
    p19.block_index = 0
    local v20 = v_u_4:getValue("patch_notes", "max_patch_note_count")
    local v21 = v_u_4:getValue("patch_notes", "patch_notes")
    for v22 = 1, v20 do
        if v21[v22] then
            if v22 > 1 then
                p19:_render_block({
                    ["type"] = "separator",
                    ["text"] = ""
                })
            end
            p19:_render_patch_note(v21[v22], v22)
        end
    end
end
function v13.cleanup(p23)
    p23.maid:DoCleaning()
end
function v13._get_translators(p24, p25)
    local v26 = Instance.new("LocalizationTable")
    local v27 = {}
    for _, v28 in { "title", "body" } do
        local v30 = {
            ["Key"] = v28,
            ["Source"] = v28,
            ["Context"] = v28,
            ["Values"] = v_u_12.Dictionary.map(p25[v28], function(p29)
                return p29.value, v_u_6.normalize_locale_roblox(p29._key)
            end)
        }
        table.insert(v27, v30)
    end
    v26:SetEntries(v27)
    return v26:GetTranslator(p24.locale_id), v26:GetTranslator("en-us")
end
function v13._render_block(p31, p32, p33)
    p31.block_index = p31.block_index + 1
    local v34 = p32.type
    local v35 = p31.templates[v34]:Clone()
    v35.LayoutOrder = p31.block_index
    p31.maid:GiveTask(v35)
    if v34 == "default" or (v34 == "right_aligned" or v34 == "heading") then
        v35.TextLabel.Text = p32.text
    elseif v34 == "image" then
        v35.Image = p32.text
    elseif v34 == "generated_image" then
        v_u_1("UIManager").wrap(v35, "PatchNotesHeader"):start(p32.data.timestamp)
    elseif v34 == "blockquote" and p32.text ~= "" then
        p31:_render_block({
            ["type"] = "default",
            ["text"] = p32.text
        }, v35.Children)
    elseif v34 == "table" then
        local v36 = v_u_1("UIManager").wrap(v35, "PatchNotesTable")
        v36:start(p32, p31.formatter)
        p31.maid:GiveTask(v36)
    end
    p31.maid:GiveTask(v35)
    if p32.blocks then
        for _, v37 in p32.blocks do
            p31:_render_block(v37, v35.Children)
        end
    end
    v35.Parent = p33 or p31.parent
end
function v13._render_patch_note(p38, p39, p40)
    local v_u_41, v42 = p38:_get_translators(p39)
    local v_u_43 = "title"
    local v44, v45 = pcall(function()
        return v_u_41:FormatByKey(v_u_43)
    end)
    if not v44 then
        v45 = v42:FormatByKey("title")
    end
    local v_u_46 = "body"
    local v47, v48 = pcall(function()
        return v_u_41:FormatByKey(v_u_46)
    end)
    if not v47 then
        v48 = v42:FormatByKey("body")
    end
    local v49 = DateTime.fromIsoDate(p39.publishedDate)
    local v50 = v49:FormatLocalTime("ll", p38.locale_id)
    local v51 = p39.robloxBanner
    local v52 = nil
    local v53
    if v51.customImage and (v51.customImage.enabled and v51.customImage.image) then
        v53 = v51.customImage.image
    else
        v53 = v51.useGameThumbnail and p40 == 1 and "rbxthumb://type=GameThumbnail&id=920587237&w=768&h=432" or v52
    end
    local v54 = {
        ["type"] = v53 and "image" or "generated_image",
        ["text"] = v53 or nil
    }
    local v55
    if v53 then
        v55 = nil
    else
        v55 = {}
        local v56 = v49.UnixTimestamp
        v55.timestamp = math.floor(v56)
    end
    v54.data = v55
    p38:_render_block(v54)
    p38:_render_block({
        ["type"] = "heading",
        ["text"] = v45:gsub("(.*)", p38.formatter.heading_1)
    })
    p38:_render_block({
        ["type"] = "right_aligned",
        ["text"] = v50:gsub("(.*)", p38.formatter.heading_5)
    })
    for _, v57 in v_u_10.convert(v48, v_u_9, p38.formatter) do
        p38:_render_block(v57)
    end
end
return v13