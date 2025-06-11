--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.FireHydrantReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetPerformanceName")
local v3 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_4 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_5 = v1("InterestScore")
local v_u_6 = v1("SteppedTask")
local v_u_7 = v1("SteppedTaskUtils")
local v_u_8 = game:GetService("CollectionService")
local function v_u_15(p9)
    local v10 = game.Players.LocalPlayer.Character
    if v10 then
        v10 = v10:FindFirstChild("HumanoidRootPart")
    end
    if not v10 then
        return nil
    end
    local v11 = p9.Position
    local v12 = v10.Position
    for _, v13 in v_u_8:GetTagged("FireHydrant") do
        local v14 = v13:GetPivot().Position
        if (v11 - v14).Magnitude < 15 and (v12 - v14).Magnitude < 20 then
            return v13
        end
    end
    return nil
end
local v_u_30 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v3.Ailment },
    ["calculate_score"] = function(p16, _)
        if p16.base.entry.is_doll then
            return v_u_5.NeverInterested
        else
            local v17 = v_u_15(p16.base.root) ~= nil
            local v18 = p16.goal_state.distance_to_owner < 20
            if p16.base.humanoid.Sit or not (v18 and v17) then
                return v_u_5.NeverInterested
            else
                return v_u_5.Gameplay
            end
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_5.GameplayCritical
    end,
    ["init_reaction"] = function(p19, _)
        return {
            ["fire_hydrant_model"] = v_u_15(p19.base.root)
        }
    end,
    ["step"] = function(p_u_20, p_u_21)
        if not p_u_21.fire_hydrant_model:IsDescendantOf(game) then
            return v_u_4.Cancel
        end
        if not p_u_20.ailments.toilet then
            return v_u_4.Complete
        end
        p_u_21.task = p_u_21.task or v_u_6.new(function(p22)
            local function v23()
                return p_u_20.goal_state.distance_to_owner > 20
            end
            local v24 = v_u_7.run_performance
            local v25 = p_u_20
            local v26 = {
                ["name"] = v_u_2.NoticeObject,
                ["manager_reaction_name"] = v_u_30.name,
                ["should_end_performance"] = v23,
                ["options"] = {
                    ["object"] = p_u_21.fire_hydrant_model,
                    ["eyes_on_notice"] = "wide_open_eyes",
                    ["effects_on_notice"] = { "surprised" },
                    ["notice_delay_time"] = 0,
                    ["acknowledgement_time"] = 0.6
                }
            }
            v24(p22, v25, v26)
            p_u_20.sounds.play_sound("FetchingRunStart")
            local v27 = v_u_7.run_performance
            local v28 = p_u_20
            local v29 = {
                ["name"] = v_u_2.FireHydrant,
                ["manager_reaction_name"] = v_u_30.name,
                ["should_end_performance"] = v23,
                ["options"] = {
                    ["fire_hydrant_model"] = p_u_21.fire_hydrant_model
                }
            }
            v27(p22, v28, v29)
            return v_u_4.Complete
        end)
        return p_u_21.task:step()
    end
}
return v_u_30