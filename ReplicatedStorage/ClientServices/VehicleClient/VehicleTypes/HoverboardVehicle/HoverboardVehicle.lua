--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.HoverboardVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlatformM")
local v_u_3 = v1("Spring")
local v4 = v1("Class")
local v_u_5 = v1("Door")
local v_u_6 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
local v_u_7 = game:GetService("UserInputService")
local v_u_8 = {
    Vector3.new(0.5, 0, 0.5),
    Vector3.new(0.5, 0, -0.5),
    Vector3.new(-0.5, 0, 0.5),
    Vector3.new(-0.5, 0, -0.5),
    Vector3.new(0, 0, 0)
}
local v_u_9 = v1("BaseVehicle")
local v10 = v4("HoverboardVehicle", v_u_9)
function v10.__init(p11, p12, p13, p14)
    v_u_9.__init(p11, p12, p13, p14)
    p11.anchor = p11.vehicle_model.Anchor
    p11.bv = p11.anchor.HoverBodyVelocity
    p11.bg = p11.anchor.HoverBodyGyro
    p11.bp = p11.anchor.HoverBodyPosition
    p11.collision_part = p11.vehicle_model.CollisionPart
    p11.offset_attachment = p11.anchor.OffsetAttachment
    p11.bg.MaxTorque = Vector3.new(1000000, 1000000, 1000000)
    p11.bp.MaxForce = Vector3.new(0, 400000, 0)
    p11.bv.Velocity = Vector3.new(0, 0, 0)
    p11.bg.CFrame = p11.vehicle_seat.CFrame
    p11.bp.Position = p11.vehicle_seat.Position
    local v15 = p12:FindFirstChild("Pivot")
    local v16 = p11.vehicle_model.ContactSurface
    p11.contact_offset = v15.CFrame:ToObjectSpace(v16.CFrame)
    p11.contact_size = v16.Size
    p11.resting_hover_height = -p11.contact_offset.Y
    p11.throttle_tilt_spring = v_u_3.new(0.2, 0.5, 0)
    p11.throttle_spring = v_u_3.new(2, 1, 0)
    p11.steer_tilt_spring = v_u_3.new(0.4, 1, 0)
    p11.steer_spring = v_u_3.new(10, 200, 0)
    p11.stuck_timer = 0
    p11.descent_speed = 0
    p11.driverless_timer = 0
    local v17 = -p11.anchor.CFrame.ZVector
    local v18 = v17.Z
    local v19 = v17.X
    p11.target_angle = math.atan2(v18, v19)
    p11.flap_hinges = p11:_get_flap_hinges()
    p11:_init_on_anchor_reset()
    p11.is_touch_controls = false
    p11:_init_touch_control_listener()
end
function v10._init_touch_control_listener(p_u_20)
    local function v22(p21)
        if p21 == Enum.UserInputType.Touch then
            p_u_20.is_touch_controls = true
            p_u_20.bg.P = 30000
        else
            p_u_20.is_touch_controls = false
            p_u_20.bg.P = 3000
        end
    end
    if v_u_7:GetLastInputType() == Enum.UserInputType.Touch then
        p_u_20.is_touch_controls = true
        p_u_20.bg.P = 30000
    else
        p_u_20.is_touch_controls = false
        p_u_20.bg.P = 3000
    end
    p_u_20.maid:GiveTask(v_u_7.LastInputTypeChanged:Connect(v22))
end
function v10._init_on_anchor_reset(p_u_23)
    p_u_23.maid:GiveTask(p_u_23.anchor:GetPropertyChangedSignal("CFrame"):Connect(function()
        p_u_23.stuck_timer = 0
        p_u_23.descent_speed = 0
        local v24 = -p_u_23.anchor.CFrame.ZVector
        local v25 = v24.Z
        local v26 = v24.X
        local v27 = math.atan2(v25, v26)
        p_u_23.target_angle = v27
        local v28 = math.cos(v27)
        local v29 = math.sin(v27)
        local v30 = Vector3.new(v28, 0, v29):Cross(Vector3.new(0, 1, 0))
        p_u_23.bg.CFrame = CFrame.fromMatrix(Vector3.new(0, 0, 0), v30, Vector3.new(0, 1, 0))
        p_u_23.bp.Position = p_u_23.anchor.Position
        p_u_23.bv.Velocity = Vector3.new(0, 0, 0)
        p_u_23.throttle_tilt_spring:reset(0)
        p_u_23.throttle_spring:reset(0)
        p_u_23.steer_tilt_spring:reset(0)
        p_u_23.steer_spring:reset(0)
        for _, v31 in p_u_23.vehicle_model:GetDescendants() do
            if v31:IsA("BasePart") then
                v31.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                v31.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
        end
    end))
