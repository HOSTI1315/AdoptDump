--// ReplicatedStorage.ClientModules.Core.XboxSupport.XboxSupport (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("PlatformM")
local v_u_3 = v_u_1("XboxSupportWatch")
local v_u_4 = v_u_1("XboxSupportProxyWatch")
local v_u_5 = v_u_1("XboxSupportWatchStack")
local v_u_6 = v_u_1("Signal")
local v_u_7 = v_u_1("Maid")
local function v_u_8() end
local function v_u_9()
    return true
end
local v_u_10 = {}
local v_u_11 = game:GetService("GuiService")
local v_u_12 = game:GetService("UserInputService")
local v_u_13 = {}
function v_u_10.get_open_close_signals(p_u_14, p_u_15)
    local v_u_16 = p_u_14:IsA("ScreenGui") and "Enabled" or (p_u_14:IsA("GuiObject") and "Visible" or error("[XboxSupport] Unsupported type for open_close_signals()"))
    local v_u_17 = v_u_6.new()
    local v_u_18 = v_u_6.new()
    p_u_14:GetPropertyChangedSignal(v_u_16):connect(function()
        if p_u_14[v_u_16] and not p_u_15 then
            v_u_17:Fire()
        else
            v_u_18:Fire()
        end
    end)
    return v_u_17, v_u_18
end
function v_u_10.watch(p_u_19)
    local v20 = p_u_19.signal_open
    local v21 = p_u_19.signal_close
    local v22 = p_u_19.selection_parent
    local v23 = p_u_19.default_selection
    local v24 = p_u_19.save_last_selection
    local v25 = p_u_19.setup_button_actions or v_u_8
    local v26 = p_u_19.teardown_button_actions or v_u_8
    local v_u_27 = v_u_3.new({
        ["selection_parent"] = v22,
        ["default_selection"] = v23,
        ["setup_button_actions"] = v25,
        ["teardown_button_actions"] = v26,
        ["save_last_selection"] = v24
    })
    v20:Connect(function(p28)
        if p28 then
            v_u_27.selected_object = p28
        end
        v_u_27:activate()
    end)
    if p_u_19.exit_buttons then
        local v_u_29 = nil
        v_u_29 = v20:Connect(function()
            v_u_29:Disconnect()
            local v30 = v_u_1("UIManager")
            for _, v31 in p_u_19.exit_buttons do
                v30.wrap(v31, "GamepadIcon"):start({
                    ["key"] = Enum.KeyCode.ButtonB,
                    ["on_update"] = function(p32, p33)
                        for _, v34 in p32.instance:GetChildren() do
                            if v34:IsA("GuiObject") then
                                v34.Visible = not p33
                            end
                        end
                    end
                })
            end
        end)
    end
    v21:Connect(function()
        v_u_27:deactivate()
    end)
    local v35 = v_u_13
    table.insert(v35, v_u_27)
    return v_u_27
