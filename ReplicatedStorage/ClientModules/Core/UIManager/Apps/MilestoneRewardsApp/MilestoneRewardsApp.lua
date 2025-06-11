--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MilestoneRewardsApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("RouterClient")
local v4 = v_u_1("Class")
local v_u_5 = v_u_1("ColorThemeManager")
local v_u_6 = v_u_1("DailyLoginDB")
local v_u_7 = v_u_1("SoundPlayer")
local v_u_8 = v_u_1("XboxSupport")
local v_u_9 = v_u_1("InventoryDB")
local v_u_10 = v_u_1("package:Promise")
local v_u_11 = game:GetService("TweenService")
local v_u_12 = game:GetService("RunService")
local v_u_13 = {
    {
        ["min_star_amount"] = 650,
        ["color"] = Color3.fromRGB(0, 244, 249)
    },
    {
        ["min_star_amount"] = 250,
        ["color"] = Color3.fromRGB(251, 176, 59)
    },
    {
        ["min_star_amount"] = 0,
        ["color"] = Color3.fromRGB(51, 51, 51)
    }
}
local v14 = v4("MilestoneRewardsApp", v_u_1("UIBaseApp"))
function v14.trigger_reverse_claim_animation_for_frame(p15, p16, p17, p_u_18)
    local v19 = p16.ClaimedFill
    local v20 = nil
    if p17 then
        local v21 = v_u_9[p17.item_category][p17.item_id]
        p16.RewardLabel.Text = v21.name
        p16.ItemIcon.Image = v21.image
        p16.StarsLabel.Text = p17.stars
        for _, v22 in v_u_13 do
            if p17.stars > v22.min_star_amount then
                v20 = v22.color
                break
            end
        end
        if not v20 then
            v20 = Color3.fromRGB(51, 51, 51)
        end
    end
    v_u_11:Create(p16.FrameImage, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["ImageColor3"] = v20 or p15.frame_colors[p16]
    }):Play()
    v_u_11:Create(v19, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["ImageTransparency"] = 1
    }):Play()
    local v23 = v_u_11:Create(v19.Clipper, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
        ["Size"] = UDim2.new(0, 0, 1, 0)
    })
    v23.Completed:connect(function()
        if p_u_18 then
            p_u_18()
        end
    end)
    v_u_7.FX:play("PopShort")
    v23:Play()
end
function v14.trigger_claim_animation_for_frame(_, p24)
    local v_u_25 = p24.ClaimedFill
    v_u_25.Visible = true
    v_u_25.ImageTransparency = 1
    v_u_25.Clipper.Size = UDim2.new(0, 0, 1, 0)
    v_u_25.Clipper.Checkmark.ImageTransparency = 1
    v_u_25.ImageColor3 = p24.FrameImage.ImageColor3
    v_u_11:Create(v_u_25, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["ImageTransparency"] = 0.4
    }):Play()
    delay(0.12, function()
        v_u_11:Create(v_u_25.Clipper, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }):Play()
        v_u_11:Create(v_u_25.Clipper.Checkmark, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["ImageTransparency"] = 0
        }):Play()
    end)
end
function v14.mark_completed(_, p26)
    local v27 = p26.ClaimedFill
    v27.Visible = true
    v27.ImageTransparency = 0.4
    v27.Clipper.Size = UDim2.new(1, 0, 1, 0)
    v27.Clipper.Checkmark.ImageTransparency = 0
    v27.ImageColor3 = p26.FrameImage.ImageColor3
end
function v14.refresh_claim_button(p28)
    local v29 = v_u_6.get_star_rewards_for_prestige(p28.prestige)
    local v30 = true
    for v31, v32 in pairs(v29) do
        if not p28.claimed_star_rewards[v31] and p28.stars >= v32.stars then
            v30 = false
            break
        end
    end
    if v30 then
        p28.claim_button_class:set_state("unpressable")
        local v33 = p28.claim_button_instance
        v33.ImageTransparency = 0.5
        v33.Face.ImageTransparency = 0.5
        v33.Face.TextLabel.TextTransparency = 0.5
    else
        p28.claim_button_class:set_state("normal")
        local v34 = p28.claim_button_instance
        v34.ImageTransparency = 0
        v34.Face.ImageTransparency = 0
        v34.Face.TextLabel.TextTransparency = 0
    end
