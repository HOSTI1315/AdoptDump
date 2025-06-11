--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.WantsToShowerPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetMovementTarget")
local v_u_3 = v1("Utilities")
local v_u_4 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_5 = v1("SteppedTask")
local v_u_6 = game:GetService("Players")
return {
    ["name"] = script.Name,
    ["validate"] = function(_, p7)
        return v_u_3.does_exist(p7.shower_model)
    end,
    ["init_performance"] = function(_, p8)
        local v9 = p8.shower_model
        local v10 = v_u_2.new({
            ["target"] = v9
        })
        local v11 = v_u_2.new({
            ["target"] = v_u_6.LocalPlayer
        })
        local v12 = {
            ["modifiers_out"] = {},
            ["in_front_of_shower_target"] = v_u_2.from_target_and_follow_distance(v9, 5, {
                ["target_reach_threshold"] = 1
            }),
            ["shower_target"] = v10,
            ["player_target"] = v11,
            ["look_target"] = v10,
            ["modifiers"] = {}
        }
        return v12
    end,
    ["step"] = function(p_u_13, p_u_14, _)
        if p_u_13.base.humanoid.Sit or p_u_13.goal_state.distance_to_owner > 20 then
            return v_u_4.Cancel
        end
        p_u_14.task = p_u_14.task or v_u_5.new(function(p15)
            local v16 = p_u_14.modifiers
            v16.movement_target = p_u_14.in_front_of_shower_target
            v16.eyes_id = "pleading_eyes"
            v16.rotation_target = p_u_14.shower_target
            v16.head_target = p_u_14.shower_target
            v16.looping_sounds = { "PleadingLoop" }
            while not p_u_14.in_front_of_shower_target:has_been_reached(p_u_13) do
                p15:wait_for_step()
            end
            while true do
                v16.rotation_target = p_u_14.shower_target
                v16.head_target = p_u_14.shower_target
                p15:wait(1)
                v16.rotation_target = p_u_14.player_target
                v16.head_target = p_u_14.player_target
                p15:wait(1)
            end
        end)
        return p_u_14.task:step()
    end,
    ["calculate_modifiers"] = function(_, p17, _)
        return p17.modifiers or {}, {}
    end
}