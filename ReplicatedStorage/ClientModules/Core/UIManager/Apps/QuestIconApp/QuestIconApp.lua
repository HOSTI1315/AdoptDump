--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.QuestIconApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlatformM")
local v3 = v1("Class")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("QuestsDB")
local v_u_6 = v1("SoundPlayer")
local v_u_7 = v1("TaskboardStyleDB")
local v_u_8 = v1("LiveOpsTime")
local v_u_9 = v1("SharedConstants")
local v_u_10 = v1("FormatHelper")
local v_u_11 = v1("Maid")
local v_u_12 = v1("EggEvent")
local v_u_13 = v1("new:TutorialHelper")
local v_u_14 = v1("package:Promise")
local v_u_15 = v1("package:Sift")
local v16 = game:GetService("Players")
local v_u_17 = game:GetService("TweenService")
local v_u_18 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v16.LocalPlayer)
local v19 = v3("QuestIconApp", v1("UIBaseApp"))
local v_u_20 = game.ReplicatedStorage.Sounds.Interface.TaskBoard.Notification.Volume
local function v_u_31(p21, p22, p23)
    local v24 = p21 - v_u_8.now()
    local v25 = math.max(0, v24)
    local v26 = v_u_18:Translate(workspace, p22)
    if v25 < 300 then
        return p23
    else
        local v27 = v_u_10.get_time_breakdown(v25)
        local v28 = v_u_18:Translate(workspace, v27.days == 1 and "1 DAY" or ("%s %s"):format(v27.days, "DAYS"))
        local v29 = v_u_18:Translate(workspace, v27.hours == 1 and "1 HOUR" or ("%02d %s"):format(v27.hours, "HOURS"))
        local v30 = v_u_18:Translate(workspace, v27.minutes == 1 and "1 MINUTE" or ("%02d %s"):format(v27.minutes, "MINUTES"))
        if v27.days < 1 and v27.hours < 1 then
            return v26 .. "\n" .. v30
        elseif v27.days > 2 or v27.hours < 1 then
            return v26 .. "\n" .. v28
        elseif v27.days > 0 then
            return v26 .. "\n" .. ("%s %s"):format(v28, v29)
        else
            return v26 .. "\n" .. v29
        end
    end
end
local function v_u_35(_)
    local v32 = v_u_12.get_time_until_release
    local v33 = math.max(0, v32())
    if v33 == 0 then
        return "RELEASED!"
    else
        local v34 = v_u_10.get_time_breakdown(v33)
        if v34.days > 1 then
            return ("EGG RELEASE\n%s DAYS"):format(v34.days)
        else
            return v34.days == 1 and "EGG RELEASE\n1 DAY" or ("EGG RELEASE\n%02d:%02d:%02d"):format(v34.hours, v34.minutes, v34.seconds)
        end
    end
end
function v19.enable_animations(p36)
    p36._animations_enabled = true
    p36:_update_quests()
end
function v19.show(p37)
    p37.instance.Enabled = true
end
function v19.hide(p38)
    p38.instance.Enabled = false
end
function v19.set_event_appearance(p39, p40)
    local v41 = v_u_7[p40 or "Default"]
    local v42 = p39.image_button.EventContainer
    local v43 = v42.EventFrame
    local v44 = v43.EventImageBottom
    local v45 = v43.EventImageTop
    local v46 = v42.MultiplierImage
    v42.Background.Image = v41.ImageButton
    v42.IsClaimable.Pet.Image = v41.ClaimablePetImage
    v42.IsNew.Pet.Image = v41.NewPetImage
    v45.EventName.Text = v41.EventName
    v45.Image = v41.EventImageTop
    v44.Image = v41.EventImageBottom
    v46.Image = v41.MultiplierImage
    v43.Visible = v41.EventFrameVisibility
end
function v19.refresh(p47, p48)
    local v49 = p47.UIManager.is_closed({
        "MainMenuApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "AvatarEditorApp",
        "PlayerSpectateApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "MinigameInGameApp",
        "FocusPetApp",
        "MockFocusPetApp",
        "LikesRewardApp"
    })
    if not p48[p47.ClassName] then
        v49 = false
    end
    if p47.UIManager.apps.HouseEditorWrapperApp.editor_open and p47.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v49 = false
    end
    if p48.QuestApp then
        p47:_update_quests()
    end
    p47:set_visibility(v49)
