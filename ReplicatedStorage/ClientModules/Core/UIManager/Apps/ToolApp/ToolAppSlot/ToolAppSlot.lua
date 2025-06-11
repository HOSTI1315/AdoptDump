--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ToolApp.ToolAppSlot (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("ClickTapInWorldExclusionList")
local v_u_4 = v1("InventoryDB")
local v_u_5 = v1("PlatformM")
local v6 = v1("TweenHelper")
local v_u_7 = v1("TweenPromise")
local v_u_8 = v1("ShakePromise")
local v_u_9 = v1("new:TextUtil")
local v_u_10 = v1("package:Sift")
local v11 = v1("UIBaseElement")
local v12, v_u_13 = v1("Class")("ToolAppSlot", v11)
local v_u_14 = game:GetService("ContextActionService")
Vector2.new((1 / 0), (1 / 0))
local v_u_15 = v6.tween_info({
    ["time"] = 0.12
})
function v12.__init(p16, ...)
    v_u_13.__init(p16, ...)
    p16.tool = nil
    p16.hovering = false
    p16.using = false
    p16.awaiting_server = false
    p16.hidden = true
    p16.instance.UIScale.Scale = 0
    p16.instance.Visible = false
    p16.shake = nil
end
function v12.show(p17)
    if p17.hidden then
        p17.hidden = false
        p17.instance.UIScale.Scale = 0.1
        p17.instance.Visible = true
        v_u_7.new(p17.instance.UIScale, v_u_15, {
            ["Scale"] = 1
        })
        p17:_update_size()
        p17:update_stack_count()
    end
end
function v12.hide(p_u_18)
    if not p_u_18.hidden then
        p_u_18.hidden = true
        v_u_7.new(p_u_18.instance.UIScale, v_u_15, {
            ["Scale"] = 0
        }):andThen(function()
            if p_u_18.hidden then
                p_u_18.instance.Visible = false
            end
        end)
    end
end
function v12._set_visibility(p19, p20)
    if p20 then
        p19:show()
    else
        p19:hide()
    end
end
function v12._update_size(p21)
    if not p21.hidden then
        local v22
        if p21.hotbar.edit_mode then
            v22 = p21.hovering and 1 or 0.9
        elseif p21.using then
            v22 = 1.14
        elseif p21.hovering then
            v22 = p21.tool and 1.1 or 1
        else
            v22 = p21.tool and 1 or 0.9
        end
        v_u_7.new(p21.instance.Tool.UIScale, v_u_15, {
            ["Scale"] = v22
        })
    end
end
function v12._get_entry(p23)
    local v24 = p23.tool
    if v24 then
        v24 = p23.tool.entry
    end
    if not v24 and p23.hotbar_properties then
        v24 = v_u_4[p23.hotbar_properties.category][p23.hotbar_properties.kind]
    end
    return v24
end
function v12.update_stack_count(p_u_25)
    if p_u_25.hotbar_properties then
        local v26 = p_u_25:_get_entry()
        if v26 then
            local v27 = (v_u_2.get("inventory") or {})[v26.category]
            if v27 then
                local v28 = 0
                for _, v29 in v27 do
                    if p_u_25:is_hotbar_slot_for(v29) then
                        v28 = v28 + 1
                    end
                end
                local v30 = p_u_25.stack_count.TextLabel
                v30.Text = v28 >= 100 and "x99+" or ("x%i"):format(v28)
                v_u_9.on_text_bounds({
                    ["Instance"] = v30,
                    ["Text"] = v30.Text
                }, function(p31)
                    p_u_25.stack_count.Size = UDim2.fromOffset(p31.X + 18, 14)
                end)
                p_u_25.stack_count.Visible = v28 ~= 1
            end
        else
            return
        end
    else
        p_u_25.stack_count.Visible = false
        return
    end
end
function v12.update(p_u_32)
    local v33 = p_u_32.UIManager.apps.ToolApp.minigame_locked
    if v33 then
        p_u_32:_set_visibility(p_u_32.tool ~= nil)
    elseif p_u_32.hotbar.edit_mode then
        p_u_32:_set_visibility(p_u_32.hotbar_properties ~= nil)
    else
        p_u_32:_set_visibility(p_u_32.hotbar_properties ~= nil and true or p_u_32.tool ~= nil)
    end
    if not p_u_32.hidden then
        local v34 = p_u_32.slot_num
        local v35
        if p_u_32.hotbar_properties == nil or v_u_5.get_platform() ~= v_u_5.platform.desktop then
            v35 = false
        else
            v35 = p_u_32.gamepad_support:should_show_slot_num()
            if v35 then
                v35 = not v33
            end
        end
        v34.Visible = v35
        local v36 = p_u_32:_get_entry()
        if v36 then
            p_u_32.item_image:update_image(v36)
            local v37 = p_u_32.tag_display
            local v38
            if p_u_32.hotbar_properties then
                v38 = p_u_32.hotbar_properties.properties or nil
            else
                v38 = nil
            end
            v37:update_tags(v38)
        end
        if p_u_32.hotbar.edit_mode then
            p_u_32.item_image.image_label.ImageTransparency = 0
            p_u_32.instance.Close.Visible = not v_u_5.is_using_gamepad()
        elseif p_u_32.tool then
            p_u_32.item_image.image_label.ImageTransparency = 0
            local v39 = p_u_32.gamepad_support:should_show_close_button(p_u_32)
            local v40 = p_u_32.instance.Close
            if v39 then
                v39 = not v33
            end
            v40.Visible = v39
        else
            p_u_32.item_image.image_label.ImageTransparency = 0.5
            p_u_32.instance.Close.Visible = false
        end
        if p_u_32.hotbar.edit_mode then
            if not p_u_32.shake then
                p_u_32.shake = v_u_8.callback({
                    ["amplitude"] = 0.01,
                    ["frequency"] = 5,
                    ["time"] = 999,
                    ["decay_percent"] = 0
                }, function(p41)
                    p_u_32.instance.Tool.Position = UDim2.fromScale(0.5 + p41.X, 0.5 + p41.Y)
                end):finally(function()
                    p_u_32.instance.Tool.Position = UDim2.fromScale(0.5, 0.5)
                end)
            end
        elseif p_u_32.shake then
            p_u_32.shake:cancel()
            p_u_32.shake = nil
        end
        p_u_32:_update_size()
        p_u_32:update_stack_count()
    end
end
function v12.set_using(p42, p43)
    if p42.using ~= p43 then
        p42.using = p43
        p42:_update_size()
    end
end
function v12.set_tool(p44, p45)
    if not p45 or p44.tool and p45.item_data.unique ~= p44.tool.item_data.unique then
        p44:set_using(false)
    end
    p44.tool = p45
end
function v12.set_hotbar_properties(p46, p47)
    p46.hotbar_properties = p47
end
function v12.is_hotbar_slot_for(p48, p49)
    if not p48.hotbar_properties then
        return false
    end
    if p49.item_data then
        p49 = p49.item_data
    end
    if p48.hotbar_properties.kind ~= p49.kind then
        return false
    end
    local v50 = p48.hotbar_properties.unique
    return (not v50 or p49.unique == v50) and true or false
end
function v12._pick_best_tool(p_u_51)
    local v52 = v_u_2.get("inventory")
    local v53 = p_u_51.hotbar_properties.category
    local v54 = p_u_51.hotbar_properties.kind
    local v_u_55 = v_u_4[v53][v54]
    local v57 = v_u_10.Dictionary.values(v_u_10.Dictionary.filter(v52[v53], function(p56)
        return p_u_51:is_hotbar_slot_for(p56)
    end))
    table.sort(v57, function(p58, p59)
        if v_u_55.uses then
            local v60 = p58.properties and p58.properties.uses_left or v_u_55.uses
            local v61 = p59.properties and p59.properties.uses_left or v_u_55.uses
            if v60 ~= v61 then
                return v60 < v61
            end
        end
        return p58.newness_order > p59.newness_order
    end)
    return v57[1] or nil
end
function v12._on_key_shortcut(p62)
    if p62.tool then
        p62:unequip_tool()
    else
        local v63 = p62.hotbar_properties and p62:_pick_best_tool()
        if v63 then
            p62.hotbar:equip(v63)
        end
    end
end
function v12.set_index(p_u_64, p65)
    p_u_64.index = p65
    p_u_64.slot_num.Text = p65
    p_u_64.instance.LayoutOrder = p65
    local v66 = Enum.KeyCode:GetEnumItems()
    local v67 = v66[v_u_10.List.find(v66, Enum.KeyCode.Zero) + p_u_64.index]
    v_u_14:UnbindAction(p_u_64.action_key)
    v_u_14:BindAction(p_u_64.action_key, function(_, p68)
        if p68 == Enum.UserInputState.Begin then
            if p_u_64.hidden or p_u_64.hotbar.edit_mode then
                return
            elseif not p_u_64.UIManager.apps.ToolApp.minigame_locked then
                p_u_64:_on_key_shortcut()
            end
        else
            return
        end
    end, false, v67)
end
function v12.unequip_tool(p69)
    if p69.UIManager.apps.ToolApp.minigame_locked then
        return
    elseif p69.tool then
        p69.hotbar:unequip(p69.tool.item_data)
    end
end
function v12.start(p_u_70, p71, p72)
    p_u_70.hotbar = p71
    p_u_70.instance.Close.Selectable = false
    p_u_70.action_key = "Hotbar_" .. p72
    p_u_70.slot_num = p_u_70.instance.SlotNum
    p_u_70.slot_num.Visible = false
    p_u_70:set_index(p72)
    p_u_70.item_image = p_u_70.UIManager.wrap(p_u_70.instance.Tool.ItemImage, "ItemImage")
    p_u_70.item_image:start({})
    p_u_70.tag_display = p_u_70.UIManager.wrap(p_u_70.instance.Tags, "TagDisplay")
    p_u_70.tag_display:start({
        ["fixed_property_size"] = 15
    })
    p_u_70.stack_count = p_u_70.instance.StackCount
    p_u_70.stack_count.Visible = false
    p_u_70.instance.Tool.MouseEnter:connect(function()
        p_u_70.hovering = true
        p_u_70:_update_size()
    end)
    p_u_70.instance.Tool.MouseLeave:connect(function()
        p_u_70.hovering = false
        p_u_70:_update_size()
    end)
    p_u_70.instance.Close.MouseButton1Down:connect(function()
        if p_u_70.hotbar.edit_mode then
            p_u_70.hotbar:server_set_slot_properties(p_u_70.index, nil)
        elseif p_u_70.tool then
            p_u_70:unequip_tool()
        end
    end)
    p_u_70.instance.Tool.MouseButton1Down:connect(function()
        if p_u_70.hotbar.edit_mode then
            p_u_70.hotbar:pick_item_promise(p_u_70.index)
        elseif p_u_70.tool then
            p_u_70.gamepad_support:close()
            if v_u_5.is_using_gamepad() then
                p_u_70:unequip_tool()
                return
            end
            if next(p_u_70.tool.tool_entry) then
                p_u_70.tool:use("UIButton")
                return
            end
        elseif p_u_70.hotbar_properties then
            p_u_70.gamepad_support:close()
            local v73 = p_u_70:_pick_best_tool()
            if v73 then
                p_u_70.hotbar:equip(v73)
            end
        end
    end)
    v_u_3.register(30, function()
        if not (p_u_70.UIManager.apps.ToolApp.minigame_world_tap_enabled and (p_u_70.tool and next(p_u_70.tool.tool_entry))) then
            return "pass"
        end
        p_u_70.tool:use("WorldTap")
        return "sink"
    end)
    p_u_70.gamepad_support = p_u_70.hotbar.gamepad_support
    p_u_70.gamepad_support:hook_slot(p_u_70)
end
return v12