end
function v14.clear_contents(p35)
    for _, v36 in pairs(p35.reward_frames) do
        v36:Destroy()
    end
    p35.reward_frames = {}
end
function v14.refresh_contents(p_u_37)
    p_u_37:clear_contents()
    local v38 = game.TextService
    local v39 = p_u_37.stars
    local v40 = v38:GetTextSize(tostring(v39), 32, Enum.Font.GothamBlack, Vector2.new((1 / 0), 32))
    p_u_37.star_count.Text = p_u_37.stars
    p_u_37.star_count.Size = UDim2.fromOffset(v40.X, v40.Y)
    local v41 = v_u_6.get_star_rewards_for_prestige(p_u_37.prestige)
    local v42 = 0
    for _ in pairs(v41) do
        v42 = v42 + 1
    end
    local v43 = v42 % 5
    local v44 = {}
    local v45 = nil
    for v46, v_u_47 in pairs(v41) do
        local v48 = tonumber(v46:match("%d+"))
        local v49 = p_u_37.claimed_star_rewards[v46]
        local v50 = p_u_37.reward_template:Clone()
        v50.Name = v46
        v50.LayoutOrder = v_u_47.stars
        v50.StarsLabel.Text = v_u_47.stars
        if v49 then
            p_u_37:mark_completed(v50)
        end
        if v_u_47.information_text then
            v50.InfoLabel.Visible = true
            v45 = Instance.new("TextButton")
            v45.BackgroundTransparency = 1
            v45.ZIndex = 100
            v45.Size = UDim2.fromScale(1, 1)
            v45.Text = ""
            v50.Selectable = false
            v45.Selectable = true
            v45.Parent = v50
            v45.MouseButton1Down:Connect(function()
                p_u_37.UIManager.apps.DialogApp:dialog({
                    ["text"] = v_u_47.information_text,
                    ["button"] = "Okay"
                })
            end)
        else
            local v51 = (v48 - 1) % 5 + 1
            local v52 = (v48 - 1) / 5
            local v53 = math.floor(v52)
            local v54 = v42 / 5
            if v53 == math.floor(v54) - 1 and v43 <= v51 then
                table.insert(v44, v50)
            end
        end
        local v55 = v_u_9[v_u_47.item_category][v_u_47.item_id]
        v50.RewardLabel.Text = v55.name
        v50.ItemIcon.Image = v55.image
        v50.ItemIcon.Visible = true
        for _, v56 in v_u_13 do
            if v_u_47.stars > v56.min_star_amount then
                v50.FrameImage.ImageColor3 = v56.color
                break
            end
        end
        if v50.FrameImage.ImageColor3 == Color3.fromRGB(251, 176, 59) and v_u_5.get_theme_color() == "yellow" then
            local v57 = v_u_5.lookup_specific_color("purple", "saturated")
            v50.FrameImage.ImageColor3 = v57
        end
        p_u_37.frame_colors[v50] = v50.FrameImage.ImageColor3
        v50.InfoLabel.ImageColor3 = p_u_37.frame_colors[v50]
        v50.Visible = true
        v50.Parent = p_u_37.scrolling_frame
        p_u_37.reward_frames[v46] = v50
    end
    for _, v58 in ipairs(v44) do
        v58.NextSelectionDown = v45
    end
end
function v14.trigger_star_decrease_animation(p_u_59, p_u_60)
    local v_u_61 = p_u_59.stars
    local v_u_62 = p_u_59.stars / 60
    return v_u_10.try(function()
        for _ = 1, 60 do
            if p_u_59.completed_prestige_animation then
                p_u_59.completed_prestige_animation = false
                p_u_59.star_count.Text = "0"
                return
            end
            local v63 = v_u_61 - v_u_62
            local v64 = math.floor(v63)
            v_u_61 = math.max(0, v64)
            p_u_59.star_count.Text = v_u_61
            task.wait(p_u_60 / 60)
        end
    end)