end
function v10._get_rudder_input(p_u_32)
    local v_u_33 = 0
    local v38 = {
        ["desktop"] = function()
            v_u_33 = -p_u_32.vehicle_seat.SteerFloat
            if v_u_2.is_using_gamepad() then
                local v34 = -p_u_32.vehicle_seat.ThrottleFloat
                local v35 = v_u_33 * v_u_33 + v34 * v34
                if math.abs(v35) <= 0.5625 then
                    v_u_33 = 0
                end
            end
        end,
        ["tablet"] = function()
            v_u_33 = -p_u_32.vehicle_seat.SteerFloat
            local v36 = -p_u_32.vehicle_seat.ThrottleFloat
            local v37 = v_u_33 * v_u_33 + v36 * v36
            if math.abs(v37) <= 0.5625 then
                v_u_33 = 0
            end
        end,
        ["phone"] = "tablet",
        ["console"] = "desktop"
    }
    v_u_2.run(v38)
    return v_u_33
end
function v10._get_flap_hinges(p39)
    local v40 = {}
    local v41 = p39.vehicle_model:FindFirstChild("Flaps")
    if v41 then
        for _, v42 in v41:GetChildren() do
            local v43 = v42:FindFirstChild("Axis")
            if v43 then
                v43 = v43:FindFirstChild("HingeConstraint")
            end
            if v43 and v43:IsA("HingeConstraint") then
                v40[v42.Name] = {
                    ["model"] = v42,
                    ["constraint"] = v43,
                    ["angular_velocity"] = v43.AngularVelocity
                }
            end
        end
    end
    return v40
end
function v10._animate_rudder_hinge(p44)
    local v45 = p44.flap_hinges.Rudder
    if v45 then
        local v46 = p44:_get_rudder_input()
        v45.constraint.TargetAngle = v46 * -20
    end
end
function v10._update_anchor(p47, p48)
    local v49 = p47.vehicle_seat
    local v50 = v49.Occupant
    if v50 then
        p47.driverless_timer = 0
    else
        p47.driverless_timer = p47.driverless_timer + p48
    end
    if v50 == nil and (p47.driverless_timer > 5 or p47.anchor.Velocity.Magnitude < 0.2) then
        v49.Anchored = true
    else
        v49.Anchored = false
    end
end
function v10._get_calculated_throttle(p51)
    local v52 = p51.throttle_spring:get_position()
    return math.clamp(v52, -1, 1)
end
function v10._get_calculated_steer(p53)
    local v54 = p53.steer_spring:get_position()
    return math.clamp(v54, -1, 1)
