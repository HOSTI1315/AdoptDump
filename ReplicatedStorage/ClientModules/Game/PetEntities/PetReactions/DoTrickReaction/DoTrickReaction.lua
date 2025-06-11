--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.DoTrickReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PetCommandType")
local v_u_4 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_5 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_6 = v1("PetPerformanceName")
local v_u_7 = v1("InterestScore")
local v_u_8 = v1("PetEntityHelper")
local v_u_9 = v1("SteppedTask")
local v_u_10 = v1("SteppedTaskUtils")
local v_u_23 = {
    ["name"] = script.Name,
    ["exclusive_state"] = v_u_5.DoingTrick,
    ["trigger_stimuli"] = { v2.Command },
    ["allowed_exclusive_states"] = { v_u_5.Sitting, v_u_5.Mounted },
    ["can_reinitialize"] = true,
    ["calculate_score"] = function(_, p11)
        if p11.pet_command_type == v_u_3.DoTrick then
            return v_u_7.Gameplay
        else
            return v_u_7.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_7.Gameplay
    end,
    ["init_reaction"] = function(p12, p13)
        local v14 = p13.stimulus
        local v15 = {
            ["trick_name"] = v14.options.trick_name
        }
        v_u_8.end_performance(p12, v_u_6.DoTrick)
        v14:acknowledge()
        return v15
    end,
    ["step"] = function(p_u_16, p_u_17)
        p_u_17.task = p_u_17.task or v_u_9.new(function(p18)
            local v19 = p_u_16.tricks_used[p_u_17.trick_name] ~= nil
            if not v19 then
                p_u_16.tricks_used[p_u_17.trick_name] = true
                v_u_10.run_performance(p18, p_u_16, {
                    ["name"] = v_u_6.NoticeObject,
                    ["manager_reaction_name"] = v_u_23.name,
                    ["options"] = {
                        ["object"] = game.Players.LocalPlayer,
                        ["eyes_on_notice"] = "tiny_eyes",
                        ["effects_on_notice"] = { "dot_dot_dot" },
                        ["notice_delay_time"] = 0.2,
                        ["acknowledgement_time"] = 2,
                        ["sounds_on_notice"] = { "TrickWindup" },
                        ["idle_anim_speed"] = 0.2
                    },
                    ["should_end_performance"] = function()
                        return p_u_16.exclusive_state ~= v_u_5.DoingTrick
                    end
                })
            end
            local v20 = v_u_10.run_performance
            local v21 = p_u_16
            local v22 = {
                ["name"] = v_u_6.NoticeObject,
                ["manager_reaction_name"] = v_u_23.name,
                ["options"] = {
                    ["object"] = game.Players.LocalPlayer,
                    ["eyes_on_notice"] = "happy_eyes",
                    ["effects_on_notice"] = { "exclaim" },
                    ["notice_delay_time"] = 0,
                    ["acknowledgement_time"] = 0.8,
                    ["should_jump_on_notice"] = true,
                    ["sounds_on_notice"] = v19 and { "ThreeLinesAlert" } or {}
                },
                ["should_end_performance"] = function()
                    return p_u_16.exclusive_state ~= v_u_5.DoingTrick
                end
            }
            v20(p18, v21, v22)
            p_u_16.sounds.play_sound("TrickRemembered")
            v_u_10.run_performance(p18, p_u_16, {
                ["name"] = v_u_6.DoTrick,
                ["manager_reaction_name"] = v_u_23.name,
                ["options"] = {
                    ["trick_name"] = p_u_17.trick_name
                },
                ["should_end_performance"] = function()
                    return p_u_16.exclusive_state ~= v_u_5.DoingTrick
                end
            })
            return v_u_4.Complete
        end)
        return p_u_17.task:step()
    end
}
return v_u_23