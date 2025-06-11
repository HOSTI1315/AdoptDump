--// ReplicatedStorage.SharedModules.ContentPacks.SocialStones2025.UIApps.SocialStonesApp (ModuleScript)

local v_u_1 = game:GetService("SocialService")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v2("Class")
local v_u_4 = v2("ClientData")
local v_u_5 = v2("ColorThemeManager")
local v_u_6 = v2("FormatHelper")
local v_u_7 = v2("FriendsClient")
local v_u_8 = v2("LiveOpsTime")
local v_u_9 = v2("Maid")
local v_u_10 = v2("PlatformM")
local v_u_11 = v2("SharedConstants")
local v_u_12 = v2("package:Promise")
local v_u_13 = v2("package:Sift")
local v14 = v3("SocialStonesApp", v2("UIBaseApp"))
local v_u_15 = v_u_11.social_stones.max_earned_per_ailment
local v_u_16 = {
    ["FriendCount"] = "BackgroundColor3",
    ["Equals"] = "TextColor3",
    ["Plus"] = "TextColor3",
    ["NoFriends"] = "TextColor3",
    ["EarnMore"] = "TextColor3",
    ["Timer"] = "TextColor3"
}
function v14.show(_) end
function v14.hide(_) end
function v14._update_timer(p17)
    local v18 = v_u_4.get("social_stones_manager")
    local v19
    if v18 then
        v19 = v18.next_earn_time
    else
        v19 = nil
    end
    if not v19 or v19 < v_u_8.now() then
        return true
    end
    local v20 = v_u_6.get_time_breakdown
    local v21 = v19 - v_u_8.now()
    local v22 = v20((math.max(0, v21)))
    p17.timer.Text = ("%2d:%02d:%02d"):format(v22.hours, v22.minutes, v22.seconds)
    return false
end
function v14._update(p_u_23)
    local v24 = v_u_7.get_friends():expect().server
    local v25 = v_u_13.Dictionary.count(v24)
    local v26 = v_u_15
    local v27 = math.min(v25, v26)
    local v28 = v_u_4.get("social_stones_manager")
    local v29
    if v28 then
        v29 = v28.next_earn_time
    else
        v29 = nil
    end
    if not v29 then
        p_u_23.maid:DoCleaning()
    end
    p_u_23.formula.Visible = false
    p_u_23.no_friends.Visible = false
    p_u_23.countdown.Visible = false
    if v29 and v_u_8.now() < v29 then
        p_u_23:_update_timer()
        p_u_23.maid.timer = v_u_12.new(function(p30, _, p31)
            while not p31() do
                task.wait(1)
                if p_u_23:_update_timer() then
                    break
                end
            end
            p30()
        end):andThen(function()
            p_u_23:_update()
        end)
        p_u_23.countdown.Visible = true
        return
    elseif v25 > 0 then
        p_u_23.friend_count.Text = v25
        p_u_23.reward.Text = v27
        p_u_23.formula.Visible = true
    else
        p_u_23.no_friends.Visible = true
    end
end
function v14.show_dialog(p32)
    if p32.showing_dialog then
        return
    else
        p32.showing_dialog = true
        local v33 = p32.formula:Clone()
        for v34, v35 in v_u_16 do
            local v36 = v33:FindFirstChild(v34, true)
            if v36 then
                v36[v35] = v_u_5.lookup("saturated")
            end
        end
        local v37 = {}
        for v38 = 1, v_u_11.social_stones.max_earned_per_ailment do
            local v39 = v33:Clone()
            v39.Visible = true
            local v40 = v39.Frame.FriendCount.TextLabel
            local v41
            if v38 == v_u_11.social_stones.max_earned_per_ailment then
                v41 = ("%*+"):format(v38)
            else
                v41 = v38
            end
            v40.Text = v41
            v39.Frame.Reward.Icon.TextLabel.Text = v38
            table.insert(v37, v39)
        end
        local v42 = Instance.new("Frame")
        v42.BackgroundTransparency = 1
        v42.Size = UDim2.new(1, 0, 0, 25)
        local v43 = p32.UIManager.apps.DialogApp:dialog({
            ["dialog_type"] = "ScrollingDialog",
            ["button"] = p32.can_invite and "Invite Friends" or "Friends",
            ["exit_button"] = true,
            ["elements"] = v_u_13.List.join({
                {
                    ["font"] = Enum.Font.FredokaOne,
                    ["text"] = "Play with friends to earn Social Stones!",
                    ["size"] = 34
                },
                {
                    ["font"] = Enum.Font.FredokaOne,
                    ["text"] = ("When you complete any orange pet need, earn Social Stones for every friend you are playing with, up to %* per need!"):format(v_u_11.social_stones.max_earned_per_ailment),
                    ["size"] = 24,
                    ["padding"] = 20
                }
            }, v37, { v42 })
        })
        p32.showing_dialog = false
        if v43 then
            if p32.can_invite then
                local v44 = Instance.new("ExperienceInviteOptions")
                v44.InviteMessageId = "c6fe3b47-f329-5446-9039-af5c89e06feb"
                v_u_1:PromptGameInvite(game.Players.LocalPlayer, v44)
                p32.UIManager.set_app_visibility("FriendsApp", true)
            end
        end
    end
end
function v14.start(p_u_45)
    p_u_45.main = p_u_45.instance.SocialStones
    p_u_45.main.Parent = nil
    p_u_45.formula = p_u_45.main.Formula
    p_u_45.friend_count = p_u_45.formula.Frame.FriendCount.TextLabel
    p_u_45.reward = p_u_45.formula.Frame.Reward.Icon.TextLabel
    p_u_45.no_friends = p_u_45.main.NoFriends
    p_u_45.countdown = p_u_45.main.Countdown
    p_u_45.timer = p_u_45.countdown.Timer
    p_u_45.reward.Parent.Image = v_u_11.social_stones.image
    p_u_45.reward.UIStroke.Color = v_u_11.social_stones.text_stroke_color
    for v46, v47 in v_u_16 do
        p_u_45.main:FindFirstChild(v46, true)[v47] = v_u_11.social_stones.indicator_color
    end
    p_u_45.maid = v_u_9.new()
    p_u_45.showing_dialog = false
    p_u_45:_update()
    v_u_7.get_friends_in_server_changed_signal():Connect(function()
        p_u_45:_update()
    end)
    v_u_4.register_callback("social_stones_manager", function()
        p_u_45:_update()
    end)
    p_u_45.can_invite = false
    task.spawn(function()
        p_u_45.can_invite = v_u_1:CanSendGameInviteAsync(game.Players.LocalPlayer)
    end)
    task.defer(function()
        local v_u_48 = p_u_45.UIManager.apps.SocialStonesIndicatorApp
        p_u_45.main.Parent = v_u_48.instance.CurrencyIndicator
        local v49 = {
            ["phone"] = function()
                p_u_45.main.UIScale.Scale = 0.75
            end,
            ["desktop"] = function()
                v_u_48:connect_hover()
            end
        }
        v_u_10.run(v49)
        v_u_48:connect_click(function()
            p_u_45:show_dialog()
        end)
    end)
end
return v14