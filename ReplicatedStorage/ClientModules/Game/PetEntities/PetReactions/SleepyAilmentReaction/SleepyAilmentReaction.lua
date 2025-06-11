--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.SleepyAilmentReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InterestScore")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("SteppedTask")
local v_u_5 = v1("SteppedTaskUtils")
local v_u_6 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v7 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_8 = v1("WeatherClient")
local v_u_9 = {
    ["generic_water_bowl"] = true,
    ["generic_food_bowl"] = true,
    ["generic_shower"] = true
}
local v_u_20 = {
    ["name"] = script.Name,
    ["allowed_exclusive_states"] = { v7.Sitting, v7.Carried },
    ["validate_pet"] = function(p10)
        local v11 = not p10.mount_state.is_mounted
        if v11 then
            v11 = not v_u_9[p10.current_furniture_use_id]
        end
        return v11
    end,
    ["calculate_score"] = function(_, _)
        return v_u_2.InformationPersistent
    end,
    ["calculate_threshold"] = function(_, p12)
        if p12.went_into_deep_sleep then
            return v_u_2.Gameplay
        else
            return v_u_2.Information
        end
    end,
    ["init_reaction"] = function(_, _)
        return {
            ["went_into_deep_sleep"] = false
        }
    end,
    ["step"] = function(p_u_13, p_u_14)
        if v_u_9[p_u_13.current_furniture_use_id] then
            return v_u_6.Cancel
        end
        if v_u_8.get_time_of_day() == "DAY" then
            return v_u_6.Cancel
        end
        p_u_14.task = p_u_14.task or v_u_4.new(function(p15)
            v_u_5.run_performance(p15, p_u_13, {
                ["name"] = v_u_3.WaitForIdling,
                ["manager_reaction_name"] = v_u_20.name,
                ["options"] = {
                    ["duration"] = math.random(2, 8)
                }
            })
            v_u_5.run_performance(p15, p_u_13, {
                ["name"] = v_u_3.FallAsleep,
                ["manager_reaction_name"] = v_u_20.name,
                ["options"] = {
                    ["on_deep_sleep_callback"] = function()
                        p_u_14.went_into_deep_sleep = true
                    end
                }
            })
            p_u_13.sounds.stop_sound("Yawn")
            local v16 = p_u_14.went_into_deep_sleep
            if p_u_13.ailments.sleepy then
                local v17 = v_u_5.run_performance
                local v18 = p_u_13
                local v19 = {
                    ["name"] = v_u_3.NoticeObject,
                    ["manager_reaction_name"] = v_u_20.name,
                    ["options"] = {
                        ["object"] = game.Players.LocalPlayer,
                        ["eyes_on_notice"] = "wide_open_eyes",
                        ["effects_on_notice"] = v16 and { "surprised" } or { "exclaim" },
                        ["notice_delay_time"] = 0,
                        ["acknowledgement_time"] = 0.8,
                        ["should_jump_on_notice"] = v16
                    }
                }
                v17(p15, v18, v19)
            end
            return v_u_6.Complete
        end)
        return p_u_14.task:step()
    end
}
return v_u_20