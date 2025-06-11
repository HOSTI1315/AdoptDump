--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.TooltipApps.BackpackTooltip (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("Maid")
local v_u_4 = v_u_1("PlatformM")
local v_u_5 = v_u_1("InventoryDB")
local v_u_6 = v_u_1("RarityDB")
local v_u_7 = v_u_1("ClientData")
local v_u_8 = v_u_1("ClientToolManager")
local v_u_9 = v_u_1("SoundPlayer")
local v_u_10 = v_u_1("EquippedPets")
local v_u_11 = v_u_1("CloudValues")
local v_u_12 = v_u_1("package:Sift")
local v_u_13 = v_u_1("TooltipHelper")
local v_u_14 = v_u_1("BackpackLockTracker")
local v_u_15 = v_u_1("BackpackFavoriteTracker")
local v16 = game:GetService("Players")
local v_u_17 = game:GetService("GuiService")
local v_u_18 = game:GetService("RunService")
local v_u_19 = game:GetService("UserInputService")
local v_u_20 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v16.LocalPlayer)
local v21 = v2("BackpackTooltip", v_u_1("UIBaseElement"))
local v_u_22 = {
    ["NONE"] = {},
    ["ADD_MORE"] = {
        ["add_more"] = true,
        ["dividerD"] = true
    },
    ["HOVER"] = {
        ["title"] = true,
        ["description"] = true
    },
    ["PINNED"] = {
        ["title"] = true,
        ["actions"] = true,
        ["list_toggle"] = true,
        ["description"] = true
    }
}
function v21._set_components_visible(p23, p24)
    local v25 = false
    for v26, v27 in pairs(p23.components) do
        local v28 = p24[v26] and true or false
        v27:set_visible(v28)
        if v28 then
            v25 = true
        end
    end
    p23.tooltip:set_visible(v25)
end
function v21._init_components(p_u_29)
    p_u_29.components.dividerC:set_options({
        ["line_visible"] = true,
        ["padding_top"] = 12,
        ["padding_bottom"] = 4,
        ["padding_left"] = 5,
        ["padding_right"] = 18
    })
    p_u_29.components.dividerD:set_options({
        ["line_visible"] = false,
        ["padding_top"] = 12,
        ["padding_bottom"] = 4,
        ["padding_left"] = 5,
        ["padding_right"] = 18
    })
    p_u_29.components.list:set_options({
        ["min_height"] = 0,
        ["max_height"] = 116
    })
    local v36 = {
        ["equip_callback"] = function(p30)
            if p_u_29.watched_item_data then
                local v31 = p_u_29.watched_item_data
                local v32 = {
                    ["desktop"] = function()
                        if p_u_29:check_if_close_override() then
                            p_u_29:close_pinned_console()
                        else
                            p_u_29:hide()
                        end
                    end,
                    ["console"] = "desktop",
                    ["phone"] = function()
                        p_u_29:hide()
                    end,
                    ["tablet"] = "phone"
                }
                v_u_4.run(v32)
                v_u_9.Interface:play("Tooltip/TooltipButtonClick")
                local v33 = p_u_29.BackpackApp:get_equip_override(v31.category).callback
                if v33 then
                    v33(v31, false, p30)
                end
            end
        end,
        ["favorite_callback"] = function()
            if p_u_29.watched_item_data then
                local v34 = v_u_15.is_favorite(p_u_29.watched_item_data)
                v_u_9.Interface:play(v34 and "Backpack/Unfavorite" or "Backpack/Favorite")
                v_u_15.set_favorite(p_u_29.watched_item_data, not v34)
                p_u_29:_update_watched_item_data()
                p_u_29.BackpackApp:refresh_rendered_items()
            end
        end,
        ["lock_callback"] = function()
            if p_u_29.watched_item_data then
                local v35 = v_u_14.is_locked(p_u_29.watched_item_data)
                v_u_9.FX:play("BambooButton")
                v_u_14.set_locked(p_u_29.watched_item_data, not v35)
                p_u_29:_update_watched_item_data()
                p_u_29.BackpackApp:refresh_rendered_items()
            end
        end
    }
    p_u_29.components.actions:set_options(v36)
    local v_u_37 = p_u_29.components.list
    local v_u_38 = p_u_29.components.list_toggle
    v_u_38:add_button("Toggle")
    v_u_38:set_button_options("Toggle", {
        ["text"] = "",
        ["callback"] = function()
            local v39 = not p_u_29.options_toggled
            local v40 = v_u_38:get_button_options("Toggle")
            if v39 then
                v40.text = "Hide"
            else
                v40.text = ("Options (%s)"):format(v_u_37:get_button_count())
            end
            v_u_38:set_button_options("Toggle", v40)
            p_u_29.options_toggled = v39
            if p_u_29.watched_item_data then
                p_u_29:_update_watched_item_data()
            end
        end
    })
    p_u_29.tooltip:refresh()
