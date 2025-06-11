--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.ThrowToyReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_3 = v1("InterestScore")
local v_u_4 = v1("ModifierPriority")
local v_u_5 = v1("PetPerformanceName")
local v_u_6 = v1("Utilities")
local v_u_7 = v1("SteppedTask")
local v_u_8 = v1("SteppedTaskUtils")
local v_u_9 = v1("PetEntityHelper")
local v_u_10 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v11 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_12 = v1("InventoryDB")
local v_u_13 = v1("PetObjectHelper")
local v_u_36 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v2.ThrowToy },
    ["allowed_exclusive_states"] = { v11.Swimming, v11.Navigating },
    ["calculate_score"] = function(p14, p15)
        if p14.base.entry.is_egg then
            return v_u_3.NeverInterested
        else
            local v16 = p14.short_term_reaction_memory
            local v17 = p15:FindFirstChild("ItemKind")
            if v17 then
                v17 = v17.Value
            end
            if v17 then
                v17 = v_u_12.toys[v17]
            end
            if v17 and v17.tool ~= "ChewToyTool" then
                if v_u_13.can_pet_chase_item(p14, p15) then
                    local v18 = v16[p15]
                    if v18 and v18.did_fetch then
                        return v_u_3.NeverInterested
                    elseif p14.ailments.play then
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
    ["calculate_threshold"] = function(p19, _)
        if p19.ailments.play then
            return v_u_3.GameplayCritical
        else
            return v_u_3.Gameplay
        end
    end,
    ["init_reaction"] = function(p20, p_u_21)
        local v22 = {
            ["object_model"] = p_u_21.stimulus,
            ["score"] = p_u_21.score
        }
        local v23 = {
            ["did_fetch"] = true,
            ["should_cleanup"] = function()
                if not v_u_6.does_exist(p_u_21.stimulus) then
                    return true
                end
            end
        }
        p20.short_term_reaction_memory[p_u_21.stimulus] = v23
        return v22
    end,
    ["step"] = function(p_u_24, p_u_25)
        if not v_u_6.does_exist(p_u_25.object_model) then
            return v_u_10.Cancel
        end
        p_u_25.task = p_u_25.task or v_u_7.new(function(p26)
            local v27 = v_u_8.run_performance
            local v28 = p_u_24
            local v29 = {
                ["name"] = v_u_5.NoticeObject,
                ["manager_reaction_name"] = v_u_36.name,
                ["options"] = {
                    ["object"] = p_u_25.object_model,
                    ["eyes_on_notice"] = "wide_open_eyes",
                    ["effects_on_notice"] = { "surprised" },
                    ["acknowledgement_time"] = 0.6
                }
            }
            v27(p26, v28, v29)
            local v30 = v_u_8.run_performance
            local v31 = p_u_24
            local v32 = {
                ["name"] = v_u_5.FetchThrowtoy,
                ["manager_reaction_name"] = v_u_36.name,
                ["options"] = {
                    ["object_model"] = p_u_25.object_model
                }
            }
            v30(p26, v31, v32)
            local v33 = v_u_9.stage_performance
            local v34 = p_u_24
            local v35 = {
                ["name"] = v_u_5.EyesProvider,
                ["options"] = {
                    ["eyes_id"] = "happy_eyes",
                    ["duration"] = 3,
                    ["priority"] = v_u_4.Lower
                }
            }
            v33(v34, v35)
            return v_u_10.Complete
        end)
        return p_u_25.task:step()
    end
}
return v_u_36