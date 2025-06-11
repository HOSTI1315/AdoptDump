--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.BaseSkatesVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("OccupantAnimator")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("Spring")
local v6 = v1("Class")
local v_u_7 = v1("Maid")
local v_u_8 = v1("Door")
local v_u_9 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
local v_u_10 = game:GetService("UserInputService")
local v_u_11 = game:GetService("ContextActionService")
local v_u_12 = v1("BaseVehicle")
local v13 = v6("BaseSkatesVehicle", v_u_12)
function v13.__init(p14, p15, p16, p17, p18)
    v_u_12.__init(p14, p15, p16, p17)
    p14.movement_animations = p17.movement_animations
    p14.bv = p14.vehicle_seat.HoverBodyVelocity
    p14.bg = p14.vehicle_seat.HoverBodyGyro
    p14.bp = p14.vehicle_seat.HoverBodyPosition
    p14.bg.MaxTorque = Vector3.new(1000000, 1000000, 1000000)
    p14.bp.MaxForce = Vector3.new(0, 40000, 0)
    local v19 = p14.vehicle_seat.CFrame.lookVector
    local v20 = v19.z
    local v21 = v19.x
    p14.target_angle = math.atan2(v20, v21)
    p14.current_raycast = nil
    p14.stuck_timer = 0
    p14.throttle_spring = v_u_5.new(2, 1, 0)
    p14.steer_spring = v_u_5.new(10, 200, 0)
    p14.speed_factor = 1
    p14.throttle_state = "idle"
    p14.skates_configuration = p18
    local v22 = {
        ["is_jumping"] = false,
        ["is_jump_about_to_end"] = false,
        ["jump_requested"] = false,
        ["forced"] = {
            ["height"] = nil,
            ["velocity"] = nil
        },
        ["ticket"] = 0,
        ["animated_ticket"] = 0,
        ["jumped_at_tick"] = -1,
        ["jump_ended_at_tick"] = -1,
        ["jump_recent_until_tick"] = -1,
        ["jump_guaranteed_to_end_at_tick"] = -1
    }
    p14.jump_state = v22
    p14.stumble_state = {
        ["is_stumbling"] = false,
        ["direction"] = Vector3.new(0, 0, 1),
        ["ticket"] = 0,
        ["animated_ticket"] = 0,
        ["stumbled_at_tick"] = -1
    }
    p14.driver_maid = v_u_7.new()
    p14:_init_touch_control_listener()
    p14:set_exit_button_forced_hidden(true)
end
function v13._init_touch_control_listener(p_u_23)
    local function v25(p24)
        if p24 == Enum.UserInputType.Touch then
            p_u_23.is_touch_controls = true
            p_u_23.bg.P = 30000
        else
            p_u_23.is_touch_controls = false
            p_u_23.bg.P = 3000
        end
    end
    if v_u_10:GetLastInputType() == Enum.UserInputType.Touch then
        p_u_23.is_touch_controls = true
        p_u_23.bg.P = 30000
    else
        p_u_23.is_touch_controls = false
        p_u_23.bg.P = 3000
    end
    p_u_23.maid:GiveTask(v_u_10.LastInputTypeChanged:Connect(v25))
end
function v13._setup_jump_action_controls(p_u_26)
    local function v28(_, p27, _)
        if p27 == Enum.UserInputState.Begin then
            p_u_26:attempt_jump()
        end
        return Enum.ContextActionResult.Sink
    end
    v_u_11:BindActionAtPriority("BaseSkatesJump", v28, false, Enum.ContextActionPriority.High.Value, Enum.PlayerActions.CharacterJump)
    v_u_11:BindActionAtPriority("BaseSkatesJumpController", v28, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonA)
    local v_u_31 = v_u_4.apps.MobileVehicleControlApp:get_input_status_changed_signal():Connect(function(p29, p30)
        if p30 and p29 == "Jump" then
            p_u_26:attempt_jump()
        end
    end)
    return function()
        v_u_11:UnbindAction("BaseSkatesJump")
        v_u_11:UnbindAction("BaseSkatesJumpController")
        v_u_31:Disconnect()
    end
end
function v13._get_calculated_throttle(p32)
    local v33 = p32.throttle_spring:get_position()
    return math.clamp(v33, -1, 1)
end
function v13._get_calculated_steer(p34)
    local v35 = p34.steer_spring:get_position()
    return math.clamp(v35, -1, 1)
