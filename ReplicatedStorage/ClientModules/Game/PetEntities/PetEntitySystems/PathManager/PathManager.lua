--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.PathManager (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Pathfinder")
local v_u_3 = v1("GoalPositionSetter")
local v_u_4 = v1("AdoptMeEnums/PetEntities/ObstacleType")
local v_u_5 = v1("StateManagerClient")
local v_u_6 = game:GetService("Players")
local v_u_7 = v1("Debug").create_debug_log("debug", false)
local v8 = {}
local function v_u_12(p_u_9, p10)
    local v11 = {
        ["get_agent_position"] = function()
            return p_u_9.base.root.Position
        end,
        ["get_target_position"] = p10,
        ["waypoint_reached_threshold"] = 1,
        ["recompute_target_distance_threshold"] = 10,
        ["recompute_lost_distance_threshold"] = 10,
        ["max_attempts"] = 1,
        ["agent_radius"] = 2,
        ["costs"] = {
            ["Water"] = 2,
            ["PreferredPath"] = 0.1
        }
    }
    return v11
end
local function v_u_14(p13)
    return p13.Humanoid, p13.HumanoidRootPart
end
local function v_u_23(p15)
    local v16 = v_u_6.LocalPlayer.Character
    local v17, v18, v19 = pcall(v_u_14, v16)
    if v17 then
        local v20 = v18:GetState()
        local v21
        if v20 == Enum.HumanoidStateType.Running then
            v21 = false
        else
            v21 = v20 ~= Enum.HumanoidStateType.Climbing
        end
        local v22 = v19.Velocity.Y
        if math.abs(v22) > 1 and v21 then
            p15.pathfinding.last_owner_airborne_time = tick()
        end
    end
end
local function v_u_41(p_u_24)
    local v25 = p_u_24.obstacle_detection
    local v26 = p_u_24.modifier_values_from_performances
    local v27 = p_u_24.pathfinding
    local v28 = p_u_24.goal_state
    if not p_u_24.client_has_control then
        return false
    end
    if not p_u_24.is_in_workspace then
        return false
    end
    if p_u_24.is_changing_interiors then
        v_u_7("shouldn\'t start because changing interiors")
        return false
    end
    if v26.shouldnt_pathfind then
        v_u_7("shouldn\'t start because shouldnt_pathfind modifier")
        return false
    end
    local v30 = p_u_24.goal_state.target and function()
        local v29 = p_u_24.goal_state.target
        if v29 then
            v29 = p_u_24.goal_state.target:get_position(p_u_24)
        end
        return v29
    end or function()
        return v_u_3.get_follow_target_pos(p_u_24)
    end
    if not v30() then
        v_u_7("shouldn\'t start because path_target doesn\'t exist")
        return false
    end
    local v31 = (p_u_24.base.root.Position - v30()).Magnitude
    if v31 > 2000 then
        v_u_7("shouldn\'t start because target is too far away; distance: " .. tostring(v31))
        return false
    end
    if v31 < 0.1 then
        v_u_7("shouldn\'t start because target is too close; distance: " .. tostring(v31))
        return false
    end
    if p_u_24.base.humanoid:GetState() == Enum.HumanoidStateType.Swimming then
        v_u_7("shouldn\'t start because swimming")
        return false
    end
    if v26.should_start_pathfinding then
        v_u_7("should start because should_start_pathfinding modifier")
        return true
    end
    local v32 = v25.obstacle_type
    local v33 = v26.shouldnt_avoid_obstacles_by or {}
    if v33.pathfinding then
        v_u_7("skipping obstacle checks because shouldnt_avoid_obstacles_by.pathfinding")
    else
        if v32 == v_u_4.NotJumpable then
            v_u_7("should start because not jumpable obstacle")
            return true
        end
        if v33.jumping and v32 == v_u_4.Jumpable then
            v_u_7("should start because jumpable obstacle")
            return true
        end
    end
    if v26.shouldnt_start_pathfinding_from_vertical_target_distance then
        v_u_7("shouldn\'t start because vertical target distance modifier")
        return false
    end
    local v34 = p_u_24.base.root.Position
    local v35 = v_u_6.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local v36 = tick() - v27.last_owner_airborne_time
    local v37 = v28.target
    local v38 = v37 and v37:get_position(p_u_24)
    if v38 then
        v35 = v38
    elseif v35 then
        v35 = v35.Position
    end
    if v35 then
        local v39 = v36 > 0.2
        local v40 = v35.Y - v34.Y
        if math.abs(v40) > 10 and v39 then
            v_u_7("should start because owner is vertically far from pet")
            return true
        end
    end
    v_u_7("shouldn\'t start: default")
    return false
end
local function v_u_47(p42)
    local v43 = p42.pathfinding
    local v44 = p42.modifier_values_from_performances
    local v45 = p42.goal_state
    if p42.base.humanoid:GetState() == Enum.HumanoidStateType.Swimming then
        return true
    elseif p42.is_changing_interiors then
        return true
    else
        local v46 = v_u_5.get(p42.base.char)
        if p42.base.humanoid.Sit or v46 and v_u_5.has_state(v46, "SitInVehicle") then
            return true
        elseif v44.shouldnt_pathfind then
            return true
        elseif v43.target_to_pathfind_to and v43.target_to_pathfind_to ~= v45.target then
            return true
        elseif v43.path:is_failed() then
            return true, true
        else
            return false
        end
    end
end
function v8.step(p_u_48, _)
    if p_u_48.client_has_control then
        debug.profilebegin("PetEntities_PathManager_GroundedTime")
        v_u_23(p_u_48)
        debug.profileend()
        local v49 = p_u_48.pathfinding
        local v50 = p_u_48.goal_state
        v49.did_path_fail_this_frame = false
        if v49.path then
            if p_u_48.is_in_workspace then
                debug.profilebegin("PetEntities_PathManager_UpdatePath")
                v49.path:update_path()
                debug.profileend()
                debug.profilebegin("PetEntities_PathManager_ShouldStopPathfinding")
                local v51, v52 = v_u_47(p_u_48)
                debug.profileend()
                if v51 then
                    local v53 = p_u_48.pathfinding
                    v53.path:destroy()
                    v53.path = nil
                    if v52 then
                        v49.did_path_fail_this_frame = true
                    end
                else
                    debug.profilebegin("PetEntities_PathManager_NextWaypoint")
                    if v49.path:is_current_waypoint_reached() then
                        v49.path:next()
                    end
                    debug.profileend()
                    debug.profilebegin("PetEntities_PathManager_MaybeCleanup")
                    if not v49.path:has_next_waypoint() or v49.path:is_possibly_final_waypoint() and not v_u_41(p_u_48) then
                        local v54 = p_u_48.pathfinding
                        v54.path:destroy()
                        v54.path = nil
                    end
                    debug.profileend()
                end
            else
                local v55 = p_u_48.pathfinding
                v55.path:destroy()
                v55.path = nil
                return
            end
        else
            debug.profilebegin("PetEntities_PathManager_ShouldStartPathfinding")
            if v_u_41(p_u_48) then
                v49.target_to_pathfind_to = v50.target
                debug.profilebegin("PetEntities_PathManager_GetPathForCurrentGoal")
                local v57 = v_u_12(p_u_48, p_u_48.goal_state.target and function()
                    local v56 = p_u_48.goal_state.target
                    if v56 then
                        v56 = p_u_48.goal_state.target:get_position(p_u_48)
                    end
                    return v56
                end or function()
                    return v_u_3.get_follow_target_pos(p_u_48)
                end)
                v49.path = v_u_2.new(v57)
                debug.profileend()
            end
            debug.profileend()
            return
        end
    else
        if p_u_48.pathfinding.path then
            local v58 = p_u_48.pathfinding
            v58.path:destroy()
            v58.path = nil
        end
        return
    end
end
return v8