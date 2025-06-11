--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.AnticipateFoodReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v4 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_5 = v1("InterestScore")
local v_u_6 = v1("PetPerformanceName")
local v_u_7 = v1("SteppedTask")
local v_u_8 = v1("SteppedTaskUtils")
local v_u_9 = v1("InventoryDB")
local v_u_10 = v1("PetPotionEffectsDB")
local v_u_11 = v1("Utilities")
local v_u_12 = game:GetService("Players")
local v_u_60 = {
    ["name"] = script.Name,
    ["trigger_stimuli"] = { v4.EquippedItem },
    ["allowed_exclusive_states"] = { v3.Carried, v3.Swimming },
    ["calculate_score"] = function(p13, p14)
        local v15 = v_u_9.food[p14.id]
        if v15 and v15.ailment_to_boost ~= nil and true or v_u_10[p14.id] ~= nil then
            if p14.id == "pet_age_potion" and (p13.base.char_wrapper.pet_progression.age or 0) >= 6 then
                return v_u_5.NeverInterested
            else
                return v_u_5.Anticipate
            end
        else
            return v_u_5.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(p16, p17)
        if p17.is_potion or (p16.ailments.hungry or p16.ailments.thirsty) then
            return v_u_5.GameplayCritical
        else
            return v_u_5.Gameplay
        end
    end,
    ["init_reaction"] = function(p18, p19)
        local v20 = v_u_12.LocalPlayer.Character
        if v20 then
            v20 = v20:FindFirstChildOfClass("Tool")
        end
        if v20 then
            v20 = v20:FindFirstChild("LeftMount", true) or v20:FindFirstChild("RightMount", true)
        end
        local v21 = p18.base.entry.is_doll
        local v22 = p18.base.entry.is_egg
        local v23 = p19.stimulus
        local v24 = v23.id
        local v25 = v_u_10[v24] ~= nil
        local v26 = v_u_9.food[v24]
        local v27 = true
        if v26 then
            local v28 = v26.cannot_feed_to_egg
            local v29 = v26.cannot_feed_to_doll
            if v22 and v28 then
                v27 = false
            elseif v21 and v29 then
                v27 = false
            end
        end
        local v30 = v_u_9.food[v23.id]
        local v31 = {
            ["score"] = p19.score,
            ["food_object"] = v20,
            ["is_potion"] = v25
        }
        if not v25 then
            if v30 then
                v25 = v30.ailment_to_boost == "thirsty"
            else
                v25 = false
            end
        end
        v31.is_drink = v25
        v31.can_be_consumed = v27
        return v31
    end,
    ["can_plead"] = function(p32, p33)
        local v34 = p33.is_potion
        local v35 = p32.ailments.hungry ~= nil
        local v36 = p32.ailments.thirsty ~= nil
        local v37 = not p33.can_be_consumed or (v34 or v35 and not p33.is_drink)
        if v37 then
            v36 = v37
        elseif v36 then
            v36 = p33.is_drink
        end
        return v36
    end,
    ["step"] = function(p_u_38, p_u_39)
        if not v_u_11.does_exist(p_u_39.food_object) then
            return v_u_2.Cancel
        end
        local v_u_40 = p_u_39.is_potion
        local v_u_41 = p_u_39.food_object
        p_u_39.task = p_u_39.task or v_u_7.new(function(p42)
            if v_u_60.can_plead(p_u_38, p_u_39) then
                local function v43()
                    return not v_u_60.can_plead(p_u_38, p_u_39)
                end
                p42:wait(0.5)
                if v_u_40 then
                    local v44 = v_u_8.run_performance
                    local v45 = p_u_38
                    local v46 = {
                        ["name"] = v_u_6.NoticeObject,
                        ["manager_reaction_name"] = v_u_60.name,
                        ["should_end_performance"] = v43,
                        ["options"] = {
                            ["object"] = v_u_41,
                            ["eyes_on_notice"] = "wide_open_eyes",
                            ["effects_on_notice"] = { "question_mark" },
                            ["sounds_on_notice"] = { "ItemQuestionMark" },
                            ["acknowledgement_time"] = 1.25,
                            ["notice_delay_time"] = 0
                        }
                    }
                    v44(p42, v45, v46)
                    local v47 = v_u_8.run_performance
                    local v48 = p_u_38
                    local v49 = {
                        ["name"] = v_u_6.AnticipateObject,
                        ["manager_reaction_name"] = v_u_60.name,
                        ["should_end_performance"] = v43,
                        ["options"] = {
                            ["object"] = v_u_41,
                            ["distance"] = 6,
                            ["eyes_id"] = "tiny_eyes",
                            ["effects"] = { "sweatdrop" },
                            ["looping_sounds"] = { "SweatdropLoop" }
                        }
                    }
                    v47(p42, v48, v49)
                else
                    local v50 = v_u_8.run_performance
                    local v51 = p_u_38
                    local v52 = {
                        ["name"] = v_u_6.NoticeObject,
                        ["manager_reaction_name"] = v_u_60.name,
                        ["should_end_performance"] = v43,
                        ["options"] = {
                            ["object"] = v_u_41,
                            ["eyes_on_notice"] = "heart_eyes",
                            ["effects_on_notice"] = { "surprised" },
                            ["acknowledgement_time"] = 0.8,
                            ["notice_delay_time"] = 0
                        }
                    }
                    v50(p42, v51, v52)
                    local v53 = v_u_8.run_performance
                    local v54 = p_u_38
                    local v55 = {
                        ["name"] = v_u_6.AnticipateObject,
                        ["manager_reaction_name"] = v_u_60.name,
                        ["should_end_performance"] = v43,
                        ["options"] = {
                            ["object"] = v_u_41,
                            ["distance"] = 4.5,
                            ["eyes_id"] = "pleading_eyes",
                            ["looping_sounds"] = { "PleadingLoop" },
                            ["allow_sit_states"] = true
                        }
                    }
                    v53(p42, v54, v55)
                end
            else
                local function v56()
                    return v_u_60.can_plead(p_u_38, p_u_39)
                end
                p42:wait(1)
                local v57 = v_u_8.run_performance
                local v58 = p_u_38
                local v59 = {
                    ["name"] = v_u_6.LookAtObject,
                    ["manager_reaction_name"] = v_u_60.name,
                    ["should_end_performance"] = v56,
                    ["options"] = {
                        ["object"] = v_u_41
                    }
                }
                v57(p42, v58, v59)
            end
            p_u_39.task = nil
        end)
        return p_u_39.task:step()
    end
}
return v_u_60