end
function v13._can_jump(p36)
    local v37 = p36.skates_configuration.jump.enabled and not p36.jump_state.is_jumping
    if v37 then
        if p36.current_raycast == nil then
            v37 = false
        else
            v37 = os.clock() - p36.jump_state.jump_ended_at_tick > p36.skates_configuration.jump.debounce
        end
    end
    return v37
end
function v13._get_height_from_ground(p38, p39)
    local v40 = p38.vehicle_seat.Occupant
    local v41
    if v40 then
        v41 = v40.RootPart
    else
        v41 = v40
    end
    if not (v40 and v41) then
        return 0
    end
    local v42 = CFrame.identity
    local v43 = p38.vehicle_seat:FindFirstChild("SeatWeld")
    if v43 and p39 then
        v42 = v43.C0 * v43.C1:Inverse()
    end
    local v44 = v40:FindFirstChild("BodyHeightScale")
    local v45 = not (v44 and v44:IsA("NumberValue")) and 1 or v44.Value
    local v46 = (p38.vehicle_db_entry.ground_offset or 0) * v45
    return v40.HipHeight + v41.Size.Y / 2 + v46 - v42.Y
end
function v13._get_hover_height(p47)
    return p47:_get_height_from_ground(true)
end
function v13._get_cast_height(p48)
    return p48:_get_height_from_ground(false) + 1
end
function v13._raycast_floor(p49)
    local v50 = p49.vehicle_seat.Occupant
    local v_u_51
    if v50 then
        v_u_51 = v50.RootPart
    else
        v_u_51 = v50
    end
    if v50 and v_u_51 then
        local v52 = p49:_get_cast_height()
        local v53 = { p49.vehicle_model, workspace.Terrain }
        for _, v54 in p49:get_occupant_players() do
            if v54.Character then
                local v55 = v54.Character
                table.insert(v53, v55)
            end
        end
        local v56 = v_u_9.cast_ray
        local v57 = {
            ["origin"] = v_u_51.Position
        }
        local v58 = v_u_51.CFrame
        local v59 = -v52
        v57.direction = v58:VectorToWorldSpace((Vector3.new(0, v59, 0)))
        v57.filter_type = Enum.RaycastFilterType.Exclude
        v57.instances = v53
        function v57.callback(p60)
            if p60.Instance:IsA("BasePart") and v_u_51:CanCollideWith(p60.Instance) then
                local v61 = p60.Instance.Parent
                if v61 and not v61:FindFirstChildOfClass("Humanoid") then
                    return true
                end
            end
            return false
        end
        local v62 = v56(v57)
        if v62 then
            local v63 = v62.Normal.Y
            local v64 = math.clamp(v63, -1, 1)
            if math.acos(v64) <= p49.skates_configuration.slope_limit then
                return v62
            end
        end
    end
    return nil