end
function v14.trigger_prestige(p_u_65)
    local v66 = v_u_6.get_prestige_reward(p_u_65.prestige)
    if v66.prestige_text then
        p_u_65.UIManager.apps.DialogApp:dialog({
            ["text"] = v66.prestige_text,
            ["button"] = "Awesome!"
        })
    end
    p_u_65.prestige = p_u_65.prestige + 1
    local v67 = v_u_6.get_star_rewards_for_prestige(p_u_65.prestige)
    local v_u_68 = {}
    for v69, v70 in pairs(p_u_65.reward_frames) do
        local v71 = {
            ["reward_name"] = v69,
            ["frame"] = v70,
            ["order"] = v70.LayoutOrder,
            ["new_reward_entry"] = v67[v69]
        }
        table.insert(v_u_68, v71)
    end
    table.sort(v_u_68, function(p72, p73)
        return p72.order > p73.order
    end)
    local v77 = { p_u_65:trigger_star_decrease_animation(#v_u_68 * 0.2), (v_u_10.try(function()
            for v74, v75 in pairs(v_u_68) do
                local v76 = v74 == #v_u_68 and function()
                    p_u_65.completed_prestige_animation = true
                end or nil
                p_u_65:trigger_reverse_claim_animation_for_frame(v75.frame, v75.new_reward_entry, v76)
                wait(0.2)
            end
        end)) }
    v_u_10.all(v77):andThen(function()
        p_u_65:update_daily_login_data()
        p_u_65:refresh_contents()
    end)
end
function v14.claim_all_rewards(p_u_78)
    spawn(function()
        local v79 = v_u_6.get_star_rewards_for_prestige(p_u_78.prestige)
        local v80 = {}
        for v81, v82 in pairs(v79) do
            local v83 = p_u_78.reward_frames[v81]
            if p_u_78.stars >= v82.stars and not p_u_78.claimed_star_rewards[v81] then
                local v84 = {
                    ["frame"] = v83,
                    ["stars"] = v82.stars,
                    ["reward_name"] = v81
                }
                table.insert(v80, v84)
            end
        end
        table.sort(v80, function(p85, p86)
            return p85.stars < p86.stars
        end)
        for _, v_u_87 in pairs(v80) do
            local v88 = v_u_87.frame
            local v90 = v_u_10.all({ v_u_10.async(function(p89, _)
                    p89((v_u_3.get("DailyLoginAPI/ClaimStarReward"):InvokeServer(v_u_87.reward_name)))
                end), v_u_10.delay(0.25) }):expect()[1]
            warn("SUCCESS", v90)
            if v90 then
                p_u_78.claimed_star_rewards[v_u_87.reward_name] = true
                v_u_7.FX:play("GoldSparklePrize")
                p_u_78:trigger_claim_animation_for_frame(v88)
                if v79[v_u_87.reward_name] == v_u_6.get_prestige_reward(p_u_78.prestige) then
                    wait(1)
                    p_u_78:trigger_prestige()
                end
            end
        end
    end)
end
function v14.refresh_streaks(p_u_91)
    if p_u_91.longest_streak == 1 then
        p_u_91.longest_streak_frame.Streak.Text = p_u_91.longest_streak .. " DAY"
    else
        p_u_91.longest_streak_frame.Streak.Text = p_u_91.longest_streak .. " DAYS"
    end
    if p_u_91.longest_streak > 500 then
        p_u_91.longest_streak_frame.Streak.Text = p_u_91.longest_streak_frame.Streak.Text .. " \240\159\145\128"
        local v_u_92 = p_u_91.longest_streak_frame.Streak.Position
        p_u_91.vibration_thread = v_u_12.RenderStepped:Connect(function()
            local v93 = math.random(-1, 1)
            local v94 = math.random(-1, 1)
            local v95 = UDim2.new(v_u_92.X.Scale, v_u_92.X.Offset + v93, v_u_92.Y.Scale, v_u_92.Y.Offset + v94)
            p_u_91.longest_streak_frame.Streak.Position = v95
        end)
    end
    if p_u_91.streak == 1 then
        p_u_91.current_streak_frame.Streak.Text = p_u_91.streak .. " DAY"
    else
        p_u_91.current_streak_frame.Streak.Text = p_u_91.streak .. " DAYS"
    end
