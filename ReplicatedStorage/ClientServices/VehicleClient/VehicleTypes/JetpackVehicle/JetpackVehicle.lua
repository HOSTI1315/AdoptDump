--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.JetpackVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientToolManager")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("UIManager")
local v5 = v1("Class")
local v_u_6 = v1("Maid")
local v_u_7 = game:GetService("Debris")
local v_u_8 = game:GetService("UserInputService")
local v_u_9 = game:GetService("ReplicatedStorage")
local v_u_10 = game:GetService("ContextActionService")
local v_u_11 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
local v_u_12 = {
    ["keyboard"] = {
        ["up"] = Enum.KeyCode.R,
        ["down"] = Enum.KeyCode.Q
    },
    ["console"] = {
        ["up"] = Enum.KeyCode.ButtonR2,
        ["down"] = Enum.KeyCode.ButtonL2
    }
}
local v_u_13 = v1("BaseVehicle")
local v14 = v5("JetpackVehicle", v_u_13)
function v14.__init(p15, p16, p17, p18)
    v_u_13.__init(p15, p16, p17, p18)
    p15.engine_part = p16:WaitForChild("Engine")
    p15.target_height = p15.engine_part.Position
    p15.target_angle = select(2, p15.engine_part.CFrame:ToEulerAnglesYXZ())
    p15.stored_forces = {
        ["turn_torque"] = p15.engine_part.Turn.Gyro.MaxTorque,
        ["velocity_force"] = p15.engine_part.BodyVelocity.MaxForce,
        ["velocity_p"] = p15.engine_part.BodyVelocity.P,
        ["height_force"] = p15.engine_part.Height.MaxForce,
        ["height_p"] = p15.engine_part.Height.P,
        ["height_d"] = p15.engine_part.Height.D,
        ["corrective_torque"] = p15.engine_part.Correct.Gyro.MaxTorque
    }
    p15.driver_maid = v_u_6.new()
end
local function v_u_24(p19, p20, p21)
    local v22 = p19:Dot(p20)
    local v23 = p19:Cross(p20)
    if v22 < -0.99999 then
        return CFrame.fromAxisAngle(p21, 3.141592653589793)
    else
        return CFrame.new(0, 0, 0, v23.x, v23.y, v23.z, 1 + v22)
    end
end
local function v_u_26(...)
    for _, v25 in pairs({ ... }) do
        if v_u_8:IsKeyDown(v25) or v_u_8:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, v25) then
            return 1
        end
    end
    return 0
end
local function v_u_29()
    local v27 = Enum.ContextActionPriority.Medium.Value + 1
    v_u_10:BindActionAtPriority("disable_throttleAccel", function()
        return Enum.ContextActionResult.Sink
    end, false, v27, v_u_12.console.up)
    v_u_10:BindActionAtPriority("disable_throttleDeccel", function()
        return Enum.ContextActionResult.Sink
    end, false, v27, v_u_12.console.down)
    local v_u_28 = false
    return function()
        if not v_u_28 then
            v_u_10:UnbindAction("disable_throttleAccel")
            v_u_10:UnbindAction("disable_throttleDeccel")
        end
        v_u_28 = true
    end
end
local function v_u_35(p30)
    local v31 = v_u_9:FindFirstChild("Resources")
    if v31 then
        v31 = v31:FindFirstChild("Particles")
    end
    if v31 then
        v31 = v31:FindFirstChild("EquipPoof")
    end
    if v31 then
        for _, v32 in v31:GetChildren() do
            local v33 = Instance.new("Attachment")
            v33.Position = p30
            v33.Parent = workspace.Terrain
            local v34 = v32:Clone()
            v34.Parent = v33
            v34:Emit(10)
            v_u_7:AddItem(v33, 10)
        end
    end