end
function v13._update_springs(p65, p66)
    local v67 = p65.vehicle_seat
    local v68 = (v67.Velocity * Vector3.new(1, 0, 1)).Magnitude
    local v69 = (p65.bv.Velocity * Vector3.new(1, 0, 1)).Magnitude
    if v68 < 5 and v69 - v68 > 5 then
        p65.stuck_timer = p65.stuck_timer + p66
    else
        p65.stuck_timer = 0
    end
    if (p65.jump_state.is_jumping and 0.1 or 0.25) < p65.stuck_timer then
        p65.throttle_spring:reset(v68 / p65.vehicle_db_entry.max_speed)
    end
    local v70 = false
    local v71, v72
    if v67.Occupant == nil then
        v71 = 0
        v72 = 0
    elseif v_u_8.entering_door then
        v71 = 0.5
        v72 = 0
    elseif p65.is_touch_controls then
        local v73 = workspace.CurrentCamera.CFrame
        local v74 = p65:get_control_vector()
        local v75 = v74.Magnitude
        if v75 > 0.0001 then
            local v76 = v73:VectorToWorldSpace(v74) * Vector3.new(1, 0, 1)
            local v77 = v76:Dot(v76) <= 0 and Vector3.new(0, 0, 0) or v76.Unit
            local v78 = v67.CFrame.lookVector * Vector3.new(1, 0, 1)
            local v79 = v78:Dot(v78) <= 0 and Vector3.new(0, 0, 0) or v78.Unit
            local v80 = v79:Dot(v77)
            local v81 = math.clamp(v80, -1, 1)
            local v82 = math.acos(v81)
            local v83 = v77:Cross(v79).Y
            local v84 = math.sign(v83)
            local v85 = v82 / 3.141592653589793 * v84
            v72 = math.clamp(v85, -1, 1)
            local v86 = math.abs(v72)
            if v86 > 0.5 then
                v71 = 0
                v70 = true
            else
                v71 = ((1 - v86) * 0.5 + 0.5) * math.clamp(v75, 0, 1)
            end
        else
            v71 = 0
            v72 = 0
        end
    else
        v71 = v67.ThrottleFloat
        v72 = v67.SteerFloat
    end
    local v87, v88
    if v71 == 0 and not p65.is_touch_controls then
        v87 = "idle"
        local v89 = p65.throttle_spring:get_position()
        if math.abs(v89) > 0.12 then
            v88 = "idle_slowdown_2"
        else
            v88 = "idle_slowdown_1"
        end
    elseif v71 == 0 and p65.is_touch_controls then
        if v70 then
            v88 = "touch_idle_slowdown_3"
            v87 = "brake"
        elseif p65:_get_calculated_throttle() > 0.12 then
            v88 = "touch_idle_slowdown_2"
            v87 = "brake"
        else
            v88 = "touch_idle_slowdown_1"
            v87 = "idle"
        end
    else
        local v90 = p65.throttle_spring:get_position()
        if math.sign(v90) == math.sign(v71) then
            v88 = "moving"
            v87 = "moving"
        else
            v88 = "brake"
            v87 = "brake"
        end
    end
    local v91 = p65.skates_configuration.throttle[v88]
    p65.throttle_spring:set_frequency(v91.frequency)
    p65.throttle_spring:set_damping_ratio(v91.damping_ratio)
    p65.throttle_state = v87
    p65.throttle_spring:set_goal(v71)
    p65.steer_spring:set_goal(v72)
    if p65.jump_state.is_jumping then
        if p65.jump_state.forced.velocity then
            p65.throttle_spring:reset(0)
            p65.steer_spring:reset(0)
        end
    else
        p65.throttle_spring:update(p66)
    end
    p65.steer_spring:update(p66)