end
function v19._play_sound(p50, p51, p52)
    if p50.instance.Enabled ~= false and p50.UIManager.is_visible("QuestIconApp") ~= false then
        if p52 then
            v_u_6.Interface:play("TaskBoard/" .. p51).Volume = p52
        end
    end
end
function v19._update_quests(p53)
    if p53._animations_enabled then
        local v54 = v_u_4.get("quest_manager") or {
            ["quests_cached"] = {},
            ["daily_quest_data"] = {
                ["last_quest_issued_time"] = 0,
                ["recent_quests"] = {}
            }
        }
        local v55 = p53.UIManager.is_visible("QuestApp")
        local v56 = 0
        local v57 = false
        local v58 = false
        for _, v59 in pairs(v54.quests_cached) do
            local v60 = v_u_5.all_quests[v59.entry_name]
            v56 = v56 + 1
            v57 = v57 or v59.is_new
            if v60.reward.claimable_override then
                v58 = v58 or v60.reward.claimable_override(v59)
            else
                v58 = v58 or v59.steps_completed == v60.total_steps
            end
        end
        for _, v61 in pairs(p53.icon_info) do
            if p53:is_button_enabled() then
                if v61.should_show(v57, v58, v55) then
                    if not (v61.scale_tween or v61.bounce_tween) then
                        if v58 then
                            p53:_play_sound("Complete")
                            p53:_shoot_confetti()
                        end
                        p53:_animate_quest_button_scale(v61, 1)
                    end
                elseif not v61.scale_tween then
                    p53:_animate_quest_button_scale(v61, 0)
                end
            else
                p53:_animate_quest_button_scale(v61, 0)
            end
        end
    end
end
function v19._animate_quest_button_scale(p_u_62, p_u_63, p_u_64)
    if p_u_63.bounce_tween then
        p_u_63.bounce_tween:Cancel()
        p_u_63.bounce_tween:Destroy()
        p_u_63.bounce_tween = nil
    end
    if p_u_63.scale_tween then
        p_u_63.scale_tween:Cancel()
        p_u_63.scale_tween:Destroy()
        p_u_63.scale_tween = nil
    end
    p_u_63.scale_tween = v_u_17:Create(p_u_63.frame.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Scale"] = p_u_64
    })
    p_u_63.scale_tween.Completed:Connect(function(p65)
        p_u_63.scale_tween:Destroy()
        p_u_63.scale_tween = nil
        if p_u_64 == 1 and p65 == Enum.PlaybackState.Completed then
            p_u_62:_animate_quest_button_bounce(p_u_63, v_u_20)
        end
    end)
    p_u_63.scale_tween:Play()
end
function v19._get_default_button_scale(_)
    return v_u_2.get_platform() == v_u_2.platform.phone and 0.7 or 1
end
function v19._animate_quest_button_bounce(p_u_66, p_u_67, p_u_68)
    p_u_67.frame.Position = p_u_67.default_position
    p_u_67.bounce_tween = v_u_17:Create(p_u_67.frame, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 1, true), {
        ["Position"] = p_u_67.frame.Position + UDim2.new(0, 0, 0, -24)
    })
    p_u_67.bounce_tween.Completed:Connect(function()
        v_u_14.delay(4.5):await()
        if p_u_67.bounce_tween then
            p_u_66:_animate_quest_button_bounce(p_u_67, p_u_68 * 0.8)
        end
    end)
    p_u_67.bounce_tween:Play()
    p_u_66:_play_sound("Notification", p_u_68)
end
function v19._shoot_confetti(p69)
    local v70 = p69.confetti_to_clone:GetChildren()
    local v_u_71 = Random.new()
    for v72, v73 in ipairs(v70) do
        local v_u_74 = v73:Clone()
        local v75 = #v70 / -2 + v72
        local v_u_76 = v_u_17:Create(v_u_74, TweenInfo.new(0.5 + v_u_71:NextNumber(-0.05, 0.3), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["Rotation"] = v_u_74.Rotation + v75 * (15 + v_u_71:NextInteger(1, 25)),
            ["Position"] = v_u_74.Position + UDim2.new(0, v75 * (18 + v_u_71:NextInteger(-5, 5)), 0, -115 + v_u_71:NextInteger(-25, 25))
        })
        v_u_76.Completed:Connect(function()
            v_u_17:Create(v_u_74, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Position"] = v_u_74.Position + UDim2.new(0, 0, 0, 100)
            }):Play()
            local v77 = v_u_17:Create(v_u_74, TweenInfo.new(0.25 + v_u_71:NextNumber(-0.1, 0.1), Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                ["ImageTransparency"] = 1
            })
            v77.Completed:Connect(function()
                v_u_74.Parent = nil
            end)
            v77:Play()
            v_u_76:Destroy()
        end)
        v_u_76:Play()
        v_u_74.Parent = p69.confetti
    end
    v_u_17:Create(p69.confetti.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
        ["Scale"] = 1
    }):Play()
