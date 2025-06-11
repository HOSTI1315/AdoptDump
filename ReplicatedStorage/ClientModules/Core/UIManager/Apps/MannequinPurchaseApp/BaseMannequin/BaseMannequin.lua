--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MannequinPurchaseApp.BaseMannequin (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("Signal")
local v_u_5 = game:GetService("RunService")
local v6 = v2("BaseMannequin")
function v6.__init(p_u_7, p8, p9, p10, p11)
    p_u_7.content_type = p10
    p_u_7.model = p9
    p_u_7.mannequin_id = p11
    p_u_7.spawn_cframe = p8
    p_u_7.content_changed_signal = v_u_4.new()
    p_u_7.is_shadow = false
    p_u_7.animation_state = "stopped"
    p_u_7.rotation_state = "paused"
    p_u_7.rotation = 0
    p_u_7.previous_applied_rotation = nil
    p_u_7.maid = v_u_3.new()
    p_u_7.maid:GiveTask(p_u_7.content_changed_signal)
    p_u_7.maid:GiveTask(v_u_5.Heartbeat:Connect(function(p12)
        p_u_7:_step(p12)
    end))
end
function v6._refresh_shadow_mode(_)
    error("BaseMannequin:_refresh_shadow_mode: Not implemented")
end
function v6.build_virtual_mannequin_model(_)
    error("BaseMannequin:build_virtual_mannequin_model: Not implemented")
end
function v6.set_is_shadow(p13, p14)
    if p13.is_shadow ~= p14 then
        p13.is_shadow = p14
        p13:_refresh_shadow_mode()
    end
end
function v6.update_animation_state(p15, p16)
    if p15.animation_state == p16 then
        return
    else
        p15.animation_state = p16
        local v17 = p15.animation_tracks
        if v17 then
            if p16 == "stopped" then
                v17.idle:Stop()
            elseif p16 == "idle" then
                v17.idle:Play(0)
            end
        else
            return
        end
    end
end
function v6.update_rotation_state(p18, p19)
    if p18.rotation_state ~= p19 then
        p18.rotation_state = p19
    end
end
function v6.adjust_rotation(p20, p21)
    p20.rotation = (p20.rotation + p21) % 1
end
function v6._step(p22, p23)
    local v24 = p22.rotation_state
    local v25 = p22.previous_applied_rotation
    local v26 = nil
    if v24 == "paused" then
        v26 = p22.rotation
    elseif v24 == "reset" then
        if p22.rotation == 0 then
            v26 = 0
        elseif v25 > 0.5 then
            local v27 = v25 + 2 * p23
            v26 = math.clamp(v27, 0, 1) % 1
        else
            local v28 = v25 - 2 * p23
            v26 = math.clamp(v28, 0, 1) % 1
        end
    elseif v24 == "reset_turned_around" then
        if v25 >= 0 and v25 < 0.5 then
            local v29 = v25 + 2 * p23
            v26 = math.clamp(v29, 0, 0.5) % 1
        else
            local v30 = v25 - 2 * p23
            v26 = math.clamp(v30, 0.5, 1) % 1
        end
    elseif v24 == "turntable" then
        local v31 = v25 + 0.125 * p23
        v26 = math.clamp(v31, 0, 1) % 1
    end
    if v26 ~= v25 then
        p22.rotation = v26
        local v32 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 6.283185307179586 * v26)
        p22.model:PivotTo(p22.spawn_cframe * v32)
        p22.previous_applied_rotation = v26
    end
end
function v6.get_content_type(p33)
    return p33.content_type
end
function v6.get_content(p34)
    return p34.content
end
function v6.get_model(p35)
    return p35.model
end
function v6.get_front_facing_cframe(p36)
    if p36.cframe_offset then
        return p36.spawn_cframe + p36.cframe_offset
    else
        return p36.spawn_cframe
    end
end
function v6.bind_to_content_changed(p37, p38)
    return p37.content_changed_signal:Connect(p38)
end
function v6.update_content(p39, p40)
    p39.content = p40
    p39.content_changed_signal:Fire()
end
function v6.get_camera_rotation(p41)
    return p41:get_front_facing_cframe()
end
function v6.get_focus_cframe(p42)
    return p42:get_front_facing_cframe()
end
function v6.get_camera_distance(_)
    return 11
end
function v6.get_screen_position(_, p43)
    return Vector2.new(p43.X * 0.5, p43.Y * 0.5)
end
function v6.reset_rotation_for_focus(p44)
    p44:update_rotation_state("reset")
end
function v6.buy(_)
    error("BaseMannequin:buy: Not implemented")
end
function v6.destroy(p45)
    p45.maid:Destroy()
end
return v6