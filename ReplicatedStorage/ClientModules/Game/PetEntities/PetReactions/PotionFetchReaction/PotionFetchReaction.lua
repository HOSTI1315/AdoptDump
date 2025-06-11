--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.PotionFetchReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_3 = v1("InterestScore")
v1("ModifierPriority")
local v_u_4 = v1("PetPerformanceName")
local v_u_5 = v1("Utilities")
local v_u_6 = v1("SteppedTask")
local v_u_7 = v1("SteppedTaskUtils")
local v_u_8 = v1("PetEntityHelper")
local v_u_9 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v10 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_11 = v1("InventoryDB")
local v_u_12 = v1("PetPotionEffectsDB")
local v_u_33 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v2.ThrowToy },
    ["allowed_exclusive_states"] = { v10.Sitting, v10.Carried, v10.Swimming },
    ["calculate_score"] = function(p13, p14)
        local v15 = p14:FindFirstChild("OwnerPlayer")
        if (v15 and v15.Value or nil) == p13.base.char_wrapper.entity_controller then
            local v16 = p13.short_term_reaction_memory[p14]
            if v16 and v16.did_fetch then
                return v_u_3.NeverInterested
            else
                local v17 = p14:FindFirstChild("ItemKind")
                if v17 then
                    v17 = v17.Value
                end
                local v18
                if v17 then
                    v18 = v_u_11.food[v17]
                else
                    v18 = v17
                end
                if v18 and v_u_12[v17] ~= nil then
                    return v_u_3.GameplayCritical
                else
                    return v_u_3.NeverInterested
                end
            end
        else
            return v_u_3.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_3.GameplayCritical
    end,
    ["init_reaction"] = function(p19, p_u_20)
        local v21 = {
            ["object_model"] = p_u_20.stimulus,
            ["score"] = p_u_20.score
        }
        local v22 = {
            ["did_fetch"] = true,
            ["should_cleanup"] = function()
                if not v_u_5.does_exist(p_u_20.stimulus) then
                    return true
                end
            end
        }
        p19.short_term_reaction_memory[p_u_20.stimulus] = v22
        local v23 = p_u_20.stimulus:FindFirstChild("ItemKind")
        if v23 then
            v23 = v23.Value
        end
        if v23 == "pet_age_potion" then
            v21.eye_color = Color3.fromRGB(172, 143, 71)
        end
        return v21
    end,
    ["step"] = function(p_u_24, p_u_25)
        if not v_u_5.does_exist(p_u_25.object_model) then
            return v_u_9.Cancel
        end
        p_u_25.task = p_u_25.task or v_u_6.new(function(p26)
            local v27 = v_u_7.run_performance
            local v28 = p_u_24
            local v29 = {
                ["name"] = v_u_4.NoticeObject,
                ["manager_reaction_name"] = v_u_33.name,
                ["options"] = {
                    ["object"] = p_u_25.object_model,
                    ["eyes_on_notice"] = "heart_eyes",
                    ["eye_color_on_notice"] = p_u_25.eye_color,
                    ["effects_on_notice"] = { "surprised" },
                    ["sounds_on_notice"] = { "FriendshipEyes" },
                    ["acknowledgement_time"] = 3.5
                }
            }
            v27(p26, v28, v29)
            local v30 = v_u_7.run_performance
            local v31 = p_u_24
            local v32 = {
                ["name"] = v_u_4.FetchThrowtoy,
                ["manager_reaction_name"] = v_u_33.name,
                ["options"] = {
                    ["object_model"] = p_u_25.object_model,
                    ["grab_by_attachment"] = "Grab"
                }
            }
            v30(p26, v31, v32)
            v_u_8.stage_performance(p_u_24, {
                ["name"] = v_u_4.HappyHop
            })
            return v_u_9.Complete
        end)
        return p_u_25.task:step()
    end
}
return v_u_33