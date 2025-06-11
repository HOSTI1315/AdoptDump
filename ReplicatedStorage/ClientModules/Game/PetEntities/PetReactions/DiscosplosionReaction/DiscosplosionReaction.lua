--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.DiscosplosionReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_4 = v1("InterestScore")
local v_u_5 = v1("PetPerformanceName")
local v_u_6 = v1("SteppedTask")
local v_u_7 = v1("SteppedTaskUtils")
local v8 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_9 = game:GetService("Workspace")
local v_u_21 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v2.Discosplosion },
    ["allowed_exclusive_states"] = { v8.Mounted },
    ["calculate_score"] = function(_, p10)
        if p10:IsDescendantOf(v_u_9) then
            return v_u_4.Anticipate
        else
            return v_u_4.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_4.Gameplay
    end,
    ["init_reaction"] = function(_, p11)
        return {
            ["discosplosion"] = p11.stimulus,
            ["score"] = p11.score
        }
    end,
    ["step"] = function(p_u_12, p_u_13)
        p_u_13.task = p_u_13.task or v_u_6.new(function(p14)
            local v15 = v_u_7.run_performance
            local v16 = p_u_12
            local v17 = {
                ["name"] = v_u_5.NoticeObject,
                ["manager_reaction_name"] = v_u_21.name,
                ["options"] = {
                    ["object"] = p_u_13.discosplosion,
                    ["eyes_on_notice"] = "wide_open_eyes",
                    ["effects_on_notice"] = { "surprised" },
                    ["acknowledgement_time"] = 0.9
                }
            }
            v15(p14, v16, v17)
            local v18 = v_u_7.run_performance
            local v19 = p_u_12
            local v20 = {
                ["name"] = v_u_5.Discosplosion,
                ["manager_reaction_name"] = v_u_21.name,
                ["options"] = {
                    ["discosplosion"] = p_u_13.discosplosion
                }
            }
            v18(p14, v19, v20)
            return v_u_3.Complete
        end)
        return p_u_13.task:step()
    end
}
return v_u_21