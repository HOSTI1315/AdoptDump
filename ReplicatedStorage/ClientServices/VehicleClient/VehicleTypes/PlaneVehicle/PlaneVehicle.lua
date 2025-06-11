--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.PlaneVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClickTapInWorldExclusionList")
local v_u_3 = v1("InteractionsEngine")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("UIManager")
local v_u_6 = v1("Raycast")
local v_u_7 = v1("Spring")
local v8 = v1("Class")
local v_u_9 = v1("Maid")
local v_u_10 = v1("package:Promise")
local v_u_11 = v1("TweenPromise")
local v_u_12 = game:GetService("RunService")
local v_u_13 = game:GetService("UserInputService")
local v_u_14 = game:GetService("ContextActionService")
local v_u_15 = Enum.KeyCode.ButtonR1
local v_u_16 = v1("BaseVehicle")
local v17 = v8("PlaneVehicle", v_u_16)
function v17.__init(p18, p19, p20, p21)
    v_u_16.__init(p18, p19, p20, p21)
    p18.engine_part = p19:WaitForChild("Engine")
    p18.propeller_hinges = p18:_get_propeller_hinges()
    p18.flap_hinges = p18:_get_flap_hinges()
    p18.stored_forces = {
        ["gyro_torque"] = p18.engine_part.BodyGyro.MaxTorque,
        ["velocity_force"] = p18.engine_part.BodyVelocity.MaxForce
    }
    p18.roll_spring = v_u_7.new(1, 1, 0)
    p18.pitch_spring = v_u_7.new(1, 1, 0)
    p18.speed_spring = v_u_7.new(3, 1, 0)
    p18.current_yaw = 0
    p18.has_engine_started = false
    p18.action_state = {
        ["name"] = nil,
        ["idle_sign"] = 0,
        ["roll"] = CFrame.identity,
        ["control"] = CFrame.identity,
        ["trick_promise"] = v_u_10.resolve()
    }
    p18.driver_maid = v_u_9.new()
end
local v_u_51 = {
    ["Default"] = {
        ["public"] = false,
        ["is_manual_control"] = false,
        ["trick_promise"] = function(_)
            return v_u_10.resolve()
        end,
        ["process_input"] = function(p22)
            local v23, v24 = p22:_get_raw_inputs()
            return v23, v24, v23
        end
    },
    ["Trick A"] = {
        ["public"] = true,
        ["is_manual_control"] = true,
        ["trick_promise"] = function(p_u_25)
            local v26 = TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
            local v_u_27 = p_u_25.roll_spring:get_position() * p_u_25.vehicle_db_entry.max_roll
            local v_u_28 = math.sign(v_u_27) < 0 and -6.283185307179586 or 6.283185307179586
            return v_u_11.callback(0, 1, v26, function(p29)
                p_u_25.action_state.control = CFrame.fromEulerAnglesYXZ(p_u_25.pitch_spring:get_position() * p_u_25.vehicle_db_entry.max_pitch, p_u_25.current_yaw, 0)
                local v30 = v_u_27
                local v31 = v_u_28
                p_u_25.action_state.roll = CFrame.fromEulerAnglesXYZ(0, 0, (1 - p29) * v30 + p29 * v31)
            end)
        end,
        ["process_input"] = function(p32)
            local v33, _ = p32:_get_raw_inputs()
            return v33, 0, v33
        end
    },
    ["Trick B"] = {
        ["public"] = true,
        ["is_manual_control"] = true,
        ["trick_promise"] = function(p_u_34)
            local v35 = TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
            local v_u_36 = p_u_34.pitch_spring:get_position() * p_u_34.vehicle_db_entry.max_pitch
            return v_u_11.callback(0, 1, v35, function(p37)
                local v38 = v_u_36
                p_u_34.action_state.control = CFrame.fromEulerAnglesYXZ((1 - p37) * v38 + p37 * 6.283185307179586, p_u_34.current_yaw, 0)
                p_u_34.action_state.roll = CFrame.fromEulerAnglesXYZ(0, 0, p_u_34.roll_spring:get_position() * p_u_34.vehicle_db_entry.max_roll)
            end)
        end,
        ["process_input"] = function(p39)
            local v40, _ = p39:_get_raw_inputs()
            return v40, 0, v40
        end
    },
    ["Idle"] = {
        ["public"] = true,
        ["is_manual_control"] = false,
        ["trick_promise"] = function(p_u_41)
            local v42 = -p_u_41.vehicle_seat.SteerFloat
            local v43 = math.sign(v42)
            p_u_41.action_state.idle_sign = v43 == 0 and 1 or v43
            return v_u_10.fromEvent(v_u_12.PostSimulation, function()
                local v44, v45 = p_u_41:_get_raw_inputs()
                local v46
                if v44 == 0 then
                    v46 = v45 == 0
                else
                    v46 = false
                end
                return v46
            end):andThen(function()
                return v_u_10.fromEvent(v_u_12.PostSimulation, function()
                    local v47, v48 = p_u_41:_get_raw_inputs()
                    local v49
                    if v47 == 0 then
                        v49 = v48 == 0
                    else
                        v49 = false
                    end
                    return not v49
                end)
            end)
        end,
        ["process_input"] = function(p50)
            return p50.action_state.idle_sign, 0, p50.action_state.idle_sign
        end
    }
}
local function v_u_54()
    local v52 = Enum.ContextActionPriority.Medium.Value + 1
    v_u_14:BindActionAtPriority("disable_throttleAccel", function()
        return Enum.ContextActionResult.Sink
    end, false, v52, Enum.KeyCode.ButtonR2)
    v_u_14:BindActionAtPriority("disable_throttleDeccel", function()
        return Enum.ContextActionResult.Sink
    end, false, v52, Enum.KeyCode.ButtonL2)
    local v_u_53 = false
    return function()
        if not v_u_53 then
            v_u_14:UnbindAction("disable_throttleAccel")
            v_u_14:UnbindAction("disable_throttleDeccel")
        end
        v_u_53 = true
    end
