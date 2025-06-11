--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.NavigateReaction (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v_u_1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_4 = v_u_1("PetPerformanceName")
local v_u_5 = v_u_1("InterestScore")
local v6 = v_u_1("AdoptMeEnums/PetEntities/StimulusType")
local v_u_7 = v_u_1("AdoptMeEnums/PetEntities/PetCommandType")
local v_u_8 = v_u_1("SteppedTask")
local v_u_9 = v_u_1("SteppedTaskUtils")
local v_u_26 = {
    ["name"] = script.Name,
    ["exclusive_state"] = v2.Navigating,
    ["trigger_stimuli"] = { v6.Command },
    ["allowed_exclusive_states"] = {
        v2.Focused,
        v2.Mounted,
        v2.Swimming,
        v2.Sitting
    },
    ["can_reinitialize"] = true,
    ["calculate_score"] = function(_, p10)
        if p10.pet_command_type == v_u_7.Navigate then
            return v_u_5.AlwaysInterested
        else
            return v_u_5.NeverInterested
        end
    end,
    ["calculate_threshold"] = function(_, _)
        return v_u_5.Gameplay
    end,
    ["init_reaction"] = function(_, p11)
        local v12 = p11.stimulus
        local v_u_13 = v12.options.nav_name
        local v14 = {
            ["nav_name"] = v_u_13,
            ["target"] = v12.options.target,
            ["on_despawn"] = function()
                v_u_1("UIManager").apps.GuideArrowApp:cancel_navigation(v_u_13)
            end
        }
        v12:acknowledge()
        return v14
    end,
    ["step"] = function(p_u_15, p_u_16)
        p_u_16.task = p_u_16.task or v_u_8.new(function(p17)
            local v_u_18 = v_u_1("UIManager")
            local function v19()
                return v_u_18.apps.GuideArrowApp.running_nav_name ~= p_u_16.nav_name and true or p_u_15.current_furniture_use_id
            end
            if not p_u_15.short_term_reaction_memory[p_u_16.nav_name] then
                local v20 = v_u_9.run_performance
                local v21 = p_u_15
                local v22 = {
                    ["name"] = v_u_4.NoticeObject,
                    ["manager_reaction_name"] = v_u_26.name,
                    ["should_end_performance"] = v19,
                    ["options"] = {
                        ["object"] = p_u_16.target,
                        ["eyes_on_notice"] = "happy_eyes",
                        ["effects_on_notice"] = { "surprised" },
                        ["should_jump_on_notice"] = true
                    }
                }
                v20(p17, v21, v22)
                p_u_15.short_term_reaction_memory[p_u_16.nav_name] = {
                    ["should_cleanup"] = v19
                }
            end
            local v23 = v_u_9.run_performance
            local v24 = p_u_15
            local v25 = {
                ["name"] = v_u_4.Navigate,
                ["manager_reaction_name"] = v_u_26.name,
                ["should_end_performance"] = v19,
                ["options"] = {
                    ["nav_name"] = p_u_16.nav_name,
                    ["target"] = p_u_16.target
                }
            }
            v23(p17, v24, v25)
            v_u_18.apps.GuideArrowApp:cancel_navigation(p_u_16.nav_name)
            return v_u_3.Complete
        end)
        return p_u_16.task:step()
    end
}
return v_u_26