--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.EatReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v4 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_5 = v1("InterestScore")
local v_u_6 = v1("PetPerformanceName")
local v_u_7 = v1("Utilities")
local v_u_8 = v1("PetPotionEffectsDB")
local v_u_9 = v1("InventoryDB")
local v_u_10 = v1("SteppedTask")
local v_u_11 = v1("SteppedTaskUtils")
local v_u_12 = v1("PetEntityHelper")
local v_u_13 = v1("ModifierPriority")
local v_u_14 = v1("PetObjectHelper")
local v_u_35 = {
    ["name"] = script.Name,
    ["exclusive_state"] = v4.Eating,
    ["trigger_stimuli"] = { v2.Food },
    ["allowed_exclusive_states"] = {
        v4.Sitting,
        v4.Carried,
        v4.Focused,
        v4.Navigating
    },
    ["calculate_score"] = function(p15, p16)
        local v17 = p15.short_term_reaction_memory
        if v_u_14.item_belongs_to_pet(p15, p16) then
            local v18 = v17[p16]
            if v18 and v18.did_eat then
                return v_u_5.NeverInterested
            else
                return v_u_5.GameplayCritical
            end
        else
            return v_u_5.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_5.GameplayCritical
    end,
    ["init_reaction"] = function(p19, p_u_20)
        local v21 = p_u_20.stimulus:FindFirstChild("ItemKind").Value
        local v22 = v_u_8[v21] ~= nil
        local v23 = v_u_9.food[v21]
        local v24 = {
            ["object_model"] = p_u_20.stimulus,
            ["is_potion"] = v22,
            ["score"] = p_u_20.score,
            ["is_drink"] = v22 or v23.ailment_to_boost == "thirsty"
        }
        local v25 = {
            ["did_eat"] = false,
            ["should_cleanup"] = function()
                return not v_u_7.does_exist(p_u_20.stimulus)
            end
        }
        p19.short_term_reaction_memory[p_u_20.stimulus] = v25
        v24.memory = v25
        return v24
    end,
    ["step"] = function(p_u_26, p_u_27)
        if not v_u_7.does_exist(p_u_27.object_model) then
            return v_u_3.Cancel
        end
        local v_u_28 = p_u_27.object_model
        local v_u_29 = p_u_27.is_potion
        local v_u_30 = p_u_26.base.entry.is_food_grabber
        p_u_27.task = p_u_27.task or v_u_10.new(function(p31)
            local v32 = v_u_11.run_performance
            local v33 = p_u_26
            local v34 = {
                ["name"] = v_u_6.NoticeObject,
                ["manager_reaction_name"] = v_u_35.name,
                ["options"] = {
                    ["object"] = v_u_28,
                    ["eyes_on_notice"] = v_u_29 and "wide_open_eyes" or "heart_eyes",
                    ["effects_on_notice"] = v_u_29 and { "question_mark" } or { "surprised" },
                    ["acknowledgement_time"] = v_u_30 and 0.4 or (v_u_29 and 1.5 or 0.9),
                    ["do_not_turn_to_face_target"] = v_u_30
                }
            }
            v32(p31, v33, v34)
            v_u_11.run_performance(p31, p_u_26, {
                ["name"] = v_u_6.Eat,
                ["manager_reaction_name"] = v_u_35.name,
                ["options"] = {
                    ["object_model"] = v_u_28
                }
            })
            p_u_27.memory.did_eat = true
            v_u_12.stage_performance(p_u_26, {
                ["name"] = v_u_6.EyesProvider,
                ["options"] = {
                    ["eyes_id"] = "happy_eyes",
                    ["duration"] = 3,
                    ["priority"] = v_u_13.Lower
                }
            })
            return v_u_3.Complete
        end)
        return p_u_27.task:step()
    end
}
return v_u_35