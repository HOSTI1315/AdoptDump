--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.CompletedDirtyAilmentReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PetCommandType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v4 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_5 = v1("InterestScore")
local v_u_6 = v1("PetPerformanceName")
local v_u_7 = v1("SteppedTask")
local v_u_8 = v1("SteppedTaskUtils")
local v9 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_15 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v9.Command },
    ["allowed_exclusive_states"] = { v4.Sitting, v4.Carried },
    ["calculate_score"] = function(_, p10)
        if p10.pet_command_type == v_u_2.CompleteAilment and p10.options.ailment_id == "dirty" then
            return v_u_5.Information
        else
            return v_u_5.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_5.Anticipate
    end,
    ["init_reaction"] = function(_, p11)
        p11.stimulus:acknowledge()
        return {
            ["score"] = p11.score
        }
    end,
    ["step"] = function(p_u_12, p13)
        p13.task = p13.task or v_u_7.new(function(p14)
            v_u_8.run_performance(p14, p_u_12, {
                ["name"] = v_u_6.Clean,
                ["manager_reaction_name"] = v_u_15.name
            })
            return v_u_3.Complete
        end)
        return p13.task:step()
    end
}
return v_u_15