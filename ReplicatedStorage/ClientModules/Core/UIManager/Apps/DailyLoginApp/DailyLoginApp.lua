--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.DailyLoginApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("ScriptUtil")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("XboxSupport")
local v6 = v1("Class")
local v_u_7 = v1("ColorThemeManager")
local v_u_8 = v1("DailyLoginDB")
local v_u_9 = v1("InventoryDB")
local v_u_10 = v1("SoundPlayer")
v1("Debug").create_log()
local v_u_11 = game:GetService("TweenService")
local v_u_12 = game:GetService("RunService")
local v_u_13 = {
    ["day_2"] = {
        ["Image"] = "rbxassetid://2709125553",
        ["Size"] = UDim2.new(0, 93, 0, 86),
        ["Position"] = UDim2.new(0.5, 0, 0.5, 7)
    },
    ["day_3"] = {
        ["Image"] = "rbxassetid://2709125554",
        ["Size"] = UDim2.new(0, 100, 0, 91),
        ["Position"] = UDim2.new(0.5, 0, 0.5, -1)
    },
    ["day_4"] = {
        ["Image"] = "rbxassetid://2709126701",
        ["Size"] = UDim2.new(0, 109, 0, 90),
        ["Position"] = UDim2.new(0.5, 0, 0.5, -1)
    }
}
local v14 = v6("DailyLoginApp", v1("UIBaseApp"))
function v14.highlight_day_frame(p_u_15, p_u_16)
    local v_u_17 = p_u_16.FrameFill:Clone()
    v_u_17.Name = "FrameImageShine"
    v_u_17.ImageTransparency = 1
    v_u_17.ImageColor3 = Color3.fromRGB(255, 255, 255)
    v_u_17.Size = UDim2.new(1, 0, 1, 0)
    v_u_17.ZIndex = p_u_16.FrameImage.ZIndex + 1
    v_u_17.Parent = p_u_16
    spawn(function()
        while p_u_15.visible and (p_u_15.claimable and p_u_16.Parent ~= nil) do
            local v18 = v_u_17
            local v19 = tick() * 2
            v18.ImageTransparency = 1 - (math.sin(v19) / 2 + 0.5) * 0.6
            v_u_12.Heartbeat:Wait()
        end
        v_u_17.ImageTransparency = 1
    end)
end
function v14.animate_gift_day_frame(p_u_20, p_u_21)
    local v_u_22 = p_u_21.RadialPinstripe
    local v_u_23 = false
    local v_u_24 = 0
    spawn(function()
        while p_u_20.visible and p_u_21.Parent ~= nil do
            if p_u_21:IsDescendantOf(p_u_20.page_layout.CurrentPage) then
                if not v_u_23 then
                    v_u_23 = true
                    v_u_24 = tick() + 0.175
                end
                v_u_22.Rotation = v_u_24 < tick() and tick() * 10 % 360 or 0
            elseif v_u_23 then
                v_u_23 = false
                v_u_22.Rotation = 0
            end
            v_u_12.Heartbeat:Wait()
        end
    end)
end
function v14.clear_day_list(p25)
    for _, v26 in pairs(p25.day_frames) do
        v26:Destroy()
    end
    p25.day_frames = {}
end
function v14._convert_yellow_frame_to_purple(_, p27)
    local v28
    if v_u_7.get_theme_color() == "yellow" then
        v28 = v_u_7.lookup_specific_color("purple", "saturated")
        p27.StarsLabel.TextColor3 = v28
    else
        v28 = v_u_7.lookup_specific_color("yellow", "saturated")
    end
    p27.FrameImage.ImageColor3 = v28
    p27.RadialPinstripe.ImageColor3 = v28
