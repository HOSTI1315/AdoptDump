--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.FollowPresetPathReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("SteppedTask")
local v_u_5 = v1("SteppedTaskUtils")
local v_u_6 = v1("package:Promise")
local v7 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_15 = {
    ["name"] = script.Name,
    ["exclusive_state"] = v7.FollowingPresetPath,
    ["allowed_exclusive_states"] = {
        v7.Sitting,
        v7.Carried,
        v7.Mounted,
        v7.Swimming
    },
    ["init_reaction"] = function(_, p8)
        return {
            ["path"] = p8.path,
            ["finish_use_callback"] = p8.finish_use_callback
        }
    end,
    ["step"] = function(p_u_9, p_u_10)
        p_u_10.task = p_u_10.task or v_u_4.new(function(p11)
            local v12 = v_u_5.run_performance
            local v13 = p_u_9
            local v14 = {
                ["name"] = v_u_3.FollowPresetPath,
                ["manager_reaction_name"] = v_u_15.name,
                ["options"] = {
                    ["path"] = p_u_10.path,
                    ["disable_obstacle_detection_proximity"] = 10
                }
            }
            v12(p11, v13, v14)
            v_u_6.try(p_u_10.finish_use_callback)
            return v_u_2.Complete
        end)
        return p_u_10.task:step()
    end
}
return v_u_15