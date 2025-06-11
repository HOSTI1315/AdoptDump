--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.GreetOnJoinReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_3 = v1("InterestScore")
local v_u_4 = v1("PetPerformanceName")
local v_u_5 = v1("SteppedTask")
local v_u_6 = v1("SteppedTaskUtils")
local v_u_7 = v1("Utilities")
local v_u_8 = v1("PetEntityHelper")
local v_u_9 = v1("SharedConstants")
local v_u_10 = game:GetService("Players")
local v_u_27 = {
    ["name"] = script.Name,
    ["calculate_threshold"] = function(_, _)
        return v_u_3.Gameplay
    end,
    ["init_reaction"] = function(p11, p12)
        local v13 = {
            ["score"] = p12.score
        }
        local v14 = p11.base.char_wrapper.pet_progression.age or 1
        local v15 = p11.base.char_wrapper.pet_progression.friendship_level or 0
        if v14 >= 6 and v_u_9.friendship_flourish_level <= v15 then
            v13.is_friend = true
        end
        return v13
    end,
    ["step"] = function(p_u_16, p_u_17)
        p_u_17.task = p_u_17.task or v_u_5.new(function(p18)
            p18:wait(0.4)
            local v19 = v_u_6.run_performance
            local v20 = p_u_16
            local v21 = {
                ["name"] = v_u_4.NoticeObject,
                ["manager_reaction_name"] = v_u_27.name,
                ["options"] = {
                    ["object"] = v_u_10.LocalPlayer,
                    ["eyes_on_notice"] = p_u_17.is_friend and "heart_eyes" or "tiny_eyes",
                    ["eye_color_on_notice"] = p_u_17.is_friend and Color3.fromRGB(255, 69, 121) or nil,
                    ["effects_on_notice"] = p_u_17.is_friend and { "hearts" } or { "surprised" },
                    ["sounds_on_notice"] = p_u_17.is_friend and { "FriendshipHeartExplosion" } or nil,
                    ["acknowledgement_time"] = 0.75,
                    ["notice_delay_time"] = 0
                }
            }
            v19(p18, v20, v21)
            v_u_6.run_performance(p18, p_u_16, {
                ["name"] = v_u_4.HappyHop,
                ["manager_reaction_name"] = v_u_27.name
            })
            if p_u_17.is_friend then
                p_u_16.sounds.play_sound("FriendshipHeartsLong")
            end
            local v_u_22 = os.clock() + 2
            local v23 = v_u_6.run_performance
            local v24 = p_u_16
            local v26 = {
                ["name"] = v_u_4.RunInCircles,
                ["manager_reaction_name"] = v_u_27.name,
                ["options"] = {
                    ["walkspeed"] = 22,
                    ["radius"] = 2.5,
                    ["eyes_id"] = "super_squinting_eyes",
                    ["effects"] = { "smoke_trail", p_u_17.is_friend and "love_boosted" or "love" },
                    ["looping_sounds"] = { "FetchingRunLoop", not p_u_17.is_friend and "LoveLoop" or nil }
                },
                ["should_end_performance"] = function()
                    if v_u_22 <= os.clock() then
                        local v25 = v_u_10.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if not v25 then
                            return true
                        end
                        if v_u_7.zero_out_y(p_u_16.base.root.Position - v25.Position).Unit:Dot(v25.CFrame.LookVector) > 0.9659258262890683 then
                            return true
                        end
                    end
                end
            }
            v23(p18, v24, v26)
            v_u_6.run_performance(p18, p_u_16, {
                ["name"] = v_u_4.Greet,
                ["manager_reaction_name"] = v_u_27.name,
                ["options"] = {
                    ["is_friend"] = p_u_17.is_friend
                }
            })
            v_u_8.stage_performance(p_u_16, {
                ["name"] = v_u_4.EyesProvider,
                ["options"] = {
                    ["eyes_id"] = "happy_eyes",
                    ["duration"] = 5
                }
            })
            return v_u_2.Complete
        end)
        return p_u_17.task:step()
    end
}
return v_u_27