end
function v14.refresh_day_list(p29)
    p29:clear_day_list()
    local v30 = (p29.streak - 1) % v_u_8.week_length
    if p29.streak < v_u_8.week_length then
        v30 = p29.streak - 1
    end
    for v31 = 1, v_u_8.month_length do
        local v32 = v31 - 1 + p29.streak - v30
        local v33 = p29.day_template:Clone()
        v33.Name = "Day" .. v32
        v33.LayoutOrder = v32
        local v34 = v_u_8.get_reward_for_day(v32)
        if v34.reward_type == "gift" then
            local v35 = v_u_9.gifts[v34.gift_type]
            v33.RadialPinstripe.Visible = true
            v33.RewardLabel.Text = v35.name
            v33.GiftIcon.Visible = true
            p29:animate_gift_day_frame(v33)
            p29:_convert_yellow_frame_to_purple(v33)
        elseif v34.reward_type == "money" then
            v33.RewardLabel.Text = "$" .. v34.amount
            v33.MoneyIcon.Visible = true
            local v36 = v_u_13["day_" .. v31 % v_u_8.week_length]
            if v36 then
                for v37, v38 in pairs(v36) do
                    v33.MoneyIcon[v37] = v38
                end
            end
        elseif v34.reward_type == "item" then
            local v39 = v_u_9[v34.item_category][v34.item_id]
            v33.RewardLabel.Text = v39.name
            v33.ItemIcon.Visible = true
            v33.ItemIcon.Image = v39.image
            p29:_convert_yellow_frame_to_purple(v33)
        end
        local v40 = v34.stars
        if v40 == 1 then
            v33.StarsLabel.Visible = false
        else
            v33.StarsLabel.Text = v40 .. " STARS"
        end
        if v32 == p29.streak then
            v33.DayLabel.Text = "TODAY"
            if p29.claimable then
                p29:highlight_day_frame(v33)
            else
                p29:mark_day_frame_as_claimed(v33)
            end
            p29.today_frame = v33
        else
            v33.DayLabel.Text = "DAY " .. v32
        end
        if v32 < p29.streak then
            p29:mark_day_frame_as_claimed(v33)
        end
        v33.Visible = true
        local v41 = p29.day_buckets
        local v42 = v31 / v_u_8.week_length
        v33.Parent = v41[math.ceil(v42)]
        p29.day_frames[v31] = v33
    end
end
function v14.mark_day_frame_as_claimed(_, p43)
    local v44 = p43.ClaimedFill
    v44.Visible = true
    v44.ImageTransparency = 0.4
    v44.ImageColor3 = p43.FrameImage.ImageColor3
end
function v14.trigger_claim_animation(p45)
    local v46 = p45.today_frame
    local v_u_47 = v46.ClaimedFill
    v_u_47.Visible = true
    v_u_47.ImageTransparency = 1
    v_u_47.Clipper.Size = UDim2.new(0, 0, 1, 0)
    v_u_47.Clipper.Checkmark.ImageTransparency = 1
    v_u_47.ImageColor3 = v46.FrameImage.ImageColor3
    v_u_11:Create(v_u_47, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["ImageTransparency"] = 0.4
    }):Play()
    delay(0.12, function()
        v_u_11:Create(v_u_47.Clipper, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }):Play()
        v_u_11:Create(v_u_47.Clipper.Checkmark, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["ImageTransparency"] = 0
        }):Play()
    end)
end
function v14.trigger_star_animation(p_u_48)
    local v49 = v_u_8.get_reward_for_day(p_u_48.streak)
    v_u_10.FX:play("GoldSparklePrize")
    local v_u_50 = {}
    local v51 = 0.25
    for _ = 1, v49.stars do
        local v52 = p_u_48.star_icon_template:Clone()
        local v53 = UDim2.fromOffset(p_u_48.today_frame.AbsolutePosition.X, p_u_48.today_frame.AbsolutePosition.Y) + UDim2.fromOffset(p_u_48.today_frame.AbsoluteSize.X / 2, p_u_48.today_frame.AbsoluteSize.Y / 2) + UDim2.fromOffset(0, 36)
        v52.AnchorPoint = Vector2.new(0.5, 0.5)
        v52.Position = v53
        v52.Size = UDim2.fromOffset(1, 1)
        v52.Visible = true
        v52.ZIndex = p_u_48.today_frame.ZIndex - 2
        v52.Parent = p_u_48.instance
        local v54 = UDim2.fromOffset(24, 24)
        if v49.stars == 1 then
            v54 = UDim2.fromOffset(48, 48)
        end
        v52:TweenSize(v54, "Out", "Back", 0.2)
        table.insert(v_u_50, v52)
        v_u_11:Create(v52, TweenInfo.new(0.15 + math.random() / 10, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            ["Position"] = v52.Position + UDim2.new(0, math.random(-40, 40), 0, -math.random(70, 110))
        }):Play()
    end
    if v49.stars == 1 then
        v51 = v51 + 0.1
    end
    delay(v51 + 0.5, function()
        local v_u_55 = p_u_48.milestones_button_instance
        local v_u_56 = v_u_55.Size
        local v_u_57 = v_u_11:Create(v_u_55, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            ["Size"] = v_u_56
        })
        for v_u_58, v_u_59 in pairs(v_u_50) do
            local v60 = TweenInfo.new(v_u_58 / 10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local v61 = p_u_48.milestones_button_instance.AbsolutePosition
            local v62 = p_u_48.milestones_button_instance.AbsoluteSize / 2
            local v63 = v_u_11:Create(v_u_59, v60, {
                ["Position"] = UDim2.fromOffset(v61.X + v62.X, v61.Y + v62.Y + 36)
            })
            v63.Completed:connect(function()
                v_u_59:Destroy()
                local v64 = v_u_10.FX:play("Pop")
                v64.PlaybackSpeed = v64.PlaybackSpeed + v_u_58 / 10
                v_u_55.Size = v_u_56 + UDim2.fromOffset(2, 2)
                v_u_57:Play()
            end)
            v63:Play()
        end
    end)