end
function v17._get_flap_hinges(p55)
    local v56 = {}
    local v57 = p55.vehicle_model:FindFirstChild("Flaps")
    if v57 then
        for _, v58 in v57:GetChildren() do
            local v59 = v58:FindFirstChild("Axis")
            if v59 then
                v59 = v59:FindFirstChild("HingeConstraint")
            end
            if v59 and v59:IsA("HingeConstraint") then
                v56[v58.Name] = {
                    ["model"] = v58,
                    ["constraint"] = v59,
                    ["angular_velocity"] = v59.AngularVelocity
                }
            end
        end
    end
    return v56
end
function v17._animate_flap_hinges(p60, p61, p62, p63)
    local v64 = p60.flap_hinges.BackLeft
    local v65 = p60.flap_hinges.BackRight
    local v66 = p60.flap_hinges.FrontLeft
    local v67 = p60.flap_hinges.FrontRight
    if v64 and (v65 and (v66 and v67)) then
        if p61 == 0 then
            v66.constraint.TargetAngle = p62 * 20
            v67.constraint.TargetAngle = p62 * 20
            v64.constraint.TargetAngle = p62 * 20
            v65.constraint.TargetAngle = p62 * 20
        else
            v66.constraint.TargetAngle = p61 * -20
            v67.constraint.TargetAngle = p61 * 20
            v64.constraint.TargetAngle = p61 * -20
            v65.constraint.TargetAngle = p61 * 20
        end
    end
    local v68 = p60.flap_hinges.Rudder
    if v68 then
        v68.constraint.TargetAngle = p63 * -20
    end
end
function v17._get_propeller_hinges(p69)
    local v70 = {}
    for _, v71 in p69.vehicle_model:WaitForChild("Propellers"):GetChildren() do
        local v72 = v71:FindFirstChild("Axis")
        if v72 then
            v72 = v72:FindFirstChild("HingeConstraint")
        end
        if v72 and v72:IsA("HingeConstraint") then
            v70[v71] = {
                ["model"] = v71,
                ["constraint"] = v72,
                ["angular_velocity"] = v72.AngularVelocity
            }
        end
    end
    return v70
end
function v17._set_propellers_active(p73, p74)
    for _, v75 in p73.propeller_hinges do
        if p74 then
            v75.constraint.AngularVelocity = v75.angular_velocity
        else
            v75.constraint.AngularVelocity = 0
        end
    end
end
function v17._get_current_action_name(p76)
    return p76.action_state.name or "Default"
end
function v17._get_raw_inputs(p_u_77)
    local v_u_78 = 0
    local v_u_79 = 0
    local v81 = {
        ["desktop"] = function()
            v_u_78 = -p_u_77.vehicle_seat.SteerFloat
            v_u_79 = -p_u_77.vehicle_seat.ThrottleFloat
            if v_u_4.is_using_gamepad() and v_u_78 * v_u_78 + v_u_79 * v_u_79 <= 0.5625 then
                v_u_78 = 0
                v_u_79 = 0
            end
        end,
        ["tablet"] = function()
            v_u_78 = -p_u_77.vehicle_seat.SteerFloat
            v_u_79 = v_u_5.apps.MobileVehicleControlApp:get_vertical_input()
            local v80 = -p_u_77.vehicle_seat.ThrottleFloat
            if v_u_78 * v_u_78 + v80 * v80 <= 0.5625 then
                v_u_78 = 0
            end
        end,
        ["phone"] = "tablet",
        ["console"] = "desktop"
    }
    v_u_4.run(v81)
    return v_u_78, v_u_79
