--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MerchantApp.MerchantRequirementsEntry (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("RarityDB")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("PlatformM")
local v_u_6 = v1("GrammarUtil")
local v_u_7 = v1("Maid")
local v8 = v1("Class")("MerchantRequirements", (v1("UIBaseElement")))
local v9 = game:GetService("Players")
local v_u_10 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v9.LocalPlayer)
local v_u_11 = {
    ["pets"] = "Pets",
    ["pet_accessories"] = "Pet Wear",
    ["strollers"] = "Strollers",
    ["food"] = "Food",
    ["transport"] = "Vehicles",
    ["toys"] = "Toys",
    ["gifts"] = "Gifts",
    ["stickers"] = "Stickers"
}
function v8._clear(p12)
    for _, v13 in p12.slots:GetChildren() do
        if v13:IsA("GuiObject") then
            v13:Destroy()
        end
    end
end
function v8._hook_remove_item(p_u_14, p15, p_u_16)
    p_u_14.maid:GiveTask(p15[v_u_5.mouse_down_or_click()]:Connect(function()
        p_u_14.remove_callback(p_u_16)
    end))
end
function v8._hook_pick_item(p_u_17, p18, p_u_19)
    p_u_17.maid:GiveTask(p18[v_u_5.mouse_down_or_click()]:Connect(function()
        p_u_17.pick_callback(p_u_19)
    end))
end
function v8._create_completed_entry(p20, p21, p22)
    local v23 = v_u_4.get("inventory")[p21.category][p22]
    if v23 then
        local v24 = p20.slot_template:Clone()
        v24.Item.Visible = true
        v24.Icons.Visible = false
        v24.Added.Visible = true
        v24.Add.Visible = false
        p20.UIManager.wrap(v24.Item, "ItemDataImage"):start({
            ["item_data"] = v23
        })
        if v23.properties then
            p20.UIManager.wrap(v24.Item, "TagDisplay"):start({
                ["properties"] = v23.properties
            })
        end
        p20.maid:GiveTask(p20.UIManager.apps.MerchantApp.tooltip:hook_on_hover({
            ["frame"] = v24.Item,
            ["type"] = "item_data",
            ["item_data"] = v23
        }))
        p20:_hook_remove_item(v24, p21)
        return v24
    end
end
function v8._create_kind_entry(p25, p26)
    local v27 = v_u_2[p26.category][p26.kind]
    local v28 = p25.slot_template:Clone()
    v28.Item.Visible = true
    v28.Icons.Visible = false
    p25.UIManager.wrap(v28.Item, "ItemImage"):start({
        ["entry"] = v27
    })
    if p26.properties then
        p25.UIManager.wrap(v28.Item, "TagDisplay"):start({
            ["properties"] = p26.properties
        })
    end
    v28.Item.ItemImageTemplate.ImageTransparency = 0.6
    p25:_hook_pick_item(v28, p26)
    return v28
end
function v8._create_rarity_entry(p29, p30)
    local v31 = p29.slot_template:Clone()
    v31.Item.Visible = true
    v31.Icons.Visible = true
    for _, v32 in v31.Icons:GetChildren() do
        v32.Visible = v32.Name == p30.category
        v32.ImageColor3 = v_u_3[p30.rarity].color
    end
    if p30.properties then
        p29.UIManager.wrap(v31.Item, "TagDisplay"):start({
            ["properties"] = p30.properties
        })
    end
    p29:_hook_pick_item(v31, p30)
    return v31
end
function v8._update_text_label(p33, p34)
    local v35 = p34[1]
    if v35.requirement_type == "kind" then
        local v36 = v_u_2[v35.category][v35.kind]
        local v37 = v_u_6.append_properties(v36.name, v35.properties)
        if #p34 > 1 then
            p33.text_label.Text = ("%s: %i"):format(v37, #p34)
        else
            p33.text_label.Text = v37
        end
    elseif v35.requirement_type == "rarity" then
        local v38 = v_u_3[v35.rarity]
        local v39 = v_u_6.append_properties(v_u_11[v35.category], v35.properties)
        local v40 = v_u_10:translate(game, v38.name)
        if v35.origin_item then
            local v41 = nil
            for _, v42 in v_u_2 do
                local v43 = v42[v35.origin_item]
                if v43 then
                    v41 = v43.name
                    break
                end
            end
            local v44 = v_u_10:translate(game, v41)
            p33.text_label.Text = ("%s: %i %s (%s)"):format(v39, #p34, v40, v44)
        else
            p33.text_label.Text = ("%s: %i %s"):format(v39, #p34, v40)
        end
    else
        error("Requirement type not recognized: " .. v35.requirement_type)
    end
    if not p33.text_label.TextFits then
        p33.text_label.AutomaticSize = Enum.AutomaticSize.Y
        p33.text_label.TextWrapped = true
    end
end
function v8.start(p45, p46)
    p45.maid = v_u_7.new()
    p45.pick_callback = p46.pick_callback
    p45.remove_callback = p46.remove_callback
    local v47 = p46.requirements_by_type
    local v48 = p46.item_list
    p45.text_label = p45.instance.TextLabel
    p45.text_label.AutoLocalize = false
    p45.slots = p45.instance.Slots
    p45.slot_template = p45.slots.SlotTemplate
    p45.slot_template.Parent = nil
    p45:_update_text_label(v47)
    p45:_clear()
    for v49, v50 in v47 do
        local v51 = nil
        if v48[v50.unique] then
            v51 = p45:_create_completed_entry(v50, v48[v50.unique])
        elseif v50.requirement_type == "kind" then
            v51 = p45:_create_kind_entry(v50)
        elseif v50.requirement_type == "rarity" then
            v51 = p45:_create_rarity_entry(v50)
        else
            error("Requirement type not recognized: " .. v50.requirement_type)
        end
        v51.Name = v50.unique
        v51.LayoutOrder = v49
        v51.Parent = p45.slots
    end
    return p45
end
function v8.destroy(p52)
    p52.maid:DoCleaning()
end
return v8