end
local function v_u_74(p65)
    local v66 = p65 / 86400
    local v67 = math.floor(v66)
    local v68 = (p65 - v67 * 86400) / 3600
    local v69 = math.floor(v68)
    local v70 = (p65 - v67 * 86400 - v69 * 3600) / 60
    local v71 = math.floor(v70)
    local v72 = p65 - v67 * 86400 - v69 * 3600 - v71 * 60
    local v73 = math.floor(v72)
    if v67 > 0 then
        return string.format("%dd %02dh %02dm %02ds", v67, v69, v71, v73)
    else
        return string.format("%02dh %02dm %02ds", v69, v71, v73)
    end
end
function v14.start_countdown_timer(p_u_75)
    local v76 = v_u_2.get("daily_login_manager")
    p_u_75.early_claim_explainer_button_instance.Visible = v76.is_early_redeem or p_u_75.time_until_next_streak > 86400
    if v76.claimable then
        if v76.is_early_redeem then
            p_u_75.tagline.Text = "You\226\128\153re early! You can claim tomorrow\226\128\153s reward now!"
        end
    else
        coroutine.wrap(function()
            while p_u_75.visible do
                if p_u_75.time_until_next_streak then
                    p_u_75.tagline.Text = "Next reward in " .. v_u_74(p_u_75.time_until_next_streak - (tick() - p_u_75.countdown_start))
                end
                wait(0.2)
            end
        end)()
    end