end
function v21._get_divider_visibility(p41, p42)
    local v43 = {
        ["dividerA"] = p41.pinned,
        ["dividerC"] = p41.pinned
    }
    if p41.pinned and p41.options_toggled then
        if p41.components.list:get_button_count() > 0 then
            v43.dividerB = true
            v43.dividerC = true
            return v43
        end
        if not p41.pinned then
            v43.dividerD = true
            return v43
        end
    else
        if not p42 then
            v43.dividerB = true
            v43.dividerC = true
            return v43
        end
        if not p41.pinned then
            v43.dividerD = true
        end
    end
    return v43
end
function v21._update_watched_item_data(p44)
    local v45 = p44.watched_item_data
    assert(v45, "Tooltip is not watching any item data.")
    local v46 = ((v_u_7.get("inventory") or {})[p44.watched_item_data.category] or {})[p44.watched_item_data.unique]
    if v46 then
        local v47 = p44.BackpackApp:get_stack_count(v46)
        local v48 = v_u_5[v46.category][v46.kind]
        local v_u_49 = v_u_13.get_item_data_description(v46, v48, v47)
        local v50 = v_u_8.is_equipped(v46)
        local v51 = v_u_15.is_favorite(v46)
        local v52 = v_u_14.is_locked(v46)
        local v53 = v_u_14.is_lockable(v46)
        local v54 = v_u_6[v48.displayed_rarity or (v48.rarity or "common")]
        local v55 = v_u_20:Translate(workspace, v54.name)
        local v56 = p44.components.title
        local v57 = {
            ["image"] = v48.image,
            ["flipbook_properties"] = v48.flipbook_properties
        }
        local v58
        if v46.category == "stickers" then
            v58 = Enum.ScaleType.Fit
        else
            v58 = nil
        end
        v57.image_scale_type = v58
        v57.header_text = v48.name
        local v59 = v54.color
        local v60 = v59.r * 255
        local v61 = math.round(v60)
        local v62 = v59.g * 255
        local v63 = math.round(v62)
        local v64 = v59.b * 255
        v57.sub_header_text = ("<font color= \"rgb(%s, %s, %s)\">%s</font>"):format(v61, v63, math.round(v64), "\226\151\134  ") .. v55
        v57.exit_button_space = p44.pinned
        v57.favorite_background = v51
        v56:set_options(v57)
        p44.components.description:set_options({
            ["min_height"] = 0,
            ["max_height"] = 116,
            ["auto_localize"] = false,
            ["paragraphs"] = v_u_49.paragraphs,
            ["on_click"] = v_u_49.lootbox_info_target and (function()
                v_u_1("new:StandardSequencePreviewClient").preview_sequence_async(v_u_49.lootbox_info_target)
            end or nil) or nil
        })
        local v65 = p44.BackpackApp:get_equip_override(v46.category)
        if v65 then
            v65 = v65.text
        end
        local v66 = v65 or (v50 and "Unequip" or "Equip")
        local v67 = v50 and "cancel" or "normal"
        local v68 = v46.category == "pets"
        local v69 = v_u_10.get_max_equip_count() > 1
        local v70 = not v50
        if v70 then
            if v68 then
                if v69 then
                    v70 = #v_u_10.get_my_equipped() > 0
                else
                    v70 = v69
                end
            else
                v70 = v68
            end
        end
        local v71 = v70 and v66 == "Equip" and "Equip Main" or v66
        local v72 = p44.components.actions
        v72:set_equip_text_state(v71, v67)
        v72:set_star_state(not v51)
        v72:set_lock_state(v52)
        v72:set_lock_button_visible(v53)
        v72:set_alt_equip_visible(v70)
        local v73 = v_u_12.Dictionary.merge(p44.pinned and v_u_22.PINNED or v_u_22.HOVER, p44:_get_divider_visibility(v_u_49.empty))
        if p44.pinned then
            v73.description = not p44.options_toggled
            v73.list_toggle = p44.components.list:get_button_count() > 0
            v73.list = p44.options_toggled
        end
        if v73.description and v_u_49.empty then
            v73.description = false
        end
        if v68 then
            local v74 = p44.pinned
            if not v74 then
                v69 = v74
            end
        else
            v69 = v68
        end
        v73.double_pet_certificate = v69
        p44:_set_components_visible(v73)
        p44.tooltip:refresh()
    else
        p44:hide()
    end
