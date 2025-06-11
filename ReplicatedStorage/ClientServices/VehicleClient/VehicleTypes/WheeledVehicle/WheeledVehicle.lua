--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.WheeledVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("OccupantAnimator")
local v_u_3 = v1("TweenPromise")
local v_u_4 = v1("SeatUtil")
local v5 = v1("Class")
local v_u_6 = v1("Door")
local v_u_7 = v1("package:Promise")
local v_u_8 = v1("BaseVehicle")
local v9 = v5("WheeledVehicle", v_u_8)
function v9.__init(p10, p11, p12, p13)
    v_u_8.__init(p10, p11, p12, p13)
    p10.front_rotates = p12.front_rotates
    p10.front_motors = p12.front_motors
    p10.back_motors = p12.back_motors
    p10.wheel_radius = p12.wheel_radius
    p10.max_speed = p13.max_speed
    p10.turn_angle = p13.turn_angle
    p10.lean_angle = p13.lean_angle
    p10.acceleration = p13.acceleration
    p10.drift_slowdown = p13.drift_slowdown
    p10.is_lean_vehicle = p13.is_lean_vehicle and true or false
    p10.movement_animations = p13.movement_animations
    p10.bg = p10.vehicle_seat:WaitForChild("BodyGyro")
    p10.bp = p10.vehicle_seat:WaitForChild("BodyPosition")
    p10.bg.MaxTorque = p10.is_lean_vehicle and Vector3.new(0, 0, 400000) or Vector3.new(0, 0, 0)
    p10.bp.MaxForce = Vector3.new(0, 0, 0)
    local v14 = p10.front_motors[1] or p10.back_motors[1]
    local v15 = not v14 and 0 or v14.AngularVelocity
    p10.speed = math.abs(v15) * p10.wheel_radius
    p10.flipped_timer = 0
    p10.driverless_timer = 0
    p10.recovering_from_flip = false
    p10.can_control_speed = true
    p10.boost_promise = v_u_7.resolve()
end
function v9._update_anchored(p16, p17)
    local v18 = p16.vehicle_seat
    local v19 = v18.Occupant
    if v19 then
        p16.driverless_timer = 0
    else
        p16.driverless_timer = p16.driverless_timer + p17
    end
    if v19 or p16.driverless_timer <= 5 and v18.Velocity.Magnitude >= 0.2 then
        v18.Anchored = false
    else
        v18.Anchored = true
    end
end
function v9._update_flip(p20, p21)
    local v22 = p20.vehicle_seat
    local v23 = v22.Velocity.Magnitude
    local v24 = v22.CFrame.YVector.Y
    local v25 = math.clamp(v24, -1, 1)
    local v26 = math.asin(v25)
    if p20.recovering_from_flip then
        if v26 > 1.3962634015954636 and (v22.Velocity.Magnitude < 1 and v22.RotVelocity.Magnitude < 1) then
            p20.flipped_timer = 0
        end
    elseif v26 < 0.8726646259971648 and v23 < 16 then
        p20.flipped_timer = p20.flipped_timer + p21
    else
        p20.flipped_timer = 0
    end
    if p20.flipped_timer > 2.5 and not p20.recovering_from_flip then
        p20.recovering_from_flip = true
        local v27 = (v22.CFrame.lookVector * Vector3.new(1, 0, 1)).unit
        local v28 = v27:Cross(v27)
        local v29 = CFrame.fromMatrix(Vector3.new(0, 0, 0), v28, Vector3.new(0, 1, 0))
        local v30 = v22.Position + Vector3.new(0, 16, 0)
        p20.bg.CFrame = v29
        p20.bg.MaxTorque = Vector3.new(10000, 10000, 10000)
        p20.bp.Position = v30
        p20.bp.MaxForce = Vector3.new(inf, inf, inf)
    elseif p20.flipped_timer == 0 and p20.recovering_from_flip then
        p20.recovering_from_flip = false
        if p20.is_lean_vehicle then
            p20.bg.MaxTorque = Vector3.new(0, 0, 400000)
        else
            p20.bg.MaxTorque = Vector3.new(0, 0, 0)
        end
        p20.bp.MaxForce = Vector3.new(0, 0, 0)
    end
end
function v9._update_speed(p31, p32)
    if p31.can_control_speed then
        local v33 = p31.speed
        local v34 = p31.max_speed
        local v35 = p31.acceleration
        local v36 = p31.drift_slowdown
        local v37 = p31.vehicle_seat
        local v38 = v37.ThrottleFloat
        local v39 = v37.Occupant == nil and 0 or v38
        local v40 = math.clamp(v39, -1, 1)
        if v_u_6.entering_door then
            v33 = v34 / 2
        elseif v40 > 0 and v33 < v34 or v40 < 0 and -v34 < v33 then
            v33 = v33 + v35 * v40 * p32
        elseif v40 == 0 then
            v33 = math.abs(v33) < 1 and 0 or v33 + -math.sign(v33) * v36 * p32
        end
        if math.abs(v33) > v34 / 3 then
            local v41 = v37.Velocity.Magnitude
            local v42 = v33 / 2
            if v41 < math.abs(v42) then
                local v43 = math.sign(v33)
                v33 = v37.Velocity.Magnitude * v43
            end
        end
        p31.speed = v33
    end
