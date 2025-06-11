--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ToolApp.ToolAppHotbar (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("ClientToolManager")
local v_u_4 = v1("Maid")
local v_u_5 = v1("PlatformM")
local v_u_6 = v1("RouterClient")
local v_u_7 = v1("SingleActionBuffer")
local v_u_8 = v1("SoundPlayer")
local v_u_9 = v1("package:Promise")
local v_u_10 = v1("package:Sift")
local v11 = v1("UIBaseElement")
local v12, v_u_13 = v1("Class")("ToolAppHotbar", v11)
local v_u_14 = {
    ["transport"] = true,
    ["pets"] = true
}
function v12.__init(p15, ...)
    v_u_13.__init(p15, ...)
    p15.slots = nil
    p15.edit_mode = false
    p15.edit_maid = v_u_4.new()
    p15.tool_container_width = p15.instance.ToolContainer.AbsoluteSize.X
    p15.action_buffer = v_u_7.new()
    p15.slot_refresh_buffer = v_u_7.new()
    p15.picking_item = false
    p15:_refresh_max_visible_slots()
end
function v12.equip(p_u_16, p_u_17)
    p_u_16.action_buffer:run(function()
        v_u_9.allSettled({ v_u_9.delay(0.25), v_u_9.try(function()
                v_u_8.Interface:play("Tooltip/TooltipButtonClick")
                p_u_16.UIManager.apps.BackpackApp:get_equip_override(p_u_17.category).callback(p_u_17, true, false)
            end) }):await()
    end)
end
function v12.unequip(p18, p_u_19)
    p18.action_buffer:run(function()
        v_u_9.allSettled({ v_u_9.delay(0.25), v_u_9.try(function()
                v_u_8.Interface:play("Items/ItemUnequip")
                v_u_3.unequip(p_u_19)
            end) }):await()
    end)
end
function v12.get_equipped_slot(p20, p21, p22)
    if p21 and p21.item_data then
        p21 = p21.item_data
    end
    if p21 then
        for v23 = 1, #p20.slots - 1 do
            local v24 = p20.slots[v23]
            if v24:is_hotbar_slot_for(p21) then
                return v24
            end
        end
    end
    if p22 or v_u_14[p21.category] then
        return nil
    else
        return p20.slots[#p20.slots]
    end
end
function v12.server_set_slot_properties(p_u_25, p_u_26, p_u_27)
    if not p_u_25.awaiting_server then
        p_u_25.awaiting_server = true
        v_u_9.try(function()
            v_u_6.get("ToolAPI/SetSlotProperties"):InvokeServer(p_u_26, p_u_27)
        end):finally(function()
            p_u_25.awaiting_server = false
        end)
    end
end
function v12.pick_item_promise(p_u_28, p_u_29, p30)
    if not p_u_28.edit_mode then
        return nil
    end
    if p_u_28.picking_item then
        return nil
    end
    p_u_28.picking_item = true
    if v_u_5.is_using_gamepad() and not p30 then
        local v31 = p_u_28.gamepad_support:prompt_pick_or_delete_slot()
        if v31 ~= "pick" then
            if v31 == "delete" then
                p_u_28:server_set_slot_properties(p_u_29, nil)
            end
            p_u_28.picking_item = false
            return nil
        end
    end
    if not p_u_29 then
        local v32 = 0
        for _, v33 in p_u_28.slots do
            if v33.hotbar_properties then
                v32 = v32 + 1
            end
        end
        p_u_29 = v32 + 1
    end
    local v_u_41 = v_u_9.new(function(p34)
        local v36 = {
            ["keep_cached_scroll_positions_on_open"] = true,
            ["allow_callback"] = function(p35)
                return not p_u_28:get_equipped_slot(p35, true)
            end
        }
        local v37 = p_u_28.UIManager.apps.BackpackApp:pick_item(v36)
        p_u_28.picking_item = false
        p34(v37)
    end):andThen(function(p38)
        if p38 then
            local v39
            if p38.category == "pets" or p38.category == "transport" then
                v39 = p38.unique
            else
                v39 = nil
            end
            local v40
            if p38.category == "pets" then
                v40 = p38.properties
            else
                v40 = nil
            end
            p_u_28:server_set_slot_properties(p_u_29, {
                ["category"] = p38.category,
                ["kind"] = p38.kind,
                ["unique"] = v39 or nil,
                ["properties"] = v40 or nil
            })
        end
    end)
    p_u_28.edit_maid:GiveTask(function()
        p_u_28.picking_item = false
        v_u_41:cancel()
    end)
    return v_u_41
end
function v12.refresh_minigame_state(p42)
    if p42.UIManager.apps.ToolApp.minigame_locked or p42.UIManager.apps.ToolApp.minigame_hotbar then
        p42:stop_editing()
    end
    p42:update()
end
function v12.is_in_edit_mode(p43)
    return p43.edit_mode
end
function v12.start_editing(p_u_44)
    if p_u_44.edit_mode then
        return
    elseif p_u_44.UIManager.apps.ToolApp.minigame_locked or p_u_44.UIManager.apps.ToolApp.minigame_hotbar then
        p_u_44.UIManager.apps.DialogApp:dialog({
            ["text"] = "You can\'t edit the hotbar right now.",
            ["button"] = "Okay"
        })
    else
        p_u_44:_set_edit_mode(true)
        v_u_6.get("ToolAPI/StartEditingHotbar"):FireServer()
        if v_u_5.is_using_gamepad() then
            p_u_44.UIManager.apps.ToolApp:lock_visible("EditMode"):expect()
            p_u_44.gamepad_support:open()
        else
            p_u_44.UIManager.apps.ToolApp:lock_visible("EditMode")
            local v_u_45 = p_u_44.UIManager.apps.ExtraButtonsApp:register_button({
                ["priority"] = 5,
                ["text"] = "Stop Editing",
                ["mouse_button1_click"] = function()
                    p_u_44:stop_editing()
                end
            })
            v_u_45:show()
            p_u_44.edit_maid:GiveTask(function()
                p_u_44.UIManager.apps.ExtraButtonsApp:unregister_button(v_u_45)
            end)
        end
        p_u_44.edit_maid:GiveTask(function()
            p_u_44.UIManager.apps.ToolApp:unlock_visible("EditMode")
        end)
        p_u_44.edit_maid:GiveTask(p_u_44.UIManager.app_visibilities_changed:Connect(function(p46, p47)
            if p47 and (p46 == "BackpackApp" and not p_u_44.picking_item) then
                p_u_44:stop_editing()
            end
        end))
    end
end
function v12.stop_editing(p48)
    if p48.edit_mode then
        p48:_set_edit_mode(false)
        v_u_6.get("ToolAPI/StopEditingHotbar"):FireServer()
        p48.gamepad_support.watch:clear_watch_stack()
    end
end
function v12.update(p49)
    local v50 = p49.UIManager.apps.ToolApp.minigame_hotbar
    local v51
    if v50 then
        if v50.hide_empty_slots then
            v51 = v_u_10.List.filter(v50.slots, function(p52)
                local v53 = p52.hotbar_properties
                local v54 = (v_u_2.get("inventory") or {})[v53.category]
                if not v54 then
                    return false
                end
                for _, v55 in v54 do
                    if v55.kind == v53.kind and (not v53.unique or v55.unique == v53.unique) then
                        return true
                    end
                end
                return false
            end)
        else
            v51 = v50.slots
        end
    else
        v51 = v_u_2.get("hotbar_manager")
    end
    local v56 = p49.max_visible_slots <= 0 and {} or v_u_10.List.slice(v51, 1, p49.max_visible_slots)
    if not p49.slots then
        p49.slots = {}
        for v57 = 1, 10 do
            local v58 = p49.UIManager.wrap(p49.tool_template:Clone(), "ToolAppSlot")
            p49.slots[v57] = v58
            v58.instance.Parent = p49.instance
            v58:start(p49, v57)
        end
        p49.gamepad_support.gamepad_icon.instance.Parent = p49.slots[1].instance
    end
    local v59 = 0
    for v60 = 1, 10 do
        local v61 = v56[v60] or {}
        p49.slots[v60]:set_hotbar_properties(v61.hotbar_properties)
        if v61.hotbar_properties then
            v59 = v59 + 1
        end
    end
    local v62 = {}
    for _, v63 in p49.UIManager.apps.ToolApp.active_tools do
        local v64 = p49:get_equipped_slot(v63)
        if v64 then
            v62[v64] = true
            v64:set_tool(v63)
        end
    end
    for _, v65 in p49.slots do
        if not v62[v65] then
            v65:set_tool(nil)
        end
    end
    p49.gamepad_support:update_unequip_slot(p49.slots)
    for _, v66 in p49.slots do
        v66:update()
    end
    p49.all_slots_in_use = p49.max_visible_slots <= v59
    p49:_update_add_button()
    p49.gamepad_support:make_selection_circular(p49)
    p49.gamepad_support:refresh_gamepad_icon(p49)
    if v59 == 0 then
        p49.UIManager.apps.ToolApp:lock_visible("EmptyHotbar")
    else
        p49.UIManager.apps.ToolApp:unlock_visible("EmptyHotbar")
    end
end
function v12._update_add_button(p67)
    if p67.edit_mode then
        if p67.all_slots_in_use then
            p67.add_button:hide()
        else
            p67.add_button:show()
        end
    else
        p67.add_button:hide()
        return
    end
end
function v12._set_edit_mode(p68, p69)
    if p68.edit_mode ~= p69 then
        if not p69 then
            p68.edit_maid:DoCleaning()
        end
        p68.edit_mode = p69
        p68:_update_add_button()
        for _, v70 in p68.slots do
            v70:update()
        end
        p68.gamepad_support:make_selection_circular(p68)
    end
end
function v12.set_using_tool(p71, p72, p73)
    p71:get_equipped_slot(p72):set_using(p73)
end
function v12._refresh_max_visible_slots(p_u_74)
    p_u_74.max_visible_slots = v_u_5.run({
        ["phone"] = function()
            return 3
        end,
        ["tablet"] = function()
            return 4
        end,
        ["default"] = function()
            local v75 = p_u_74.UIManager.apps.ExtraButtonsApp.instance.Frame
            local v76 = p_u_74.UIManager.apps.NavigatorApp.instance.Frame
            local v77 = v75.AbsoluteSize.X + 10
            local v78 = v76.AbsoluteSize.X
            local v79 = workspace.CurrentCamera.ViewportSize.X - math.max(v77, v78) * 2
            local v80 = p_u_74.tool_container_width
            local v81 = p_u_74.instance.UIListLayout.Padding.Offset
            local v82 = 0
            local v83 = v80 * 2 + v81 * 1
            local v84 = v82
            for _ = 1, 10 do
                v84 = v84 + 1
                v83 = v83 + v80 + v81
                if v79 < v83 then
                    return v82
                end
                v82 = v84
            end
            return v82
        end
    })
end
function v12.start(p_u_85)
    p_u_85.tool_template = p_u_85.instance.ToolContainer
    p_u_85.tool_template.Parent = nil
    p_u_85.gamepad_support = p_u_85.UIManager.apps.ToolApp.gamepad_support
    p_u_85.gamepad_support:hook_hotbar(p_u_85)
    p_u_85.add_button = p_u_85.UIManager.wrap(p_u_85.instance.AddContainer, "ToolAppAddButton")
    p_u_85.add_button:start(p_u_85)
    p_u_85:update()
    v_u_2.register_callback("hotbar_manager", function(_, _)
        p_u_85:update()
    end)
    v_u_2.register_callback("inventory", function(_, _, _)
        local v86 = p_u_85.UIManager.apps.ToolApp.minigame_hotbar
        if v86 and v86.hide_empty_slots then
            p_u_85:update()
        else
            for _, v87 in p_u_85.slots do
                if not v87.hidden then
                    v87:update_stack_count()
                end
            end
        end
    end)
    p_u_85:refresh_minigame_state()
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        p_u_85.action_buffer:run(function()
            v_u_9.allSettled({ v_u_9.delay(0.25), v_u_9.try(function()
                    p_u_85:_refresh_max_visible_slots()
                    p_u_85:update()
                end) }):await()
        end)
    end)
    task.defer(function()
        p_u_85:_refresh_max_visible_slots()
        p_u_85:update()
    end)
end
return v12