end
function v14._get_vertical_control_value(p36)
    local v37 = v_u_4.apps.MobileVehicleControlApp:get_vertical_input()
    if v37 == 0 then
        v37 = v_u_26(v_u_12.keyboard.up, v_u_12.console.up) - v_u_26(v_u_12.keyboard.down, v_u_12.console.down)
    end
    local v38 = p36.vehicle_seat.Occupant
    if v38 then
        v38 = v38.Parent
    end
    local v_u_39
    if v38 then
        v_u_39 = v38:FindFirstChild("HumanoidRootPart")
    else
        v_u_39 = v38
    end
    if v_u_39 and v_u_39:IsA("BasePart") then
        local v40 = v_u_39.Size.Y * 1.75
        local v41 = v_u_39.Size.Y * 4
        local v42 = v_u_11.cast_ray
        local v43 = {
            ["origin"] = v_u_39.Position
        }
        local v44 = -v41
        v43.direction = Vector3.new(0, v44, 0)
        v43.filter_type = Enum.RaycastFilterType.Exclude
        v43.instances = { p36.vehicle_model, v38 }
        function v43.callback(p45)
            return p45.Instance:CanCollideWith(v_u_39)
        end
        local v46 = v42(v43)
        if v46 then
            local v47 = v_u_39.Position.Y - v46.Position.Y - v40
            if v47 > 0 and v37 < 0 then
                local v48 = v47 / (v41 - v40)
                local v49 = math.clamp(v48, 0, 1)
                return (1 - v49) * 0 + v49 * v37
            end
            if v47 < 0 then
                local v50 = -v47 / (v40 - v_u_39.Size.Y)
                local v51 = math.clamp(v50, 0, 1)
                v37 = (1 - v51) * 0 + v51 * 1
            end
        end
    end
    return v37
end
function v14._correct_orientation(p52)
    local v53 = p52.engine_part.CFrame
    if v53.YVector.Y < 0.3 then
        local v54 = v_u_24(v53.YVector, Vector3.new(0, 1, 0), v53.XVector) * (v53 - v53.Position) + v53.Position
        p52.engine_part.Correct.Gyro.CFrame = v54
        p52.engine_part.Correct.Gyro.MaxTorque = p52.stored_forces.corrective_torque
    else
        p52.engine_part.Correct.Gyro.MaxTorque = Vector3.new(0, 0, 0)
    end
end
function v14._update_control(p55, p56)
    local v57 = p55.vehicle_seat.Occupant
    if v57 then
        v57 = v57.Parent
    end
    if v57 then
        v57 = v57:FindFirstChild("HumanoidRootPart")
    end
    if v57 and v57:IsA("BasePart") then
        local v58 = p55:_get_vertical_control_value()
        local v59 = p55.vehicle_seat.SteerFloat
        local v60 = p55.vehicle_seat.ThrottleFloat
        local v61 = p55.vehicle_seat.Occupant ~= nil
        local v62 = -v60
        local v63 = Vector3.new(v59, v58, v62)
        local v64 = v59 * v59 + v60 * v60 > 0
        local v65 = workspace.CurrentCamera.CFrame
        local v66 = v_u_24(v65.YVector, Vector3.new(0, 1, 0), v65.XVector) * (v65 - v65.Position) + v65.Position
        local v67 = v66:VectorToWorldSpace(v63)
        local v68 = v57.AssemblyMass / 4.5
        p55.engine_part.BodyVelocity.Velocity = v67 * p55.vehicle_db_entry.max_speed
        p55.engine_part.BodyVelocity.MaxForce = not v61 and Vector3.new(0, 0, 0) or p55.stored_forces.velocity_force * v68
        p55.engine_part.BodyVelocity.P = p55.stored_forces.velocity_p * v68
        local v69 = p55.engine_part.Position.Y
        if v61 then
            local v70 = p55.target_height.Y + v67.Y * p55.vehicle_db_entry.lift_speed * p56
            local v71 = p55.vehicle_db_entry.lift_speed * p56 * 10
            local v72 = v70 - v69
            local v73 = -v71
            v69 = v69 + math.clamp(v72, v73, v71)
        end
        p55.target_height = Vector3.new(0, v69, 0)
        p55.engine_part.Height.Position = p55.target_height
        p55.engine_part.Height.MaxForce = not v61 and Vector3.new(0, 0, 0) or p55.stored_forces.height_force * v68
        p55.engine_part.Height.P = p55.stored_forces.height_p * v68
        p55.engine_part.Height.D = p55.stored_forces.height_d * 2
        local v74 = CFrame.new()
        if v64 then
            local v75 = v66.ZVector
            local v76 = (Vector3.new(0, 1, 0)):Cross(v67)
            v74 = CFrame.fromAxisAngle(v76, p55.vehicle_db_entry.tilt_angle)
            local v77 = v75.X
            local v78 = v75.Z
            p55.target_angle = math.atan2(v77, v78) + 3.141592653589793
        else
            p55.target_angle = ({ p55.engine_part.CFrame:ToEulerAnglesYXZ() })[2]
        end
        local v79 = tick()
        local v80 = -v79 * p55.vehicle_db_entry.wobble_frequency + 1.5707963267948966
        local v81 = math.sin(v80)
        local v82 = -v79 * p55.vehicle_db_entry.wobble_frequency
        local v83 = math.sin(v82)
        local v84 = CFrame.fromEulerAnglesXYZ(v81 * p55.vehicle_db_entry.wobble_reduction, 0, v83 * p55.vehicle_db_entry.wobble_reduction)
        local v85 = v74 * CFrame.fromEulerAnglesYXZ(0, p55.target_angle, 0)
        p55.engine_part.Turn.Gyro.CFrame = p55.engine_part.Turn.Gyro.CFrame:Lerp(v85, p56 * 0.1 * 60) * v84
        p55.engine_part.Turn.Gyro.MaxTorque = not v61 and Vector3.new(0, 0, 0) or p55.stored_forces.turn_torque
    end
