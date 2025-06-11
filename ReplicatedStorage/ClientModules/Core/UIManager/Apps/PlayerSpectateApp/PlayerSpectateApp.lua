--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerSpectateApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("ControlsDisabler")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("XboxSupport")
local v_u_6 = v1("ClientData")
local v_u_7 = v1("PlatformM")
local v_u_8 = v1("Signal")
local v9 = v1("Class")
local v_u_10 = v1("package:Sift")
local v_u_11 = v1("package:Promise")
local v_u_12 = game:GetService("Players")
local v_u_13 = game:GetService("RunService")
local v14 = v9("PlayerSpectateApp", v1("UIBaseApp"))
local v_u_15 = 0
function v14._setup_exit_button(p16)
    local v_u_17 = v_u_8.new()
    local v_u_18 = p16.instance.ExitButton
    v_u_18.AnchorPoint = Vector2.new(1, 0)
    v_u_18.Position = UDim2.new(1, -10, 0, 10)
    v_u_7.run({
        ["desktop"] = function()
            v_u_18.Size = UDim2.new(0, 180, 0, 55)
        end,
        ["console"] = "desktop",
        ["tablet"] = function()
            v_u_18.Size = UDim2.new(0, 180, 0, 55)
        end
    })
    p16.UIManager.wrap(v_u_18.XboxButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonB,
        ["on_update"] = function(p19, p20)
            p19.instance.Visible = p20
        end
    })
    p16.UIManager.wrap(v_u_18, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            v_u_17:Fire()
        end
    }):set_state("cancel")
    return v_u_17
end
function v14._get_watching_list(p_u_21)
    local v22 = v_u_10.Dictionary.keys(p_u_21.watching)
    table.sort(v22, function(p23, p24)
        return p_u_21.watching[p23].unique < p_u_21.watching[p24].unique
    end)
    return v22
end
function v14._spectate(p_u_25, p_u_26)
    if p_u_25.UIManager.is_visible(p_u_25.ClassName) then
        task.spawn(function()
            v_u_4.get("ReplicationFocusAPI/UpdateReplicationFocusForSpectate"):FireServer(p_u_26)
            v_u_15 = v_u_15 + 1
            local v27 = v_u_15
            while v_u_15 == v27 do
                local v28 = p_u_26
                if v28 then
                    v28 = v28.Character
                end
                if v28 then
                    v28 = v28:FindFirstChild("Humanoid")
                end
                if v28 and v28:IsDescendantOf(workspace) then
                    local v29 = workspace.CurrentCamera
                    if v28 then
                        v29.CameraSubject = v28
                        p_u_25.instance.Container.Nickname.TextLabel.Text = p_u_26.Name
                        p_u_25.spectate_changed:Fire(p_u_26)
                    end
                    return
                end
                task.wait()
            end
        end)
    end
end
function v14._reset_camera(_)
    v_u_15 = v_u_15 + 1
    v_u_4.get("ReplicationFocusAPI/ResetReplicationFocus"):FireServer()
    local v30 = workspace.CurrentCamera
    local v31 = v_u_12.LocalPlayer
    if v31 then
        v31 = v31.Character
    end
    if v31 then
        v31 = v31:FindFirstChild("Humanoid")
    end
    v30.CameraSubject = v31
end
function v14.get_spectate_changed_signal(p32)
    return p32.spectate_changed
end
function v14.is_watching(p33, p34)
    return p33.watching[p34] ~= nil
end
function v14.get_current_player(p35)
    if p35.UIManager.is_visible(p35.ClassName) then
        return p35.watching_list[p35.watching_index]
    else
        return nil
    end
end
function v14.get_watching_list(p36)
    return v_u_10.List.copy(p36.watching_list)
end
function v14.get_watching_changed_signal(p37)
    return p37.watching_changed
end
function v14.can_watch(_, p38)
    if not p38 or (not p38.Character or p38 == v_u_12.LocalPlayer) then
        return false
    end
    local v39 = v_u_12.LocalPlayer
    local v40 = v_u_6.get_server(v39, "char_wrapper_raw") or {}
    local v41
    if v40.location then
        v41 = v40.location.full_destination_id
    else
        v41 = nil
    end
    local v42 = v_u_6.get_server(p38, "char_wrapper_raw") or {}
    local v43
    if v42.location then
        v43 = v42.location.full_destination_id
    else
        v43 = nil
    end
    if v41 then
        if v43 then
            v43 = v41 == v43
        end
    else
        v43 = v41
    end
    return v43
