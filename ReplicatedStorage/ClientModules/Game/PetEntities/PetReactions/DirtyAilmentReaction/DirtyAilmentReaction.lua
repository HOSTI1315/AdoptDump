--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.DirtyAilmentReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InterestScore")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("SteppedTask")
local v_u_5 = v1("SteppedTaskUtils")
local v_u_6 = v1("PetEntityHelper")
local v_u_7 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v8 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_12 = {
    ["name"] = script.Name,
    ["allowed_exclusive_states"] = { v8.Sitting, v8.Carried },
    ["calculate_score"] = function(_)
        return v_u_2.Information
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_2.Anticipate
    end,
    ["step"] = function(p_u_9, p10)
        p10.task = p10.task or v_u_4.new(function(p11)
            v_u_5.run_performance(p11, p_u_9, {
                ["name"] = v_u_3.TransitionDirty,
                ["manager_reaction_name"] = v_u_12.name
            })
            v_u_6.stage_performance(p_u_9, {
                ["name"] = v_u_3.Dirty
            })
            return v_u_7.Complete
        end)
        return p10.task:step()
    end
}
return v_u_12