end
function v10._get_floor_contact_info(p_u_55)
    local v56 = p_u_55.anchor.CFrame * p_u_55.contact_offset
    local v57 = { p_u_55.vehicle_model }
    for _, v58 in p_u_55:get_occupant_players() do
        if v58.Character then
            local v59 = v58.Character
            table.insert(v57, v59)
        end
    end
    local v60 = v56.YVector
    local v61 = nil
    local v62 = 0
    local v63 = Vector3.new(0, 0, 0)
    for _, v64 in v_u_8 do
        local v65 = v56 * (p_u_55.contact_size * v64)
        local v66 = v65 + v60 * (p_u_55.resting_hover_height + 0.5)
        local v67 = v65 - v60 * 4
        local v_u_68 = 0
        local v72 = v_u_6.cast_ray({
            ["origin"] = v66,
            ["direction"] = v67 - v66,
            ["filter_type"] = Enum.RaycastFilterType.Exclude,
            ["instances"] = v57,
            ["callback"] = function(p69, p70)
                v_u_68 = v_u_68 + 1
                if v_u_68 > 10 then
                    p70()
                    return false
                else
                    if p_u_55.collision_part:CanCollideWith(p69.Instance) then
                        local v71 = p69.Instance.Parent
                        if v71 and not v71:FindFirstChildOfClass("Humanoid") then
                            return true
                        end
                    end
                    return false
                end
            end
        })
        if v72 then
            local v73 = v72.Normal.Y
            local v74 = math.clamp(v73, -1, 1)
            if 1.5707963267948966 - math.asin(v74) < 0.7853981633974483 then
                v62 = v62 + 1
                v63 = v63 + v72.Normal
            end
            if not v61 or v72.Position.Y > v61.Y then
                v61 = v72.Position
            end
        end
    end
    local v75 = nil
    if v62 > 0 then
        local v76 = v63 / v62
        local v77 = v76:Dot(v76) <= 0 and Vector3.new(0, 0, 0) or v76.Unit
        local v78 = v77.Y
        local v79 = math.clamp(v78, -1, 1)
        if 1.5707963267948966 - math.asin(v79) < 0.7853981633974483 then
            v75 = v77
        end
    end
    return v61, v75
end
function v10._update_springs(p80, p81)
    local v82 = p80.vehicle_seat
    local v83 = p80.throttle_tilt_spring
    local v84 = p80.throttle_spring
    local v85 = p80.steer_tilt_spring
    local v86 = p80.steer_spring
    local v87 = p80.vehicle_db_entry.max_speed
    local v88 = p80.anchor.Velocity.Magnitude
    local v89 = p80.bv.Velocity.Magnitude
    if v88 < 5 and v89 - v88 > 5 then
        p80.stuck_timer = p80.stuck_timer + p81
    else
        p80.stuck_timer = 0
    end
    if p80.stuck_timer > 0.25 then
        v84:reset(v88 / v87)
    end
    local v90 = false
    local v91, v92
    if v82.Occupant == nil then
        v91 = 0
        v92 = 0
    elseif v_u_5.entering_door then
        v91 = 0.5
        v92 = 0
    elseif p80.is_touch_controls then
        local v93 = workspace.CurrentCamera.CFrame
        local v94 = p80:get_control_vector()
        local v95 = v94.Magnitude
        if v95 > 0.0001 then
            local v96 = v93:VectorToWorldSpace(v94) * Vector3.new(1, 0, 1)
            local v97 = v96:Dot(v96) <= 0 and Vector3.new(0, 0, 0) or v96.Unit
            local v98 = p80.vehicle_seat.CFrame.lookVector * Vector3.new(1, 0, 1)
            local v99 = v98:Dot(v98) <= 0 and Vector3.new(0, 0, 0) or v98.Unit
            local v100 = v99:Dot(v97)
            local v101 = math.clamp(v100, -1, 1)
            local v102 = math.acos(v101)
            local v103 = v97:Cross(v99).Y
            local v104 = math.sign(v103)
            local v105 = v102 / 3.141592653589793 * v104
            v92 = math.clamp(v105, -1, 1)
            local v106 = math.abs(v92)
            if v106 > 0.5 then
                v91 = 0
                v90 = true
            else
                v91 = ((1 - v106) * 0.5 + 0.5) * math.clamp(v95, 0, 1)
            end
        else
            v91 = 0
            v92 = 0
        end
    else
        v91 = v82.ThrottleFloat
        v92 = v82.SteerFloat
    end
    local v107 = p80.is_touch_controls
    if v91 == 0 and not v107 then
        local v108 = v84:get_position()
        if math.abs(v108) > 0.12 then
            v84:set_frequency(0.3)
            v84:set_damping_ratio(2)
        else
            v84:set_frequency(4)
            v84:set_damping_ratio(2)
        end
    elseif v91 == 0 and v107 then
        if v90 then
            v84:set_frequency(16)
            v84:set_damping_ratio(8)
        elseif p80:_get_calculated_throttle() > 0.12 then
            v84:set_frequency(4)
            v84:set_damping_ratio(8)
        else
            v84:set_frequency(4)
            v84:set_damping_ratio(2)
        end
    else
        local v109 = v84:get_position()
        if math.sign(v109) == math.sign(v91) then
            v84:set_frequency(1)
            v84:set_damping_ratio(2)
        else
            v84:set_frequency(1)
            v84:set_damping_ratio(8)
        end
    end
    v83:set_goal(v91)
    v84:set_goal(v91)
    v85:set_goal(v92)
    v86:set_goal(v92)
    v83:update(p81)
    v84:update(p81)
    v85:update(p81)
    v86:update(p81)