end
function v17._get_processed_inputs(p82)
    return v_u_51[p82:_get_current_action_name()].process_input(p82)
end
function v17._get_target_speed(p83)
    local v84 = p83.vehicle_db_entry.flat_speed
    local v85 = p83.pitch_spring:get_position()
    local v86 = math.clamp(v85, -1, 1)
    if v86 > 0 then
        return (1 - v86) * v84 + v86 * p83.vehicle_db_entry.climb_speed
    end
    if v86 < 0 then
        local v87 = -v86
        v84 = (1 - v87) * v84 + v87 * p83.vehicle_db_entry.descent_speed
    end
    return v84
end
function v17._get_wobble(p88)
    local v89 = tick()
    local v90 = -v89 * p88.vehicle_db_entry.wobble_frequency + 1.5707963267948966
    local v91 = math.sin(v90)
    local v92 = -v89 * p88.vehicle_db_entry.wobble_frequency
    local v93 = math.sin(v92)
    return CFrame.fromEulerAnglesXYZ(v91 * p88.vehicle_db_entry.wobble_reduction, 0, v93 * p88.vehicle_db_entry.wobble_reduction)
end
function v17._is_flying(p94)
    local v95 = p94.vehicle_seat.Occupant ~= nil
    if v95 then
        v95 = p94.has_engine_started
    end
    return v95
end
function v17._is_doing_trick(p96)
    return p96.action_state.trick_promise:getStatus() == v_u_10.Status.Started
end
function v17._is_current_action_manual_control(p97)
    return v_u_51[p97.action_state.name or "Default"].is_manual_control
end
function v17._cancel_trick(p98)
    if p98:_is_doing_trick() then
        p98.action_state.trick_promise:cancel()
    end
end
function v17._do_trick(p_u_99, p100)
    if p_u_99:_is_flying() and not p_u_99:_is_doing_trick() then
        local v101 = v_u_51[p100]
        p_u_99.action_state.name = p100
        p_u_99.action_state.trick_promise = v101.trick_promise(p_u_99):catch(warn):finally(function()
            p_u_99.action_state.name = nil
        end)
    end
end
function v17._setup_trick_interactions(p_u_102)
    if p_u_102.vehicle_model.PrimaryPart == nil then
        warn("PlaneVehicle: PrimaryPart is nil. Interaction will not work.")
    else
        local v_u_103 = {}
        for _, v104 in p_u_102.vehicle_model:GetDescendants() do
            if v104:IsA("BasePart") and v104.CanCollide then
                table.insert(v_u_103, v104)
            end
        end
        local v_u_105 = {}
        for v_u_106, v107 in v_u_51 do
            if v107.public then
                table.insert(v_u_105, {
                    ["text"] = v_u_106,
                    ["on_selected"] = function()
                        p_u_102:_do_trick(v_u_106)
                    end
                })
            end
        end
        local v_u_108 = false
        local v_u_109 = v_u_4.get_platform() == "desktop"
        local v_u_110 = v_u_3:register({
            ["text"] = "Tricks",
            ["part"] = p_u_102.vehicle_model.PrimaryPart,
            ["is_visible"] = function()
                if v_u_108 then
                    return true
                elseif v_u_109 then
                    return v_u_6.mousecast(nil, nil, nil, v_u_103, {
                        ["ignore_non_cancollide"] = true,
                        ["ignore_transparent"] = false
                    }) and true or false
                else
                    return false
                end
            end,
            ["on_selected"] = function()
                v_u_108 = true
                return v_u_105
            end,
            ["on_finished"] = function()
                v_u_108 = false
            end
        })
        local v114 = {
            ["desktop"] = function()
                local v111 = v_u_54()
                p_u_102.driver_maid:GiveTask(v111)
                p_u_102.driver_maid:GiveTask(v_u_2.register(5, function()
                    return v_u_4.is_using_gamepad() and "pass" or (v_u_6.mousecast(nil, nil, nil, v_u_103, {
                        ["ignore_non_cancollide"] = true,
                        ["ignore_transparent"] = false
                    }) and (v_u_5.apps.InteractionsApp:call_on_selected(v_u_110, v_u_110.on_selected) == "no_choices" and "pass" or "sink") or "pass")
                end))
                p_u_102.driver_maid:GiveTask(v_u_13.InputBegan:Connect(function(p112, p113)
                    if p113 then
                        return
                    elseif v_u_4.is_using_gamepad() then
                        if p112.KeyCode == v_u_15 then
                            v_u_5.apps.InteractionsApp:call_on_selected(v_u_110, v_u_110.on_selected)
                        end
                    end
                end))
            end,
            ["tablet"] = "desktop",
            ["phone"] = "desktop",
            ["console"] = "desktop"
        }
        v_u_4.run(v114)
        p_u_102.driver_maid:GiveTask(v_u_110)
    end
