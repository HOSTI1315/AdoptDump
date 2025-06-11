--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.PetMover (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ObstacleType")
local v_u_3 = v1("StateManagerClient")
local v4 = {}
local function v_u_8(p5, p6)
    if p6 == Vector3.new(0, 0, 0) or p6 ~= p6 then
        p5.base.humanoid:Move((Vector3.new()))
        p5.base.humanoid.WalkSpeed = 0
        p5.move_state.is_moving = false
        p5.move_state.final_move_vector = Vector3.new()
        p5.move_state.stopped_moving_time = tick()
    else
        local v7 = p5.move_state
        v7.last_move_time = tick()
        v7.final_move_vector = p6.Unit
        p5.base.humanoid:Move(p6.Unit)
        p5.base.humanoid.WalkSpeed = p6.Magnitude
        v7.is_moving = true
    end
end
local function v_u_12(p9)
    local v10 = p9.modifier_values_from_performances
    if v10.should_jump then
        return true
    end
    if v10.shouldnt_avoid_obstacles_by and (not v10.shouldnt_avoid_obstacles_by.jumping and p9.obstacle_detection.obstacle_type == v_u_2.Jumpable) then
        return true
    end
    local v11 = p9.pathfinding.path
    if v11 and (v11:is_current_waypoint_ready() and v11:get_current_waypoint().action == "Jump") then
        return true
    end
end
local function v_u_20(p13)
    local v14 = p13.jump_state
    if v_u_12(p13) then
        v14.last_jump_time = tick()
        p13.base.humanoid.Jump = true
        local v15 = p13.base.humanoid:GetState()
        if v15 ~= Enum.HumanoidStateType.Freefall and v15 ~= Enum.HumanoidStateType.Jumping then
            p13.sounds.play_sound("Jump")
        end
        local v16 = p13.jump_state
        local v17 = p13.modifier_values_from_performances
        local v18 = p13.obstacle_detection
        local v19
        if v17.jump_height then
            v19 = v17.jump_height
        elseif v18.obstacle_height then
            v19 = v18.obstacle_height + 1
        else
            v19 = v16.base_jump_height
        end
        p13.base.humanoid.JumpHeight = v19
    else
        p13.base.humanoid.JumpHeight = v14.base_jump_height
    end
end
local function v_u_26(p21)
    local v22 = p21.modifier_values_from_performances
    local v23 = p21.speed_state
    local v24 = p21.move_state
    local v25 = v22.movement_vector
    if v25 then
        v_u_8(p21, v25)
        return
    elseif p21.shared_cache.humanoid_state == Enum.HumanoidStateType.Swimming then
        p21.base.humanoid:Move((Vector3.new()))
        p21.base.humanoid.WalkSpeed = 0
        p21.move_state.is_moving = false
        p21.move_state.final_move_vector = Vector3.new()
        p21.move_state.stopped_moving_time = tick()
    else
        v_u_8(p21, v24.move_vector + v23.owner_move_vector)
    end
end
v4.optimization_prioritize = "owned"
function v4.step(p27, _)
    if p27.client_has_control then
        local v28 = v_u_3.get(p27.base.char)
        if not (p27.base.humanoid.Sit or v28 and v_u_3.has_state(v28, "SitInVehicle")) then
            v_u_20(p27)
            v_u_26(p27)
            return
        end
    end
    if p27.move_state.is_moving then
        p27.base.humanoid:Move((Vector3.new()))
        p27.base.humanoid.WalkSpeed = 0
        p27.move_state.is_moving = false
        p27.move_state.final_move_vector = Vector3.new()
        p27.move_state.stopped_moving_time = tick()
    end
end
return v4