end
function v21._show_item_data(p_u_75, p76)
    p_u_75.watched_item_data = p76
    p_u_75:_update_watched_item_data()
    p_u_75.show_maid:GiveTask(v_u_18.Stepped:Connect(function()
        p_u_75:_update_watched_item_data()
    end))
    if p_u_75.pinned then
        p_u_75.options_toggled = true
        p_u_75.components.list_toggle:get_button_options("Toggle").callback()
    end
end
function v21._show_add_more(p77, p78, p79)
    p77:_set_components_visible(v_u_22.ADD_MORE)
    p77.components.add_more:set_options({
        ["header_text"] = p78,
        ["sub_header_text"] = p79
    })
    p77.tooltip:refresh()
end
function v21._hide_no_refresh(p80)
    p80.show_maid:DoCleaning()
    p80.hover:set_can_hover(true)
    p80.tooltip:set_exit_visible(false)
    p80:_set_components_visible(v_u_22.NONE)
    p80.watched_item_data = nil
    p80.pinned = false
end
function v21._retain_xbox_selected(p81)
    if p81.watched_item_data then
        local v82 = p81.BackpackApp.content:FindFirstChild(p81.watched_item_data.unique, true)
        if v82 then
            p81.BackpackApp.watch:select_object(v82.Button)
            return true
        end
        local v83 = p81.BackpackApp.content:FindFirstChild("Button", true)
        p81.BackpackApp.watch:select_object(v83)
    end
end
function v21._init_mobile_tap_to_leave(p_u_84)
    local v95 = {
        ["phone"] = function()
            local v_u_85 = p_u_84.tooltip:get_container()
            v_u_19.InputBegan:Connect(function(p86)
                if v_u_85.Visible and p86.UserInputType == Enum.UserInputType.Touch then
                    local v87 = v_u_19:GetMouseLocation() - v_u_17:GetGuiInset()
                    local v88 = v_u_85
                    local v89 = v87 - v88.AbsolutePosition
                    local v90
                    if v89.X >= 0 and (v89.Y > 0 and v89.X <= v88.AbsoluteSize.X) then
                        v90 = v89.Y <= v88.AbsoluteSize.Y
                    else
                        v90 = false
                    end
                    if not v90 then
                        local v91 = p_u_84.components.double_pet_certificate.instance
                        local v92 = v87 - v91.AbsolutePosition
                        local v93
                        if v92.X >= 0 and (v92.Y > 0 and v92.X <= v91.AbsoluteSize.X) then
                            v93 = v92.Y <= v91.AbsoluteSize.Y
                        else
                            v93 = false
                        end
                        if not v93 then
                            p_u_84.can_pin = false
                            p_u_84:hide()
                        end
                    end
                end
            end)
            v_u_19.InputEnded:Connect(function(p94)
                if not p_u_84.can_pin and p94.UserInputType == Enum.UserInputType.Touch then
                    v_u_18.RenderStepped:Wait()
                    p_u_84.can_pin = true
                end
            end)
        end,
        ["tablet"] = "phone"
    }
    v_u_4.run(v95)
