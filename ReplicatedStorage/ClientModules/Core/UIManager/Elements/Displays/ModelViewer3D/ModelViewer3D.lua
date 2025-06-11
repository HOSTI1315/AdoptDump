--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.ModelViewer3D (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ViewportModelFitter")
local v_u_3 = v1("Spring")
local v_u_4 = v1("Signal")
local v5 = v1("Class")
local v_u_6 = v1("Maid")
local v_u_7 = v1("new:GuiVisibility")
local v_u_8 = game:GetService("RunService")
local v_u_9 = game:GetService("UserInputService")
local v_u_10 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true
}
local v_u_11 = {
    [Enum.UserInputType.MouseMovement] = true,
    [Enum.UserInputType.Touch] = true
}
local v12 = v5("ModelViewer3D", v1("UIBaseElement"))
function v12._stop_controls(p13)
    p13.controls_maid:DoCleaning()
end
function v12._init_controls(p_u_14)
    local v_u_15 = false
    local v_u_16 = p_u_14.rotation_x
    local v_u_17 = p_u_14.rotation_y
    local v_u_18 = Vector2.new()
    if p_u_14.can_input then
        p_u_14.controls_maid:GiveTask(p_u_14.instance.InputBegan:Connect(function(p19)
            if v_u_10[p19.UserInputType] then
                v_u_15 = true
                v_u_16 = p_u_14.rotation_x
                v_u_17 = p_u_14.rotation_y
                v_u_18 = Vector2.new(p19.Position.X, p19.Position.Y)
                p_u_14.control_changed:Fire(v_u_15)
            end
        end))
        p_u_14.controls_maid:GiveTask(v_u_9.InputEnded:Connect(function(p20)
            if v_u_15 and v_u_10[p20.UserInputType] then
                v_u_15 = false
                p_u_14.input_ended_at = tick()
                p_u_14.control_changed:Fire(v_u_15)
            end
        end))
        p_u_14.controls_maid:GiveTask(v_u_9.InputChanged:Connect(function(p21)
            if v_u_15 and v_u_11[p21.UserInputType] then
                local v22 = (Vector2.new(p21.Position.X, p21.Position.Y) - v_u_18) / (p_u_14.instance.AbsoluteSize / 2)
                local v23 = p_u_14
                local v24 = v_u_16 - v22.Y * 0.7853981633974483
                v23.rotation_x = math.clamp(v24, -1.3962634015954636, 1.3962634015954636)
                p_u_14.rotation_y = v_u_17 - v22.X * 0.7853981633974483
            end
        end))
    end
    p_u_14.controls_maid:GiveTask(v_u_8.RenderStepped:Connect(function(p25)
        if p_u_14.spin_enabled and (not v_u_15 and tick() - p_u_14.input_ended_at > 1.5) then
            local v26 = p_u_14
            local v27 = p_u_14.rotation_x
            local v28 = p_u_14.target_x_rotation
            local v29 = p25 * 60 * 0.1
            v26.rotation_x = (1 - v29) * v27 + v28 * v29
            p_u_14.rotation_y = p_u_14.rotation_y + 0.5235987755982988 * p25
        end
        p_u_14.distance_spring:update(p25)
        if p_u_14.render_model then
            local v30 = CFrame.fromEulerAnglesYXZ(p_u_14.rotation_x, p_u_14.rotation_y, 0)
            p_u_14.camera.CFrame = v30 * CFrame.new(0, 0, p_u_14:get_distance())
        end
    end))
end
function v12.get_default_distance(p31)
    return p31.default_distance
end
function v12.get_distance(p32)
    return p32.distance_spring:get_position()
end
function v12.set_distance(p33, p34)
    p33.distance_spring:reset(p34)
end
function v12.get_target_distance(p35)
    return p35.distance_spring:get_goal()
end
function v12.set_target_distance(p36, p37)
    p36.distance_spring:set_goal(p37)
end
function v12.reset_rotation(p38, p39, p40)
    p38.rotation_x = p39 or p38.target_x_rotation
    p38.rotation_y = p40 or 0
    p38.input_ended_at = -1
end
function v12.get_spin_enabled(p41)
    return p41.spin_enabled
end
function v12.set_spin_enabled(p42, p43)
    p42.input_ended_at = -1
    p42.spin_enabled = p43 and true or false
end
function v12.get_model(p44)
    return p44.render_model
end
function v12.set_model(p45, p46)
    if p45.render_model then
        p45.render_model:Destroy()
        p45.render_model = nil
    end
    if p46 then
        p45.render_model = p46:Clone()
        p45.render_model:PivotTo(CFrame.new())
        p45.render_model.Parent = p45.instance
        p45.fitter:update_target_model(p45.render_model)
        p45.fitter:recalibrate()
        p45.default_distance = p45.fitter:get_fit_distance()
        p45:set_target_distance(p45.default_distance)
        p45:set_distance(p45.default_distance)
    end
end
function v12.start(p_u_47, p48)
    p_u_47.spin_enabled = true
    p_u_47.can_input = p48.can_input
    p_u_47.input_ended_at = -1
    p_u_47.maid = v_u_6.new()
    p_u_47.controls_maid = v_u_6.new()
    p_u_47.camera = Instance.new("Camera")
    p_u_47.camera.FieldOfView = p48.field_of_view
    p_u_47.camera.Parent = p_u_47.instance
    p_u_47.instance.CurrentCamera = p_u_47.camera
    p_u_47.render_model = nil
    p_u_47.default_distance = 0
    p_u_47.distance_spring = v_u_3.new(0.75, 1, 0)
    p_u_47.target_x_rotation = p48.target_x_rotation
    p_u_47.fitter = v_u_2.new(p_u_47.instance, p_u_47.camera, nil)
    p_u_47.rotation_x = p_u_47.target_x_rotation
    p_u_47.rotation_y = 0
    p_u_47.control_changed = v_u_4.new()
    p_u_47.maid:GiveTask(v_u_7.on_visible_changed(p_u_47.instance, function(p49)
        if p49 then
            p_u_47:_init_controls()
        else
            p_u_47:_stop_controls()
        end
    end))
    return p_u_47
end
function v12.destroy(p50)
    p50:set_model(nil)
    p50:_stop_controls()
    p50.maid:DoCleaning()
end
return v12