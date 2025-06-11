--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.HelicopterVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlatformM")
local v_u_3 = v1("UIManager")
local v4 = v1("Class")
local v_u_5 = v1("Maid")
local v_u_6 = game:GetService("UserInputService")
local v_u_7 = game:GetService("ContextActionService")
local v_u_8 = {
    ["keyboard"] = {
        ["up"] = Enum.KeyCode.R,
        ["down"] = Enum.KeyCode.Q
    },
    ["console"] = {
        ["up"] = Enum.KeyCode.ButtonR2,
        ["down"] = Enum.KeyCode.ButtonL2
    }
}
local v_u_9 = v1("BaseVehicle")
local v10 = v4("HelicopterVehicle", v_u_9)
function v10.__init(p11, p12, p13, p14)
    v_u_9.__init(p11, p12, p13, p14)
    p11.engine_part = p12:WaitForChild("Engine")
    p11.target_height = p11.engine_part.Position
    p11.target_angle = select(2, p11.engine_part.CFrame:ToEulerAnglesYXZ())
    p11.propeller_hinges = p11:_get_propeller_hinges()
    p11.stored_forces = {
        ["height_force"] = p11.engine_part.Height.MaxForce,
        ["turn_torque"] = p11.engine_part.Turn.Gyro.MaxTorque,
        ["velocity_force"] = p11.engine_part.BodyVelocity.MaxForce,
        ["corrective_torque"] = p11.engine_part.Correct.Gyro.MaxTorque
    }
    p11.driver_maid = v_u_5.new()
end
local function v_u_20(p15, p16, p17)
    local v18 = p15:Dot(p16)
    local v19 = p15:Cross(p16)
    if v18 < -0.99999 then
        return CFrame.fromAxisAngle(p17, 3.141592653589793)
    else
        return CFrame.new(0, 0, 0, v19.X, v19.Y, v19.Z, 1 + v18)
    end
end
local function v_u_22(...)
    for _, v21 in { ... } do
        if v_u_6:IsKeyDown(v21) or v_u_6:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, v21) then
            return 1
        end
    end
    return 0
end
local function v_u_25()
    local v23 = Enum.ContextActionPriority.Medium.Value + 1
    v_u_7:BindActionAtPriority("disable_throttleAccel", function()
        return Enum.ContextActionResult.Sink
    end, false, v23, v_u_8.console.up)
    v_u_7:BindActionAtPriority("disable_throttleDeccel", function()
        return Enum.ContextActionResult.Sink
    end, false, v23, v_u_8.console.down)
    local v_u_24 = false
    return function()
        if not v_u_24 then
            v_u_7:UnbindAction("disable_throttleAccel")
            v_u_7:UnbindAction("disable_throttleDeccel")
        end
        v_u_24 = true
    end
end
function v10._get_propeller_hinges(p26)
    local v27 = {}
    local v28 = p26.vehicle_model:FindFirstChild("Propellers")
    if v28 then
        for _, v29 in v28:GetChildren() do
            local v30 = v29:FindFirstChild("Axis")
            if v30 then
                v30 = v30:FindFirstChild("HingeConstraint")
            end
            if v30 and v30:IsA("HingeConstraint") then
                v27[v29] = {
                    ["model"] = v29,
                    ["constraint"] = v30,
                    ["angular_velocity"] = v30.AngularVelocity
                }
            end
        end
    end
    return v27
end
function v10._set_propellers_active(p31, p32)
    for _, v33 in p31.propeller_hinges do
        if p32 then
            v33.constraint.AngularVelocity = v33.angular_velocity
        else
            v33.constraint.AngularVelocity = 0
        end
    end
end
function v10._correct_orientation(p34)
    local v35 = p34.engine_part.CFrame
    if v35.YVector.Y < 0.3 then
        local v36 = v_u_20(v35.YVector, Vector3.new(0, 1, 0), v35.XVector) * (v35 - v35.Position) + v35.Position
        p34.engine_part.Correct.Gyro.CFrame = v36
        p34.engine_part.Correct.Gyro.MaxTorque = p34.stored_forces.corrective_torque
    else
        p34.engine_part.Correct.Gyro.MaxTorque = Vector3.new(0, 0, 0)
    end
