--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.CelestialPetReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v4 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_5 = v1("PetPerformanceName")
local v_u_6 = v1("SteppedTaskUtils")
local v_u_7 = v1("InterestScore")
local v_u_8 = v1("SteppedTask")
local v_u_9 = game:GetService("Workspace")
local v_u_24 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v4.CelestialPet },
    ["allowed_exclusive_states"] = {
        v2.Sitting,
        v2.Carried,
        v2.Mounted,
        v2.Swimming,
        v2.FollowingPresetPath
    },
    ["calculate_score"] = function(p10, p11)
        local v12 = p10.base.root.Position
        local v13 = p11.PrimaryPart.Position
        if p11:IsDescendantOf(v_u_9) and (v12 - v13).magnitude <= 20 then
            return v_u_7.Effect
        else
            return v_u_7.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_7.InformationPersistent
    end,
    ["init_reaction"] = function(_, p14)
        return {
            ["other_pet"] = p14.stimulus,
            ["score"] = p14.score
        }
    end,
    ["step"] = function(p_u_15, p_u_16)
        p_u_16.task = p_u_16.task or v_u_8.new(function(p17)
            local v18 = v_u_6.run_performance
            local v19 = p_u_15
            local v20 = {
                ["name"] = v_u_5.NoticeObject,
                ["manager_reaction_name"] = v_u_24.name,
                ["options"] = {
                    ["object"] = p_u_16.other_pet,
                    ["eyes_on_notice"] = "wide_open_eyes",
                    ["effects_on_notice"] = { "surprised" },
                    ["mute_sounds"] = true,
                    ["acknowledgement_time"] = 0.9
                }
            }
            v18(p17, v19, v20)
            local v21 = v_u_6.run_performance
            local v22 = p_u_15
            local v23 = {
                ["name"] = v_u_5.CelestialPet,
                ["manager_reaction_name"] = v_u_24.name,
                ["options"] = {
                    ["other_pet"] = p_u_16.other_pet
                }
            }
            v21(p17, v22, v23)
            return v_u_3.Complete
        end)
        return p_u_16.task:step()
    end
}
return v_u_24