--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.SavedFromIceBlock (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_3 = v1("InterestScore")
local v_u_4 = v1("PetPerformanceName")
local v_u_5 = v1("SteppedTask")
local v_u_6 = v1("SteppedTaskUtils")
local v_u_7 = v1("PetEntityHelper")
local v_u_8 = v1("PetMovementTarget")
local v_u_9 = game:GetService("Players")
local v_u_27 = {
    ["name"] = script.Name,
    ["calculate_threshold"] = function(_, _)
        return v_u_3.GameplayCritical
    end,
    ["init_reaction"] = function(_, p10)
        local v11 = {
            ["target"] = v_u_8.new({
                ["target"] = p10.position or v_u_9.LocalPlayer
            })
        }
        return v11
    end,
    ["step"] = function(p_u_12, p_u_13)
        p_u_13.task = p_u_13.task or v_u_5.new(function(p14)
            p14:wait(0.4)
            local v15 = v_u_6.run_performance
            local v16 = p_u_12
            local v17 = {
                ["name"] = v_u_4.NoticeObject,
                ["manager_reaction_name"] = v_u_27.name,
                ["options"] = {
                    ["object"] = v_u_9.LocalPlayer,
                    ["eyes_on_notice"] = "tiny_eyes",
                    ["effects_on_notice"] = { "surprised" },
                    ["acknowledgement_time"] = 0.75,
                    ["notice_delay_time"] = 0
                }
            }
            v15(p14, v16, v17)
            v_u_6.run_performance(p14, p_u_12, {
                ["name"] = v_u_4.HappyHop,
                ["manager_reaction_name"] = v_u_27.name
            })
            local v18 = v_u_6.run_performance
            local v19 = p_u_12
            local v20 = {
                ["name"] = v_u_4.RunInCircles,
                ["manager_reaction_name"] = v_u_27.name,
                ["options"] = {
                    ["walkspeed"] = 22,
                    ["radius"] = 3,
                    ["duration"] = 2.5,
                    ["eyes_id"] = "super_squinting_eyes",
                    ["effects"] = { "smoke_trail", "love" },
                    ["looping_sounds"] = { "FetchingRunLoop", "LoveLoop" },
                    ["target"] = p_u_13.target
                }
            }
            v18(p14, v19, v20)
            local v21 = v_u_6.run_performance
            local v22 = p_u_12
            local v23 = {
                ["name"] = v_u_4.Greet,
                ["manager_reaction_name"] = v_u_27.name,
                ["options"] = {
                    ["target"] = p_u_13.target
                }
            }
            v21(p14, v22, v23)
            local v24 = v_u_7.stage_performance
            local v25 = p_u_12
            local v26 = {
                ["name"] = v_u_4.EyesProvider,
                ["options"] = {
                    ["eyes_id"] = "happy_eyes",
                    ["duration"] = 2
                }
            }
            v24(v25, v26)
            return v_u_2.Complete
        end)
        return p_u_13.task:step()
    end
}
return v_u_27