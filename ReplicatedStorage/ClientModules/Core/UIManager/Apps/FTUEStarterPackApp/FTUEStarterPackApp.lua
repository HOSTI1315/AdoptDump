--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FTUEStarterPackApp (ModuleScript)

local v_u_1 = game:GetService("TweenService")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v2("Class")
local v_u_4 = v2("ClientData")
local v_u_5 = v2("FormatHelper")
local v_u_6 = v2("GamepassDB")
local v_u_7 = v2("LiveOpsTime")
local v_u_8 = v2("PlatformM")
local v_u_9 = v2("RouterClient")
local v_u_10 = v2("SharedConstants")
local v_u_11 = v2("SoundPlayer")
local v_u_12 = v2("new:StarterPackAB")
local v_u_13 = v2("TranslationHelper")
local v_u_14 = v2("TweenHelper")
local v_u_15 = v2("XboxSupport")
local v_u_16 = v2("package:Promise")
local v_u_17 = v_u_8.get_platform()
local v18 = v3("FTUEStarterPackApp", v2("UIBaseApp"))
function v18._init_countdown(p_u_19)
    task.defer(function()
        p_u_19.UIManager.wait_for_initialization()
        local v20 = v_u_4.get("ftue_2022_starter_pack_manager")
        if v20 then
            if p_u_19.icon_container then
                local v21 = p_u_19.icon.Backing.TimerLabel
                local v22 = p_u_19.splash:FindFirstChild("ConfirmButton")
                while true do
                    local v23 = v_u_4.get("ftue_2022_starter_pack_manager")
                    if not v23 then
                        break
                    end
                    local v24 = v23.starter_pack_timestamp
                    local v25 = v_u_10.ftue_starter_pack.expiry_time
                    if v24 then
                        v25 = v24 + v25 - v_u_7.now()
                    end
                    if v23.starter_pack_purchased or v25 < 0 then
                        p_u_19.UIManager.set_app_visibility(p_u_19.ClassName, false)
                        p_u_19.UIManager.apps.ShopApp:set_premium_item_visible(v_u_12:get_value("product_key"), false)
                    else
                        local v26 = v_u_5.get_time_breakdown((math.max(0, v25)));
                        ("%02d:%02d:%02d"):format(v26.hours, v26.minutes, v26.seconds)
                        local v27
                        if v26.days > 0 then
                            local v28 = v26.days == 1 and "DAY" or "DAYS"
                            v27 = ("%01d %s"):format(v26.days, v28)
                        else
                            local v29 = v26.hours
                            v27 = (#tostring(v29) == 1 and "%01d:%02d:%02d" or "%02d:%02d:%02d"):format(v26.hours, v26.minutes, v26.seconds)
                        end
                        if p_u_19.splash and p_u_19.asset_kind == "Default" then
                            v22.Face.Labels.Bottom.Text = ("OFFER ENDS IN %s"):format(v27)
                        end
                        v21.Text = v27
                        p_u_19.UIManager.set_app_visibility(p_u_19.ClassName, true)
                        p_u_19.UIManager.apps.ShopApp:set_premium_item_visible(v_u_12:get_value("product_key"), true)
                    end
                    task.wait(1)
                end
            elseif not v20.starter_pack_purchased then
                p_u_19.UIManager.set_app_visibility(p_u_19.ClassName, true)
            end
        else
            return
        end
    end)
end
function v18._init_pinstripe_animation(p30)
    if p30.icon_container then
        v_u_1:Create(p30.icon.RadialPinstripe, v_u_14.tween_info({
            ["time"] = 48,
            ["easing_style"] = Enum.EasingStyle.Linear,
            ["repeat_count"] = -1
        }), {
            ["Rotation"] = 360
        }):Play()
    end
end
function v18._init_hover_enlarge(p31)
    if p31.icon_container then
        if v_u_17 == v_u_8.platform.desktop then
            local v_u_32 = p31.icon.Backing.BobUIScale
            p31.icon.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(v_u_32, TweenInfo.new(0.1), {
                    ["Scale"] = 1.15
                }):Play()
            end)
            p31.icon.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(v_u_32, TweenInfo.new(0.1), {
                    ["Scale"] = 1
                }):Play()
            end)
        end
    end
end
function v18.show(p33)
    p33.instance.Enabled = true
end
function v18.hide(p34)
    p34.instance.Enabled = false
end
function v18.is_icon_visible(p35)
    return p35.instance.Enabled
end
function v18.refresh(p36, p37)
    local v38 = p36.UIManager.is_closed({
        "MainMenuApp",
        "RoleplayPayApp",
        "AvatarEditorApp",
        "PlayerSpectateApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "FocusPetApp",
        "LikesRewardApp"
    })
    if not p37[p36.ClassName] then
        v38 = false
    end
    if not p36.show_starter_pack then
        v38 = false
    end
    p36:set_visibility(v38)