end
function v14.notify_backlogged_stars(p96)
    if not p96.already_awarded_backlogged_star_count then
        p96.already_awarded_backlogged_star_count = true
        if p96.awarded_backlogged_star_count then
            p96.UIManager.apps.DialogApp:dialog({
                ["text"] = "You\'ve been awarded " .. p96.awarded_backlogged_star_count .. " stars for your existing streak!",
                ["button"] = "Awesome!"
            })
        end
    end
end
function v14.clean_up_events(p97)
    if p97.vibration_thread then
        p97.vibration_thread:Disconnect()
        p97.vibration_thread = nil
    end
end
function v14.update_daily_login_data(p98)
    local v99 = v_u_2.get("daily_login_manager")
    p98.streak = v99.streak
    p98.longest_streak = v99.longest_streak
    p98.stars = v99.stars
    p98.claimed_star_rewards = v99.claimed_star_rewards
    p98.prestige = v99.prestige
    p98.awarded_backlogged_star_count = v99.awarded_backlogged_star_count
end
function v14.show(p_u_100)
    p_u_100.instance.Frame.Visible = true
    p_u_100:update_daily_login_data()
    p_u_100:refresh_contents()
    p_u_100:refresh_streaks()
    p_u_100:refresh_claim_button()
    p_u_100:notify_backlogged_stars()
    v_u_1("CoreUIInsetHelper").run_once_if_intersecting(p_u_100.exit_button, function(p101)
        p_u_100.exit_button.Position = p_u_100.exit_button.Position + UDim2.fromOffset(-p101 - 4, 34)
    end)
end
function v14.hide(p102)
    p102.instance.Frame.Visible = false
    p102:clean_up_events()
    p102:clear_contents()
end
function v14.start(p_u_103)
    p_u_103.header = p_u_103.instance.Frame.Header
    p_u_103.body = p_u_103.instance.Frame.Body
    p_u_103.star_count = p_u_103.header.StarCount.Amount
    p_u_103.exit_button = p_u_103.header.ExitButton
    p_u_103.scrolling_frame = p_u_103.body.ScrollingFrameContainer.ScrollingFrame
    p_u_103.longest_streak_frame = p_u_103.body.LongestStreak
    p_u_103.current_streak_frame = p_u_103.body.CurrentStreak
    p_u_103.reward_template = p_u_103.scrolling_frame.RewardTemplate
    p_u_103.claim_button_instance = p_u_103.body.ClaimButton
    p_u_103.completed_prestige_animation = false
    p_u_103.frame_colors = {}
    p_u_103.reward_frames = {}
    p_u_103.reward_template.Parent = nil
    p_u_103.UIManager.wrap(p_u_103.exit_button, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_103.UIManager.set_app_visibility(p_u_103.ClassName, false)
        end
    })
    local v104 = p_u_103.UIManager.wrap(p_u_103.claim_button_instance, "DepthButton")
    v104:start({
        ["mouse_button1_down"] = function()
            p_u_103:claim_all_rewards()
            p_u_103.claim_button_class:set_state("unpressable")
            local v105 = p_u_103.claim_button_instance
            v105.ImageTransparency = 0.5
            v105.Face.ImageTransparency = 0.5
            v105.Face.TextLabel.TextTransparency = 0.5
        end
    })
    p_u_103.claim_button_class = v104
    p_u_103.scrolling_frame.UIGridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        local v106 = p_u_103.scrolling_frame.UIGridLayout.AbsoluteContentSize
        p_u_103.scrolling_frame.CanvasSize = UDim2.fromOffset(0, v106.Y + 10)
    end)
    v_u_8.quick_watch({
        ["selection_parent"] = p_u_103.instance.Frame,
        ["default_selection"] = p_u_103.claim_button_instance,
        ["app_name"] = p_u_103.ClassName,
        ["exit_buttons"] = { p_u_103.exit_button }
    })
end
return v14