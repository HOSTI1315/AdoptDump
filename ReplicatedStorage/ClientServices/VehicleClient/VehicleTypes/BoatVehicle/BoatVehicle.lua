--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.BoatVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIManager")
local v3 = v1("Class")
local v_u_4 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
local v_u_5 = game:GetService("TweenService")
local v_u_6 = v1("BaseVehicle")
local v7 = v3("BoatVehicle", v_u_6)
local v_u_8 = require(script:WaitForChild("BoatVehicleAnimator"))
v7.animator = v_u_8
function v7.__init(p9, p10, p11, p12)
    v_u_6.__init(p9, p10, p11, p12)
    p9.float_part = p10:WaitForChild("Float")
    p9.engine_part = p10:WaitForChild("Engine")
    p9.idle_target = 0
    p9.surface = v_u_8.SURFACE.Land
    p9.target_angle = ({ p9.engine_part.CFrame:ToEulerAnglesYXZ() })[2]
    p9.internal_animator = v_u_8.new(p10, p12)
    p9.stored_forces = {
        ["turn_torque"] = p9.engine_part.Turn.Gyro.MaxTorque,
        ["lean_torque"] = p9.float_part.Lean.Gyro.MaxTorque
    }
    p9:_init_idle()
    p9:_init_on_land_msg()
end
function v7._get_drag(p13, p14, p15)
    local v16 = p14:Dot(p14) <= 0 and Vector3.new(0, 0, 0) or p14.Unit
    local v17 = p14.Magnitude / p15
    local v18 = math.clamp(v17, 0, 1) ^ 2 * 3.141592653589793 * 0.5
    local v19 = math.tan(v18)
    local v20 = p13.vehicle_db_entry.acceleration * 1.5
    local v21 = math.clamp(v19, 0, v20)
    return -v16 * v21 * p13.float_part:GetMass()
end
function v7._init_on_land_msg(p22)
    p22.surface = p22.internal_animator:get_state().surface
    if p22.surface == v_u_8.SURFACE.Land then
        v_u_2.apps.HintApp:hint({
            ["text"] = "This vehicle only works in the water!",
            ["yields"] = false,
            ["overridable"] = true,
            ["length"] = 4.5
        })
    end
end
function v7._init_idle(p_u_23)
    local v_u_24 = Instance.new("NumberValue")
    local v_u_25 = v_u_5:Create(v_u_24, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0), {
        ["Value"] = 1
    })
    p_u_23.maid:GiveTask(v_u_24.Changed:Connect(function(p26)
        local v27 = (p26 - 0.5) * 2
        p_u_23.idle_target = p_u_23.vehicle_db_entry.idle_wobble * v27
    end))
    p_u_23.maid:GiveTask(function()
        v_u_25:Cancel()
        v_u_25:Destroy()
        v_u_24:Destroy()
    end)
    v_u_25:Play()
end
function v7._get_max_speed(p28)
    local v29 = p28.vehicle_db_entry.max_speed
    if p28.surface == v_u_8.SURFACE.Sand then
        return v29 * 0.25
    else
        return v29
    end
end
function v7._update_control(p30, p31, p32)
    local v33 = -p30.vehicle_seat.SteerFloat
    local v34 = p30.vehicle_seat.ThrottleFloat
    local v35 = p30.engine_part.AssemblyLinearVelocity
    local v36 = p32:VectorToObjectSpace(v35)
    local v37 = v36.Z
    local v38 = math.abs(v37) / p30:_get_max_speed()
    local v39 = math.clamp(v38, 0, 1)
    local v40 = 1 - p30.vehicle_db_entry.turn_velocity_damping * v39
    local v41
    if p30.surface == v_u_8.SURFACE.Sand then
        v41 = v40 * 0.25
    else
        v41 = not p30:is_in_water() and 0 or v40
    end
    local v42 = (p30.target_angle + v33 * v41 * p30.vehicle_db_entry.turn_speed * p31) % 6.283185307179586
    p30.target_angle = v42
    local v43 = v36.Z
    local v44 = -math.sign(v43)
    p30.engine_part.Turn.Gyro.CFrame = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), v42)
    p30.float_part.Lean.Gyro.CFrame = p32 * CFrame.fromAxisAngle(Vector3.new(0, 0, 1), p30.idle_target * (1 - v39)) * CFrame.fromAxisAngle(Vector3.new(0, 0, 1), v33 * v41 * p30.vehicle_db_entry.bank_angle * v39) * CFrame.fromAxisAngle(Vector3.new(1, 0, 0), v44 * v39 * p30.vehicle_db_entry.pitch_angle)
    if p30.surface == v_u_8.SURFACE.Water then
        p30.float_part.Lean.Gyro.MaxTorque = p30.stored_forces.lean_torque
    else
        p30.float_part.Lean.Gyro.MaxTorque = Vector3.new(0, 0, 0)
    end
    if p30.surface == v_u_8.SURFACE.Land then
        p30.engine_part.MotorForce.Force = Vector3.new(0, 0, 0)
        p30.engine_part.Turn.Gyro.MaxTorque = Vector3.new(0, 0, 0)
    else
        p30.engine_part.MotorForce.Force = p32.LookVector * v34 * p30.float_part:GetMass() * p30.vehicle_db_entry.acceleration
        p30.engine_part.Turn.Gyro.MaxTorque = p30.stored_forces.turn_torque
    end
    if v35.Magnitude > 0 then
        local v45 = p30:_get_drag(v35, p30:_get_max_speed())
        local v46 = p32.XVector
        local v47
        if v46:Dot(v46) > 0 then
            local v48 = v46.Unit
            v47 = v48 * v48:Dot(v35)
        else
            v47 = Vector3.new(0, 0, 0)
        end
        local v49 = p30:_get_drag(v47, p30.vehicle_db_entry.max_drift_speed)
        p30.engine_part.DragForce.Force = v45 + v49
    else
        p30.engine_part.DragForce.Force = Vector3.new(0, 0, 0)
    end
end
function v7._update_tilt(p50, _, p51)
    local v52 = p50.engine_part.CFrame
    local v53 = p50.vehicle_db_entry.max_tilt_dot
    local v54 = v52.YVector
    local v55 = v54.Y < v53
    if v55 then
        local v56 = p50.vehicle_db_entry.max_tilt
        local v57 = v54.Y
        local v58 = 1 - v56 / math.acos(v57)
        v52 = CFrame.new():Lerp(p51, v58) * v52
    end
    p50.float_part.Tilt.Gyro.MaxTorque = v55 and (p50.stored_forces.tilt_torque or Vector3.new(0, 0, 0)) or Vector3.new(0, 0, 0)
    p50.float_part.Tilt.Gyro.CFrame = v52
end
function v7.is_in_water(p59)
    local v60 = p59.float_part
    local v61 = (v60.CFrame * CFrame.new(0, v60.Size.Y * 0.5, 0)).Position
    local v62 = p59.vehicle_db_entry.water_check_fudge_factor or 0
    return v_u_4.cast_ray({
        ["origin"] = v61,
        ["direction"] = -v60.CFrame.UpVector * (v60.Size.Y + v62),
        ["collision_group"] = "terrain_only"
    }) ~= nil
end
function v7.update(p63, p64)
    v_u_6.update(p63, p64)
    local v65 = p63.internal_animator:get_state()
    p63.surface = v65.surface
    p63:_update_control(p64, v65.flattened_engine_cf)
    p63:_update_tilt(p64, v65.flattened_arc)
    p63.internal_animator:update(p64, v65)
end
return v7