end
function v19._on_button_activated(p78)
    if p78:is_button_enabled() then
        p78.UIManager.set_app_visibility("QuestApp")
    end
end
function v19._update_style(p_u_79)
    if v_u_13.is_new_tutorial_running() then
        p_u_79:set_event_appearance("Default")
    else
        local v_u_80 = v_u_9.egg_event
        local v_u_81 = v_u_9.festival_event
        local v82 = v_u_80.release_time + v_u_80.quest_icon_app_post_release_duration
        local v83 = nil
        local v_u_84 = nil
        if v_u_8.has_happened(v82) then
            if v_u_81.enabled then
                v83 = v_u_81.quest_icon_app_taskboard_style
                v_u_84 = function()
                    if v_u_8.has_happened(v_u_81.start_time) then
                        return v_u_31(v_u_81.finish_time, v_u_81.end_countdown_text, v_u_81.end_soon_text)
                    else
                        return v_u_31(v_u_81.start_time, v_u_81.start_countdown_text, v_u_81.start_soon_text)
                    end
                end
            end
        else
            v83 = v_u_80.quest_icon_app_taskboard_style
            v_u_84 = function()
                return v_u_35(v_u_80.release_time)
            end
        end
        v_u_14.try(function()
            if v_u_84 then
                while true do
                    local v85 = v_u_84()
                    p_u_79.timer_label.Text = v85
                    task.wait(1)
                end
            else
                return
            end
        end)
        p_u_79:set_event_appearance(v83)
        if v_u_81.instantly_takedown_taskboard then
            v_u_14.try(function()
                while not v_u_8.has_happened(v_u_81.finish_time) do
                    task.wait(1)
                end
                p_u_79:set_event_appearance("Default")
            end)
        end
    end