end
function v17.is_jump_exiting_disabled(_)
    return v_u_4.run({
        ["default"] = function()
            return false
        end,
        ["phone"] = function()
            return true
        end,
        ["tablet"] = "phone"
    })
end
function v17.on_driver_changed(p_u_115, _, _, p116)
    p_u_115.driver_maid:DoCleaning()
    p_u_115.has_engine_started = false
    local _, v117, _ = p_u_115.engine_part.CFrame:ToEulerAnglesYXZ()
    p_u_115.current_yaw = v117
    if p116 then
        p_u_115:_setup_trick_interactions()
        local v_u_118 = nil
        v_u_118 = v_u_12.PostSimulation:Connect(function()
            local _, v119 = p_u_115:_get_raw_inputs()
            if v119 > 0 then
                p_u_115.has_engine_started = true
                if v_u_118 then
                    v_u_118:Disconnect()
                    v_u_118 = nil
                end
            end
        end)
        p_u_115.driver_maid:GiveTask(function()
            p_u_115:_cancel_trick()
            p_u_115.engine_part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            p_u_115.engine_part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            if v_u_118 then
                v_u_118:Disconnect()
                v_u_118 = nil
            end
        end)
        local v120 = {
            ["desktop"] = function()
                if v_u_4.is_using_gamepad() then
                    v_u_5.apps.HintApp:hint({
                        ["text"] = "Press down to start and press RB to select a trick!",
                        ["yields"] = false,
                        ["overridable"] = true,
                        ["length"] = 4.5
                    })
                else
                    v_u_5.apps.HintApp:hint({
                        ["text"] = ("Press S or down to start, click the %s to select a trick!"):format(p_u_115.vehicle_db_entry.display_vehicle_type or "plane"),
                        ["yields"] = false,
                        ["overridable"] = true,
                        ["length"] = 4.5
                    })
                end
            end,
            ["phone"] = function()
                v_u_5.apps.HintApp:hint({
                    ["text"] = ("Press up to start, tap the %s to select a trick!"):format(p_u_115.vehicle_db_entry.display_vehicle_type or "plane"),
                    ["yields"] = false,
                    ["overridable"] = true,
                    ["length"] = 4.5
                })
                v_u_5.apps.MobileVehicleControlApp:set_configuration("Vertical")
                v_u_5.set_app_visibility("MobileVehicleControlApp", true)
                p_u_115.driver_maid:GiveTask(function()
                    v_u_5.set_app_visibility("MobileVehicleControlApp", false)
                end)
            end,
            ["tablet"] = "phone",
            ["console"] = "desktop"
        }
        v_u_4.run(v120)
    end
end
function v17.update(p121, p122)
    v_u_16.update(p121, p122)
    local v123 = p121.vehicle_seat.Occupant ~= nil
    local v124 = p121:_is_flying()
    local v125, v126, v127 = p121:_get_processed_inputs()
    p121.roll_spring:set_goal((math.sign(v125)))
    p121.roll_spring:update(p122)
    p121.pitch_spring:set_goal(v126)
    p121.pitch_spring:update(p122)
    p121.speed_spring:set_goal(p121:_get_target_speed())
    p121.speed_spring:update(p122)
    p121:_animate_flap_hinges(v125, v126, v127)
    p121.current_yaw = p121.current_yaw + v125 * p121.vehicle_db_entry.yaw_speed * p122
    local v128 = p121:_get_wobble()
    local v129, v130
    if p121:_is_doing_trick() and p121:_is_current_action_manual_control() then
        v129 = p121.action_state.control
        v130 = p121.action_state.roll
    else
        v129 = CFrame.fromEulerAnglesYXZ(p121.pitch_spring:get_position() * p121.vehicle_db_entry.max_pitch, p121.current_yaw, 0)
        v130 = CFrame.fromEulerAnglesYXZ(0, 0, p121.roll_spring:get_position() * p121.vehicle_db_entry.max_roll)
    end
    local v131 = p121.engine_part.BodyGyro
    local v132
    if v124 then
        v132 = v130 * v128
    else
        v132 = CFrame.identity
    end
    v131.CFrame = v129 * v132
    p121.engine_part.BodyVelocity.Velocity = (not v124 and 0 or -p121.speed_spring:get_position()) * v129.ZVector
    p121.engine_part.BodyGyro.MaxTorque = not v123 and Vector3.new(0, 0, 0) or p121.stored_forces.gyro_torque
    p121.engine_part.BodyVelocity.MaxForce = not v124 and Vector3.new(0, 0, 0) or p121.stored_forces.velocity_force
end
function v17.destroy(p133)
    v_u_16.destroy(p133)
    p133.driver_maid:DoCleaning()
    p133.action_state.trick_promise:cancel()
end
return v17