end
function v13._update_physics(p92, p93)
    local v94 = p92.vehicle_seat.Occupant
    local v95
    if v94 then
        v95 = v94.RootPart
    else
        v95 = v94
    end
    if v94 and v95 then
        local v96 = p92.vehicle_db_entry.max_speed
        local v97 = p92.vehicle_db_entry.turn_rate_touch or 720
        if not p92.is_touch_controls then
            v97 = p92.vehicle_db_entry.turn_rate
        end
        local v98 = os.clock()
        local v99, v100
        if p92.current_raycast then
            v99 = p92.current_raycast.Position
            v100 = p92.current_raycast.Normal
        else
            v99 = nil
            v100 = nil
        end
        if p92.stumble_state.is_stumbling then
            local v101 = (v98 - p92.stumble_state.stumbled_at_tick) / p92.skates_configuration.stumble.slide_duration
            local v102 = 1 - math.clamp(v101, 0, 1)
            local v103 = p92.stumble_state.direction
            local v104 = -v103.X
            local v105 = -v103.X
            local v106 = math.atan2(v104, v105)
            p92.target_angle = v106
            local v107 = math.cos(v106)
            local v108 = math.sin(v106)
            local v109 = Vector3.new(v107, 0, v108):Cross(Vector3.new(0, 1, 0))
            p92.bg.CFrame = CFrame.fromMatrix(Vector3.new(), v109, Vector3.new(0, 1, 0))
            p92.bv.Velocity = v103 * 15 * v102 * v102
            p92.bv.MaxForce = Vector3.new(10000, 0, 10000)
            if v99 then
                local v110 = p92:_get_hover_height()
                p92.bp.Position = v99 + (v100 or Vector3.new(0, 1, 0)) * v110
                p92.bp.MaxForce = Vector3.new(0, 40000, 0)
            else
                p92.bp.MaxForce = Vector3.new(0, 0, 0)
                p92.bp.Position = p92.vehicle_seat.Position
            end
        else
            local v111 = false
            if p92.jump_state.jump_requested or p92.jump_state.is_jumping then
                if p92.jump_state.jump_requested then
                    p92.jump_state.jump_requested = false
                    p92.jump_state.is_jumping = true
                    local v112 = p92.jump_state.forced.velocity or p92.vehicle_seat.AssemblyLinearVelocity
                    local v113 = p92.jump_state.forced.height or p92.skates_configuration.jump.height
                    local v114 = 2 * workspace.Gravity * v113
                    local v115 = math.sqrt(v114)
                    local v116 = v115 * 2 / workspace.Gravity
                    local v117 = v112 + Vector3.new(0, v115, 0)
                    p92.vehicle_seat.AssemblyLinearVelocity = v117
                    if p92.jump_state.forced.velocity then
                        p92.bv.Velocity = v112
                        p92.bg.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0), v112 * Vector3.new(1, 0, 1))
                        local v118 = v112.Z
                        local v119 = v112.X
                        p92.target_angle = math.atan2(v118, v119)
                    end
                    p92.jump_state.jumped_at_tick = v98
                    p92.jump_state.jump_recent_until_tick = v98 + v116 / 2
                    p92.jump_state.jump_guaranteed_to_end_at_tick = v98 + v116
                end
                local _ = v98 - p92.jump_state.jumped_at_tick
                local v120 = v98 < p92.jump_state.jump_recent_until_tick
                local v121 = p92.jump_state.jump_guaranteed_to_end_at_tick <= v98
                local v122 = false
                if not v120 then
                    local v123 = p92:_get_cast_height() + 0
                    if v99 then
                        local v124 = v95.Position.Y < v99.Y + v123
                    end
                    v122 = v124 and true or v122
                end
                local v125 = false
                if not v120 then
                    local v126 = p92:_get_cast_height() + 3
                    if v99 then
                        v99 = v95.Position.Y < v99.Y + v126
                    end
                    v125 = v99 and true or v125
                end
                p92.jump_state.is_jump_about_to_end = v125
                if v122 or v121 then
                    p92.jump_state.is_jumping = false
                    p92.jump_state.jump_ended_at_tick = v98
                    p92.jump_state.forced.velocity = nil
                    p92.jump_state.forced.height = nil
                    v111 = true
                end
            elseif v99 then
                local v127 = p92:_get_hover_height()
                local v128 = p92.skates_configuration.can_tilt and v100 and v100 or Vector3.new(0, 1, 0)
                p92.bp.Position = v99 + v128 * v127
                p92.bp.MaxForce = Vector3.new(0, 40000, 0)
                v111 = true
            end
            if not v111 then
                p92.bp.MaxForce = Vector3.new(0, 0, 0)
                p92.bp.Position = p92.vehicle_seat.Position
            end
            if not p92.jump_state.forced.velocity then
                local v129 = p92:_get_calculated_steer()
                local v130 = (p92.target_angle + v129 * math.rad(v97) * p93) % 6.283185307179586
                p92.target_angle = v130
                local v131 = math.cos(v130)
                local v132 = math.sin(v130)
                local v133 = Vector3.new(v131, 0, v132)
                local v134 = p92.skates_configuration.can_tilt and v100 and v100 or Vector3.new(0, 1, 0)
                local v135 = v133:Cross(v134)
                p92.bg.CFrame = CFrame.fromMatrix(Vector3.new(0, 0, 0), v135, v134)
            end
            if not p92.jump_state.is_jumping or p92.skates_configuration.is_ice_skates and not p92.jump_state.forced.velocity then
                local v136 = (v100 or Vector3.new(0, 1, 0)):Cross(p92.bg.CFrame.XVector)
                local v137 = p92:_get_calculated_throttle()
                p92.bv.Velocity = v136 * v137 * v96 * p92.speed_factor
            end
            if v100 and not p92.jump_state.is_jumping then
                p92.bv.MaxForce = Vector3.new(10000, 10000, 10000)
            else
                p92.bv.MaxForce = Vector3.new(10000, 0, 10000)
            end
        end
    else
        return
    end
