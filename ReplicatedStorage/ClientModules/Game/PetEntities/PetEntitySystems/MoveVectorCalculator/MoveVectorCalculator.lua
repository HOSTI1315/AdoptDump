--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.MoveVectorCalculator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Utilities")
local v3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_4 = v1("PetEntityHelper")
local v_u_5 = game:GetService("Players")
local v_u_6 = {
    [v3.Sitting] = true,
    [v3.Carried] = true,
    [v3.Mounted] = true,
    [v3.Focused] = true
}
local function v_u_11(p7)
    local v8 = p7.goal_state.target
    if v8 then
        v8 = v8:get_target_value()
    end
    if v8 and v8 ~= v_u_5.LocalPlayer then
        return Vector3.new()
    else
        local v9 = v_u_5.LocalPlayer.Character
        local v10
        if v9 then
            v10 = v9:FindFirstChild("Humanoid")
        else
            v10 = v9
        end
        if v9 then
            v9 = v9:FindFirstChild("HumanoidRootPart")
        end
        if v10 and v9 then
            if v10:GetState() == Enum.HumanoidStateType.Swimming then
                return v9.Velocity
            else
                return v10.MoveDirection * v10.WalkSpeed
            end
        else
            return Vector3.new()
        end
    end
end
local function v_u_24(p12)
    local v13 = p12.goal_state
    local v14 = p12.move_state
    if not v13.goal_position then
        p12.move_state.move_vector = Vector3.new()
        return Vector3.new(), Vector3.new()
    end
    local v15 = v13.goal_position - p12.base.root.Position
    if p12.base.humanoid:GetState() ~= Enum.HumanoidStateType.Swimming then
        v15 = v15 * Vector3.new(1, 0, 1)
    end
    local v16 = v_u_11(p12).Magnitude < 1
    local v17 = v13.target == nil
    if v17 and (v16 and v15.Magnitude < 1) then
        p12.move_state.move_vector = Vector3.new()
        return Vector3.new(), Vector3.new()
    end
    if not v17 and v15.Magnitude < 0.05 then
        p12.move_state.move_vector = Vector3.new()
        return Vector3.new(), Vector3.new()
    end
    local v18 = v16 and 12 or 16
    local v19 = p12.pathfinding
    local v20 = p12.modifier_values_from_performances
    local v21 = p12.speed_state
    if v20.walkspeed == nil then
        if v19.path then
            v18 = v21.pathfinding_speed
        else
            local v22 = v15.Magnitude
            if v22 < 3 then
                v18 = v22 / 3 * v18
            elseif v22 >= 20 then
                local v23 = v18 + (v22 - 20) / 40 * (36 - v18)
                v18 = math.min(v23, 36)
            end
        end
    else
        v18 = v20.walkspeed
    end
    v14.move_vector = v_u_2.safe_unit(v15) * v18
    return v14.move_vector, v15
end
local function v_u_39(p25, p26, p27)
    local v28 = p25.speed_state
    local v29 = p25.goal_state
    local v30 = v_u_11(p25)
    local v31 = v30.Magnitude < 1
    local v32 = not v29.target
    local v33 = p26.Magnitude > 0
    local v34 = p25.modifier_values_from_performances.walkspeed ~= nil
    v28.owner_move_vector_raw = v30
    if v32 and not v34 then
        local v35 = p25.base.humanoid:GetState() == Enum.HumanoidStateType.Swimming
        local v36 = v_u_5.LocalPlayer.Character
        if v36 then
            v36 = v36:FindFirstChild("Humanoid")
        end
        local v37
        if v36 then
            v37 = v36:GetState() ~= Enum.HumanoidStateType.Swimming
        else
            v37 = false
        end
        if v35 and (v31 and v37) then
            v28.owner_move_vector = v30
            return
        end
        if v33 then
            local v38 = v_u_2.safe_unit(v30):Dot(v_u_2.safe_unit(p26)) > 0.7
            if p27.Magnitude < 3 or v38 then
                v28.owner_move_vector = v30
                return
            end
        end
    end
    v28.owner_move_vector = Vector3.new()
end
return {
    ["step"] = function(p40, _)
        if p40.client_has_control and not (p40.exclusive_state and v_u_6[p40.exclusive_state]) and not (p40.move_state.calculator_disabled or v_u_4.is_pet_mounted(p40.base.char)) then
            local v41, v42 = v_u_24(p40)
            v_u_39(p40, v41, v42)
        else
            p40.move_state.move_vector = Vector3.new()
            p40.speed_state.owner_move_vector = Vector3.new()
        end
    end
}