end
function v19.start(p_u_86)
    p_u_86.button_disable_table = {}
    p_u_86.image_button = p_u_86.instance.ImageButton
    p_u_86.confetti_to_clone = p_u_86.instance.ConfettiToClone
    p_u_86.confetti = p_u_86.image_button.Confetti
    p_u_86.timer_label = p_u_86.image_button.EventContainer.EventFrame.EventImageBottom.EventTime
    p_u_86.icon_info = {
        ["is_new"] = {
            ["frame"] = p_u_86.image_button.EventContainer.IsNew,
            ["default_position"] = p_u_86.image_button.EventContainer.IsNew.Position,
            ["scale_tween"] = nil,
            ["bounce_tween"] = nil,
            ["should_show"] = function(p87, p88, p89)
                local v90 = p87 and not p88
                if v90 then
                    v90 = not p89
                end
                return v90
            end
        },
        ["is_claimable"] = {
            ["frame"] = p_u_86.image_button.EventContainer.IsClaimable,
            ["default_position"] = p_u_86.image_button.EventContainer.IsClaimable.Position,
            ["scale_tween"] = nil,
            ["bounce_tween"] = nil,
            ["should_show"] = function(_, p91, _)
                return p91
            end
        }
    }
    local v92 = v_u_2.get_platform()
    local v_u_93 = p_u_86:_get_default_button_scale()
    local v_u_94 = v92 == v_u_2.platform.phone and 0.82 or 1.12
    p_u_86.image_button.UIScale.Scale = v_u_93
    p_u_86.image_button.MouseEnter:Connect(function()
        if p_u_86.block_rescale then
            return
        elseif p_u_86:is_button_enabled() then
            local v95 = {
                ["Scale"] = v_u_94
            }
            v_u_17:Create(p_u_86.image_button.UIScale, TweenInfo.new(0.17, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), v95):Play()
        end
    end)
    p_u_86.image_button.MouseLeave:Connect(function()
        if p_u_86.block_rescale then
            return
        elseif p_u_86:is_button_enabled() then
            local v96 = {
                ["Scale"] = v_u_93
            }
            v_u_17:Create(p_u_86.image_button.UIScale, TweenInfo.new(0.17, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), v96):Play()
        end
    end)
    v_u_4.register_server_on_change_hook("quest_manager", nil, function(_, _, _)
        p_u_86:_update_quests()
    end)
    p_u_86:_update_quests()
    local function v117()
        local v_u_97 = game:GetService("UserInputService")
        local v98 = p_u_86.image_button:FindFirstChild("EventFrame", true)
        local v_u_99 = v98.Visible and v98 and v98 or p_u_86.image_button
        local v100 = v_u_15.List.push(p_u_86.instance:GetDescendants(), p_u_86.instance)
        local v_u_101 = {
            ["ImageLabel"] = "ImageTransparency",
            ["ImageButton"] = "ImageTransparency",
            ["TextLabel"] = "TextTransparency",
            ["Frame"] = "Transparency"
        }
        local v_u_102 = {}
        for _, v103 in ipairs(v100) do
            for v104, _ in pairs(v_u_101) do
                if v103:IsA(v104) then
                    local v105 = v103[v_u_101[v104]]
                    if v105 < 1 then
                        v_u_102[v103] = v105
                    end
                    break
                end
            end
        end
        local function v_u_112(p106, p107)
            for v108, v109 in pairs(v_u_102) do
                if v108.Visible then
                    for v110, v111 in pairs(v_u_101) do
                        if v108:IsA(v110) then
                            v_u_17:Create(v108, TweenInfo.new(p107, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                                [v111] = math.max(p106, v109)
                            }):Play()
                            break
                        end
                    end
                end
            end
        end
        local v_u_113 = v_u_11.new()
        v_u_97.TouchMoved:Connect(function(_, p114)
            if p114 and p_u_86.image_button.Active then
                local v115 = game.Players.LocalPlayer.Character
                if v115 then
                    v115 = game.Players.LocalPlayer.Character.Humanoid
                end
                if v115 then
                    v115 = v115.MoveDirection
                end
                if v115 ~= Vector3.new(0, 0, 0) then
                    p_u_86.block_rescale = true
                    p_u_86.image_button.Active = false
                    v_u_113:GiveTask(v_u_99.MouseEnter:Connect(function()
                        v_u_112(0.8, 0.17)
                    end))
                    v_u_113:GiveTask(v_u_99.MouseLeave:Connect(function()
                        v_u_112(0, 0.5)
                    end))
                    v_u_113:GiveTask(v_u_97.TouchEnded:Connect(function(_, p116)
                        if not p_u_86.image_button.Active and p116 then
                            p_u_86.block_rescale = false
                            p_u_86.image_button.Active = true
                            v_u_112(0, 0.5)
                            v_u_113:DoCleaning()
                        end
                    end))
                end
            else
                return
            end
        end)
    end
    v_u_2.run({
        ["phone"] = v117,
        ["tablet"] = v117
    })
    if v92 == v_u_2.platform.phone or v92 == v_u_2.platform.tablet then
        (function(p118, p_u_119)
            local v_u_120 = 0
            p118.MouseButton1Down:Connect(function()
                v_u_120 = tick()
            end)
            p118.MouseButton1Click:Connect(function()
                if tick() - v_u_120 <= 1 then
                    p_u_119()
                end
            end)
        end)(p_u_86.image_button, function()
            p_u_86:_on_button_activated()
        end)
    else
        p_u_86.image_button.MouseButton1Down:Connect(function()
            p_u_86:_on_button_activated()
        end)
    end
    game:GetService("ContextActionService"):BindAction("OpenEventApp", function(_, p121)
        if p121 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass
        end
        if p_u_86.visible == false then
            return Enum.ContextActionResult.Pass
        end
        p_u_86:_on_button_activated()
        return Enum.ContextActionResult.Sink
    end, false, Enum.KeyCode.DPadLeft)
    p_u_86.console_icon = p_u_86.UIManager.wrap(p_u_86.image_button.XboxButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.DPadLeft
    })
    if v_u_13.is_new_tutorial_running() then
        v_u_13.new_tutorial_completed_promise():andThen(function()
            p_u_86:_update_style()
        end)
    end
    p_u_86:_update_style()
end
function v19.disable_button(p122, p123)
    p122.button_disable_table[p123] = true
    p122:_update_quests()
    v_u_17:Create(p122.image_button.UIScale, TweenInfo.new(0.17, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        ["Scale"] = p122:_get_default_button_scale()
    }):Play()
end
function v19.enable_button(p124, p125)
    p124.button_disable_table[p125] = nil
    p124:_update_quests()
end
function v19.is_button_enabled(p126)
    return not next(p126.button_disable_table)
end
return v19