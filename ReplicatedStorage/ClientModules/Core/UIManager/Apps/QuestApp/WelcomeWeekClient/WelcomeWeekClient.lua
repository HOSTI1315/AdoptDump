--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.QuestApp.WelcomeWeekClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("WelcomeWeekDB")
local v_u_3 = v_u_1("RouterClient")
local v_u_4 = v_u_1("FormatHelper")
local v_u_5 = v_u_1("TweenPromise")
local v_u_6 = v_u_1("LiveOpsTime")
local v_u_7 = v_u_1("SoundPlayer")
local v_u_8 = v_u_1("ClientData")
local v_u_9 = v_u_1("KindDB")
local v_u_10 = v_u_1("Signal")
local v_u_11 = v_u_1("Maid")
local v_u_12 = v_u_1("package:Sift")
local v_u_13 = v_u_1("package:Promise")
local v_u_14 = game:GetService("GuiService")
local v_u_15 = {}
local v_u_16 = UDim2.fromOffset(450, 100)
local v_u_17 = UDim2.fromOffset(450, 80)
local v_u_18 = {
    ["bronze"] = {
        ["small"] = "rbxassetid://109430636211259",
        ["large"] = "rbxassetid://121805084603339"
    },
    ["silver"] = {
        ["small"] = "rbxassetid://126393070798567",
        ["large"] = "rbxassetid://99865061549456"
    },
    ["gold"] = {
        ["small"] = "rbxassetid://116468295300131",
        ["large"] = "rbxassetid://75400770991720"
    }
}
local v_u_19 = {
    "bronze",
    "silver",
    "gold",
    "bronze",
    "gold",
    "silver",
    "gold",
    "gold"
}
local v_u_20 = nil
local v_u_21 = false
function v_u_15.render_tab(p_u_22, p_u_23)
    local v_u_24 = p_u_22.TabContent.WelcomeWeek
    p_u_22.Body.Contents.ScrollingFrame.Visible = false
    p_u_22.Body.Contents.ScrollbarBacking.Visible = false
    local v27 = v_u_12.List.filter(p_u_22.Body.Contents.ScrollingFrame:GetDescendants(), function(p25)
        local v26 = p25:IsA("Frame")
        if v26 then
            v26 = p25.Name == "QuestTemplate"
        end
        return v26
    end)
    local v_u_28 = v_u_1("UIManager")
    local v29 = v_u_28.apps.QuestApp.sized_for_phone
    for _, v30 in v27 do
        local v31 = Instance.new("Frame")
        v31.BackgroundTransparency = 1
        local v32 = Instance.new("UIScale")
        v32.Scale = v29 and 0.56 or 0.8
        v32.Parent = v30
        v30.Position = UDim2.fromScale(0.5, 0.5)
        v30.Size = v29 and v_u_17 or v_u_16
        v30.Parent = v31
        v31.Parent = v_u_24.Daily.TaskFrame
        p_u_23:GiveTask(v31)
        v_u_20 = v_u_20 or v30.Body
    end
    local v_u_33 = v_u_8.get("welcome_week_manager") or {}
    local v34 = v_u_33.days_claimed or 0
    local v_u_35 = v_u_33.current_day
    if not v_u_33.daily_quests_given then
        v_u_35 = v_u_35 - 1
    end
    if not v_u_33.has_viewed_initial_popup then
        v_u_15.display_first_time_popup(v_u_24, p_u_23)
    end
    for v36 = 1, #v_u_2 do
        local v37 = v_u_24.Rewards.Final.Keys:FindFirstChild((tostring(v36)))
        if v37 then
            v37.Image = v_u_18[v_u_19[v36] or "gold"].small
            v37.Visible = v36 <= v34
        end
    end
    local v38 = v_u_33.day_quest_count or 0
    local v39 = #(v_u_33.day_quests_completed or {})
    local v40 = v34 < v_u_35 and v_u_33.day_ready_to_claim
    if v40 then
        v40 = not v_u_33.welcome_week_over
    end
    v_u_24.Daily.TaskLabel.Text = ("TASKS OF THE DAY (%*/%*)"):format(v39, v38)
    v_u_24.Daily.ClaimFrame.Visible = v40
    if v40 then
        v_u_24.Daily.ClaimFrame.RadialPinstripe.Rotation = 0
        local v_u_41 = v_u_5.new(v_u_24.Daily.ClaimFrame.RadialPinstripe, TweenInfo.new(15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
            ["Rotation"] = 360
        })
        p_u_23:GiveTask(function()
            v_u_41:cancel()
        end)
    end
    local v42 = false
    local v_u_43
    if v34 == #v_u_2 then
        v_u_43 = not v_u_33.welcome_week_over
    else
        v_u_43 = false
    end
    if v_u_43 then
        v_u_24.Daily.FinalClaimFrame.Visible = true
    else
        v_u_24.Daily.FinalClaimFrame.Visible = false
        local v44
        if v34 < #v_u_2 then
            v44 = v_u_35 <= v34
        else
            v44 = false
        end
        v_u_24.Daily.CompletedFrame.Visible = v44
        if #v_u_2 <= v34 then
            v_u_15.display_completed_popup(v_u_24, p_u_23)
        elseif v44 and v_u_33.next_unlock_timestamp then
            local v_u_48 = v_u_13.new(function(_, _, p45)
                while not p45() do
                    local v46 = v_u_6.get_time_until(v_u_33.next_unlock_timestamp)
                    if v46 <= 0 then
                        v_u_24.Daily.CompletedFrame.Sign.TextLabel.Text = "Come back tomorrow!"
                        return
                    end
                    local v47 = v_u_4.verbose_format_time(v46)
                    v_u_24.Daily.CompletedFrame.Sign.TextLabel.Text = ("New task in %*!"):format(v47)
                    task.wait(1)
                end
            end)
            p_u_23:GiveTask(function()
                v_u_48:cancel()
            end)
            v42 = true
        end
    end
    if v42 then
        local v49 = v_u_35 + 1
        v_u_24.Rewards.DailyLabel.Text = "TOMORROW\'S REWARD"
    else
        v_u_24.Rewards.DailyLabel.Text = "TODAY\'S REWARD"
    end
    local v50 = v_u_2[v49].reward
    local v_u_51 = v50 and v50.kind
    if v_u_51 then
        v_u_51 = v_u_9[v50.kind]
    end
    local v52 = v50 and v50.image
    if not v52 then
        if v_u_51 then
            v52 = v_u_51.image
        else
            v52 = v_u_51
        end
    end
    if v52 then
        v_u_24.Daily.ClaimFrame.Rewards.Item.Icon.Image = v52
        v_u_24.Rewards.Daily.Item.Image = v52
    end
    v_u_24.Daily.ClaimFrame.Rewards.Item.Visible = v52 ~= nil
    v_u_24.Rewards.Daily.Item.Visible = v52 ~= nil
    local v53 = v_u_18[v_u_19[v49] or "gold"].large
    v_u_24.Rewards.Daily.Key.Image = v53
    v_u_24.Daily.ClaimFrame.Rewards.Key.Icon.Image = v53
    local v_u_54 = nil
    if v40 then
        v_u_54 = v_u_24.Daily.ClaimFrame.ClaimButton
    elseif v_u_43 then
        v_u_54 = v_u_24.Daily.FinalClaimFrame.Sign.ClaimButton
    end
    if v_u_54 then
        local v_u_55 = v_u_54.Parent
        v_u_54.Parent = nil
        local v_u_56 = v_u_54:Clone()
        v_u_56.Parent = v_u_55
        v_u_20 = v_u_56
        p_u_23:GiveTask(function()
            v_u_56:Destroy()
            v_u_54.Parent = v_u_55
        end)
        local v58 = {
            ["mouse_button1_click"] = function()
                if v_u_43 then
                    if v_u_21 then
                        return
                    end
                    v_u_15.display_zebra_claim_animation(p_u_22, p_u_23)
                else
                    v_u_3.get("WelcomeWeekAPI/ClaimDailyReward"):FireServer(v_u_35)
                end
                v_u_7.Interface:play("TaskBoard/Reward")
                v_u_28.apps.QuestApp:_play_reward_animation(v_u_51, {
                    ["particle_count"] = 15,
                    ["custom_particles"] = v_u_24.Confetti:GetChildren(),
                    ["tween_info"] = function(_, p57)
                        return {
                            ["time"] = p57:NextNumber(1.2, 2.2),
                            ["style"] = Enum.EasingStyle.Sine,
                            ["direction"] = Enum.EasingDirection.Out
                        }
                    end
                })
            end
        }
        v_u_28.wrap(v_u_56, "DepthButton"):start(v58)
    end
    v_u_24.Visible = true
    if v_u_20 then
        v_u_28.apps.QuestApp.watch:select_object(v_u_20)
        v_u_20 = nil
    end
    p_u_23:GiveTask(function()
        v_u_24.Visible = false
        p_u_22.Body.Contents.ScrollingFrame.Visible = true
        p_u_22.Body.Contents.ScrollbarBacking.Visible = true
    end)
