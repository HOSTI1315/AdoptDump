--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.ChewToyReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_3 = v1("InterestScore")
local v_u_4 = v1("PetPerformanceName")
local v_u_5 = v1("Utilities")
local v_u_6 = v1("SteppedTask")
local v_u_7 = v1("SteppedTaskUtils")
local v_u_8 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v9 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_10 = v1("InventoryDB")
local v_u_11 = v1("PetObjectHelper")
local v_u_31 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v2.ThrowToy },
    ["allowed_exclusive_states"] = { v9.Navigating },
    ["calculate_score"] = function(p12, p13)
        if p12.base.entry.is_egg then
            return v_u_3.NeverInterested
        else
            local v14 = p12.short_term_reaction_memory
            local v15 = p13:FindFirstChild("ItemKind")
            if v15 then
                v15 = v15.Value
            end
            if v15 then
                v15 = v_u_10.toys[v15]
            end
            if v15 and v15.tool == "ChewToyTool" then
                if v_u_11.can_pet_chase_item(p12, p13) then
                    local v16 = v14[p13]
                    if v16 and v16.did_fetch then
                        return v_u_3.NeverInterested
                    elseif p12.ailments.play then
                        return v_u_3.GameplayCritical
                    else
                        return v_u_3.Gameplay
                    end
                else
                    return v_u_3.NeverInterested
                end
            else
                return v_u_3.NeverInterested
            end
        end
    end,
    ["calculate_threshold"] = function(p17, _)
        if p17.ailments.play then
            return v_u_3.GameplayCritical
        else
            return v_u_3.Gameplay
        end
    end,
    ["init_reaction"] = function(p18, p_u_19)
        local v20 = {
            ["object_model"] = p_u_19.stimulus,
            ["score"] = p_u_19.score
        }
        local v21 = {
            ["did_fetch"] = true,
            ["should_cleanup"] = function()
                if not v_u_5.does_exist(p_u_19.stimulus) then
                    return true
                end
            end
        }
        p18.short_term_reaction_memory[p_u_19.stimulus] = v21
        return v20
    end,
    ["step"] = function(p_u_22, p_u_23)
        if not v_u_5.does_exist(p_u_23.object_model) then
            return v_u_8.Cancel
        end
        p_u_23.task = p_u_23.task or v_u_6.new(function(p24)
            local v25 = v_u_7.run_performance
            local v26 = p_u_22
            local v27 = {
                ["name"] = v_u_4.NoticeObject,
                ["manager_reaction_name"] = v_u_31.name,
                ["options"] = {
                    ["object"] = p_u_23.object_model,
                    ["eyes_on_notice"] = "wide_open_eyes",
                    ["effects_on_notice"] = { "surprised" },
                    ["acknowledgement_time"] = 0.6
                }
            }
            v25(p24, v26, v27)
            local v28 = v_u_7.run_performance
            local v29 = p_u_22
            local v30 = {
                ["name"] = v_u_4.FetchChewtoy,
                ["manager_reaction_name"] = v_u_31.name,
                ["options"] = {
                    ["object_model"] = p_u_23.object_model
                }
            }
            v28(p24, v29, v30)
            return v_u_8.Complete
        end)
        return p_u_23.task:step()
    end
}
return v_u_31