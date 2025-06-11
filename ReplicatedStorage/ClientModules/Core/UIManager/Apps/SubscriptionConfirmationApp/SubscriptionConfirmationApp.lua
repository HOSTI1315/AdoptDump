--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.SubscriptionConfirmationApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("SoundPlayer")
local v_u_4 = v1("XboxSupport")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("TranslationHelper")
local v_u_7 = v1("new:SubscriptionsDB")
local v8 = v2("SubscriptionConfirmationApp", v1("UIBaseApp"))
function v8.show(p9)
    p9.instance.Enabled = true
end
function v8.hide(p10)
    p10.instance.Enabled = false
    p10.displayed_subscription_kind = nil
    p10.closed_callback = nil
end
function v8.is_icon_visible(p11)
    return p11.instance.Enabled
end
function v8.refresh(p12, p13)
    local v14 = p12.UIManager.is_closed({
        "RoleplayPayApp",
        "AvatarEditorApp",
        "PlayerSpectateApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp"
    })
    if not p13[p12.ClassName] then
        v14 = false
    end
    p12:set_visibility(v14)
end
function v8.view_details(p15, p16)
    if p16 then
        local v17 = v_u_7[p16]
        if v17 then
            if v17.detailed_reward_list then
                local v18 = v17.detailed_reward_list.persistent
                local v19 = v17.detailed_reward_list.periodically
                local v20 = v17.detailed_reward_list.first_time
                local v_u_21 = {}
                local function v29(p22, p23, p24, p25)
                    if p25 then
                        p22 = v_u_6.translate(game, p22)
                    end
                    if not p23 then
                        p22 = "- " .. p22
                    end
                    local v26 = v_u_21
                    local v27 = {
                        ["text"] = p22,
                        ["size"] = p24 or 28
                    }
                    local v28
                    if p23 then
                        v28 = nil
                    else
                        v28 = Enum.TextXAlignment.Left
                    end
                    v27.text_x_alignment = v28
                    v27.already_translated = not p25
                    table.insert(v26, v27)
                end
                if v19 then
                    v29("MONTHLY BENEFITS:", true, 36, true)
                    for _, v30 in v19 do
                        v29(v30)
                    end
                end
                if v18 then
                    if v19 then
                        v29("\n", true, 24)
                    end
                    v29("SUBSCRIPTION PERKS:", true, 36, true)
                    for _, v31 in v18 do
                        v29(v31)
                    end
                end
                if v20 then
                    if v19 or v18 then
                        v29("\n", true, 24)
                    end
                    v29("FIRST TIME SUBSCRIBER BONUS:", true, 36, true)
                    for _, v32 in v20 do
                        v29(v32)
                    end
                end
                p15.UIManager.apps.DialogApp:dialog({
                    ["dialog_type"] = "ScrollingDialog",
                    ["labels"] = v_u_21,
                    ["button"] = "Cool!"
                })
            end
        else
            return
        end
    else
        return
    end
end
function v8.display_subscription(p33, p34, p35)
    local v36 = v_u_7[p34]
    if v36 then
        local v37 = v36.product_info
        if v37 then
            v_u_3.FX:play("Pop")
            p33.displayed_subscription_kind = p34
            p33.closed_callback = p35
            p33.item_list.Text = table.concat(v36.reward_list or {}, "\n")
            p33.item_list.Size = UDim2.new(1, 0, 0, #v36.reward_list * 20)
            p33.splash.ConfirmButton.Face.Labels.Price.Text = ("%*%*"):format(v37.DisplayPrice, v37.DisplaySubscriptionPeriod)
            p33.splash.Benefits.ViewDetails.Visible = v36.detailed_reward_list ~= nil
            p33.UIManager.set_app_visibility(p33.ClassName, true)
        end
    else
        return
    end
end
function v8.start(p_u_38)
    p_u_38.splash = p_u_38.instance.Splash
    p_u_38.background = p_u_38.splash.Background
    p_u_38.item_list = p_u_38.splash.Benefits.ItemList
    p_u_38.displayed_subscription_kind = nil
    p_u_38.UIManager.wrap(p_u_38.splash.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            local v39 = p_u_38.closed_callback
            p_u_38.UIManager.set_app_visibility(p_u_38.ClassName, false)
            if v39 then
                v39()
            end
        end
    })
    local v40 = {
        ["mouse_button1_click"] = function()
            v_u_3.FX:play("BambooButton")
            v_u_5.get("ProductsAPI/PromptSubscriptionPurchase"):FireServer(p_u_38.displayed_subscription_kind)
            p_u_38.UIManager.set_app_visibility(p_u_38.ClassName, false)
        end
    }
    p_u_38.UIManager.wrap(p_u_38.splash.ConfirmButton, "DepthButton"):start(v40)
    p_u_38.UIManager.wrap(p_u_38.splash.Benefits.ViewDetails, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_38:view_details(p_u_38.displayed_subscription_kind)
        end
    })
    p_u_38.watch = v_u_4.quick_watch({
        ["selection_parent"] = p_u_38.instance,
        ["default_selection"] = p_u_38.splash.ConfirmButton,
        ["app_name"] = p_u_38.ClassName,
        ["exit_buttons"] = { p_u_38.splash.ExitButton },
        ["close_override"] = function()
            if p_u_38.closed_callback then
                p_u_38.closed_callback()
            end
            return true
        end
    })
end
return v8