--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AvatarEditorApp.AvatarEditorController (ModuleScript)

game:GetService("HttpService")
local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("CriticalSection")
local v_u_5 = v1("AvatarRotationController")
local v6 = v2("AvatarEditorController", v1("UIBaseElement"))
function v6.show(p7)
    p7.instance.Visible = true
end
function v6.hide(p8)
    p8.instance.Visible = false
end
function v6.listen_avatar_rotation(p_u_9)
    p_u_9:stop_listen_avatar_rotation()
    p_u_9.rotation_controller:reset()
    p_u_9.rotation_controller:start_input_step_binding(p_u_9.ClassName .. "AvatarRotationController")
    p_u_9.maid:GiveTask(function()
        p_u_9.rotation_controller:stop_input_step_binding()
    end)
    p_u_9.maid:GiveTask(p_u_9.rotation_controller:bind_to_rotated(function(p10, p11)
        if p_u_9.avatar_editor_app:is_transitioning_screens() then
            return
        else
            local v12 = p_u_9.avatar_editor_app.focus_switcher:get_current_character()
            local v13 = v12:FindFirstChild("HumanoidRootPart")
            local v14 = v12:FindFirstChild("Humanoid")
            if v14 and v13 then
                local v15 = not v14.Sit
                if v15 then
                    v15 = not v12:FindFirstChildWhichIsA("BodyGyro", true)
                end
                if v15 then
                    local v16 = nil
                    if p10 == "drag" then
                        v16 = p11 * 1
                    elseif p10 == "thumbstick" then
                        v16 = p11 * 0.5
                    end
                    v13.CFrame = v13.CFrame * CFrame.Angles(0, 6.283185307179586 * v16, 0)
                end
            end
        end
    end))
end
function v6.stop_listen_avatar_rotation(p17)
    p17.maid:DoCleaning()
end
function v6.start(p18, p19)
    p18.avatar_editor_app = p19
    p18.maid = v_u_3.new()
    p18.critical_section = v_u_4.new()
    p18.rotation_controller = v_u_5.new()
    p18.rotation_controller:set_can_start_rotation_callback(function(_, p20)
        return not p20.game_processed_event
    end)
    return p18
end
return v6