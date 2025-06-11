--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.Teleporter (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ObstacleType")
local v_u_3 = v1("CharWrapperClient")
local v4 = v1("Debug")
local v_u_5 = v1("PetEntityHelper")
local v_u_6 = v4.create_debug_log("should_teleport", false)
local v7 = {}
local function v_u_15(p8)
    if not p8.client_has_control then
        v_u_6("Not teleporting because I don\'t have control")
        return false
    end
    if not p8.is_in_workspace then
        v_u_6("Not teleporting because not in workspace")
        return false
    end
    if p8.base.root.Position.Y <= workspace.FallenPartsDestroyHeight + 50 then
        v_u_6("Teleporting because too close to fallen part destroy height")
        return true
    end
    if p8.base.humanoid.Sit then
        v_u_6("Not teleporting because sitting")
        return false
    end
    if p8.immediate_teleport then
        v_u_6("Teleporting because immediate_teleport = true")
        return true
    end
    local v9 = p8.goal_state
    local v10 = p8.modifier_values_from_performances
    if v10.teleporting_disabled then
        v_u_6("Not teleporting the teleporting_disabled modifier is active")
        return false
    end
    local v11 = v_u_3.get(game.Players.LocalPlayer.Character)
    local v12 = v9.target == nil
    if v12 then
        local v13
        if v11 then
            v13 = v11.char
        else
            v13 = v11
        end
        if v13 then
            v13 = v13:FindFirstChild("Humanoid")
        end
        if v13 then
            v13 = v13.SeatPart
        end
        if v13 and v13:GetAttribute("PetShouldNotTeleport") then
            v_u_6("Not teleporting because the player is seated in a seat that shouldn\'t be teleported to")
            return false
        end
    end
    if not v_u_3.is_in_same_location(p8.base.char_wrapper, v11) then
        v_u_6("Not teleporting because not in same location")
        return false
    end
    if p8.pathfinding.did_path_fail_this_frame then
        v_u_6("Teleporting because pathfinding failed this frame")
        return true
    end
    local v14 = p8.obstacle_detection.obstacle_type
    if v10.shouldnt_avoid_obstacles_by and not v10.shouldnt_avoid_obstacles_by.teleporting then
        if v14 == v_u_2.Impassable then
            v_u_6("Teleporting because obstacle impassable")
            return true
        end
        if v10.shouldnt_avoid_obstacles_by.pathfinding then
            if v14 == v_u_2.NotJumpable then
                v_u_6("Teleporting because pathfinding is disabled but teleporting is not")
                return true
            end
            if v10.shouldnt_avoid_obstacles_by.jumping and v14 == v_u_2.Jumpable then
                v_u_6("Teleporting because jumping and pathfinding are disabled but teleporting is not")
                return true
            end
        end
    end
    if not v9.goal_position then
        v_u_6("Not teleporting because there is no goal position")
        return false
    end
    if not v12 or ((p8.base.root.Position - v9.goal_position) * Vector3.new(1, 0, 1)).Magnitude < 128 then
        return false
    end
    v_u_6("Teleporting because we are following the owner and we are not close to the owner")
    return true
end
v7.optimization_run_only_for = "owned"
function v7.step(p16)
    if v_u_15(p16) then
        local v17 = p16.goal_state
        local v18 = p16.pathfinding
        local v19 = p16.modifier_values_from_performances
        local v20
        if (v18.path or v17.target) and (v17.goal_position and not v19.ignore_goal_when_teleporting) then
            v20 = v17.goal_position + Vector3.new(0, 3, 0)
        else
            local v21 = game.Players.LocalPlayer.Character
            local v22
            if v21 then
                v22 = v21:FindFirstChild("HumanoidRootPart")
            else
                v22 = v21
            end
            if not (v21 and v22) then
                return
            end
            v20 = v_u_5.get_teleport_location(p16.base.char, v22.CFrame)
        end
        v_u_6("Teleporting pet...")
        local v23 = p16.base.root.CFrame - p16.base.root.Position
        p16.base.root.CFrame = CFrame.new(v20) * v23
        p16.base.root.Velocity = Vector3.new(0, 0, 0)
        p16.immediate_teleport = false
        if v18.path then
            v18.path:next()
        end
    end
end
return v7