end
function v_u_15.display_completed_popup(p59, p60)
    local v61 = p59.CompletedPopup
    v61.Visible = true
    local v62 = v61.CloseButton
    if not v62:GetAttribute("ButtonInitialized") then
        v62:SetAttribute("ButtonInitialized", true)
        local v_u_63 = v_u_1("UIManager")
        v_u_63.wrap(v62, "DepthButton"):start({
            ["mouse_button1_click"] = function()
                v_u_63.apps.QuestApp:select_tab("default")
            end
        })
    end
    v_u_20 = v62
    v_u_14:AddSelectionTuple("WelcomeWeekCompleted", v62)
    p60:GiveTask(function()
        v_u_14:RemoveSelectionGroup("WelcomeWeekCompleted")
    end)
end
function v_u_15.display_first_time_popup(p64, p65)
    local v_u_66 = p64.FirstTimePopup
    v_u_66.Visible = true
    local v67 = v_u_66.Description.ConfirmButton
    if not v67:GetAttribute("ButtonInitialized") then
        v67:SetAttribute("ButtonInitialized", true)
        local function v68()
            v_u_3.get("WelcomeWeekAPI/FirstTimeAcknowledge"):FireServer()
            v_u_66.Visible = false
        end
        local v69 = v_u_1("UIManager")
        v69.wrap(v67, "DepthButton"):start({
            ["mouse_button1_click"] = v68
        })
        v69.wrap(v_u_66.CloseButton, "DepthButton"):start({
            ["mouse_button1_click"] = v68
        })
    end
    v_u_20 = v67
    v_u_14:AddSelectionTuple("WelcomeWeekStarted", v67, v_u_66.CloseButton)
    p65:GiveTask(function()
        v_u_14:RemoveSelectionGroup("WelcomeWeekStarted")
    end)
