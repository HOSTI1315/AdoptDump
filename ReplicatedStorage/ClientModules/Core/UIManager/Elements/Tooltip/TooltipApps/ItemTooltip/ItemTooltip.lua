--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.TooltipApps.ItemTooltip (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("ItemDB")
local v_u_5 = v1("RarityDB")
v1("RouterClient")
local v_u_6 = v1("package:Sift")
local v7 = game:GetService("Players")
local v_u_8 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v7.LocalPlayer)
local v_u_9 = v1("TooltipHelper")
local v10 = v2("ItemTooltip", v1("UIBaseElement"))
local v_u_11 = {
    ["NONE"] = {},
    ["HOVER"] = {
        ["title"] = true,
        ["description"] = true
    }
}
function v10._set_components_visible(p12, p13)
    local v14 = false
    for v15, v16 in pairs(p12.components) do
        local v17 = p13[v15] and true or false
        v16:set_visible(v17)
        if v17 then
            v14 = true
        end
    end
    p12.tooltip:set_visible(v14)
end
function v10._get_divider_visibility(p18, p19)
    local v20 = {}
    if p18.watched_item_entry then
        v20.dividerC = true
        return v20
    else
        if p18.watched_item_data then
            v20.dividerA = not p19
            v20.dividerB = not p19
            v20.dividerC = p19
        end
        return v20
    end
end
function v10._init_components(p21)
    p21.components.dividerB:set_options({
        ["line_visible"] = true,
        ["padding_top"] = 12,
        ["padding_bottom"] = 4,
        ["padding_left"] = 5,
        ["padding_right"] = 18
    })
    p21.components.dividerC:set_options({
        ["line_visible"] = false,
        ["padding_top"] = 12,
        ["padding_bottom"] = 4,
        ["padding_left"] = 5,
        ["padding_right"] = 18
    })
    p21.tooltip:refresh()
end
function v10._update_watched(p22, p23)
    if p22.enabled then
        local v24 = p22.watched_item_entry or p22.watched_item_data
        assert(v24, "Tooltip is not watching anything.")
        local v25 = p22.watched_item_entry
        local v26, v27
        if p22.watched_item_data then
            local v28 = p22.watched_item_data
            v25 = v_u_4[v28.category][v28.kind]
            local v29 = v_u_9.get_item_data_description(v28, v25, nil, p22.options)
            v26 = v29.paragraphs
            v27 = v29.empty
        else
            v27 = true
            v26 = {}
        end
        local v30 = v_u_5[v25.displayed_rarity or (v25.rarity or "common")]
        local v31 = v_u_8:Translate(workspace, v30.name)
        local v32 = v25.name
        if p23.name_strikethrough then
            v32 = "<s> " .. v32 .. " </s>"
        end
        local v33 = p22.components.title
        local v34 = {
            ["image"] = v25.image,
            ["flipbook_properties"] = v25.flipbook_properties,
            ["header_text"] = v32
        }
        local v35 = v30.color
        local v36 = v35.r * 255
        local v37 = math.round(v36)
        local v38 = v35.g * 255
        local v39 = math.round(v38)
        local v40 = v35.b * 255
        v34.sub_header_text = ("<font color= \"rgb(%s, %s, %s)\">%s</font>"):format(v37, v39, math.round(v40), "\226\151\134  ") .. v31
        v34.exit_button_space = false
        v34.favorite_background = false
        v33:set_options(v34)
        p22.components.description:set_options({
            ["min_height"] = 0,
            ["max_height"] = 116,
            ["auto_localize"] = false,
            ["paragraphs"] = v26
        })
        local v41 = v_u_6.Dictionary.merge(v_u_11.HOVER, p22:_get_divider_visibility(v27))
        if v27 then
            v41.description = false
        end
        p22:_set_components_visible(v41)
        p22.tooltip:refresh()
    end