end
function v18.request_prompt_promise(_, p39)
    local v40 = v_u_4.get("ftue_2022_starter_pack_manager")
    local v41 = v40.starter_pack_timestamp
    if v40.starter_pack_purchased then
        return v_u_16.resolve(false)
    elseif v41 then
        return v_u_16.resolve(not p39)
    else
        return v_u_16.new(function(p42)
            p42((v_u_9.get("ShopAPI/PromptStarterPack"):InvokeServer()))
        end):catch(function()
            return false
        end)
    end
end
function v18.try_show(p_u_43, p44)
    return p_u_43:request_prompt_promise(p44):andThen(function(p45)
        if p45 then
            if not p_u_43.splash.Visible then
                local v46 = p_u_43.splash:FindFirstChild("ConfirmButton", true):FindFirstChild("Star")
                if v46 and v46:FindFirstChild("TextLabel") then
                    local v47 = v46.TextLabel.Text
                    local v48 = {
                        ["percent"] = tonumber(v47:match("(%d-)%%"))
                    }
                    local v49 = v_u_13.format_by_key("ui.summer_2024_w1.percent_off_label", v48):gsub("(.?%d-)%s?%%%s?(.*)", "<font size=\"24\">%1%%</font>\n%2")
                    v46.TextLabel.Text = v49
                end
                p_u_43.splash.Visible = true
                v_u_11.FX:play("Pop")
            end
            return v_u_16.fromEvent(p_u_43.splash:GetPropertyChangedSignal("Visible"), function()
                return p_u_43.splash.Visible == false
            end)
        end
    end)
end
function v18.start(p_u_50)
    p_u_50.asset_kind = v_u_12:get_value("asset_kind")
    p_u_50.product_key = v_u_12:get_value("product_key")
    p_u_50.show_starter_pack = v_u_12:get_value("show_starter_pack")
    if p_u_50.show_starter_pack then
        p_u_50.splash = p_u_50.instance.Popups[p_u_50.asset_kind]
        p_u_50.splash.Visible = false
        if v_u_12:get_value("limited_time") then
            p_u_50.icon_container = p_u_50.instance.Icons[p_u_50.asset_kind]
            p_u_50.icon = p_u_50.icon_container.Icon
        end
        v_u_8.run({
            ["phone"] = function()
                local v51 = Instance.new("UIScale")
                v51.Scale = 0.75
                v51.Parent = p_u_50.splash
                if p_u_50.icon_container then
                    local v52 = Instance.new("UIScale")
                    v52.Scale = 0.75
                    v52.Parent = p_u_50.icon_container
                end
            end
        })
        p_u_50.UIManager.wrap(p_u_50.splash:FindFirstChild("ExitButton", true), "DepthButton"):start({
            ["mouse_button1_click"] = function()
                p_u_50.splash.Visible = false
            end
        })
        local v54 = {
            ["mouse_button1_click"] = function()
                v_u_11.FX:play("BambooButton")
                local v53 = v_u_6[p_u_50.product_key] ~= nil
                v_u_9.get(v53 and "ProductsAPI/PromptGamepassPurchase" or "ProductsAPI/PromptProductPurchase"):FireServer(p_u_50.product_key)
                p_u_50.splash.Visible = false
            end
        }
        p_u_50.UIManager.wrap(p_u_50.splash:FindFirstChild("ConfirmButton", true), "DepthButton"):start(v54)
        p_u_50:_init_countdown()
        if p_u_50.icon_container then
            p_u_50:_init_pinstripe_animation()
            p_u_50:_init_hover_enlarge()
            local function v55()
                if not v_u_4.get("ftue_2022_starter_pack_manager").starter_pack_purchased then
                    p_u_50:try_show():expect()
                end
            end
            p_u_50.icon[v_u_8.mouse_down_or_click()]:Connect(v55)
            p_u_50.icon_container.LayoutOrder = 4000
            p_u_50.icon_container.Visible = true
            p_u_50.UIManager.apps.SharedLayoutsApp:register_to_topbar(p_u_50.icon_container, {
                ["padding_top"] = UDim.new(0, 6),
                ["selection_instance"] = p_u_50.icon,
                ["on_press"] = v55,
                ["on_refresh"] = function()
                    local v56 = p_u_50.UIManager.apps.SharedLayoutsApp.topbar:is_clipping(p_u_50.icon_container)
                    p_u_50.icon.Visible = not v56
                end
            })
            p_u_50.watch = v_u_15.quick_watch({
                ["selection_parent"] = p_u_50.splash,
                ["default_selection"] = p_u_50.splash:FindFirstChild("ConfirmButton", true),
                ["app_name"] = p_u_50.ClassName,
                ["exit_buttons"] = { p_u_50.splash:FindFirstChild("ExitButton", true) },
                ["close_override"] = function()
                    p_u_50.splash.Visible = false
                    return false
                end
            })
        end
    end
end
return v18