end
function v21.start(p_u_96, p_u_97)
    p_u_96.BackpackApp = p_u_97
    local v_u_98 = Vector2.new(0, 0)
    local v_u_99 = UDim2.new(0, 0, 0, 0)
    local v104 = {
        ["phone"] = function()
            local v100 = p_u_97.instance.Frame.Body.ScrollComplex
            local v101 = v100.AbsolutePosition + v100.AbsoluteSize / 2
            v_u_98 = Vector2.new(0.5, 0.5)
            v_u_99 = UDim2.new(0, v101.X, 0.5, 0)
        end,
        ["tablet"] = function()
            local v102 = p_u_97.instance.Frame.Body.ScrollComplex
            local v103 = v102.AbsolutePosition + v102.AbsoluteSize / 2
            v_u_98 = Vector2.new(0.5, 0.5)
            v_u_99 = UDim2.new(0, v103.X, 0, v103.Y)
        end
    }
    v_u_4.run(v104)
    p_u_96.tooltip = p_u_96.UIManager.wrap(p_u_97.instance, "Tooltip")
    p_u_96.tooltip:start(p_u_97.instance, v_u_98, v_u_99)
    p_u_96.components = {
        ["add_more"] = p_u_96.tooltip:add_component("add_more", "TextTitle"),
        ["title"] = p_u_96.tooltip:add_component("title", "ImageTitle"),
        ["dividerA"] = p_u_96.tooltip:add_component("dividerA", "Divider"),
        ["actions"] = p_u_96.tooltip:add_component("actions", "BackpackActions"),
        ["list_toggle"] = p_u_96.tooltip:add_component("list_toggle", "ButtonList"),
        ["dividerB"] = p_u_96.tooltip:add_component("dividerB", "Divider"),
        ["description"] = p_u_96.tooltip:add_component("description", "TextBlock"),
        ["list"] = p_u_96.tooltip:add_component("list", "ButtonList"),
        ["dividerC"] = p_u_96.tooltip:add_component("dividerC", "Divider"),
        ["dividerD"] = p_u_96.tooltip:add_component("dividerD", "Divider"),
        ["double_pet_certificate"] = p_u_96.tooltip:add_component("double_pet_certificate", "Certification", p_u_96.tooltip.container)
    }
    p_u_96.components.double_pet_certificate:set_options({
        ["subscription_kind"] = "equip_2x_pets"
    })
    p_u_96.hover_active = true
    p_u_96.hover = p_u_96.tooltip:get_hover()
    local v105 = {
        ["valid_platforms"] = {
            ["desktop"] = true,
            ["console"] = true,
            ["tablet"] = false,
            ["phone"] = false
        },
        ["position"] = {
            ["x_clamped"] = false,
            ["y_clamped"] = false,
            ["x_flip"] = false,
            ["y_flip"] = false
        }
    }
    p_u_96.hover:set_options(v105)
    p_u_96.tooltip:set_exit_callback(function()
        v_u_9.Interface:play("Backpack/CloseTooltip")
        p_u_96:hide()
    end)
    p_u_97.scroll.Parent.MouseLeave:Connect(function()
        if not p_u_96.pinned then
            p_u_96:hide()
        end
    end)
    p_u_96.pinned = false
    p_u_96.can_pin = true
    p_u_96.options_toggled = false
    p_u_96.watched_item_data = nil
    p_u_96.show_maid = v_u_3.new()
    p_u_96:_init_components()
    p_u_96:_set_components_visible(v_u_22.NONE)
    p_u_96:_init_mobile_tap_to_leave()
    local function v_u_108(p106)
        local v107 = p_u_96.tooltip:get_container()
        if p106 then
            v107.Parent = p_u_97.instance.Frame
            v107.Position = UDim2.new(1, 15, 0, 0)
            v107.AnchorPoint = Vector2.new(0, 0)
        else
            v107.Parent = p_u_97.instance
            v107.Position = v_u_99
            v107.AnchorPoint = v_u_98
        end
    end
    v_u_4.get_gamepad_changed():Connect(function(p109)
        p_u_96:hide()
        v_u_108(p109)
    end)
    v_u_108(v_u_4.is_using_gamepad())
    return p_u_96
