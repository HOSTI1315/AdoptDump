--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ToolApp.ToolAppGamepadSupport (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("PlatformM")
local v_u_3 = v1("XboxSupport")
local v_u_4 = v1("package:Sift")
local v5 = v1("Class")
local v_u_6 = game:GetService("GuiService")
local v_u_7 = {
    ["holdables"] = 3,
    ["transport"] = 2,
    ["pets"] = 1
}
local v8, v_u_9 = v5("ToolAppGamepadSupport", v1("UIBaseElement"))
function v8.__init(p10, ...)
    v_u_9.__init(p10, ...)
    p10.is_object_selected = nil
    p10.unequip_slot = nil
    p10.gamepad_icon = nil
    p10.signal_open = nil
    p10.signal_close = nil
    p10.watch = nil
end
function v8.open(p11)
    if p11.signal_open then
        p11.signal_open:Fire()
    end
end
function v8.close(p12)
    if p12.signal_close then
        p12.signal_close:Fire()
    end
end
function v8.should_show_close_button(p13, p14)
    if not v_u_2.is_using_gamepad() then
        return true
    end
    local v15 = p14 == p13.unequip_slot
    local v16 = p13.is_object_selected
    if v15 then
        v15 = not v16
    end
    return v15
end
function v8.should_show_slot_num(_)
    return not v_u_2.is_using_gamepad()
end
function v8.update_unequip_slot(p17, p18)
    p17.unequip_slot = p17:_get_unequip_slot(p18)
end
function v8.make_selection_circular(_, p19)
    local v21 = v_u_4.List.filter(p19.slots, function(p20)
        return not p20.hidden
    end)
    local v22
    if p19.add_button.hidden then
        v22 = nil
    else
        v22 = p19.add_button
    end
    for v23, v24 in v21 do
        local v25 = v24.instance:FindFirstChild("Tool") or v24.instance:FindFirstChild("Add")
        local v26 = v21[v23 - 1] or (v22 or v21[#v21])
        v25.NextSelectionLeft = v26.instance:FindFirstChild("Tool") or v26.instance:FindFirstChild("Add")
        local v27 = v24.instance:FindFirstChild("Tool") or v24.instance:FindFirstChild("Add")
        local v28 = v21[v23 + 1] or (v22 or v21[1])
        v27.NextSelectionRight = v28.instance:FindFirstChild("Tool") or v28.instance:FindFirstChild("Add")
    end
    if v22 and #v21 > 0 then
        local v29 = v22.instance:FindFirstChild("Tool") or v22.instance:FindFirstChild("Add")
        local v30 = v21[1]
        v29.NextSelectionRight = v30.instance:FindFirstChild("Tool") or v30.instance:FindFirstChild("Add")
        local v31 = v22.instance:FindFirstChild("Tool") or v22.instance:FindFirstChild("Add")
        local v32 = v21[#v21]
        v31.NextSelectionLeft = v32.instance:FindFirstChild("Tool") or v32.instance:FindFirstChild("Add")
    end
end
function v8.hook_app(p_u_33, p_u_34)
    p_u_33.UIManager.wrap(p_u_34.open_backpack.XboxButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonY
    })
    game:GetService("ContextActionService"):BindActionAtPriority("ToolAppUnequip", function(_, p35, _)
        local v36 = p_u_33.UIManager.is_visible(p_u_34.ClassName)
        if v36 then
            if p35 == Enum.UserInputState.Begin then
                v36 = not p_u_34.minigame_locked
            else
                v36 = false
            end
        end
        if not (v36 and p_u_33.unequip_slot) then
            return Enum.ContextActionResult.Pass
        end
        p_u_33.unequip_slot:unequip_tool()
        return Enum.ContextActionResult.Sink
    end, false, 1600, Enum.KeyCode.ButtonB)
    game:GetService("ContextActionService"):BindAction("ToggleToolApp", function(_, p37)
        local v38 = p_u_33.UIManager.is_visible(p_u_34.ClassName)
        if v38 then
            if p37 == Enum.UserInputState.Begin then
                v38 = not p_u_34.minigame_locked
            else
                v38 = false
            end
        end
        if not v38 then
            return Enum.ContextActionResult.Pass
        end
        p_u_34:_toggle_hidden()
        return Enum.ContextActionResult.Sink
    end, false, Enum.KeyCode.DPadDown)
end
function v8.hook_hotbar(p_u_39, p_u_40)
    local v_u_41, v_u_42 = v_u_3.get_open_close_signals(p_u_40.instance)
    p_u_39.signal_open = v_u_41
    p_u_39.signal_close = v_u_42
    local v43 = p_u_40.tool_template.XboxButton
    v43.ZIndex = 2
    v43.Parent = nil
    p_u_39.gamepad_icon = p_u_39.UIManager.wrap(v43, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonR1,
        ["on_update"] = function(p44, p45)
            if p44:get_key() == Enum.KeyCode.ButtonR1 then
                p44.instance.Size = UDim2.new(0, 48, 0, 31)
            else
                p44.instance.Size = UDim2.new(0, 35, 0, 35)
            end
            p44.instance.Visible = p45
        end
    })
    p_u_39.watch = v_u_3.watch({
        ["selection_parent"] = p_u_40.instance,
        ["default_selection"] = function()
            local v46 = p_u_39:_get_leftmost_slot(p_u_40)
            if v46 then
                return v46.instance:FindFirstChild("Tool") or v46.instance:FindFirstChild("Add")
            elseif p_u_40.add_button.hidden then
                return nil
            else
                return p_u_40.add_button.instance.Add
            end
        end,
        ["signal_open"] = v_u_41,
        ["signal_close"] = v_u_42,
        ["setup_button_actions"] = function()
            game:GetService("ContextActionService"):BindAction("HotbarClose", function(_, p47)
                if p47 ~= Enum.UserInputState.Begin or not p_u_39.UIManager.apps.ToolApp.visible then
                    return Enum.ContextActionResult.Pass
                end
                v_u_42:Fire()
                return Enum.ContextActionResult.Sink
            end, false, Enum.KeyCode.ButtonB)
            game:GetService("ContextActionService"):BindActionAtPriority("HotbarBumperSelection", function(_, p48, p49)
                if p48 ~= Enum.UserInputState.Begin or not p_u_39.UIManager.apps.ToolApp.visible then
                    return Enum.ContextActionResult.Pass
                end
                local v50 = v_u_6.SelectedObject
                if not v50 then
                    return Enum.ContextActionResult.Pass
                end
                local v51 = p_u_39.watch
                local v52
                if p49.KeyCode == Enum.KeyCode.ButtonR1 then
                    v52 = v50.NextSelectionRight
                else
                    v52 = v50.NextSelectionLeft
                end
                v51:select_object(v52)
                return Enum.ContextActionResult.Sink
            end, false, 6000, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
            p_u_39.gamepad_icon:update_key(Enum.KeyCode.ButtonB)
            if v_u_6.SelectedObject and not v_u_6.SelectedObject:IsDescendantOf(p_u_40.instance) then
                local v53 = p_u_39:_get_leftmost_slot(p_u_40)
                local v54 = p_u_39.watch
                local v55
                if v53 then
                    v55 = v53.instance:FindFirstChild("Tool") or v53.instance:FindFirstChild("Add") or nil
                else
                    v55 = nil
                end
                v54:select_object(v55)
            end
        end,
        ["teardown_button_actions"] = function()
            game:GetService("ContextActionService"):UnbindAction("HotbarClose")
            game:GetService("ContextActionService"):UnbindAction("HotbarBumperSelection")
            if p_u_40.picking_item then
                p_u_39.gamepad_icon:update_key(nil)
            else
                p_u_40:stop_editing()
                p_u_39.gamepad_icon:update_key(Enum.KeyCode.ButtonR1)
            end
            p_u_39.UIManager.apps.ToolApp:unlock_visible("PickingItem")
        end
    })
    game:GetService("ContextActionService"):BindActionAtPriority("HotbarOpen", function(_, p56)
        if p56 ~= Enum.UserInputState.Begin or (not p_u_39:_get_leftmost_slot(p_u_40) or (p_u_40.picking_item or not p_u_39.UIManager.apps.ToolApp.visible)) then
            return Enum.ContextActionResult.Pass
        end
        p_u_39.UIManager.apps.ToolApp:lock_visible("PickingItem"):expect()
        v_u_41:Fire()
        return Enum.ContextActionResult.Sink
    end, false, 5000, Enum.KeyCode.ButtonR1)
    p_u_39.is_object_selected = v_u_6.SelectedObject ~= nil
    v_u_6:GetPropertyChangedSignal("SelectedObject"):Connect(function()
        local v57 = v_u_6.SelectedObject
        if v57 and v57:IsDescendantOf(p_u_40.instance) then
            p_u_39.gamepad_icon.instance.Parent = v57.Parent
        end
        local v58 = v57 ~= nil
        if v58 ~= p_u_39.is_object_selected then
            p_u_39.is_object_selected = v58
            for _, v59 in p_u_40.slots do
                v59:update()
            end
        end
    end)
end
function v8.refresh_gamepad_icon(p60, p61)
    for _, v62 in p61.slots do
        if p60.gamepad_icon.instance.Parent == v62.instance then
            if v62.hidden then
                local v63 = p60:reset_selection(p61)
                if v_u_6.SelectedObject == (v62.instance:FindFirstChild("Tool") or v62.instance:FindFirstChild("Add")) then
                    if v63 then
                        p60.watch:select_object(v63.instance:FindFirstChild("Tool") or v63.instance:FindFirstChild("Add"))
                        return
                    elseif p61.add_button.hidden then
                        p60.signal_close:Fire()
                    else
                        p60.watch:select_object(v62.hotbar.add_button.instance.Add)
                    end
                end
            end
            break
        end
    end
end
function v8.hook_slot(p64, p_u_65)
    p64.UIManager.wrap(p_u_65.instance.Close, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonB,
        ["on_update"] = function(p66, p67)
            local v68 = p67 and 40 or 49
            p_u_65.instance.Close.Size = UDim2.new(0, v68, 0, v68)
            if not p67 then
                p66.instance.Image = "rbxassetid://2601399507"
            end
            p_u_65:update()
        end
    })
end
function v8.hook_add_button(p_u_69, p_u_70)
    p_u_70.visibility_changed:Connect(function(p71)
        if not p71 then
            if p_u_69.gamepad_icon.instance.Parent == p_u_70.instance then
                local v72 = p_u_69:reset_selection(p_u_70.hotbar)
                if v_u_6.SelectedObject == p_u_70.instance.Add then
                    if v72 then
                        p_u_69.watch:select_object(v72.instance:FindFirstChild("Tool") or v72.instance:FindFirstChild("Add"))
                        return
                    end
                    p_u_69.watch:select_object(nil)
                end
            end
        end
    end)
end
function v8.reset_selection(p73, p74)
    local v75 = p73:_get_leftmost_slot(p74)
    if v75 then
        p73.gamepad_icon.instance.Parent = v75.instance
        p73.watch:clear_last_selection()
    end
    return v75
end
function v8.prompt_pick_or_delete_slot(p76)
    local v77 = p76.UIManager.apps.DialogApp
    local v78 = {
        ["dialog_type"] = "LargeButtonsListDialog"
    }
    local v79 = {
        ["pick"] = {
            ["text"] = "Select Item",
            ["layout_order"] = 1,
            ["weight"] = 1.71
        },
        ["delete"] = {
            ["text"] = "Remove Item",
            ["layout_order"] = 2,
            ["weight"] = 1
        },
        ["close"] = {
            ["text"] = "Cancel",
            ["layout_order"] = 3,
            ["weight"] = 1,
            ["button_state"] = "cancel"
        }
    }
    v78.buttons = v79
    return v77:dialog(v78)
end
function v8._get_leftmost_slot(_, p80)
    for _, v81 in p80.slots do
        if v81.hotbar_properties then
            return v81
        end
    end
    return nil
end
function v8._get_unequip_slot(_, p82)
    return v_u_4.List.reduce(p82, function(p83, p84)
        local v85 = p83.tool
        local v86 = not v85 and 0 or (v_u_7[v85.entry.category] or v_u_7.holdables)
        local v87 = p84.tool
        local v88 = not v87 and 0 or (v_u_7[v87.entry.category] or v_u_7.holdables)
        if p84.tool and v86 <= v88 then
            return p84
        else
            return p83
        end
    end)
end
return v8