end
function v10.start(p_u_42, p43, p_u_44, p45)
    p_u_42.app = p43
    p_u_42.options = p45
    local v_u_46 = p43.instance
    local v_u_47 = Vector2.new(0, 0)
    local v_u_48 = UDim2.new(0, 0, 0, 0)
    local v49 = {
        ["phone"] = function()
            v_u_47 = Vector2.new(0.5, 1)
            v_u_48 = UDim2.new(0.5, 0, 1, 0)
        end,
        ["tablet"] = function()
            v_u_46 = p_u_44
            v_u_47 = Vector2.new(0.5, 1)
            v_u_48 = UDim2.new(0.5, 0, 0, -15)
        end
    }
    v_u_3.run(v49)
    p_u_42.enabled = true
    p_u_42.tooltip = p_u_42.UIManager.wrap(v_u_46, "Tooltip")
    p_u_42.tooltip:start(p43.instance, v_u_47, v_u_48)
    local function v_u_52(p50)
        local v51 = p_u_42.tooltip:get_container()
        if p50 then
            v51.Parent = p_u_44
            v51.Position = UDim2.new(0.5, 0, 0, -15)
            v51.AnchorPoint = Vector2.new(0.5, 1)
        else
            v51.Parent = v_u_46
            v51.Position = v_u_48
            v51.AnchorPoint = v_u_47
        end
    end
    local v_u_54 = v_u_3.get_gamepad_changed():Connect(function(p53)
        v_u_52(p53)
    end)
    v_u_52(v_u_3.is_using_gamepad())
    local v_u_55 = nil
    v_u_55 = p_u_42.tooltip:get_container().Destroying:Connect(function()
        v_u_55:Disconnect()
        v_u_54:Disconnect()
    end)
    p_u_42.components = {
        ["title"] = p_u_42.tooltip:add_component("title", "ImageTitle"),
        ["dividerA"] = p_u_42.tooltip:add_component("dividerA", "Divider"),
        ["description"] = p_u_42.tooltip:add_component("description", "TextBlock"),
        ["dividerB"] = p_u_42.tooltip:add_component("dividerC", "Divider"),
        ["dividerC"] = p_u_42.tooltip:add_component("dividerD", "Divider")
    }
    p_u_42.hover = p_u_42.tooltip:get_hover()
    local v56 = {
        ["valid_platforms"] = {
            ["desktop"] = true,
            ["console"] = true,
            ["tablet"] = true,
            ["phone"] = true
        },
        ["position"] = {
            ["x_clamped"] = false,
            ["y_clamped"] = false,
            ["x_flip"] = false,
            ["y_flip"] = false
        }
    }
    p_u_42.hover:set_options(v56)
    p_u_42.watched_item_data = nil
    p_u_42.watched_item_entry = nil
    p_u_42:_init_components()
    return p_u_42
end
function v10.set_enabled(p57, p58)
    if not p58 then
        p57:hide()
    end
    p57.enabled = p58
end
function v10.set_hover_options(p59, p60)
    p59.hover:set_options(p60)
end
function v10.set_mouse_leave_frame(p_u_61, p62)
    p62.MouseLeave:Connect(function()
        p_u_61:hide()
    end)
end
function v10.hide(p63)
    p63:_set_components_visible(v_u_11.NONE)
    p63.watched_item_data = nil
    p63.watched_item_entry = nil
end
function v10.hook_on_hover(p_u_64, p_u_65)
    return p_u_64.hover:set_hover_callbacks({
        ["frame"] = p_u_65.frame,
        ["on_enter"] = function()
            if p_u_65.type == "item_data" or p_u_65.type == "item_entry" then
                p_u_64.watched_item_data = p_u_65.item_data
                p_u_64.watched_item_entry = p_u_65.item_entry
                p_u_64:_update_watched({
                    ["name_strikethrough"] = p_u_65.name_strikethrough
                })
            elseif p_u_65.type == "callback" then
                p_u_65.callback()
            end
        end,
        ["on_exit"] = function()
            p_u_64:hide()
        end
    })
end
return v10