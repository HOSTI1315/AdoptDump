--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.MountVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = game:GetService("Players")
local v_u_5 = game:GetService("RunService")
local v_u_6 = {
    [Enum.HumanoidStateType.Running] = true,
    [Enum.HumanoidStateType.RunningNoPhysics] = true,
    [Enum.HumanoidStateType.Freefall] = true,
    [Enum.HumanoidStateType.Landed] = true,
    [Enum.HumanoidStateType.None] = true
}
local v_u_7 = v1("BaseVehicle")
local v8 = v2("MountVehicle", v_u_7)
local v_u_9 = require(script:WaitForChild("MountVehicleAnimator"))
v8.animator = v_u_9
function v8.__init(p10, p11, p12, p13)
    v_u_7.__init(p10, p11, p12, p13)
    p10.humanoid = p11:FindFirstChild("Humanoid")
    p10.root_part = p11:FindFirstChild("HumanoidRootPart")
    p10.swim_force = p10.root_part.SwimForce
    p10.internal_animator = v_u_9.new(p11, p13)
    for _, v14 in Enum.HumanoidStateType:GetEnumItems() do
        if not v_u_6[v14] then
            p10.humanoid:SetStateEnabled(v14, false)
        end
    end
    p10.humanoid:ChangeState(Enum.HumanoidStateType.Running)
    p10.driver_maid = v_u_3.new()
end
function v8._update_swim(p15, p16, p17)
    if p16 and p17 then
        p15.swim_force.Position = Vector3.new(0, 1, 0) * p17
        p15.swim_force.MaxForce = Vector3.new(0, 1, 0) * p15.root_part.AssemblyMass * workspace.Gravity * 10
        p15.humanoid.WalkSpeed = p15.vehicle_db_entry.swim_speed
    else
        p15.swim_force.MaxForce = Vector3.new(0, 0, 0)
        p15.humanoid.WalkSpeed = p15.vehicle_db_entry.walk_speed
    end
end
function v8.on_driver_changed(p_u_18, _, _, p19)
    p_u_18.driver_maid:DoCleaning()
    if p19 then
        local v_u_20 = CFrame.new((p_u_18.vehicle_db_entry.camera_offset or Vector3.new(0, 5, 0)) * p_u_18.model_scale)
        p_u_18.driver_maid:GiveTask(v_u_5.PostSimulation:Connect(function()
            local v21 = (p_u_18.vehicle_seat.CFrame:ToObjectSpace(p_u_18.root_part.CFrame) * v_u_20).Position
            p_u_18.vehicle_seat.CameraOffset.Value = v21
        end))
    end
end
function v8.update(p22, p23)
    v_u_7.update(p22, p23)
    local v24 = v_u_4.LocalPlayer.Character
    if v24 then
        v24 = v24:FindFirstChild("Humanoid")
    end
    if p22.vehicle_seat.Occupant == v24 then
        p22.humanoid:Move(v24.MoveDirection)
    else
        p22.humanoid:Move(Vector3.new(0, 0, 0))
    end
    local v25 = p22.internal_animator:get_state()
    p22:_update_swim(v25.is_swimming, v25.water_level)
    p22.internal_animator:update(p23, v25)
end
function v8.destroy(p26)
    v_u_7.destroy(p26)
    p26.internal_animator:destroy()
    p26.driver_maid:DoCleaning()
end
return v8