--// ReplicatedStorage.ClientModules.Core.XboxSupport.XboxSupportWatch (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("Maid")
local v_u_4 = v_u_1("PlatformM")
local v_u_5 = v_u_1("XboxSupportWatchStack")
local v_u_6 = v_u_1("package:Promise")
local v_u_7 = game:GetService("GuiService")
local v8 = v2("XboxSupportWatch")
function v8.__init(p9, p10)
    p9.default_selection = p10.default_selection
    p9.selected_object = p10.default_selection
    p9.selection_parent = p10.selection_parent
    p9.selection_parent_overrides = {}
    p9.setup_button_actions = p10.setup_button_actions
    p9.teardown_button_actions = p10.teardown_button_actions
    p9.maid = v_u_3.new()
    p9.buttons_active = false
    if p10.save_last_selection == nil then
        p9.save_last_selection = true
    else
        p9.save_last_selection = p10.save_last_selection
    end
    local v11 = p10.selection_parent
    if typeof(v11) ~= "function" then
        local v12 = p10.selection_parent
        if typeof(v12) == "function" then
            v12 = v12()
        end
        local v13 = v12:IsA("GuiObject") or v12:IsA("LayerCollector")
        assert(v13, "Xbox support watch cannot watch a non GuiObject. Try using a container frame instead.")
    end
    return p9
end
function v8.is_active(p14)
    return v_u_5.peek() == p14
end
function v8.select_object(p15, p16)
    if p15:is_active() then
        if v_u_4.is_using_gamepad() then
            v_u_7.SelectedObject = p16
        end
    end
end
function v8.select_object_in(p17, p18)
    if p17:is_active() then
        if v_u_4.is_using_gamepad() then
            v_u_7:Select(p18)
        end
    end
end
function v8.get_selected_object_instance(p19)
    local v20 = p19.selected_object
    if typeof(v20) == "function" then
        return v20()
    else
        return v20
    end
end
function v8.get_selection_parent(p21)
    local v22
    if #p21.selection_parent_overrides > 0 then
        v22 = p21.selection_parent_overrides[#p21.selection_parent_overrides]
    else
        v22 = p21.selection_parent
    end
    if typeof(v22) == "function" then
        return v22()
    else
        return v22
    end
end
function v8._refresh_selection_parent(p23)
    local v24 = p23:get_selection_parent()
    if p23:is_active() then
        v24.SelectionGroup = true
        for _, v25 in {
            "Up",
            "Down",
            "Left",
            "Right"
        } do
            v24["SelectionBehavior" .. v25] = Enum.SelectionBehavior.Stop
        end
    else
        v_u_7.SelectedObject = nil
        v24.SelectionGroup = false
    end
end
function v8.override_selection_parent(p26, p27)
    if not table.find(p26.selection_parent_overrides, p27) then
        local v28 = p26.selection_parent_overrides
        table.insert(v28, p27)
        p26:_refresh_selection_parent()
    end
end
function v8.remove_selection_parent_override(p29, p30)
    local v31 = table.find(p29.selection_parent_overrides, p30)
    if v31 then
        table.remove(p29.selection_parent_overrides, v31).SelectionGroup = false
        p29:_refresh_selection_parent()
    end
end
function v8.activate_from_stack(p_u_32)
    local v33 = v_u_1("XboxSupport")
    local v34 = p_u_32.selected_object
    if typeof(v34) == "function" then
        v34 = v34()
    end
    if not v33.is_valid_selection(v34) then
        v34 = p_u_32.default_selection
    end
    p_u_32:_refresh_selection_parent()
    if typeof(v34) == "function" then
        v34 = v34()
    end
    p_u_32:select_object(v34)
    p_u_32.return_selection_promise = v_u_6.delay(0.1):andThen(function()
        if not v_u_7.SelectedObject then
            local v35 = p_u_32
            local v36 = p_u_32.default_selection
            if typeof(v36) == "function" then
                v36 = v36()
            end
            v35:select_object(v36)
        end
    end)
    p_u_32.maid:GiveTask(v_u_7:GetPropertyChangedSignal("SelectedObject"):Connect(function()
        if p_u_32.return_selection_promise then
            p_u_32.return_selection_promise:cancel()
            p_u_32.return_selection_promise = nil
        end
        if not v_u_7.SelectedObject then
            p_u_32.return_selection_promise = v_u_6.delay(0.1):andThen(function()
                local v37 = p_u_32
                local v38 = p_u_32.default_selection
                if typeof(v38) == "function" then
                    v38 = v38()
                end
                v37:select_object(v38)
            end)
        end
    end))
    p_u_32.maid:GiveTask(function()
        if p_u_32.return_selection_promise then
            p_u_32.return_selection_promise:cancel()
            p_u_32.return_selection_promise = nil
        end
    end)
    p_u_32.maid:GiveTask(v_u_4.get_gamepad_changed():Connect(function(p39)
        if p39 and p_u_32:is_active() then
            local v40 = p_u_32
            local v41 = p_u_32.default_selection
            if typeof(v41) == "function" then
                v41 = v41()
            end
            v40:select_object(v41)
        end
    end))
    p_u_32:enable_button_actions()
end
function v8.activate(p42)
    if p42:is_active() then
        return
    else
        local v43 = v_u_1("XboxSupport")
        local v44 = p42:get_selection_parent()
        local v45, v46 = v43.is_valid_tree(v44)
        if v45 then
            v_u_5.push(p42)
        else
            warn(("Cannot activate watch, parent (%s) is not valid.\nReason: %s"):format(v44.Name, v46))
        end
    end
end
function v8.disable_button_actions(p47)
    if p47.buttons_active then
        p47.teardown_button_actions(p47.setup_data)
        p47.setup_data = nil
        p47.buttons_active = false
    end
end
function v8.enable_button_actions(p48)
    if not p48.buttons_active then
        p48.setup_data = p48.setup_button_actions()
        p48.buttons_active = true
    end
end
function v8.clear_last_selection(p49)
    p49.selected_object = p49.default_selection
end
function v8.clear_watch_stack(p50)
    if p50:is_active() then
        v_u_5.clear(p50)
    end
end
function v8.deactivate_from_stack(p51)
    p51.selected_object = p51.save_last_selection and v_u_7.SelectedObject or p51.default_selection
    p51.maid:DoCleaning()
    p51:disable_button_actions()
    p51:_refresh_selection_parent()
    v_u_7.SelectedObject = nil
end
function v8.deactivate(p52)
    if p52:is_active() then
        v_u_5.pop()
    else
        v_u_5.remove(p52)
    end
end
return v8