end
function v13._update_animations(p138, _)
    local v139 = p138.vehicle_seat.Occupant
    local v140 = v_u_2.get_tracks(p138)
    if v139 == nil and v140 then
        v_u_2.clear_tracks(p138)
        return
    elseif v_u_2.are_tracks_loaded(p138) then
        local v141 = v140.idle
        local v142 = v140.forward
        local v143 = v140.backward
        local v144 = v140.turning_left
        local v145 = v140.turning_right
        local v146 = v140.brake
        local v147 = v140.coast
        local v148 = v140.stumble
        local v149 = v140.jump
        local v150 = v140.jump_backwards
        local v151 = v140.falling
        local v152 = v140.falling_backwards
        if not (v141.IsPlaying and (v142.IsPlaying and (v143.IsPlaying and (v144.IsPlaying and (v145.IsPlaying and v146.IsPlaying))))) then
            v_u_2.reset_animation_playback(p138)
        end
        local v153 = p138:_get_calculated_throttle()
        local v154 = p138:_get_calculated_steer()
        local v155 = p138.throttle_state
        if p138.stumble_state.is_stumbling and p138.stumble_state.animated_ticket < p138.stumble_state.ticket then
            p138.stumble_state.animated_ticket = p138.stumble_state.ticket
            if v148 then
                v148:Play(0.1, 1, 0.66)
            end
        end
        if p138.jump_state.is_jumping and p138.jump_state.animated_ticket < p138.jump_state.ticket then
            p138.jump_state.animated_ticket = p138.jump_state.ticket
            local v156 = 2
            local v157
            if v153 < -0.01 then
                v157 = v152 or v151
                if not v150 then
                    v150 = v149
                    v156 = -2
                end
            else
                v157 = v151
                v150 = v149
            end
            v150:Play(0.1, 1, v156)
            v157:Play(0.2)
        elseif (not p138.jump_state.is_jumping or p138.jump_state.is_jump_about_to_end) and v140.jump.IsPlaying then
            v149:Stop(0.2)
            if v150 then
                v150:Stop(0.2)
            end
            v151:Stop(0.2)
            if v152 then
                v152:Stop(0.2)
            end
        end
        if p138.current_raycast or not v151 then
            if v151 then
                v151:Stop(0.1)
            end
            if v152 then
                v152:Stop(0.1)
            end
            if v155 == "moving" then
                if v153 > 0.01 then
                    v_u_2.batch_adjust_speed_once({
                        v142,
                        v143,
                        v144,
                        v145
                    }, 1, 0.2)
                    v_u_2.adjust_weight_once(v143, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v146, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v147, 0.001, 0.2)
                    local v158 = 1 - math.clamp(v153, 0, 1)
                    local v159 = math.max(0.001, v158)
                    local v160 = 1 - v159
                    local v161, v162, v163
                    if v154 < 0 then
                        local v164 = -v154
                        local v165 = math.clamp(v164, 0, 1) * v160
                        v161 = math.max(0.001, v165)
                        local v166 = v160 - v161
                        v162 = math.max(0.001, v166)
                        v163 = 0.001
                    else
                        local v167 = math.clamp(v154, 0, 1) * v160
                        v163 = math.max(0.001, v167)
                        local v168 = v160 - v163
                        v162 = math.max(0.001, v168)
                        v161 = 0.001
                    end
                    v_u_2.adjust_weight_once(v141, v159, 0.2)
                    v_u_2.adjust_weight_once(v144, v161, 0.2)
                    v_u_2.adjust_weight_once(v145, v163, 0.2)
                    v_u_2.adjust_weight_once(v142, v162, 0.2)
                    return
                elseif v153 < 0.01 then
                    v_u_2.batch_adjust_speed_once({
                        v142,
                        v143,
                        v144,
                        v145
                    }, -1, 0.2)
                    v_u_2.adjust_weight_once(v147, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v142, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v144, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v145, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v146, 0.001, 0.2)
                    local v169 = -v153
                    local v170 = math.clamp(v169, 0.001, 1)
                    local v171 = 1 - v170
                    local v172 = math.max(0.001, v171)
                    v_u_2.adjust_weight_once(v143, v170, 0.2)
                    v_u_2.adjust_weight_once(v141, v172, 0.2)
                else
                    v_u_2.adjust_weight_once(v141, 1, 0.2)
                    v_u_2.adjust_weight_once(v147, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v142, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v143, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v144, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v145, 0.001, 0.2)
                    v_u_2.adjust_weight_once(v146, 0.001, 0.2)
                end
            elseif v155 == "brake" then
                v_u_2.adjust_weight_once(v141, 0.001, 0.2)
                v_u_2.adjust_weight_once(v147, 0.001, 0.2)
                v_u_2.adjust_weight_once(v142, 0.001, 0.2)
                v_u_2.adjust_weight_once(v143, 0.001, 0.2)
                v_u_2.adjust_weight_once(v144, 0.001, 0.2)
                v_u_2.adjust_weight_once(v145, 0.001, 0.2)
                v_u_2.adjust_weight_once(v146, 1, 0.1)
            else
                if v153 > 0 then
                    local v173 = math.clamp(v153, 0, 1)
                    local v174 = math.max(0.001, v173)
                    local v175 = 1 - v174
                    local v176 = math.max(0.001, v175)
                    v_u_2.adjust_weight_once(v141, v176, 0.2)
                    v_u_2.adjust_weight_once(v147, v174, 0.2)
                else
                    v_u_2.adjust_weight_once(v141, 1, 0.2)
                    v_u_2.adjust_weight_once(v147, 0.001, 0.2)
                end
                v_u_2.adjust_weight_once(v142, 0.001, 0.2)
                v_u_2.adjust_weight_once(v143, 0.001, 0.2)
                v_u_2.adjust_weight_once(v144, 0.001, 0.2)
                v_u_2.adjust_weight_once(v145, 0.001, 0.2)
                v_u_2.adjust_weight_once(v146, 0.001, 0.2)
            end
        else
            v151:Play(0.1)
            return
        end
    else
        return
    end