end
function v14.is_jump_exiting_disabled(_)
    return v_u_3.run({
        ["default"] = function()
            return false
        end,
        ["phone"] = function()
            return true
        end,
        ["tablet"] = "phone"
    })
end
function v14.on_driver_changed(p_u_86, _, _, p87)
    p_u_86.driver_maid:DoCleaning()
    if p87 then
        local v_u_88 = v_u_6.new()
        local function v_u_93()
            v_u_88:DoCleaning()
            local v_u_89 = nil
            local v_u_90 = nil
            local v91 = {
                ["desktop"] = function()
                    v_u_89 = v_u_12.keyboard.up
                    v_u_90 = v_u_12.keyboard.down
                    if v_u_3.is_using_gamepad() then
                        v_u_89 = v_u_12.console.up
                        v_u_90 = v_u_12.console.down
                        v_u_88:GiveTask((v_u_29()))
                    end
                end,
                ["phone"] = function()
                    v_u_4.apps.MobileVehicleControlApp:set_configuration("Vertical")
                    v_u_4.set_app_visibility("MobileVehicleControlApp", true)
                    v_u_88:GiveTask(function()
                        v_u_4.set_app_visibility("MobileVehicleControlApp", false)
                    end)
                end,
                ["tablet"] = "phone",
                ["console"] = "desktop"
            }
            v_u_3.run(v91)
            if v_u_89 and v_u_90 then
                local v92 = v_u_4.apps.InputDisplayApp
                v_u_4.apps.HintApp:hint({
                    ["text"] = "See bottom left corner for ascend and descend controls.",
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
                v92:show_input("Jetpack", v_u_89, {
                    ["prompt_text"] = "Ascend",
                    ["scale"] = 0.8
                })
                v92:show_input("Jetpack", v_u_90, {
                    ["prompt_text"] = "Descend",
                    ["scale"] = 0.8
                })
                v_u_88:GiveTask(function()
                    v_u_4.apps.InputDisplayApp:clear_tag("Jetpack")
                end)
            end
        end
        v_u_93()
        p_u_86.driver_maid:GiveTask(v_u_3.get_gamepad_changed():Connect(function()
            v_u_93()
        end))
        local v_u_94 = v_u_2.get_equipped_by_category("transport")[1]
        if v_u_94 then
            v_u_94 = v_u_94.unique
        end
        p_u_86.driver_maid:GiveTask(function()
            v_u_88:DoCleaning()
            local v95 = v_u_2.get_equipped_by_category("transport")[1]
            if v95 and v95.unique == v_u_94 then
                v_u_35(p_u_86.vehicle_seat.Position)
                v_u_2.backpack_equip(v95, {
                    ["forced_action"] = "unequip"
                })
            end
        end)
    end
end
function v14.update(p96, p97)
    v_u_13.update(p96, p97)
    p96:_update_control(p97)
    p96:_correct_orientation()
end
function v14.destroy(p98)
    v_u_13.destroy(p98)
    p98.driver_maid:DoCleaning()
end
return v14