end
function v10._update_control(p37, p38)
    local v39 = v_u_3.apps.MobileVehicleControlApp:get_vertical_input()
    if v39 == 0 then
        v39 = v_u_22(v_u_8.keyboard.up, v_u_8.console.up) - v_u_22(v_u_8.keyboard.down, v_u_8.console.down)
    end
    local v40 = p37.vehicle_seat.SteerFloat
    local v41 = p37.vehicle_seat.ThrottleFloat
    local v42 = p37.vehicle_seat.Occupant ~= nil
    local v43 = -v41
    local v44 = Vector3.new(v40, v39, v43)
    local v45 = v40 * v40 + v41 * v41 > 0
    local v46 = workspace.CurrentCamera.CFrame
    local v47 = v_u_20(v46.YVector, Vector3.new(0, 1, 0), v46.XVector) * (v46 - v46.Position) + v46.Position
    local v48 = v47:VectorToWorldSpace(v44)
    p37.engine_part.BodyVelocity.Velocity = v48 * p37.vehicle_db_entry.max_speed
    p37.engine_part.BodyVelocity.MaxForce = not v42 and Vector3.new(0, 0, 0) or p37.stored_forces.velocity_force
    local v49 = p37.engine_part.Position.Y
    if v42 then
        local v50 = p37.target_height.Y + v48.Y * p37.vehicle_db_entry.lift_speed * p38
        local v51 = p37.vehicle_db_entry.lift_speed * p38 * 10
        local v52 = v50 - v49
        local v53 = -v51
        v49 = v49 + math.clamp(v52, v53, v51)
    end
    p37.target_height = Vector3.new(0, v49, 0)
    p37.engine_part.Height.Position = p37.target_height
    p37.engine_part.Height.MaxForce = not v42 and Vector3.new(0, 0, 0) or p37.stored_forces.height_force
    local v54 = CFrame.new()
    if v45 then
        local v55 = v47.ZVector
        local v56 = (Vector3.new(0, 1, 0)):Cross(v48)
        v54 = CFrame.fromAxisAngle(v56, p37.vehicle_db_entry.tilt_angle)
        local v57 = v55.X
        local v58 = v55.Z
        p37.target_angle = math.atan2(v57, v58) + 3.141592653589793
    else
        p37.target_angle = ({ p37.engine_part.CFrame:ToEulerAnglesYXZ() })[2]
    end
    local v59 = tick()
    local v60 = -v59 * p37.vehicle_db_entry.wobble_frequency + 1.5707963267948966
    local v61 = math.sin(v60)
    local v62 = -v59 * p37.vehicle_db_entry.wobble_frequency
    local v63 = math.sin(v62)
    local v64 = CFrame.fromEulerAnglesXYZ(v61 * p37.vehicle_db_entry.wobble_reduction, 0, v63 * p37.vehicle_db_entry.wobble_reduction)
    local v65 = v54 * CFrame.fromEulerAnglesYXZ(0, p37.target_angle, 0)
    p37.engine_part.Turn.Gyro.CFrame = p37.engine_part.Turn.Gyro.CFrame:Lerp(v65, p38 * 0.1 * 60) * v64
    p37.engine_part.Turn.Gyro.MaxTorque = not v42 and Vector3.new(0, 0, 0) or p37.stored_forces.turn_torque
end
function v10.is_jump_exiting_disabled(_)
    return v_u_2.run({
        ["default"] = function()
            return false
        end,
        ["phone"] = function()
            return true
        end,
        ["tablet"] = "phone"
    })
end
function v10.on_driver_changed(p66, _, _, p67)
    p66.driver_maid:DoCleaning()
    if p67 then
        local v_u_68 = v_u_5.new()
        local function v_u_73()
            v_u_68:DoCleaning()
            local v_u_69 = nil
            local v_u_70 = nil
            local v71 = {
                ["desktop"] = function()
                    v_u_69 = v_u_8.keyboard.up
                    v_u_70 = v_u_8.keyboard.down
                    if v_u_2.is_using_gamepad() then
                        v_u_69 = v_u_8.console.up
                        v_u_70 = v_u_8.console.down
                        v_u_68:GiveTask((v_u_25()))
                    end
                end,
                ["phone"] = function()
                    v_u_3.apps.MobileVehicleControlApp:set_configuration("Vertical")
                    v_u_3.set_app_visibility("MobileVehicleControlApp", true)
                    v_u_68:GiveTask(function()
                        v_u_3.set_app_visibility("MobileVehicleControlApp", false)
                    end)
                end,
                ["tablet"] = "phone",
                ["console"] = "desktop"
            }
            v_u_2.run(v71)
            if v_u_69 and v_u_70 then
                local v72 = v_u_3.apps.InputDisplayApp
                v_u_3.apps.HintApp:hint({
                    ["text"] = "See bottom left corner for ascend and descend controls.",
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
                v72:show_input("Helicopter", v_u_69, {
                    ["prompt_text"] = "Ascend",
                    ["scale"] = 0.8
                })
                v72:show_input("Helicopter", v_u_70, {
                    ["prompt_text"] = "Descend",
                    ["scale"] = 0.8
                })
                v_u_68:GiveTask(function()
                    v_u_3.apps.InputDisplayApp:clear_tag("Helicopter")
                end)
            end
        end
        v_u_73()
        p66.driver_maid:GiveTask(v_u_2.get_gamepad_changed():Connect(function()
            v_u_73()
        end))
        p66.driver_maid:GiveTask(function()
            v_u_68:DoCleaning()
        end)
    end
end
function v10.update(p74, p75)
    v_u_9.update(p74, p75)
    p74:_update_control(p75)
    p74:_set_propellers_active(p74.vehicle_seat.Occupant ~= nil)
    p74:_correct_orientation()
end
function v10.destroy(p76)
    v_u_9.destroy(p76)
    p76.driver_maid:DoCleaning()
end
return v10