end
function v14.watch(p_u_44, p_u_45)
    if not p_u_44.watching[p_u_45] and p_u_44:can_watch(p_u_45) then
        p_u_44.watching_unique = p_u_44.watching_unique + 1
        p_u_44.watching[p_u_45] = {
            ["unique"] = p_u_44.watching_unique,
            ["promise"] = v_u_11.new(function(_, _, p46)
                while not p46() do
                    if not p_u_44:can_watch(p_u_45) then
                        p_u_44:unwatch(p_u_45)
                        return
                    end
                    v_u_13.Heartbeat:Wait()
                end
            end)
        }
        p_u_44.watching_changed:Fire(p_u_45, true)
    end
end
function v14.unwatch(p47, p48)
    if p47.watching[p48] then
        p47.watching[p48].promise:cancel()
        p47.watching[p48] = nil
        p47.watching_changed:Fire(p48, false)
    end
end
function v14.unwatch_all(p49)
    for v50, _ in pairs(p49.watching) do
        p49:unwatch(v50)
    end
end
function v14.show(p51)
    if #p51.watching_list > 0 then
        p51:_spectate(p51.watching_list[p51.watching_index])
        v_u_3.disable_controls(p51.ClassName)
        p51.UIManager.apps.CoreGuiApp:set_coregui_disabled(p51.ClassName, "touch_gui")
        v_u_2:disable(p51.ClassName)
        p51.instance.Enabled = true
        p51.app_visibility_changed:Fire(true)
    else
        p51.UIManager.set_app_visibility(p51.ClassName, false)
    end
end
function v14.hide(p52)
    p52:_reset_camera()
    p52:unwatch_all()
    v_u_3.enable_controls(p52.ClassName)
    p52.UIManager.apps.CoreGuiApp:reenable_coregui(p52.ClassName, "touch_gui")
    v_u_2:enable(p52.ClassName)
    p52.instance.Enabled = false
    p52.app_visibility_changed:Fire(false)
    p52.spectate_changed:Fire(nil)
end
function v14.get_app_visibility_changed_signal(p53)
    return p53.app_visibility_changed
end
function v14.start(p_u_54)
    p_u_54.app_visibility_changed = v_u_8.new()
    p_u_54.watching = {}
    p_u_54.watching_list = {}
    p_u_54.watching_index = 1
    p_u_54.watching_unique = 0
    p_u_54.watching_changed = v_u_8.new()
    p_u_54.spectate_changed = v_u_8.new()
    p_u_54.watching_changed:Connect(function()
        local v55 = p_u_54.watching_index
        local v56 = p_u_54.watching_list[v55]
        p_u_54.watching_list = p_u_54:_get_watching_list()
        if p_u_54:is_watching(v56) then
            p_u_54.watching_index = table.find(p_u_54.watching_list, v56) or 1
        else
            p_u_54.watching_index = 1
        end
        local v57 = #p_u_54.watching_list > 1
        p_u_54.instance.Container.Left.Visible = v57
        p_u_54.instance.Container.Right.Visible = v57
        if #p_u_54.watching_list > 0 then
            p_u_54:_spectate(p_u_54.watching_list[p_u_54.watching_index])
        else
            p_u_54.UIManager.set_app_visibility(p_u_54.ClassName, false)
        end
    end)
    p_u_54.instance.Container.Left.Activated:Connect(function()
        local v58 = p_u_54
        local v59 = p_u_54.watching_index
        local v60 = #p_u_54.watching_list
        v58.watching_index = (v59 + 1 - 1) % v60 + 1
        p_u_54:_spectate(p_u_54.watching_list[p_u_54.watching_index])
    end)
    p_u_54.instance.Container.Right.Activated:Connect(function()
        local v61 = p_u_54
        local v62 = p_u_54.watching_index
        local v63 = #p_u_54.watching_list
        v61.watching_index = (v62 + -1 - 1) % v63 + 1
        p_u_54:_spectate(p_u_54.watching_list[p_u_54.watching_index])
    end)
    p_u_54.exit_button_activated = p_u_54:_setup_exit_button()
    p_u_54.exit_button_activated:Connect(function()
        p_u_54.UIManager.set_app_visibility(p_u_54.ClassName, false)
    end)
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_54.instance,
        ["default_selection"] = function()
            if p_u_54.instance.Container.Right.Visible then
                return p_u_54.instance.Container.Right
            else
                return p_u_54.instance.ExitButton
            end
        end,
        ["app_name"] = p_u_54.ClassName
    })
end
return v14