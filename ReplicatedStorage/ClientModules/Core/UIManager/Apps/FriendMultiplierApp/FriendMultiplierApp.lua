--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FriendMultiplierApp (ModuleScript)

local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("SocialService")
local v3 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v4 = v3("Class")
local v_u_5 = v3("PlatformM")
local v_u_6 = v3("TimeZoneHelper")
v3("FriendsClient")
local v_u_7 = v3("LiveOpsTime")
local v_u_8 = v3("CloudValues")
local v_u_9 = v3("package:Sift")
local v_u_10 = v_u_5.get_platform()
local v11 = v4("FriendMultiplierApp", v3("UIBaseApp"))
function v11.is_multiplier_active(_)
    local v12 = v_u_8:getValue("friend_multiplier", "enabled")
    if v12 then
        v12 = v_u_8:getValue("friend_multiplier", "schedule")
    end
    local v13 = v_u_7.now()
    if not v12 then
        return false
    end
    local v14 = v12.start_time
    local v15 = v12.expiration_time
    local v16 = v_u_6.from_timezone_datetime("PST", v14.year, v14.month, v14.day, v14.hour, v14.minute).UnixTimestamp
    local v17 = v_u_6.from_timezone_datetime("PST", v15.year, v15.month, v15.day, v15.hour, v15.minute).UnixTimestamp
    local v18
    if v16 <= v13 then
        v18 = v13 < v17
    else
        v18 = false
    end
    return v18
end
function v11.show(p19)
    p19.instance.Enabled = true
end
function v11.hide(p20)
    p20.instance.Enabled = false
end
function v11.refresh(_) end
function v11.set_visibility(p21, p22)
    local v23 = p22 and (p21.UIManager.is_closed({
        "MainMenuApp",
        "RoleplayPayApp",
        "AvatarEditorApp",
        "PlayerSpectateApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "FocusPetApp",
        "FriendsApp",
        "LikesRewardApp"
    }) and not p21.showing_dialog)
    if v23 then
        v23 = p21:is_multiplier_active()
    end
    if p21.UIManager.apps.HideGuiApp:should_hide_app(p21.ClassName) then
        v23 = false
    end
    p21.enabled = v23
    if v23 then
        p21:show()
    else
        p21:hide()
    end
end
function v11.show_dialog(p24)
    if p24.showing_dialog then
        return
    else
        p24.showing_dialog = true
        local v25 = Instance.new("Frame")
        v25.BackgroundTransparency = 1
        v25.Size = UDim2.new(1, 0, 0, 25)
        local v26 = p24.UIManager.apps.DialogApp
        local v27 = {
            ["dialog_type"] = "ScrollingDialog",
            ["button"] = p24.can_invite and "Invite Friends" or "Friends",
            ["exit_button"] = true
        }
        local v28 = {
            {
                ["font"] = Enum.Font.FredokaOne,
                ["text"] = "Play with friends to earn 1.25x Bucks!",
                ["size"] = 34
            },
            v25
        }
        v27.elements = v_u_9.List.join(v28, { v25 })
        local v29 = v26:dialog(v27)
        p24.showing_dialog = false
        p24:set_visibility(true)
        if v29 then
            if p24.can_invite then
                local v30 = Instance.new("ExperienceInviteOptions")
                v30.InviteMessageId = "64058659-8b28-024d-b317-7c7ae27e45b1"
                v_u_2:PromptGameInvite(game.Players.LocalPlayer, v30)
                p24.UIManager.set_app_visibility("FriendsApp", true)
            end
        end
    end
end
function v11.start(p_u_31)
    p_u_31.enabled = false
    p_u_31.container = p_u_31.instance.Container
    task.defer(function()
        if v_u_5.get_platform() == v_u_5.platform.desktop then
            p_u_31.container.UIScale.Scale = 1
        else
            p_u_31.container.UIScale.Scale = 0.75
        end
    end)
    p_u_31.container.MultiplierText.Text = "GET 1.25x"
    p_u_31.container.LayoutOrder = 1500
    p_u_31.can_invite = false
    task.spawn(function()
        p_u_31.can_invite = v_u_2:CanSendGameInviteAsync(game.Players.LocalPlayer)
    end)
    if v_u_10 == v_u_5.platform.desktop then
        p_u_31.container.MouseEnter:Connect(function()
            v_u_1:Create(p_u_31.container.UIScale, TweenInfo.new(0.1), {
                ["Scale"] = 1.15
            }):Play()
        end)
        p_u_31.container.MouseLeave:Connect(function()
            v_u_1:Create(p_u_31.container.UIScale, TweenInfo.new(0.1), {
                ["Scale"] = 1
            }):Play()
        end)
    end
    p_u_31.UIManager.apps.SharedLayoutsApp:register_to_topbar(p_u_31.container, {
        ["padding_top"] = UDim.new(0, 6),
        ["on_press"] = function()
            p_u_31:show_dialog()
            if v_u_10 == v_u_5.platform.desktop then
                v_u_1:Create(p_u_31.container.UIScale, TweenInfo.new(0.1), {
                    ["Scale"] = 1
                }):Play()
            end
        end
    })
end
return v11