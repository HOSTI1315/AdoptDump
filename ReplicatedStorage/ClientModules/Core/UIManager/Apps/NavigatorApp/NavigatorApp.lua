--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.NavigatorApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v_u_1("ClientData")
local v_u_2 = v_u_1("PlatformM")
v_u_1("RouterClient")
local v_u_3 = v_u_1("XboxSupport")
local v4 = v_u_1("Class")
v_u_1("UIDB")
v_u_1("Signal")
v_u_1("TableUtil")
local v_u_5 = v_u_1("CriticalSection")
v_u_1("PolicyHelper")
local v_u_6 = v_u_1("package:Promise")
local v_u_7 = game:GetService("TweenService")
game:GetService("ContextActionService")
local v8 = v4("NavigatorApp", v_u_1("UIBaseApp"))
local v_u_9 = v_u_2.get_platform()
function v8.show(p_u_10)
    p_u_10.instance.Enabled = true
    for _, v11 in pairs(p_u_10.instance.Frame.Buttons:GetDescendants()) do
        if v11:IsA("ImageButton") and v11.Visible then
            v11.Rotation = 0
        end
    end
    if not p_u_10.interior_listening then
        v_u_1("InteriorsM").on_location_changed:Connect(function()
            if p_u_10.UIManager.is_visible("AvatarEditorApp") then
                p_u_10.UIManager.set_app_visibility("AvatarEditorApp")
                v_u_6.delay(0.5):andThen(function()
                    p_u_10:mobile_toggle_expansion(false)
                end)
            end
        end)
        p_u_10.interior_listening = true
    end
end
function v8.hide(p12)
    p12.instance.Enabled = false
    if p12.watch then
        p12.watch:deactivate()
    end
end
function v8.refresh(p13, _)
    local v14 = p13.UIManager.is_closed({
        "MainMenuApp",
        "AvatarEditorApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "PlayerSpectateApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "MinigameInGameApp",
        "FocusPetApp",
        "MockFocusPetApp",
        "LikesRewardApp"
    })
    if v_u_9 == v_u_2.platform.desktop or v_u_2.is_using_gamepad() then
        if p13.UIManager.apps.HouseEditorWrapperApp.editor_open and p13.UIManager.apps.HouseEditorWrapperApp.drawer_open then
            v14 = false
        end
    end
    p13:set_visibility(v14)
end
local function v_u_16(p_u_15)
    Instance.new("UIScale").Parent = p_u_15.Parent
    p_u_15.MouseEnter:Connect(function()
        v_u_7:Create(p_u_15, TweenInfo.new(0.25), {
            ["Rotation"] = -12 or 0
        }):Play()
    end)
    p_u_15.MouseLeave:Connect(function()
        v_u_7:Create(p_u_15, TweenInfo.new(0.25), {
            ["Rotation"] = nil or 0
        }):Play()
    end)
end
function v8.get_toggle_function(p_u_17, p_u_18)
    return function()
        p_u_17.UIManager.set_app_visibility(p_u_18)
        p_u_17:mobile_toggle_expansion(false)
    end
end
function v8.open_star_rewards(p19)
    p19.UIManager.set_app_visibility("DailyLoginApp", true)
    p19.UIManager.set_app_visibility("MilestoneRewardsApp", true)
end
function v8.mobile_toggle_expansion(p_u_20, p_u_21)
    if v_u_9 == v_u_2.platform.phone or v_u_9 == v_u_2.platform.tablet then
        p_u_20.expand_critical_section:run(function()
            if p_u_21 and p_u_20.expanded == p_u_21 then
                return
            elseif tick() - (p_u_20.last_expanded_time or 0) >= 0.2 then
                p_u_20.expanded = p_u_21 or not p_u_20.expanded
                p_u_20.last_expanded_time = tick()
                if p_u_20.expanded then
                    p_u_20.instance.Frame.Buttons.Visible = true
                end
                local v22 = game:GetService("TweenService"):Create(p_u_20.instance.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["Position"] = p_u_20.expanded and UDim2.new(1, 0, 0.5, 0) or UDim2.new(1, p_u_20.instance.Frame.Size.X.Offset + 8, 0.5, 0)
                })
                v22:Play()
                v22.Completed:wait()
                p_u_20.instance.Frame.Expand.Button.Arrow.Rotation = p_u_20.expanded and 180 or 0
                if not p_u_20.expanded then
                    p_u_20.instance.Frame.Buttons.Visible = false
                end
            end
        end)
    end
end
function v8._run_china_logic(p23)
    local v24 = require(game.ReplicatedStorage.ChinaPolicyService)
    assert(v24:IsReady())
    if v24:IsActive() then
        p23.instance.Frame.Buttons.Extras.Twitter.Visible = false
    end