end
function v10._update_physics(p110, p111)
    local v112 = p110.vehicle_db_entry.max_speed
    local v113 = p110.vehicle_db_entry.turn_rate_touch or 720
    if not p110.is_touch_controls then
        v113 = p110.vehicle_db_entry.turn_rate
    end
    local v114 = p110.anchor.CFrame
    local v115, v116 = p110:_get_floor_contact_info()
    if v115 then
        p110.descent_speed = 0
        local v117 = p110.bp
        local v118 = (v115 + (v116 or Vector3.new(0, 1, 0)) * p110.resting_hover_height).Y
        v117.Position = Vector3.new(0, v118, 0)
    else
        p110.descent_speed = p110.descent_speed + p111 * 80
        local v119 = p110.bp
        local v120 = v114.Position
        local v121 = p110.descent_speed * p111
        v119.Position = v120 - Vector3.new(0, v121, 0)
    end
    local v122 = p110:_get_calculated_steer()
    local v123 = (p110.target_angle + v122 * math.rad(v113) * p111) % 6.283185307179586
    p110.target_angle = v123
    local v124 = math.cos(v123)
    local v125 = math.sin(v123)
    local v126 = Vector3.new(v124, 0, v125):Cross(v116 or Vector3.new(0, 1, 0))
    p110.bg.CFrame = CFrame.fromMatrix(Vector3.new(), v126, v116 or Vector3.new(0, 1, 0))
    if v116 then
        local v127 = v116:Cross(v126)
        local v128 = p110:_get_calculated_throttle()
        p110.bv.Velocity = v127 * v128 * v112
        p110.bv.MaxForce = Vector3.new(10000, 10000, 10000)
    else
        p110.bv.MaxForce = Vector3.new(10000, 0, 10000)
    end
end
function v10._update_offset(p129)
    local v130 = p129.vehicle_db_entry.moving_hover_offset
    local v131 = p129.vehicle_db_entry.idle_hover_offset
    local v132 = p129.vehicle_db_entry.idle_hover_frequency
    local v133 = p129.vehicle_db_entry.lean_angle
    local v134 = math.rad(v133)
    local v135 = p129:_get_calculated_throttle()
    local v136 = math.abs(v135)
    local v137 = p129.throttle_tilt_spring:get_position()
    local v138 = p129.steer_tilt_spring:get_position()
    local v139 = tick()
    local v140
    if v132 then
        local v141 = v139 * v132
        v140 = math.sin(v141) / 2 + 0.5
    else
        v140 = 0
    end
    local v142
    if v132 then
        local v143 = -v139 * v132 + 1.5707963267948966
        v142 = math.sin(v143)
    else
        v142 = 0
    end
    local v144
    if v132 then
        local v145 = -v139 * v132
        v144 = math.sin(v145)
    else
        v144 = 0
    end
    local v146 = v136 * v130 + v140 * v131
    p129.offset_attachment.CFrame = CFrame.new(0, v146, 0) * CFrame.fromEulerAnglesXYZ(-v137 * v134 + v142 * 0.08, 0, -v138 * v134 + v144 * 0.08)
end
function v10.get_camera_configuration(p147)
    if p147.is_touch_controls then
        return "freecam"
    end
    local v148 = v_u_9.get_camera_configuration(p147)
    return v148 == "default" and "hoverboard" or v148
end
function v10.update(p149, p150)
    v_u_9.update(p149, p150)
    p149:_update_anchor(p150)
    if not p149.vehicle_seat.Anchored then
        p149:_update_springs(p150)
        p149:_update_physics(p150)
        p149:_update_offset()
        p149:_animate_rudder_hinge()
    end
end
function v10.destroy(p151)
    v_u_9.destroy(p151)
end
return v10