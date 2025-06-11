--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.GoalPositionSetter (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Raycast")
local v3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_4 = v1("PetEntityHelper")
local v_u_5 = game:GetService("Workspace")
local v_u_6 = game:GetService("Players")
local v_u_7 = {}
local v_u_8 = {
    [v3.Sitting] = true,
    [v3.Carried] = true,
    [v3.Mounted] = true,
    [v3.Focused] = true
}
local function v_u_17(p_u_9, p10, p11, p12)
    local v16 = {
        ["ignore_non_cancollide"] = true,
        ["ignore_transparent"] = false,
        ["ignore_water"] = not p12,
        ["ignore_function"] = function(p13)
            local v14 = p13:IsDescendantOf(v_u_5)
            assert(v14, "Part is not a descendant of workspace")
            local v15 = p_u_9.base.root:IsDescendantOf(v_u_5)
            assert(v15, "Root is not a descendant of workspace")
            return not p_u_9.base.root:CanCollideWith(p13)
        end
    }
    return v_u_2.FindPartOnRay(Ray.new(p10, p11), {
        v_u_5.PetObjects,
        v_u_5.Pets,
        v_u_6.LocalPlayer.Character,
        p_u_9.base.char
    }, nil, v16)
end
local function v_u_36(p18, p19, p20, p21)
    local v22 = (p21 or p20.CFrame) * CFrame.new(0, -(p20.Size.Y / 2) - p19.HipHeight, 0) * CFrame.new(0, 0.5, 0)
    local v23 = p18.goal_state
    local v24 = v22 * Vector3.new(0, 0, 4)
    local v25 = v22 * Vector3.new(4.5, 0, -8) - v24
    local v26, v27 = v_u_17(p18, v24, v25)
    if not v26 then
        local v28 = v23.recent_obstacle_point
        if v28 then
            if (p18.base.root.Position - v28).Magnitude < 7.5 then
                return true
            end
            v23.recent_obstacle_point = nil
            return false
        else
            if p19:GetState() == Enum.HumanoidStateType.Swimming then
                return false
            end
            local v29 = v_u_17(p18, v22 * (p18.base.char:GetAttribute("FollowOffset") or Vector3.new(3.5, 0, 0)) + Vector3.new(0, 1, 0), Vector3.new(0, -5, 0), true)
            return not v29 and true or (v29:IsA("Terrain") and true or false)
        end
    end
    local v30 = v27
    local v31 = 4
    local v32 = false
    while true do
        v24 = v24 + Vector3.new(0, 1, 0)
        local v33, v34 = v_u_17(p18, v24, v25)
        if not v33 then
            v32 = true
            break
        end
        if ((v27 - v34) * Vector3.new(1, 0, 1)).Magnitude < 0.1 then
            v32 = false
            break
        end
        local v35 = (v27 - v24) * Vector3.new(1, 0, 1)
        if (v34 - v24).Magnitude < v35.Magnitude then
            v32 = false
            break
        end
        v31 = v31 - 1
        if v31 <= 0 then
            break
        end
        v27 = v34
    end
    if v32 then
        return false
    end
    v23.recent_obstacle_point = v30
    return true
end
local function v_u_42(p37, p38)
    local v39 = p37.Unit
    local v40 = nil
    for _, v41 in ipairs(p38) do
        v40 = v39:Cross(v41).Unit
        if v40 ~= Vector3.new() then
            break
        end
    end
    return v39, -v39:Cross(v40).Unit, v40
end
local function v_u_47(_, p43)
    if p43.Velocity.Magnitude <= 3 then
        return p43.CFrame
    end
    local v44, v45, v46 = v_u_42(-p43.Velocity, { p43.CFrame.XVector, p43.CFrame.ZVector })
    return CFrame.fromMatrix(p43.Position, v45, v46, v44)
end
function v_u_7.get_follow_target_pos(p48)
    debug.profilebegin("PetEntities_GoalPositionSetter_GetFollowTargetPos")
    local v49 = v_u_6.LocalPlayer.Character
    local v50
    if v49 then
        v50 = v49:FindFirstChild("Humanoid")
    else
        v50 = v49
    end
    if v49 then
        v49 = v49:FindFirstChild("HumanoidRootPart")
    end
    if v50 and v49 then
        local v51
        if v50:GetState() == Enum.HumanoidStateType.Swimming then
            v51 = v_u_47(v50, v49)
        else
            v51 = nil
        end
        debug.profilebegin("PetEntities_GoalPositionSetter_GetShouldAvoidObstacle")
        local v52 = v_u_36(p48, v50, v49, v51)
        debug.profileend()
        local v53 = (v52 or v50:GetAttribute("IsEnteringDoor")) and Vector3.new(0, 0, 4.5) or (p48.base.char:GetAttribute("FollowOffset") or Vector3.new(3.5, 0, 0))
        debug.profileend()
        return (v51 or v49.CFrame) * v53
    end
end
function v_u_7.step(p54, _)
    if p54.client_has_control and p54.is_in_workspace then
        local v55 = p54.goal_state
        local v56 = p54.move_state
        local v57 = p54.pathfinding
        local v58 = v_u_6.LocalPlayer.Character
        local v59
        if v58 then
            v59 = v58:FindFirstChild("Humanoid")
        else
            v59 = v58
        end
        if v58 then
            v58 = v58:FindFirstChild("HumanoidRootPart")
        end
        if v59 and v58 then
            local v60 = (p54.base.root.Position - v58.Position).Magnitude
            v55.distance_to_owner = v60
            if p54.exclusive_state and v_u_8[p54.exclusive_state] or v_u_4.is_pet_mounted(p54.base.char) then
                v55.goal_position = nil
            end
            if not p54.is_changing_interiors then
                if v57.path then
                    if v57.path:is_current_waypoint_ready() then
                        v55.goal_position = v57.path:get_current_waypoint().position
                    else
                        v55.goal_position = nil
                    end
                end
                if v55.target then
                    v55.goal_position = v55.target:get_position(p54)
                    return
                end
            end
            local v61 = v60 < 10
            local v62 = not v56.is_moving
            if v62 then
                v62 = tick() - v56.last_move_time > 0.5
            end
            local v63 = p54.base.char:GetAttribute("FollowOffset") or Vector3.new(3.5, 0, 0)
            if v62 and (v61 and v63 == v55.follow_offset) then
                v55.goal_position = nil
            else
                v55.goal_position = v_u_7.get_follow_target_pos(p54)
                v55.follow_offset = v63
            end
        else
            v55.goal_position = nil
            v55.distance_to_owner = (1 / 0)
            return
        end
    else
        return
    end
end
return v_u_7