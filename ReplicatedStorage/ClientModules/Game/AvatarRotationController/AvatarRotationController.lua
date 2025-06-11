--// ReplicatedStorage.ClientModules.Game.AvatarRotationController (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Spring")
local v_u_4 = v1("Signal")
local v_u_5 = v1("Maid")
local v_u_6 = game:GetService("UserInputService")
local v_u_7 = game:GetService("RunService")
local v8 = v2("AvatarRotationController")
function v8.__init(p_u_9)
    p_u_9.rotate_spring = v_u_3.new(1, 1.5, 0)
    p_u_9.rotating = false
    p_u_9.last_rotate_type = nil
    p_u_9.current_drag_position = nil
    p_u_9.last_drag_position = nil
    p_u_9.thumbstick_position = nil
    p_u_9.rotated_signal = v_u_4.new()
    p_u_9.on_rotating_changed_signal = v_u_4.new()
    p_u_9.maid = v_u_5.new()
    p_u_9.maid:GiveTask(p_u_9.rotated_signal)
    p_u_9.maid:GiveTask(p_u_9.on_rotating_changed_signal)
    p_u_9.maid:GiveTask(v_u_6.InputBegan:Connect(function(p10, p11)
        if not p_u_9.rotating then
            local v12 = p10.UserInputType
            if v12 == Enum.UserInputType.MouseButton1 or (v12 == Enum.UserInputType.MouseButton2 or v12 == Enum.UserInputType.Touch) then
                local v13 = p10.Position
                if p_u_9.can_start_rotation_callback == nil or p_u_9.can_start_rotation_callback("drag", {
                    ["position"] = v13,
                    ["game_processed_event"] = p11
                }) then
                    p_u_9.rotating = true
                    p_u_9.last_rotate_type = "drag"
                    p_u_9.last_drag_position = v13
                    p_u_9.current_drag_position = v13
                    p_u_9:_on_rotate_began()
                end
            end
        end
    end))
    p_u_9.maid:GiveTask(v_u_6.InputChanged:Connect(function(p14, _)
        local v15 = p14.UserInputType
        if v15 == Enum.UserInputType.MouseMovement or v15 == Enum.UserInputType.Touch then
            if p_u_9.rotating then
                p_u_9.last_rotate_type = "drag"
                p_u_9.current_drag_position = p14.Position
                return
            end
        elseif v15 == Enum.UserInputType.Gamepad1 and p14.KeyCode == Enum.KeyCode.Thumbstick2 then
            p_u_9.last_rotate_type = "thumbstick"
            local v16 = p14.Position
            local v17 = v16.X
            if math.abs(v17) > 0.15 then
                if not p_u_9.rotating then
                    p_u_9.rotating = true
                    p_u_9:_on_rotate_began()
                end
            elseif p_u_9.rotating then
                p_u_9.rotating = false
                p_u_9:_on_rotate_ended()
            end
            p_u_9.thumbstick_position = v16
        end
    end))
    p_u_9.maid:GiveTask(v_u_6.InputEnded:Connect(function(p18, _)
        if p_u_9.rotating then
            local v19 = p18.UserInputType
            if v19 == Enum.UserInputType.MouseButton1 or (v19 == Enum.UserInputType.MouseButton2 or v19 == Enum.UserInputType.Touch) then
                p_u_9.rotating = false
                p_u_9.last_rotate_type = "drag"
                p_u_9:_on_rotate_ended()
            end
        end
    end))
end
function v8._step_rotate_inputs(p20, p21)
    local v22 = p20.last_rotate_type
    local v23 = 0
    local v24 = 0
    if v22 ~= "drag" then
        if v22 == "thumbstick" then
            v23 = p20.thumbstick_position.X * p21
            v24 = 0
        end
        return v23, v24
    end
    local v25 = p20.current_drag_position
    local v26 = p20.last_drag_position
    if v26 then
        local v27 = (v25 - v26).X
        local v28 = workspace.CurrentCamera.ViewportSize.Y
        v23 = v27 / v28
        v24 = v27 / v28 / p21 * 0.01
    end
    p20.last_drag_position = p20.current_drag_position
    return v23, v24
end
function v8._after_input_step(p29, p30)
    if p29.last_rotate_type ~= nil then
        local v31, v32 = p29:_step_rotate_inputs(p30)
        local v33 = p29.rotating
        local v34 = p29.rotate_spring
        if v33 then
            v34:set_frequency(10)
            v34:set_goal(v32)
            v34:update(p30)
            if v31 ~= 0 then
                p29.rotated_signal:Fire(p29.last_rotate_type, v31)
                return
            end
        else
            v34:set_frequency(1.5)
            v34:set_goal(0)
            v34:update(p30)
            local v35 = p29.rotate_spring:get_position()
            if math.abs(v35) > 1e-6 then
                p29.rotated_signal:Fire(p29.last_rotate_type, v35)
            end
        end
    end
end
function v8._on_rotate_began(p36)
    p36.rotate_spring:reset(0)
    p36.on_rotating_changed_signal:Fire(true)
end
function v8._on_rotate_ended(p37)
    p37.rotate_spring:reset(p37.rotate_spring:get_position())
    p37.on_rotating_changed_signal:Fire(false)
end
function v8.set_can_start_rotation_callback(p38, p39)
    p38.can_start_rotation_callback = p39
end
function v8.bind_to_rotated(p40, p41)
    return p40.rotated_signal:Connect(p41)
end
function v8.bind_to_on_rotating_changed(p42, p43)
    return p42.on_rotating_changed_signal:Connect(p43)
end
function v8.reset(p44)
    p44.rotating = false
    p44.last_rotate_type = nil
    p44.current_drag_position = nil
    p44.last_drag_position = nil
    p44.thumbstick_position = nil
    p44.rotate_spring:reset(0)
end
function v8.start_input_step_binding(p_u_45, p_u_46)
    assert(p_u_46)
    p_u_45.maid.unbind = nil
    v_u_7:BindToRenderStep(p_u_46, Enum.RenderPriority.Input.Value + 1, function(p47)
        p_u_45:_after_input_step(p47)
    end)
    function p_u_45.maid.unbind()
        v_u_7:UnbindFromRenderStep(p_u_46)
    end
end
function v8.stop_input_step_binding(p48)
    p48.maid.unbind = nil
end
function v8.Destroy(p49)
    p49.maid:Destroy()
end
return v8