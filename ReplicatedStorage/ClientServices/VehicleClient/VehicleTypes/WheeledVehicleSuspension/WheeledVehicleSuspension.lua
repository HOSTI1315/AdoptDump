--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.WheeledVehicleSuspension (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("OccupantAnimator")
local v_u_3 = v1("TweenPromise")
local v4 = v1("Class")
local v_u_5 = v1("Door")
local v_u_6 = v1("package:Promise")
local v_u_7 = {
    ["inactive"] = 0,
    ["pre_forces"] = 1,
    ["post_forces"] = 2
}
local v_u_8 = v1("BaseVehicle")
local v9 = v4("WheeledVehicle", v_u_8)
function v9.__init(p10, p11, p12, p13)
    v_u_8.__init(p10, p11, p12, p13)
    p10.turn_hinge = p12.turn_hinge
    p10.front_wheel_rigs = p12.front_wheel_rigs
    p10.back_wheel_rigs = p12.back_wheel_rigs
    p10.is_lean_vehicle = p13.is_lean_vehicle and true or false
    p10.movement_animations = p13.movement_animations
    p10.bg = p10.vehicle_seat:WaitForChild("BodyGyro")
    p10.bp = p10.vehicle_seat:WaitForChild("BodyPosition")
    p10.bg.MaxTorque = p10.is_lean_vehicle and Vector3.new(0, 0, 400000) or Vector3.new(0, 0, 0)
    p10.bp.MaxForce = Vector3.new(0, 0, 0)
    p10.speed = 0
    p10.driverless_timer = 0
    p10.flipped = {
        ["timer"] = 0,
        ["state"] = v_u_7.inactive
    }
    p10.can_control_speed = true
    p10.boost_promise = v_u_6.resolve()
end
local function v_u_19(p14, p15, p16)
    local v17 = p14:Dot(p15)
    local v18 = p14:Cross(p15)
    if v17 < -0.99999 then
        return CFrame.fromAxisAngle(p16, 3.141592653589793)
    else
        return CFrame.new(0, 0, 0, v18.X, v18.Y, v18.Z, 1 + v17)
    end
end
function v9._update_anchored(p20, p21)
    local v22 = p20.vehicle_seat
    local v23 = v22.Occupant
    if v23 then
        p20.driverless_timer = 0
    else
        p20.driverless_timer = p20.driverless_timer + p21
    end
    if v23 or p20.driverless_timer <= 5 and v22.AssemblyLinearVelocity.Magnitude >= 0.2 then
        v22.Anchored = false
    else
        v22.Anchored = true
    end
end
function v9._update_flip(p24, p25)
    local v26 = p24.vehicle_seat
    local v27 = v26.AssemblyLinearVelocity.Magnitude
    local v28 = v26:GetPivot()
    local v29 = v28.YVector.Y
    local v30 = math.clamp(v29, -1, 1)
    local v31 = math.acos(v30)
    local v32
    if v27 < 16 then
        v32 = v31 >= 0.8726646259971648
    else
        v32 = false
    end
    if p24.flipped.state == v_u_7.inactive then
        if v32 then
            p24.flipped.state = v_u_7.pre_forces
            p24.flipped.timer = 0
        end
    else
        p24.flipped.timer = p24.flipped.timer + p25
    end
    if p24.flipped.state == v_u_7.pre_forces then
        if v32 then
            if p24.flipped.timer >= 2.5 then
                p24.speed = 0
                p24.flipped.state = v_u_7.post_forces
                local v33 = v_u_19(v28.YVector, Vector3.new(0, 1, 0), v28.XVector) * v26.CFrame
                local v34 = v26.Position + Vector3.new(0, 16, 0)
                p24.bg.CFrame = v33
                p24.bg.MaxTorque = Vector3.new(inf, inf, inf)
                p24.bp.Position = v34
                p24.bp.MaxForce = Vector3.new(inf, inf, inf)
            end
        else
            p24.flipped.state = v_u_7.inactive
        end
    end
    if p24.flipped.state == v_u_7.post_forces and (p24.flipped.timer >= 4.5 and v31 <= 0.3490658503988659) then
        p24.flipped.state = v_u_7.inactive
        v26.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        v26.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        if p24.is_lean_vehicle then
            p24.bg.MaxTorque = Vector3.new(0, 0, 400000)
        else
            p24.bg.MaxTorque = Vector3.new(0, 0, 0)
        end
        p24.bp.MaxForce = Vector3.new(0, 0, 0)
    end
end
function v9._update_speed(p35, p36)
    if p35.can_control_speed then
        if p35.flipped.state == v_u_7.inactive then
            local v37 = p35.speed
            local v38 = p35.vehicle_db_entry.max_speed
            local v39 = p35.vehicle_db_entry.acceleration
            local v40 = p35.vehicle_db_entry.drift_slowdown
            local v41 = p35.vehicle_seat
            local v42 = v41.ThrottleFloat
            local v43 = v41.Occupant == nil and 0 or v42
            local v44 = math.clamp(v43, -1, 1)
            if v_u_5.entering_door then
                v37 = v38 / 2
            elseif v44 > 0 and v37 < v38 or v44 < 0 and -v38 < v37 then
                v37 = v37 + v39 * v44 * p36
            elseif v44 == 0 then
                v37 = math.abs(v37) < 1 and 0 or v37 + -math.sign(v37) * v40 * p36
            end
            if math.abs(v37) > v38 / 3 then
                local v45 = v41.AssemblyLinearVelocity.Magnitude
                local v46 = v37 / 2
                if v45 < math.abs(v46) then
                    local v47 = math.sign(v37)
                    v37 = v41.Velocity.Magnitude * v47
                end
            end
            p35.speed = v37
        end
    else
        return
    end
end
function v9._update_wheel_motor(p48, p49)
    local v50 = p49.wheel_configuration.is_powered and true or false
    local v51 = -p48.speed / p49.wheel_radius
    local v52 = p49.wheel_configuration.speed_multiplier
    p49.motor.AngularVelocity = v51 * v52
    local v53 = p49.motor
    local v54
    if v50 then
        v54 = Enum.ActuatorType.Motor
    else
        v54 = Enum.ActuatorType.None
    end
    v53.AngularActuatorType = v54
end
function v9._update_wheels(p55)
    local v56 = p55.vehicle_seat.SteerFloat
    local v57 = p55.vehicle_seat.Occupant == nil and 0 or v56
    p55.turn_hinge.TargetAngle = p55.vehicle_db_entry.turn_angle * -v57 * ((p55.model_scale + 1) / 2)
    local v58 = p55.turn_hinge.CurrentAngle
    local v59 = math.rad(v58)
    local v60 = CFrame.fromEulerAnglesXYZ(v59, 0, 0)
    for _, v61 in p55.front_wheel_rigs do
        p55:_update_wheel_motor(v61)
        v61.turn_attach.CFrame = v61.turn_attach_cf * v60
    end
    for _, v62 in p55.back_wheel_rigs do
        p55:_update_wheel_motor(v62)
    end
end
function v9._update_lean(p63)
    if p63.is_lean_vehicle and not p63.recovering_from_flip then
        local v64 = p63.speed
        local v65 = p63.vehicle_db_entry.max_speed
        local v66 = p63.vehicle_db_entry.lean_angle
        local v67 = p63.vehicle_seat
        local v68 = v67.SteerFloat
        local v69 = v67.Occupant == nil and 0 or v68
        local v70 = v67.Position
        local v71 = v67.CFrame.lookVector.X
        local v72 = v67.CFrame.lookVector.Z
        local v73 = Vector3.new(v71, 0, v72)
        local v74 = -v66 * v69 * math.abs(v64) / v65
        local v75 = math.rad(v74)
        p63.bg.CFrame = CFrame.lookAt(v70, v70 + v73) * CFrame.fromEulerAnglesXYZ(0, 0, v75)
    end
end
function v9._update_animations(p76)
    if p76.movement_animations then
        local v77 = p76.vehicle_seat.Occupant
        local v78 = v_u_2.get_tracks(p76)
        if v77 == nil and v78 then
            v_u_2.clear_tracks(p76)
            return
        elseif v_u_2.are_tracks_loaded(p76) then
            local v79 = v78.idle
            local v80 = v78.forward
            local v81 = v78.backward
            if not (v79.IsPlaying and (v80.IsPlaying and v81.IsPlaying)) then
                v_u_2.reset_animation_playback(p76)
            end
            local v82 = p76.speed
            if v77 then
                if v82 > 0 then
                    v_u_2.batch_adjust_speed_once({ v80, v81 }, 1, 0.2)
                    v_u_2.adjust_weight_once(v79, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v81, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v80, 1, 0.2)
                    return
                elseif v82 < 0 then
                    v_u_2.batch_adjust_speed_once({ v80, v81 }, 1, 0.2)
                    v_u_2.adjust_weight_once(v79, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v80, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v81, 1, 0.2)
                else
                    v_u_2.adjust_weight_once(v79, 1, 0.2)
                    v_u_2.adjust_weight_once(v80, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v81, 0.001, 0.2)
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end
function v9.update(p83, p84)
    v_u_8.update(p83, p84)
    if p83.vehicle_model:IsDescendantOf(workspace) then
        p83:_update_animations()
        p83:_update_anchored(p84)
        if not p83.vehicle_seat.Anchored then
            p83:_update_flip(p84)
            p83:_update_speed(p84)
            p83:_update_wheels()
            p83:_update_lean()
        end
    else
        return
    end
end
function v9.is_boosting(p85)
    return p85.boost_promise:getStatus() == v_u_6.Status.Started
end
function v9.boost_absolute_speed(p_u_86, p_u_87, p88, p_u_89, p_u_90)
    p_u_86.boost_promise:cancel()
    local v_u_91 = math.sign(p_u_87)
    local v_u_92 = p_u_86.speed
    p_u_86.can_control_speed = false
    p_u_86.boost_promise = v_u_3.callback(0, 1, TweenInfo.new(p88), function(p93)
        local v94 = v_u_92
        local v95 = p_u_87
        p_u_86.speed = (1 - p93) * v94 + p93 * v95
    end):andThen(function()
        return v_u_6.delay(p_u_89)
    end):andThen(function()
        local v96 = v_u_91 * p_u_87 - p_u_86.vehicle_db_entry.max_speed
        local v97 = math.max(0, v96)
        local v98 = p_u_90 or v97 / p_u_86.drift_slowdown
        if v97 > 0 and v98 > 0 then
            return v_u_3.callback(0, 1, TweenInfo.new(v98), function(p99)
                local v100 = p_u_86
                local v101 = p_u_87
                local v102 = p_u_86.vehicle_db_entry.max_speed * v_u_91
                v100.speed = (1 - p99) * v101 + p99 * v102
            end)
        else
            return v_u_6.resolve()
        end
    end):finally(function()
        p_u_86.can_control_speed = true
    end)
    return p_u_86.boost_promise
end
function v9.boost_percentage_max_speed(p103, p104, p105, p106, p107)
    return p103:boost_absolute_speed(p103.vehicle_db_entry.max_speed * math.max(1, p104), p105, p106, p107)
end
function v9.destroy(p108)
    v_u_8.destroy(p108)
    if v_u_2.get_tracks(p108) then
        v_u_2.clear_tracks(p108)
    end
end
return v9