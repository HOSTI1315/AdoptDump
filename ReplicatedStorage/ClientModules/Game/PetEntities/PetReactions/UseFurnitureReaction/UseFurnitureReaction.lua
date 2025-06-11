--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.UseFurnitureReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_3 = v1("InterestScore")
local v4 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_5 = v1("AdoptMeEnums/PetEntities/PetCommandType")
local v_u_6 = v1("package:Promise")
return {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v4.Command },
    ["calculate_score"] = function(_, p7)
        if p7.pet_command_type == v_u_5.UseFurniture then
            return v_u_3.GameplayCritical
        else
            return v_u_3.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_3.Anticipate
    end,
    ["init_reaction"] = function(_, p8)
        local v9 = p8.stimulus
        local v10 = {
            ["use_furniture_callback"] = v9.options.use_furniture_callback,
            ["score"] = p8.score
        }
        v9:acknowledge()
        return v10
    end,
    ["step"] = function(_, p11)
        v_u_6.try(p11.use_furniture_callback)
        return v_u_2.Complete
    end
}