end
function v_u_10.quick_watch(p36)
    local v37 = p36.selection_parent
    local v38 = p36.default_selection
    local v_u_39 = p36.app_name
    local v_u_40 = p36.unique_key or v_u_39
    local v41
    if v37 then
        if v38 then
            v41 = v_u_39
        else
            v41 = v38
        end
    else
        v41 = v37
    end
    assert(v41, "Missing requires parameters for quick_watch")
    local v42 = p36.quick_open_button
    local v_u_43 = p36.setup_button_actions
    local v_u_44 = p36.teardown_button_actions
    local v45 = p36.save_last_selection
    local v_u_46 = p36.open_override or v_u_9
    local v_u_47 = p36.close_override or v_u_9
    local v48 = p36.open_close_instance or v37
    local v49 = p36.exit_buttons
    local v_u_50 = p36.next_selections
    local v_u_51, v_u_52 = v_u_10.get_open_close_signals(v48, p36.open_using_button_only)
    local v_u_53
    if v_u_50 then
        v_u_53 = v_u_7.new()
    else
        v_u_53 = nil
    end
    local v59 = {
        ["selection_parent"] = v37,
        ["default_selection"] = v38,
        ["signal_open"] = v_u_51,
        ["signal_close"] = v_u_52,
        ["save_last_selection"] = v45,
        ["exit_buttons"] = v49,
        ["setup_button_actions"] = function()
            game:GetService("ContextActionService"):BindAction(v_u_40 .. "Close", function(_, p54)
                if p54 == Enum.UserInputState.Begin then
                    if v_u_47() then
                        v_u_1("UIManager").set_app_visibility(v_u_39)
                        v_u_52:Fire()
                    end
                else
                    return
                end
            end, false, Enum.KeyCode.ButtonB)
            if v_u_43 then
                v_u_43()
            end
            if v_u_53 then
                for v55, v56 in v_u_50 do
                    for v57, v58 in v56 do
                        v_u_53:GiveTask(v_u_10.set_next_selection(v55, v57, v58))
                    end
                end
            end
        end,
        ["teardown_button_actions"] = function()
            game:GetService("ContextActionService"):UnbindAction(v_u_40 .. "Close")
            if v_u_53 then
                v_u_53:DoCleaning()
            end
            if v_u_44 then
                v_u_44()
            end
        end
    }
    local v60 = v_u_10.watch(v59)
    if not v42 then
        return v60, v_u_9
    end
    game:GetService("ContextActionService"):BindAction("Open" .. v_u_40, function(_, p61)
        if p61 == Enum.UserInputState.Begin then
            if v_u_46() then
                v_u_1("UIManager").set_app_visibility(v_u_39, true)
                v_u_51:Fire()
            end
        else
            return
        end
    end, false, v42)
    return v60, function()
        game:GetService("ContextActionService"):UnbindAction("Open" .. v_u_40)
    end
end
function v_u_10.proxy_watch(p62)
    return v_u_4.new(p62)
end
function v_u_10.deactivate_watch_with_selected_instance(p63)
    for _, v64 in v_u_5.get() do
        if v64:get_selected_object_instance() == p63 or v64:is_active() and v_u_11.SelectedObject == p63 then
            v64:deactivate()
        end
    end
end
local function v_u_67(p65)
    local v66 = {}
    while p65 ~= game and p65 ~= nil do
        table.insert(v66, p65)
        p65 = p65.Parent
    end
    return v66
end
local function v_u_72(p68, p69)
    local v70 = 0
    for _, v71 in p68:GetChildren() do
        if v71.Name == p69 then
            v70 = v70 + 1
            if v70 >= 2 then
                break
            end
        end
    end
    if v70 == 0 then
        return nil
    elseif v70 == 1 then
        return p68:FindFirstChild(p69), true
    else
        return p68:FindFirstChild(p69), false
    end
end
function v_u_10.attempt_preserve_selection_on_recreation()
    local v_u_73 = v_u_11.SelectedObject
    if v_u_73 == nil then
        return v_u_9
    end
    if not v_u_73:IsDescendantOf(game) then
        return v_u_9
    end
    local v_u_74 = v_u_73:FindFirstAncestorWhichIsA("ScrollingFrame")
    local v_u_75
    if v_u_74 then
        v_u_75 = v_u_74.CanvasPosition
    else
        v_u_75 = nil
    end
    local v_u_76 = v_u_67(v_u_73)
    local v_u_77 = v_u_73:GetFullName()
    return function()
        if v_u_73.Parent ~= nil then
            return
        end
        for v86, v85 in v_u_76 do
            if v85.Parent then
                ::l6::
                if v85 then
                    for v80 = v86 - 1, 1, -1 do
                        local v81 = v_u_76[v80].Name
                        local v82, v83 = v_u_72(v85, v81)
                        if not v82 then
                            return
                        end
                        if v83 == false then
                            error("Cannot derive ancestry because an ancestor of SelectedObject " .. "has the same name as one of the ancestor\'s siblings. Please rename \"" .. v81 .. "\" to something unique. \"" .. v81 .. "\" is parented to \"" .. v85:GetFullName() .. "\". SelectedObject\'s ancestry was \"" .. v_u_77 .. "\" before it was destroyed.")
                        end
                        v85 = v82
                    end
                    local v84 = v_u_10.get_watch_from_parent(v85, true)
                    if v84 then
                        v84:select_object(v85)
                    end
                    if v_u_75 then
                        v_u_74.CanvasPosition = v_u_75
                    end
                    return true
                end
                return
            end
        end
        local v85 = nil
        local v86 = nil
        goto l6
    end