end
function v8.start(p_u_25)
    for _, v26 in pairs(p_u_25.instance.Frame.Buttons:GetDescendants()) do
        if v26:IsA("ImageButton") and v26.Visible then
            v_u_16(v26)
        end
    end
    spawn(function()
        p_u_25:_run_china_logic()
    end)
    p_u_25.instance.Frame.Visible = true
    p_u_25.interior_listening = nil
    p_u_25.instance.Frame.Buttons.JournalFrame.Journal[v_u_2.mouse_down_or_click()]:connect(p_u_25:get_toggle_function("JournalApp"))
    p_u_25.instance.Frame.Buttons.ShopFrame.Shop[v_u_2.mouse_down_or_click()]:connect(p_u_25:get_toggle_function("ShopApp"))
    p_u_25.instance.Frame.Buttons.FriendsFrame.Friends[v_u_2.mouse_down_or_click()]:connect(p_u_25:get_toggle_function("FriendsApp"))
    p_u_25.instance.Frame.Buttons.AvatarFrame.Avatar[v_u_2.mouse_down_or_click()]:connect(function()
        p_u_25.UIManager.set_app_visibility("AvatarEditorApp")
        delay(0.5, function()
            p_u_25:mobile_toggle_expansion(false)
        end)
    end)
    p_u_25.instance.Frame.Buttons.Extras.Settings[v_u_2.mouse_down_or_click()]:connect(p_u_25:get_toggle_function("SettingsApp"))
    p_u_25.instance.Frame.Buttons.Extras.StarRewards[v_u_2.mouse_down_or_click()]:connect(function()
        p_u_25:open_star_rewards()
        p_u_25:mobile_toggle_expansion(false)
    end)
    p_u_25.instance.Frame.Buttons.Extras.Family[v_u_2.mouse_down_or_click()]:connect(p_u_25:get_toggle_function("FamilyApp"))
    p_u_25.instance.Frame.Buttons.Extras.Profile[v_u_2.mouse_down_or_click()]:Connect(function()
        if not p_u_25.UIManager.is_visible("PlayerProfileApp") or p_u_25.UIManager.apps.PlayerProfileApp.player ~= game.Players.LocalPlayer then
            p_u_25.UIManager.apps.PlayerProfileApp:open_player_profile_for_me()
        else
            p_u_25.UIManager.set_app_visibility("PlayerProfileApp", false)
        end
        p_u_25:mobile_toggle_expansion(false)
    end)
    if v_u_9 == v_u_2.platform.phone or v_u_9 == v_u_2.platform.tablet then
        p_u_25.instance.Frame.Position = UDim2.new(1, p_u_25.instance.Frame.Size.X.Offset + 8, 0.5, 0)
        p_u_25.instance.Frame.Buttons.Visible = false
        p_u_25.expanded = false
        p_u_25.expand_critical_section = v_u_5.new()
        p_u_25.instance.Frame.Expand.Button.MouseButton1Down:connect(function()
            p_u_25:mobile_toggle_expansion()
        end)
    end
    if v_u_9 == v_u_2.platform.tablet then
        local v27 = Instance.new("UIScale")
        v27.Scale = 1.2
        v27.Parent = p_u_25.instance.Frame.Expand
    end
    v_u_2.run({
        ["tablet"] = "phone",
        ["phone"] = function()
            local v28 = p_u_25.instance.Frame.Buttons
            for _, v29 in {
                v28.AvatarFrame,
                v28.FriendsFrame,
                v28.JournalFrame,
                v28.ShopFrame
            } do
                local v30 = v29:FindFirstChildWhichIsA("TextLabel", true)
                if v30 then
                    v30.Rotation = 0
                end
            end
        end
    })
    local v31 = p_u_25.instance.Frame:FindFirstChild("XboxButton")
    if v31 then
        p_u_25.console_icon = p_u_25.UIManager.wrap(v31, "GamepadIcon"):start({
            ["key"] = Enum.KeyCode.ButtonSelect
        })
        local v32 = v_u_3.quick_watch
        local v33 = {
            ["selection_parent"] = p_u_25.instance.Frame,
            ["default_selection"] = p_u_25.instance.Frame.Buttons.ShopFrame.Shop,
            ["app_name"] = p_u_25.ClassName,
            ["quick_open_button"] = Enum.KeyCode.ButtonSelect,
            ["next_selections"] = {
                [p_u_25.instance.Frame.Buttons.ShopFrame.Shop] = {
                    [Enum.KeyCode.DPadUp] = function()
                        return p_u_25.UIManager.apps.SharedLayoutsApp:select_next_icon()
                    end
                }
            },
            ["setup_button_actions"] = function()
                p_u_25.console_icon:update({
                    ["key"] = Enum.KeyCode.ButtonB
                })
                p_u_25.old_image_transparency = p_u_25.console_icon.instance.ImageTransparency
                p_u_25.console_icon.instance.ImageTransparency = 0
            end,
            ["teardown_button_actions"] = function()
                p_u_25.console_icon:update({
                    ["key"] = Enum.KeyCode.ButtonSelect
                })
                p_u_25.console_icon.instance.ImageTransparency = p_u_25.old_image_transparency
            end
        }
        p_u_25.watch = v32(v33)
    end
end
return v8