end
function v9._update_motors(p44)
    local v45 = p44.speed
    local v46 = p44.wheel_radius
    local v47 = p44.model_scale
    local v48 = p44.front_motors
    local v49 = p44.back_motors
    local v50 = p44.front_rotates
    local v51 = p44.turn_angle
    local v52 = v45 / v46
    local v53 = p44.vehicle_seat
    local v54 = v53.Occupant
    local v55 = v53.SteerFloat
    local v56 = v54 == nil and 0 or v55
    for _, v57 in v48 do
        local v58 = v57:FindFirstChild("SpeedMultiplier") and (v57.SpeedMultiplier.Value or 1) or 1
        v57.AngularVelocity = -v52 / v47 * v58
    end
    for _, v59 in v49 do
        local v60 = v59:FindFirstChild("SpeedMultiplier") and (v59.SpeedMultiplier.Value or 1) or 1
        v59.AngularVelocity = v60 * -v52 / v47 * v60
    end
    for _, v61 in v50 do
        v61.TargetAngle = v51 * v56 * ((v47 + 1) / 2)
    end
end
function v9._update_lean(p62)
    if p62.is_lean_vehicle and not p62.recovering_from_flip then
        local v63 = p62.speed
        local v64 = p62.max_speed
        local v65 = p62.lean_angle
        local v66 = p62.vehicle_seat
        local v67 = v66.SteerFloat
        local v68 = v66.Occupant == nil and 0 or v67
        local v69 = v66.Position
        local v70 = v66.CFrame.lookVector.X
        local v71 = v66.CFrame.lookVector.Z
        local v72 = Vector3.new(v70, 0, v71)
        local v73 = -v65 * v68 * math.abs(v63) / v64
        local v74 = math.rad(v73)
        p62.bg.CFrame = CFrame.lookAt(v69, v69 + v72) * CFrame.fromEulerAnglesXYZ(0, 0, v74)
    end
end
function v9._update_animations(p75)
    if p75.movement_animations then
        local v76 = v_u_4.get_occupant(p75.vehicle_seat)
        local v77 = v_u_2.get_tracks(p75)
        if v76 == nil and v77 then
            v_u_2.clear_tracks(p75)
            return
        elseif v_u_2.are_tracks_loaded(p75) then
            local v78 = v77.idle
            local v79 = v77.forward
            local v80 = v77.backward
            if not (v78.IsPlaying and (v79.IsPlaying and v80.IsPlaying)) then
                v_u_2.reset_animation_playback(p75)
            end
            local v81 = p75.speed
            if v76 then
                if v81 > 0 then
                    v_u_2.batch_adjust_speed_once({ v79, v80 }, 1, 0.2)
                    v_u_2.adjust_weight_once(v78, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v80, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v79, 1, 0.2)
                    return
                elseif v81 < 0 then
                    v_u_2.batch_adjust_speed_once({ v79, v80 }, 1, 0.2)
                    v_u_2.adjust_weight_once(v78, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v79, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v80, 1, 0.2)
                else
                    v_u_2.adjust_weight_once(v78, 1, 0.2)
                    v_u_2.adjust_weight_once(v79, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v80, 0.001, 0.2)
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
function v9.update(p82, p83)
    v_u_8.update(p82, p83)
    p82:_update_animations()
    if p82.vehicle_model:IsDescendantOf(workspace) then
        p82:_update_anchored(p83)
        if not p82.vehicle_seat.Anchored then
            p82:_update_flip(p83)
            p82:_update_speed(p83)
            p82:_update_motors()
            p82:_update_lean()
        end
    else
        return
    end
end
function v9.is_boosting(p84)
    return p84.boost_promise:getStatus() == v_u_7.Status.Started
end
function v9.boost_absolute_speed(p_u_85, p_u_86, p87, p_u_88, p_u_89)
    p_u_85.boost_promise:cancel()
    local v_u_90 = math.sign(p_u_86)
    local v_u_91 = p_u_85.speed
    p_u_85.can_control_speed = false
    p_u_85.boost_promise = v_u_3.callback(0, 1, TweenInfo.new(p87), function(p92)
        local v93 = v_u_91
        local v94 = p_u_86
        p_u_85.speed = (1 - p92) * v93 + p92 * v94
    end):andThen(function()
        return v_u_7.delay(p_u_88)
    end):andThen(function()
        local v95 = v_u_90 * p_u_86 - p_u_85.max_speed
        local v96 = math.max(0, v95)
        local v97 = p_u_89 or v96 / p_u_85.drift_slowdown
        if v96 > 0 and v97 > 0 then
            return v_u_3.callback(0, 1, TweenInfo.new(v97), function(p98)
                local v99 = p_u_85
                local v100 = p_u_86
                local v101 = p_u_85.max_speed * v_u_90
                v99.speed = (1 - p98) * v100 + p98 * v101
            end)
        else
            return v_u_7.resolve()
        end
    end):finally(function()
        p_u_85.can_control_speed = true
    end)
    return p_u_85.boost_promise
end
function v9.boost_percentage_max_speed(p102, p103, p104, p105, p106)
    return p102:boost_absolute_speed(p102.vehicle_db_entry.max_speed * math.max(1, p103), p104, p105, p106)
end
function v9.destroy(p107)
    v_u_8.destroy(p107)
    if v_u_2.get_tracks(p107) then
        v_u_2.clear_tracks(p107)
    end
end
return v9