end
function v_u_15.display_zebra_claim_animation(p70, p71)
    local v72 = v_u_1("UIManager")
    local v73 = v_u_1("XboxSupport")
    if not v_u_21 then
        v_u_21 = true
        local v_u_74 = p70.TabContent.WelcomeWeek
        local v_u_75 = v_u_13.resolve()
        local v_u_76 = v_u_11.new()
        local v_u_77 = v_u_74.ZebraRescue:Clone()
        v_u_76:GiveTask(v_u_77)
        p71:GiveTask(v_u_76)
        v_u_76:GiveTask(function()
            v_u_3.get("WelcomeWeekAPI/ClaimFinalReward"):FireServer()
            v_u_74.Daily.CompletedFrame.Visible = true
            v_u_75:cancel()
            v_u_76 = nil
        end)
        local v_u_78 = v_u_10.new()
        v_u_77.AcceptButton.Visible = false
        v72.wrap(v_u_77.AcceptButton, "DepthButton"):start({
            ["mouse_button1_click"] = function()
                if v_u_77.AcceptButton.Visible then
                    v_u_78:Fire()
                end
            end
        })
        local v_u_79 = v_u_77.ZebraInCage
        v_u_79.KeyEnd.Visible = false
        local v_u_80 = v_u_76
        for _, v81 in v_u_79.KeyStart:GetChildren() do
            v81.ImageTransparency = 1
        end
        v_u_79.Position = UDim2.fromScale(0.5, 1.25)
        v_u_77.Fade.BackgroundTransparency = 1
        v_u_77.Visible = true
        v_u_77.Parent = p70.Parent
        local v_u_82 = v73.watch({
            ["signal_open"] = v_u_10.new(),
            ["signal_close"] = v_u_10.new(),
            ["selection_parent"] = v_u_77,
            ["default_selection"] = function()
                if v_u_77.AcceptButton.Visible then
                    return v_u_77.AcceptButton
                else
                    return v_u_77.Fade
                end
            end
        })
        v_u_82:activate()
        v_u_80:GiveTask(function()
            v_u_82:deactivate()
        end)
        v_u_75 = v_u_13.all({ v_u_5.new(v_u_77.Fade, TweenInfo.new(2), {
                ["BackgroundTransparency"] = 0.4
            }), v_u_5.new(v_u_79, TweenInfo.new(1.2, Enum.EasingStyle.Back), {
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }) }):andThen(function()
            local v83 = {}
            for v84, v_u_85 in v_u_79.KeyStart:GetChildren() do
                local v_u_86 = v_u_79.KeyEnd:FindFirstChild(v_u_85.Name)
                local v_u_87 = v_u_79.Locks:FindFirstChild(v_u_85.Name)
                local v88 = v_u_13.delay((v84 - 1) * 1.2):andThen(function()
                    return v_u_13.all({ v_u_5.new(v_u_85, TweenInfo.new(1.25), {
                            ["Position"] = v_u_86.Position,
                            ["Rotation"] = v_u_86.Rotation
                        }), v_u_5.new(v_u_85, TweenInfo.new(0.85), {
                            ["ImageTransparency"] = 0
                        }) }):andThen(function()
                        return v_u_13.all({ v_u_5.new(v_u_85, TweenInfo.new(0.5), {
                                ["ImageTransparency"] = 1
                            }), v_u_5.new(v_u_87, TweenInfo.new(0.8), {
                                ["ImageTransparency"] = 1,
                                ["Position"] = v_u_87.Position + UDim2.fromOffset(0, 150)
                            }) })
                    end)
                end)
                table.insert(v83, v88)
            end
            return v_u_13.all(v83):andThen(function()
                return v_u_13.delay(0.45)
            end)
        end):andThen(function()
            local v89 = v_u_79.CageBars.Size
            return v_u_5.new(v_u_79.CageBars, TweenInfo.new(0.5), {
                ["Size"] = UDim2.fromOffset(v89.X.Offset, 0)
            }):andThen(function()
                v_u_79.CageBars.Visible = false
                v_u_79.Zebra.ZIndex = 5
            end)
        end):andThen(function()
            local v90 = Random.new()
            local v91 = {}
            for _, v92 in v_u_77.Confetti:GetChildren() do
                if v92:IsA("ImageLabel") then
                    v91[v92] = v92.Position
                    v92.Position = UDim2.fromScale(0.5, 0.5)
                    v92.ImageTransparency = 1
                end
            end
            v_u_77.Confetti.Visible = true
            for _, v93 in v_u_77.Confetti:GetChildren() do
                if v93:IsA("ImageLabel") then
                    local v94 = TweenInfo.new(v90:NextNumber(0.5, 1.5), Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                    v_u_5.new(v93, v94, {
                        ["Position"] = v91[v93],
                        ["ImageTransparency"] = 0
                    })
                end
            end
            local v95 = v_u_77.Header.Position
            v_u_77.Header.Visible = true
            v_u_77.Header.Position = v95 + UDim2.fromScale(0, -0.5)
            v_u_5.new(v_u_77.Header, TweenInfo.new(0.7, Enum.EasingStyle.Back), {
                ["Position"] = v95
            })
            local v96 = v_u_77.RadialPinstripe.Size
            v_u_77.RadialPinstripe.ImageTransparency = 1
            v_u_77.RadialPinstripe.Visible = true
            v_u_5.new(v_u_77.RadialPinstripe, TweenInfo.new(0.6), {
                ["Size"] = v96,
                ["ImageTransparency"] = 0
            })
            v_u_5.new(v_u_77.RadialPinstripe, TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                ["Rotation"] = 360
            })
            return v_u_13.all({ v_u_5.new(v_u_79.CageMain, TweenInfo.new(0.2), {
                    ["ImageTransparency"] = 1
                }), v_u_5.new(v_u_79.CageBackground, TweenInfo.new(0.2), {
                    ["ImageTransparency"] = 1
                }) }):andThen(function()
                return v_u_13.delay(1)
            end)
        end):andThen(function()
            local v97 = v_u_77.AcceptButton.Position
            v_u_77.AcceptButton.Position = v97 + UDim2.fromScale(0, 0.3)
            v_u_77.AcceptButton.Visible = true
            return v_u_5.new(v_u_77.AcceptButton, TweenInfo.new(0.75, Enum.EasingStyle.Back), {
                ["Position"] = v97
            }):andThen(function()
                v_u_82:select_object(v_u_77.AcceptButton)
                return v_u_13.fromEvent(v_u_78)
            end)
        end):done(function()
            if v_u_80 then
                v_u_80:DoCleaning()
            end
            v_u_21 = false
        end)
    end
end
function v_u_15.is_active()
    local v98 = v_u_8.get("welcome_week_manager")
    if v98 then
        v98 = v98.active
    end
    return v98
end
function v_u_15.init()
    local v_u_99 = false
    v_u_8.register_callback_plus_existing("welcome_week_manager", function(_, _)
        local v100 = v_u_1("UIManager")
        if not v_u_99 and v_u_15.is_active() then
            v_u_99 = true
            v100.apps.QuestApp:render_tabs()
            v100.apps.QuestApp:select_tab("welcome_week")
        end
        if v100.is_visible("QuestApp") and (v100.apps.QuestApp.current_tab and v100.apps.QuestApp.current_tab.name == "welcome_week") then
            v100.apps.QuestApp:_render_quests()
        end
    end)
end
return v_u_15