end
function v14.refresh_scroll_buttons(p77)
    local v78 = p77.page_layout.CurrentPage
    if v78 == p77.day_buckets[#p77.day_buckets] then
        p77.right_button:disable()
        p77.left_button:enable()
        return
    elseif v78 == p77.day_buckets[1] then
        p77.right_button:enable()
        p77.left_button:disable()
    else
        p77.right_button:enable()
        p77.left_button:enable()
    end
end
function v14.update_daily_login_data(p79)
    local v80 = v_u_2.get("daily_login_manager")
    p79.streak = v80.streak
    p79.claimable = v80.claimable
    p79.day_of_month = (p79.streak - 1) % v_u_8.month_length + 1
end
function v14.refresh_claim_button(p81)
    if p81.claimable then
        p81.claim_depth_button:set_state("normal")
        p81.claim_button_instance.Face.TextLabel.Text = "CLAIM!"
    else
        p81.claim_depth_button:set_state("cancel")
        p81.claim_button_instance.Face.TextLabel.Text = "CLOSE"
    end
end
function v14.show(p82)
    p82.instance.Enabled = true
    p82.instance.Frame.Visible = true
    p82:update_daily_login_data()
    p82:refresh_claim_button()
    p82:refresh_day_list()
    p82:refresh_scroll_buttons()
    p82:start_countdown_timer()
end
function v14.hide(p83)
    p83.instance.Enabled = false
    p83.instance.Frame.Visible = false
    p83:clear_day_list()
end
function v14.refresh(p84, p85)
    local v86 = p84.UIManager.is_closed({ "MilestoneRewardsApp" })
    if not p85[p84.ClassName] then
        v86 = false
    end
    p84:set_visibility(v86)
end
function v14.yield_until_app_closed(p87)
    p87.cont.yield()
end
function v14.start(p_u_88)
    p_u_88.body = p_u_88.instance.Frame.Body
    p_u_88.claim_button_instance = p_u_88.body.Buttons.ClaimButton
    p_u_88.milestones_button_instance = p_u_88.body.Buttons.MilestonesButton
    p_u_88.tagline = p_u_88.body.TaglineArea.Tagline
    p_u_88.early_claim_explainer_button_instance = p_u_88.body.TaglineArea.EarlyClaimExplainerButton
    p_u_88.days_list_container = p_u_88.body.DaysListContainer
    p_u_88.left_button_instance = p_u_88.days_list_container.LeftArrowButtonContainer.LeftArrowButton
    p_u_88.right_button_instance = p_u_88.days_list_container.RightArrowButtonContainer.RightArrowButton
    p_u_88.days_list = p_u_88.days_list_container.DaysList
    p_u_88.page_layout = p_u_88.days_list.UIPageLayout
    p_u_88.day_bucket_template = p_u_88.days_list.DayBucketTemplate
    p_u_88.day_template = p_u_88.day_bucket_template.DayTemplate
    p_u_88.day_template.Parent = nil
    p_u_88.day_bucket_template.Parent = nil
    p_u_88.star_icon_template = p_u_88.day_template.StarIcon
    p_u_88.star_icon_template.Parent = nil
    p_u_88.day_buckets = {}
    p_u_88.day_frames = {}
    p_u_88.can_sprout_currency = false
    p_u_88.cont = v_u_3.create_continue()
    local v89 = v_u_8.month_length / v_u_8.week_length
    for v90 = 1, math.ceil(v89) do
        local v91 = p_u_88.day_bucket_template:Clone()
        v91.LayoutOrder = v90
        v91.Name = "DayBucket" .. v90
        v91.Parent = p_u_88.days_list
        p_u_88.day_buckets[v90] = v91
    end
    local v92 = p_u_88.UIManager.wrap(p_u_88.claim_button_instance, "DepthButton")
    v92:start({
        ["mouse_button1_click"] = function()
            if p_u_88.claimable then
                coroutine.wrap(function()
                    p_u_88.can_sprout_currency = true
                    p_u_88.claimable = false
                    p_u_88:refresh_claim_button()
                    if p_u_88.page_layout.CurrentPage ~= p_u_88.day_buckets[1] then
                        p_u_88.page_layout:JumpToIndex(0)
                        wait(p_u_88.page_layout.TweenTime)
                    end
                    if p_u_88.visible then
                        p_u_88:trigger_claim_animation()
                        p_u_88:trigger_star_animation()
                    end
                end)()
                v_u_4.get("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
            else
                p_u_88.UIManager.set_app_visibility(p_u_88.ClassName, false)
                p_u_88.cont.continue()
                if v_u_8.get_reward_for_day(p_u_88.streak).reward_type == "money" and p_u_88.can_sprout_currency then
                    p_u_88.can_sprout_currency = false
                    p_u_88.UIManager.apps.SpecialEffectsApp:sprout_currency(game.Players.LocalPlayer, "small")
                end
            end
        end
    })
    p_u_88.claim_depth_button = v92
    p_u_88.UIManager.wrap(p_u_88.milestones_button_instance, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_88.UIManager.set_app_visibility("MilestoneRewardsApp", true)
        end
    })
    local function v94(p93)
        p93.InnerColor.ImageColor3 = v_u_7.lookup("medium_light")
    end
    local function v96(p95)
        p95.InnerColor.ImageColor3 = v_u_7.lookup("saturated")
    end
    local function v98(p97)
        p97.InnerColor.ImageColor3 = Color3.fromRGB(150, 150, 150)
    end
    local v99 = p_u_88.UIManager.wrap(p_u_88.left_button_instance, "CustomButton")
    p_u_88.left_button = v99
    v99:start({
        ["hover_render"] = v94,
        ["up_render"] = v96,
        ["disabled_render"] = v98,
        ["mouse_button1_down"] = function()
            p_u_88.page_layout:Previous()
        end
    })
    local v100 = p_u_88.UIManager.wrap(p_u_88.right_button_instance, "CustomButton")
    p_u_88.right_button = v100
    v100:start({
        ["hover_render"] = v94,
        ["up_render"] = v96,
        ["disabled_render"] = v98,
        ["mouse_button1_down"] = function()
            p_u_88.page_layout:Next()
        end
    })
    local v102 = {
        ["mouse_button1_click"] = function()
            local v101 = v_u_2.get("daily_login_manager").claimable and "You can claim tomorrow\226\128\153s reward early! It will take the usual amount of time for the next reward to be ready." or "You claimed your reward early! Tomorrow\226\128\153s reward is not ready yet."
            p_u_88.UIManager.apps.DialogApp:dialog({
                ["text"] = v101,
                ["button"] = "Okay"
            })
        end
    }
    p_u_88.UIManager.wrap(p_u_88.early_claim_explainer_button_instance, "DepthButton"):start(v102)
    p_u_88.page_layout.Stopped:Connect(function(_)
        p_u_88:refresh_scroll_buttons()
    end)
    v_u_2.register_callback_plus_existing("daily_login_manager", function(_, p103)
        if p103 then
            p_u_88.time_until_next_streak = p103.time_until_next_streak
            p_u_88.countdown_start = tick()
        end
    end)
    p_u_88.milestones_button_instance.NextSelectionUp = p_u_88.right_button_instance
    p_u_88.claim_button_instance.NextSelectionUp = p_u_88.left_button_instance
    p_u_88.left_button_instance.NextSelectionRight = p_u_88.right_button_instance
    p_u_88.left_button_instance.NextSelectionDown = p_u_88.claim_button_instance
    p_u_88.right_button_instance.NextSelectionLeft = p_u_88.left_button_instance
    p_u_88.right_button_instance.NextSelectionDown = p_u_88.milestones_button_instance
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_88.instance.Frame,
        ["default_selection"] = p_u_88.claim_button_instance,
        ["app_name"] = p_u_88.ClassName
    })
end
return v14