end
function v21.hide(p110)
    p110:_hide_no_refresh()
    if not v_u_11:getValue("optimization", "backpack_no_refresh_on_tooltip_hidden") then
        p110.BackpackApp:refresh_rendered_items()
    end
end
function v21.check_if_close_override(p111)
    local v112 = p111.pinned and v_u_17.SelectedObject
    if v112 then
        v112 = v_u_17.SelectedObject:IsDescendantOf(p111.tooltip:get_container())
    end
    return v112
end
function v21.is_pinned(p113)
    return p113.pinned
end
function v21.is_watched_item(p114, p115)
    if p114.watched_item_data and p115 then
        return p114.watched_item_data.unique == p115.unique
    end
end
function v21.close_pinned_console(p116)
    local v117 = p116.watched_item_data
    local v118 = p116:_retain_xbox_selected()
    p116:hide()
    v_u_9.Interface:play("Backpack/CloseTooltip")
    if v118 and v117 then
        p116:_show_item_data(v117, v_u_22.HOVER)
    end
end
function v21.is_visible(p119)
    return p119.tooltip:is_visible()
end
function v21.pin(p_u_120, p121, p122)
    if p_u_120.can_pin then
        p_u_120:hide()
        p_u_120.hover:set_can_hover(false)
        p_u_120.tooltip:set_exit_visible(true)
        p_u_120.pinned = true
        local v123 = p_u_120.components.list
        v123:clear_buttons()
        for v124, v125 in ipairs(p122) do
            v123:add_button(v124)
            v123:set_button_options(v124, v125)
        end
        v_u_9.Interface:play("Backpack/OpenTooltip")
        p_u_120:_show_item_data(p121, v_u_22.PINNED)
        local v126 = {
            ["desktop"] = function()
                if v_u_4.is_using_gamepad() then
                    p_u_120.BackpackApp.watch:select_object(p_u_120.components.actions:get_button("Equip"))
                else
                    p_u_120.hover:position_at_mouse()
                end
            end,
            ["console"] = "desktop"
        }
        v_u_4.run(v126)
    end
end
function v21.set_hover_active(p127, p128)
    p127.hover_active = p128
end
function v21.hook_on_hover(p_u_129, p_u_130)
    return p_u_129.hover:set_hover_callbacks({
        ["frame"] = p_u_130.frame,
        ["on_enter"] = function()
            if p_u_129.hover_active then
                p_u_129:_hide_no_refresh()
                if p_u_130.type == "item_data" then
                    p_u_129:_show_item_data(p_u_130.item_data, v_u_22.HOVER)
                elseif p_u_130.type == "add_more" then
                    p_u_129:_show_add_more(p_u_130.title, p_u_130.sub_title)
                end
            else
                return
            end
        end,
        ["on_exit"] = function()
            p_u_129:hide()
        end
    })
end
return v21