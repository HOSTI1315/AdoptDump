--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.ObstacleDetector (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Raycast")
local v3 = v1("Debug")
local v_u_4 = v1("AdoptMeEnums/PetEntities/ObstacleType")
local v5 = v1("Maid")
local v_u_6 = game:GetService("Workspace")
local v_u_7 = game:GetService("Players")
local v_u_8 = v3.create_debug_log("waypoint_completion", false)
local v_u_9 = v3.create_debug_log("raycast_hit", false)
local v_u_10 = v3.create_debug_log("stuck_timeout", false)
local v_u_11 = v5.new()
local function v_u_12(_, _, _, _) end
local function v_u_20(p_u_13, p14, p15)
    local v19 = {
        ["ignore_non_cancollide"] = true,
        ["ignore_transparent"] = false,
        ["ignore_water"] = true,
        ["ignore_function"] = function(p16)
            local v17 = p16:IsDescendantOf(v_u_6)
            assert(v17, "Part is not a descendant of workspace")
            local v18 = p_u_13.base.root:IsDescendantOf(v_u_6)
            assert(v18, "Root is not a descendant of workspace")
            return not p_u_13.base.root:CanCollideWith(p16)
        end
    }
    return v_u_2.FindPartOnRay(Ray.new(p14, p15), {
        v_u_6.PetObjects,
        v_u_6.Pets,
        v_u_7.LocalPlayer.Character,
        p_u_13.base.char
    }, nil, v19)
end
local function v_u_35(p21, _)
    local v22 = p21.speed_state
    local v23 = p21.pathfinding
    local v24 = p21.obstacle_detection
    local v25 = v23.path:is_current_waypoint_ready()
    if v25 then
        v25 = v23.path:get_current_waypoint()
    end
    if v25 then
        if v25.position ~= v24.recent_waypoint_position then
            v24.recent_waypoint_position = v25.position
            v24.recent_waypoint_changed_tick = tick()
            v_u_8("Set recent_waypoint_changed_tick")
        end
        local v26 = v23.path:get_previous_waypoint()
        v24.last_successful_move_time = tick()
        local v27 = (v25.position - v26.position).Magnitude
        local v28 = math.max(0.1, v27)
        local v29 = v22.pathfinding_speed
        local v30 = v28 / math.max(0.01, v29)
        local v31 = tick() - v24.recent_waypoint_changed_tick - 0.5
        local v32 = v31 / v30
        local v33 = v28 + (0 - v28) * v32 + 7
        if v25.action == "Jump" then
            v33 = v33 + 10
        end
        local v34 = (v25.position - p21.base.root.Position).Magnitude
        v_u_8("---")
        v_u_8(("total_dist: %.2f"):format(v28))
        v_u_8(("total_time / current_time: %.2f / %.2f"):format(v30, v31))
        v_u_8(("total_dist / current_dist: %.2f / %.2f"):format(v28, v34))
        v_u_8(("expct_dist / current_dist: %.2f / %.2f"):format(v33, v34))
        v_u_8(("time_pct / dist_pct: %.2f / %.2f"):format(v32, v34 / v28))
        v_u_8("---")
        if v32 < 0 then
            v_u_8("Ok < 0")
            return v_u_4.None
        elseif v33 < v34 then
            v_u_8("Teleporting to next waypoint")
            return v_u_4.Impassable
        else
            v_u_8("Ok")
            return v_u_4.None
        end
    else
        v24.recent_waypoint_position = nil
        v24.recent_waypoint_changed_tick = nil
        v_u_8("Cleared recent_waypoint _changed_tick and _position")
        v_u_8("Missing current_waypoint")
        return v_u_4.None
    end
end
local function v_u_47(p36)
    local v37 = p36.goal_state
    local v38 = p36.base.humanoid
    local v39 = p36.base.root
    local v40 = (2 * (p36.modifier_values_from_performances.jump_height or p36.jump_state.base_jump_height) / v_u_6.Gravity) ^ 0.5 * v38.WalkSpeed
    local v41 = v37.target
    if not v41 then
        return v40
    end
    local v42 = v41:get_position(p36)
    local v43 = v39.Position - v42
    local v44 = v43.X
    local v45 = v43.Z
    local v46 = Vector3.new(v44, 0, v45).Magnitude
    return math.min(v46, v40)
end
local function v_u_103(p48)
    local v49 = p48.base.humanoid.MoveDirection
    local v50 = v49.X
    local v51 = v49.Z
    local v52 = Vector3.new(v50, 0, v51)
    if v52 ~= Vector3.new() then
        v52 = v52.Unit
    end
    if v52 == Vector3.new() then
        v_u_9("skipping because 0, 0, 0 movement_direction_heading")
        return v_u_4.None
    else
        local v53 = p48.base.char:FindFirstChild("Head")
        if v53 then
            local v54 = p48.base.root
            local v55 = p48.base.humanoid
            local v56 = v54.Position
            local v57 = v54.Size.Y / 2
            local v58 = v56 - Vector3.new(0, v57, 0)
            local v59 = v52 * v_u_47(p48)
            local v60, v61, v62 = v_u_20(p48, v58, v59)
            v_u_12(v58, v59, v61, "forward")
            if not v60 then
                local v63 = v53.Position
                local v64 = v53.Size.Y / 2
                local v65 = v63 + Vector3.new(0, v64, 0)
                v60, v61, v62 = v_u_20(p48, v65, v59)
                v_u_12(v65, v59, v61, "head")
            end
            v_u_9("hit_forward:", v60)
            if v60 then
                local v66 = v62.Y
                local v67 = math.acos(v66)
                local v68 = math.deg(v67)
                v_u_9("hit_forward_slope_angle:", v68)
                if v68 > 1 and v68 < v55.MaxSlopeAngle then
                    return v_u_4.None
                else
                    local v69 = p48.base.char:FindFirstChild("Head")
                    local v70 = v69.Position.Y + v69.Size.Y / 2
                    local v71 = p48.base.root
                    local v72 = v70 - (v71.Position.Y - v71.Size.Y / 2)
                    local v73 = p48.base.humanoid.HipHeight + v72
                    local v74 = p48.modifier_values_from_performances.jump_height or p48.jump_state.base_jump_height
                    local v75 = v74 + v55.HipHeight - 0.5 + v73
                    local v76 = v54.Position
                    local v77 = v54.Size.Y / 2 + v55.HipHeight
                    local v78 = v76 - Vector3.new(0, v77, 0)
                    local v79 = v78 + Vector3.new(0, 0.2, 0)
                    local v80 = v75 - 0.2
                    local v81 = Vector3.new(0, v80, 0)
                    local v82, v83 = v_u_20(p48, v79, v81)
                    v_u_12(v79, v81, v83, "up")
                    local v84 = v83.Y - v78.Y - v73
                    local v85 = v78 + Vector3.new(0, v84, 0)
                    local v86, v87, v88 = v_u_20(p48, v85, v59)
                    v_u_12(v85, v59, v87, "jump")
                    local v89 = v88.Y
                    local v90 = math.acos(v89)
                    local v91 = math.deg(v90)
                    v_u_9("hit_up:", v82)
                    v_u_9("hit_jump:", v86)
                    v_u_9("hit_jump_slope_angle:", v91)
                    if v86 and (v91 <= 0 or v91 >= v55.MaxSlopeAngle) then
                        return v_u_4.NotJumpable
                    else
                        local v92 = v61.X
                        local v93 = v83.Y - 0.1
                        local v94 = v61.Z
                        local v95, v96 = v_u_20(p48, Vector3.new(v92, v93, v94) + v52 * 0.1, Vector3.new(0, -10, 0))
                        local v97 = v96.Y - v78.Y
                        if v82 and v83.Y - v97 < v73 then
                            return v_u_4.NotJumpable
                        else
                            if v95 and v96.Y >= v61.Y then
                                v74 = v97
                            elseif v82 then
                                v74 = v83.Y - v73 - 0.5
                            end
                            local v98 = (2 * v74 / v_u_6.Gravity) ^ 0.5
                            local v99 = v55.WalkSpeed * v98
                            local v100 = v61 - v54.Position
                            local v101 = v100.X
                            local v102 = v100.Z
                            if Vector3.new(v101, 0, v102).Magnitude < v99 then
                                return v_u_4.Jumpable, v74
                            else
                                return v_u_4.None
                            end
                        end
                    end
                end
            else
                return v_u_4.None
            end
        else
            return v_u_4.None
        end
    end
end
local function v_u_120(p104, _)
    local v105 = p104.move_state
    local v106 = p104.goal_state
    local v107 = p104.base.root.Velocity
    local v108 = v107.X
    local v109 = v107.Z
    local v110 = Vector3.new(v108, 0, v109)
    local v111
    if v110 == Vector3.new() then
        v111 = v110
    else
        v111 = v110.Unit
    end
    local v112 = p104.base.humanoid.MoveDirection
    local v113 = v112.X
    local v114 = v112.Z
    local v115 = Vector3.new(v113, 0, v114)
    if v115 ~= Vector3.new() then
        v115 = v115.Unit
    end
    if v105.is_moving then
        if v106.target then
            local v116 = game.Players.LocalPlayer.Character
            if v116 then
                v116 = v116:FindFirstChild("HumanoidRootPart")
            end
            if not v116 then
                return
            end
            if (v116.Position - p104.base.root.Position).Magnitude < 5 then
                return true, "near owner"
            end
        end
        local v117 = v111:Dot(v115)
        local v118 = math.acos(v117)
        if math.deg(v118) > 5 then
            return false, "bad heading"
        else
            local v119 = p104.base.humanoid.WalkSpeed
            if v110.Magnitude < 1 and v119 > 1 then
                return false, "not moving"
            else
                return true, "default"
            end
        end
    else
        return true, "not suppose to be moving anyways"
    end
end
local function v_u_128(p121, p122)
    local v123 = p121.obstacle_detection
    local v124 = p121.pathfinding
    local v125, v126 = v_u_120(p121, p122)
    if v125 then
        v_u_10("Pet is moving: ", v126)
        v123.last_successful_move_time = tick()
        return v_u_4.None
    else
        v_u_10("Pet not moving:", v126)
        local v127 = tick() - v123.last_successful_move_time
        v_u_10("Last move:", v127, "seconds ago")
        if v127 > 1 then
            if v124.path then
                v_u_10("Reporting Impassable obstacle")
                return v_u_4.Impassable
            else
                v_u_10("Reporting NotJumpable obstacle")
                return v_u_4.NotJumpable
            end
        else
            return v_u_4.None
        end
    end
end
return {
    ["optimization_run_only_for"] = "owned",
    ["step"] = function(p129, p130)
        if p129.client_has_control then
            if p129.is_in_workspace then
                local v131 = p129.obstacle_detection
                local v132 = p129.pathfinding
                local v133 = p129.modifier_values_from_performances
                v131.obstacle_type = v_u_4.None
                v131.obstacle_height = nil
                if p129.mount_state.is_mounted then
                    return
                else
                    local v134 = p129.base.humanoid:GetState() ~= Enum.HumanoidStateType.Swimming
                    v_u_11:DoCleaning()
                    local v135 = v133.shouldnt_avoid_obstacles_by
                    if v134 then
                        if v135.jumping and (v135.pathfinding and v135.teleporting) then
                            return
                        end
                        if v132.path and not v133.ignore_goal_when_teleporting then
                            v131.obstacle_type = v_u_35(p129, p130)
                        else
                            local v136, v137 = v_u_103(p129, p130)
                            v131.obstacle_type = v136
                            v131.obstacle_height = v137
                        end
                    end
                    local v138 = v_u_128(p129, p130)
                    if v138 ~= v_u_4.None then
                        v131.obstacle_type = v138
                        v_u_10("Updating last successful move time: stuck obstacle reported (timeout reset)")
                        v131.last_successful_move_time = tick()
                    end
                end
            else
                return
            end
        else
            return
        end
    end
}