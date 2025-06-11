--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.ExcitedToShowerReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetPerformanceName")
local v3 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_4 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_5 = v1("InterestScore")
local v_u_6 = v1("SteppedTask")
local v_u_7 = v1("SteppedTaskUtils")
local v_u_8 = game:GetService("CollectionService")
local function v_u_12(p9)
    local v10 = v_u_8:GetTagged("ShowerFurniture")
    for _, v11 in pairs(v10) do
        if (p9.Position - v11.PrimaryPart.Position).magnitude < 12 then
            return v11
        end
    end
end
local v_u_28 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v3.Ailment },
    ["calculate_score"] = function(p13, _)
        local v14 = v_u_12(p13.base.root) ~= nil
        local v15 = p13.goal_state.distance_to_owner < 10
        if p13.base.humanoid.Sit or not (v15 and v14) then
            return v_u_5.NeverInterested
        else
            return v_u_5.Anticipate
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_5.Gameplay
    end,
    ["init_reaction"] = function(p16, p17)
        return {
            ["score"] = p17.score,
            ["shower_model"] = v_u_12(p16.base.root)
        }
    end,
    ["step"] = function(p_u_18, p_u_19)
        if not p_u_19.shower_model:IsDescendantOf(game) then
            return v_u_4.Cancel
        end
        p_u_19.task = p_u_19.task or v_u_6.new(function(p20)
            local function v21()
                return not p_u_18.ailments.dirty
            end
            local v22 = v_u_7.run_performance
            local v23 = p_u_18
            local v24 = {
                ["name"] = v_u_2.NoticeObject,
                ["manager_reaction_name"] = v_u_28.name,
                ["should_end_performance"] = v21,
                ["options"] = {
                    ["object"] = p_u_19.shower_model,
                    ["eyes_on_notice"] = "pleading_eyes",
                    ["effects_on_notice"] = { "surprised" },
                    ["notice_delay_time"] = 0.5,
                    ["acknowledgement_time"] = 1.5,
                    ["should_jump_on_notice"] = true
                }
            }
            v22(p20, v23, v24)
            local v25 = v_u_7.run_performance
            local v26 = p_u_18
            local v27 = {
                ["name"] = v_u_2.WantsToShower,
                ["manager_reaction_name"] = v_u_28.name,
                ["should_end_performance"] = v21,
                ["options"] = {
                    ["shower_model"] = p_u_19.shower_model
                }
            }
            v25(p20, v26, v27)
            return v_u_4.Complete
        end)
        return p_u_19.task:step()
    end
}
return v_u_28