end
function v_u_10.get_watch_from_parent(p87, p88)
    local v89 = nil
    for _, v90 in v_u_5.get() do
        local v91 = v90:get_selection_parent()
        if p87 == v91 or p87:IsDescendantOf(v91) then
            v89 = v90
            break
        end
    end
    if not v89 then
        if p88 then
            return nil
        end
        error("Cannot find an XboxSupportWatch that watches the parent. " .. "Please use XboxSupport.quick_watch or equivalent to watch an ancestor of " .. p87.Name)
    end
    return v89
end
function v_u_10.narrow_selection_parent(p_u_92)
    assert(p_u_92, "Missing param new_selection_parent")
    if not v_u_2.is_using_gamepad() then
        return v_u_9
    end
    local v_u_93 = v_u_10.get_watch_from_parent(p_u_92)
    v_u_93:override_selection_parent(p_u_92)
    return function()
        v_u_93:remove_selection_parent_override(p_u_92)
    end
end
function v_u_10.is_valid_tree(p94)
    while p94:IsA("GuiObject") or p94:IsA("LayerCollector") do
        if p94:IsA("GuiObject") and not p94.Visible then
            return false, ("parent_not_visible (%s)"):format(p94:GetFullName())
        end
        if p94:IsA("LayerCollector") and not p94.Enabled then
            return false, ("layer_collector_not_enabled (%s)"):format(p94:GetFullName())
        end
        p94 = p94.Parent
    end
    return true, nil
end
function v_u_10.is_valid_selection(p95)
    if not p95 then
        return true, nil
    end
    if not p95:IsDescendantOf(game.Players.LocalPlayer.PlayerGui) then
        return false, "not_a_descendant_of_playergui"
    end
    if not p95:FindFirstAncestorWhichIsA("LayerCollector") then
        return false, "no_layer_collector_ancestor"
    end
    if not p95:IsA("GuiObject") then
        return false, ("not_a_gui_object (%s)"):format(p95.ClassName)
    end
    if not p95.Visible then
        return false, "not_visible"
    end
    if not p95.Selectable then
        return false, "not_selectable"
    end
    if p95.AbsoluteSize.Magnitude >= 1 then
        return v_u_10.is_valid_tree(p95)
    end
    local v96 = p95.AbsoluteSize.X
    local v97 = math.floor(v96)
    local v98 = p95.AbsoluteSize.Y
    return false, ("too_small (x: %i, y: %i)"):format(v97, (math.floor(v98)))
end
function v_u_10.set_next_selection(p_u_99, p_u_100, p_u_101)
    local v_u_102 = v_u_7.new()
    local v_u_103 = true
    v_u_102:GiveTask(v_u_11:GetPropertyChangedSignal("SelectedObject"):Connect(function()
        if v_u_11.SelectedObject == p_u_99 then
            if v_u_12:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, p_u_100) then
                v_u_103 = false
                v_u_102.wait_for_input_ended = v_u_12.InputEnded:Connect(function(p104)
                    if p104.UserInputType == Enum.UserInputType.Gamepad1 and p104.KeyCode == p_u_100 then
                        v_u_103 = true
                        v_u_102.wait_for_input_ended = nil
                    end
                end)
            end
        end
    end))
    v_u_102:GiveTask(v_u_12.InputBegan:Connect(function(p105)
        if v_u_103 and (v_u_11.SelectedObject == p_u_99 and (p105.UserInputType == Enum.UserInputType.Gamepad1 and p105.KeyCode == p_u_100)) then
            local v106 = p_u_101
            if type(v106) == "function" then
                v106 = v106(p_u_99)
            end
            if v106 then
                for _, v107 in v_u_13 do
                    local v108 = v107:get_selection_parent()
                    if v106 == v108 or v106:IsDescendantOf(v108) then
                        v_u_10.deactivate_watch_with_selected_instance(p_u_99)
                        v107:activate()
                        v107:select_object(v106)
                        return
                    end
                end
            end
        else
            return
        end
    end))
    return function()
        v_u_102:DoCleaning()
    end
end
function v_u_10.init()
    v_u_11.AutoSelectGuiEnabled = false
end
return v_u_10