end
function v13.set_speed_factor(p177, p178)
    p177.speed_factor = p178
end
function v13.make_stumble(p_u_179, p180)
    if p_u_179.jump_state.is_jumping then
        return false
    end
    if p_u_179.stumble_state.is_stumbling then
        return false
    end
    p_u_179.stumble_state.is_stumbling = true
    local v181 = p_u_179.stumble_state
    local v182 = p180 * Vector3.new(1, 0, 1)
    v181.direction = v182:Dot(v182) <= 0 and Vector3.new(0, 0, 0) or v182.Unit
    p_u_179.stumble_state.stumbled_at_tick = os.clock()
    p_u_179.stumble_state.ticket = p_u_179.stumble_state.ticket + 1
    task.spawn(function()
        task.wait(p_u_179.skates_configuration.stumble.debounce + p_u_179.skates_configuration.stumble.slide_duration)
        p_u_179.stumble_state.is_stumbling = false
    end)
    return true
end
function v13.is_jumping(p183)
    return p183.jump_state.is_jumping
end
function v13.attempt_jump(p184, p185, p186)
    local v187
    if p184:_can_jump() then
        p184.jump_state.forced.height = p185
        p184.jump_state.forced.velocity = p186
        p184.jump_state.ticket = p184.jump_state.ticket + 1
        p184.jump_state.jump_requested = true
        v187 = true
    else
        v187 = false
    end
    return v187
end
function v13.get_camera_configuration(p188)
    return p188.is_touch_controls and "freecam" or v_u_12.get_camera_configuration(p188)
end
function v13.is_jump_exiting_disabled(_)
    return true
end
function v13.on_driver_changed(p_u_189, _, _, p190)
    p_u_189.driver_maid:DoCleaning()
    if p190 then
        local v191 = p_u_189:_setup_jump_action_controls()
        p_u_189.driver_maid:GiveTask(v191)
        local v192 = {
            ["phone"] = function()
                v_u_4.apps.MobileVehicleControlApp:set_configuration("Jump")
                v_u_4.set_app_visibility("MobileVehicleControlApp", true)
                p_u_189.driver_maid:GiveTask(function()
                    v_u_4.set_app_visibility("MobileVehicleControlApp", false)
                end)
            end,
            ["tablet"] = "phone"
        }
        v_u_3.run(v192)
    end
end
function v13.update(p193, p194)
    v_u_12.update(p193, p194)
    p193.current_raycast = p193:_raycast_floor()
    local v195 = p193.current_raycast
    if v195 then
        v195 = p193.current_raycast.Instance:FindFirstChild("SpeedFactor")
    end
    p193:set_speed_factor(not v195 and 1 or v195.Value)
    p193:_update_springs(p194)
    p193:_update_physics(p194)
    p193:_update_animations(p194)
end
function v13.destroy(p196)
    v_u_12.destroy(p196)
    if v_u_2.are_tracks_loaded(p196) then
        v_u_2.clear_tracks(p196)
    end
end
return v13