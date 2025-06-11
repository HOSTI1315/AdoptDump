--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.SwimmingMover (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetEntityHelper")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = game:GetService("Players")
local v9 = {
    ["setup"] = function(p5)
        local v6 = Instance.new("BodyGyro")
        v6.Name = "SwimmingGyro"
        v6.MaxTorque = Vector3.new(10000000000, 10000000000, 10000000000)
        v6.D = 200
        v6.P = 5000
        local v7 = Instance.new("BodyVelocity")
        v7.Name = "SwimmingBodyVelocity"
        v7.MaxForce = Vector3.new(10000000000, 10000000000, 10000000000)
        p5.swim_state.swim_bodygyro = v6
        p5.swim_state.swim_bodyvelocity = v7
        p5.swim_state.swim_maid:GiveTask(v6)
        p5.swim_state.swim_maid:GiveTask(v7)
    end,
    ["cleanup"] = function(p8)
        if p8.swim_state.swim_bodygyro then
            p8.swim_state.swim_bodygyro:Destroy()
        end
        if p8.swim_state.swim_bodyvelocity then
            p8.swim_state.swim_bodyvelocity:Destroy()
        end
    end
}
local function v_u_15()
    local v10 = v_u_4.LocalPlayer.Character
    if v10 then
        v10 = v10:FindFirstChild("HumanoidRootPart")
    end
    local v11 = (v10.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
    local v12 = -v11.X
    local v13 = -v11.Z
    local v14 = math.atan2(v12, v13)
    return CFrame.Angles(0, v14, 0)
end
local function v_u_22(p16)
    local v17 = p16.swim_state
    local v18 = p16.goal_state
    v17.swim_bodygyro.Parent = nil
    v17.swim_bodyvelocity.Parent = nil
    v17.swim_bodyvelocity.Velocity = Vector3.new()
    v17.enabled = false
    local v19 = v_u_4.LocalPlayer.Character
    local v20
    if v19 then
        v20 = v19:FindFirstChild("Humanoid")
    else
        v20 = v19
    end
    local v21 = v19:FindFirstChild("HumanoidRootPart")
    if not (v20 and v21) or (v20:GetState() ~= Enum.HumanoidStateType.Swimming or (v18.target ~= nil or ((v21.Position - p16.base.root.Position) * Vector3.new(1, 0, 1)).Magnitude >= 10)) then
        p16.base.root.Velocity = p16.base.root.Velocity + Vector3.new(0, 50, 0)
    end
end
v9.optimization_prioritize = "owned"
function v9.step(p23, _)
    local v24 = p23.swim_state
    if p23.client_has_control and not p23.mount_state.is_mounted then
        local v25 = p23.move_state
        local v26 = p23.speed_state
        local v27 = p23.goal_state
        local v28 = p23.base.humanoid:GetState() == Enum.HumanoidStateType.Swimming
        if v28 and not v24.enabled then
            if not p23.active_performances.FetchChewtoy then
                local v29 = p23.swim_state
                v29.swim_bodygyro.Parent = p23.base.root
                v29.swim_bodyvelocity.Parent = p23.base.root
                v29.enabled = true
            end
        elseif (not v28 or v_u_2.has_performance(p23, v_u_3.FetchChewtoy)) and v24.enabled then
            v_u_22(p23)
        end
        if v28 then
            v25.is_moving = true
            v25.last_move_time = tick()
            local v30 = v25.move_vector
            local v31 = v_u_4.LocalPlayer.Character
            if v31 then
                v31 = v31:FindFirstChild("Humanoid")
            end
            local v32
            if v31 then
                v32 = v31:GetState() == Enum.HumanoidStateType.Swimming
            else
                v32 = v31
            end
            local v33 = v27.target == nil
            local v34 = p23.modifier_values_from_performances.rotation_target
            if v34 then
                v34 = v34:get_position(p23)
            end
            if v34 then
                v24.swim_bodygyro.CFrame = CFrame.new(p23.base.root.Position, v34)
            elseif v32 and v33 then
                if v31 and (v31.MoveDirection.Magnitude > 0 and v26.owner_move_vector.Magnitude > 1) then
                    v24.swim_bodygyro.CFrame = CFrame.new(Vector3.new(), (v30 + v26.owner_move_vector).Unit)
                else
                    v24.swim_bodygyro.CFrame = v_u_15()
                end
            else
                v24.swim_bodygyro.CFrame = CFrame.new(Vector3.new(), v30)
                local v35 = v30.Unit
                if v35 == v35 then
                    v24.swim_bodygyro.CFrame = CFrame.new(Vector3.new(), v35)
                else
                    v24.swim_bodygyro.CFrame = CFrame.new()
                end
            end
            v24.swim_bodyvelocity.Velocity = v30 + v26.owner_move_vector
        end
    elseif p23.swim_state.enabled then
        v_u_22(p23)
    end
end
return v9