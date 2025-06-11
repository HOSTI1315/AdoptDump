--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ShopApp (ModuleScript)

local v_u_1 = game:GetService("Players")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("ClientData")
local v_u_4 = v_u_2("PlatformM")
local v_u_5 = v_u_2("RouterClient")
local v_u_6 = v_u_2("XboxSupport")
local v7 = v_u_2("Class")
local v_u_8 = v_u_2("TableUtil")
local v_u_9 = v_u_2("GamepassDB")
local v_u_10 = v_u_2("DeveloperProductDB")
local v_u_11 = v_u_2("CostDiscountHelper")
local v_u_12 = v_u_2("ShopAppDetailsClient")
local v_u_13 = v_u_2("EggEvent")
local v_u_14 = v_u_2("ProductImages")
local v15 = v_u_2("new:StarterPackAB")
local v_u_16 = v_u_2("LiveOpsTime")
local v_u_17 = v_u_2("FormatHelper")
local v_u_18 = v_u_2("TranslationHelper")
local v_u_19 = v_u_2("new:SubscriptionsDB")
local v_u_20 = v_u_2("new:SubscriptionsClient")
local v21 = v_u_2("package:Sift")
local v_u_22 = v_u_2("package:t")
local v_u_23 = v_u_2("package:Promise")
local v_u_24 = v_u_2("new:ForSaleManager")
local v_u_25 = v_u_2("ClientGamepassHelper")
local v_u_26 = v_u_2("ClientDeveloperProductHelper")
local v27 = v15:get_value("product_key")
local v28 = {}
if v27 == "random_pets_2022_winged_horse" then
    v27 = nil
end
__set_list(v28, 1, {v27})
local v_u_29 = {
    "rain_2023_golden_plantain",
    "snow_2022_golden_clam",
    "fall_2022_golden_wheat_stalk",
    "mud_ball"
}
local v_u_30 = {
    "butterfly_2025_goldenrod_flower",
    "camping_2025_maple_leaf_treat",
    "spring_2025_dance_arcade_stand",
    "ice_cream_2025_snow_cone_stand",
    "gifthat_november_2024_hippogriff",
    "tutorial_2025_2x_pet_certificate",
    "subscription_2024_2x_pet_certificate",
    "jokes_2024_homeing_rocket",
    "soccer_2024_soccer_house_gamepass",
    "fossil_isle_bundle_gamepass",
    "stickers_2024_premium_pack",
    "easter_2024_classic_trade_stand",
    "hamstertime_2024_golden_corn",
    "beach_2024_nautilus",
    "mega_cars_2024_mega_car_pack",
    "kiwi_2023_toyshop_house",
    "lures_2023_cozy_home_lure",
    "expandable_houses_2023_luxury_house",
    "school_hospital_2023_gamepass",
    "paint_2023_colored_hair_spray_sealer",
    "sky_ux_2023_cuddly_candle",
    "springfest_2023_regal_carriages",
    "camping_2023_firefly",
    "wings_2022_premium_wing_chest",
    "tutorial_2025_royal_palace_spaniel",
    "royal_palace_2022_spaniel",
    "golden_goldfish",
    "space_bundle_2022",
    "random_pets_2022_winged_horse",
    "woodland_2022_camping_kit",
    "taxi_driver_bundle",
    "ultra_car_pack",
    "diamond_lavender",
    "pet_flying_potion",
    "pet_riding_potion",
    "royal_butterfly_bundle",
    "honey",
    "pirates_costume",
    "magic_house_door",
    "sloth",
    "modern_mansion",
    "hotdog_stand",
    "lemonade_stand",
    "celebrity",
    "millionaire",
    "starterpack",
    "vip",
    "premium_plots",
    "candy_cannon"
}
local v_u_31 = v21.List.concat(v28, { "pet_care" }, v_u_29, v_u_30)
local v_u_32 = {
    ["Default"] = {},
    ["Desert"] = { "mud_ball" },
    ["Snow"] = { "snow_2022_golden_clam" },
    ["Fall"] = { "fall_2022_golden_wheat_stalk" },
    ["Rain"] = { "rain_2023_golden_plantain" }
}
local v_u_33 = v21.Set.fromList(v_u_31)
local v_u_34 = v_u_2("Debug").create_log()
local v_u_35 = v_u_18.get_translator_for_player(v_u_1.LocalPlayer)
local v_u_36 = v_u_4.get_platform() == v_u_4.platform.phone and true or v_u_4.get_platform() == v_u_4.platform.tablet
local v37 = v7("ShopApp", v_u_2("UIBaseApp"))
local function v_u_41(p38, p39, p40)
    if p39 then
        v_u_5.get("ProductsAPI/PromptGamepassPurchase"):FireServer(p38)
        return
    elseif p40 then
        v_u_5.get("ProductsAPI/PromptSubscriptionPurchase"):FireServer(p38)
    else
        v_u_5.get("ProductsAPI/PromptProductPurchase"):FireServer(p38)
    end
end
function v37.get_featured_item_kind()
    return v_u_30[1]
end
function v37.show(p42)
    p42:refresh_gamepasses()
    p42.instance.Parent = v_u_1.LocalPlayer.PlayerGui
    p42.instance.Frame.Visible = true
    p42:refresh_shop_details()
    for _, v_u_43 in p42.exit_buttons do
        v_u_2("CoreUIInsetHelper").run_once_if_intersecting(v_u_43.instance, function(p44)
            v_u_43.instance.Position = v_u_43.instance.Position + UDim2.fromOffset(-p44 - 4, 0)
        end)
    end
end
function v37.hide(p45)
    p45.instance.Frame.Visible = false
    p45.instance.Parent = nil
    p45:clear_gamepasses()
    for _, v46 in p45.on_close_callbacks do
        v46()
    end
end
function v37.clear_gamepasses(p47)
    for _, v48 in p47.takedown_promises do
        v48:cancel()
    end
    p47.takedown_promises = {}
    for _, v49 in pairs(p47.content:GetChildren()) do
        if v49:IsA("ImageLabel") or v49:IsA("ImageButton") then
            v49:Destroy()
        end
    end
end
function v37.refresh_gamepasses(p_u_50)
    p_u_50:clear_gamepasses()
    local v51 = v_u_3.get("gamepass_manager") or {}
    local v52 = v_u_3.get("LiveOpsMapType")
    for v53, v_u_54 in v_u_31 do
        if v_u_33[v_u_54] and (not table.find(v_u_29, v_u_54) or table.find(v_u_32[v52], v_u_54)) and (not v_u_24.has_custom_callback(v_u_54) or v_u_24.is_for_sale(v_u_54)) then
            local v_u_55 = false
            local v_u_56 = false
            local v_u_57 = nil
            if v_u_9[v_u_54] then
                v_u_57 = v_u_9[v_u_54]
                v_u_55 = true
            elseif v_u_10[v_u_54] then
                v_u_57 = v_u_10[v_u_54]
            elseif v_u_19[v_u_54] then
                v_u_57 = v_u_19[v_u_54]
                v_u_56 = true
            end
            if not (v_u_57.takedown_timestamp and v_u_16.has_happened(v_u_57.takedown_timestamp)) then
                if not (v_u_55 and v_u_25.should_hide(v_u_54)) then
                    if v_u_55 or (v_u_56 or not v_u_26.should_hide(v_u_54)) then
                        if v_u_56 and not v_u_57.hidden then
                            p_u_50:render_subscription(v_u_57, v53)
                        elseif not v_u_57.hidden then
                            local v_u_58 = p_u_50.template:clone()
                            v_u_58.Name = v_u_54
                            v_u_58.Description.Text = v_u_57.description
                            v_u_58.GamepassImage.Image = ""
                            v_u_14.get(v_u_54):andThen(function(p59)
                                if v_u_58:FindFirstChild("GamepassImage") then
                                    v_u_58.GamepassImage.Image = p59
                                end
                            end)
                            v_u_58.LastChanceSign.Visible = v_u_57.takedown_timestamp ~= nil and true or v_u_57.is_last_chance == true
                            v_u_58.TakedownTimer.Visible = v_u_57.takedown_timestamp ~= nil
                            v_u_58.LayoutOrder = v53
                            v_u_58.Parent = p_u_50.content
                            if v_u_57.takedown_timestamp then
                                local v60 = p_u_50.takedown_promises
                                local v65 = v_u_23.race({ v_u_16.delay_until(v_u_57.takedown_timestamp), v_u_23.new(function(_, _, p61)
                                        while not p61() do
                                            local v62 = v_u_16.get_time_until(v_u_57.takedown_timestamp)
                                            local v63 = v_u_17.get_time_breakdown(v62)
                                            local v64 = v_u_58.TakedownTimer.TextLabel
                                            if v63.days > 0 then
                                                v64.Text = ("%s %s"):format(v63.days, v63.days > 1 and "DAYS" or "DAY")
                                            else
                                                v64.Text = ("%02d:%02d:%02d"):format(v63.hours, v63.minutes, v63.seconds)
                                            end
                                            task.wait(1)
                                        end
                                    end) })
                                table.insert(v60, v65:andThen(function()
                                    p_u_50:refresh_gamepasses()
                                end))
                            end
                            local v66
                            if v_u_57.original_cost == nil then
                                v66 = false
                            else
                                v66 = v_u_57.cost < v_u_57.original_cost
                            end
                            local v67 = v_u_9[v_u_54]
                            if v67 then
                                v67 = v_u_8.is_member(v51, v_u_54)
                            end
                            local v68 = v_u_57.multiple_purchase_developer_product_id ~= nil
                            local v69 = 0
                            if v67 then
                                v69 = v69 + 1000
                            end
                            if v66 or v_u_57.prioritize then
                                v69 = v69 - 100
                            end
                            if v_u_57.is_last_chance then
                                v69 = v69 - 100
                            end
                            v_u_58.LayoutOrder = v_u_58.LayoutOrder + v69
                            if v67 and not v68 then
                                v_u_58.Unlock:Destroy()
                                v_u_58.Discount.Visible = false
                                v_u_58.Owned.Visible = true
                            else
                                v_u_58.Owned:Destroy()
                                local v70 = v_u_58.Unlock.Face
                                if v66 then
                                    v70.SaleContents.NewPrice.TextLabel.Text = v_u_57.cost
                                    v70.SaleContents.OldPrice.Frame.TextLabel.Text = v_u_57.original_cost
                                    v_u_58.Unlock.Position = UDim2.new(1, -6, 1, -5)
                                    v_u_58.Unlock.AnchorPoint = Vector2.new(1, 1)
                                    local v71 = v_u_11.calculate_discount_percent_text(v_u_57.original_cost, v_u_57.cost)
                                    v_u_58.Discount.Text = v71 .. "% OFF!"
                                else
                                    if v67 and v68 then
                                        v70.NormalContents.Unlock.Text = "Unlock Again"
                                    else
                                        v70.NormalContents.Unlock.Text = "Unlock"
                                    end
                                    v70.NormalContents.Price.TextLabel.Text = v_u_57.cost
                                    v_u_58.Unlock.Position = UDim2.new(1, -6, 0.5, 0)
                                    v_u_58.Unlock.AnchorPoint = Vector2.new(1, 0.5)
                                end
                                v70.SaleContents.Visible = v66
                                v70.NormalContents.Visible = not v66
                                v_u_58.Discount.Visible = v66
                                local v72 = {
                                    [v_u_36 and "mouse_button1_click" or "mouse_button1_down"] = function()
                                        v_u_41(v_u_54, v_u_55, v_u_56)
                                    end
                                }
                                p_u_50.UIManager.wrap(v_u_58.Unlock, "DepthButton"):start(v72)
                                v_u_58.MouseButton1Down:connect(function()
                                    if v_u_4.is_using_gamepad() then
                                        v_u_41(v_u_54, v_u_55, v_u_56)
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end
    end
    local v73 = p_u_50.content.UIListLayout.AbsoluteContentSize.Y + 20
    p_u_50.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, v73)
    p_u_50:update_size()
end
function v37.render_subscription(p_u_74, p75, p76)
    local v77 = p75.product_info
    if v77 then
        local v_u_78 = p75.kind
        local v_u_79 = p75.name or v77.Name
        local v80 = p_u_74.subscription_template:clone()
        v80.Name = v_u_78
        local v81 = v_u_20.is_active(v_u_78)
        if v81 then
            v80.Unowned:Destroy()
            v80.Owned.Title.Text = ("%* ACTIVE"):format(v_u_79)
            local v82 = nil
            local v83 = nil
            local v84, v85 = v_u_20.is_expiring(v_u_78)
            if v84 and v85 then
                v83 = "EXPIRES"
            else
                local v86
                v86, v85 = v_u_20.is_renewing(v_u_78)
                if v86 and v85 then
                    v83 = "RENEWS"
                else
                    v85 = v82
                end
            end
            if v83 == nil then
                v80.Owned.RenewLabel.Visible = false
            else
                local v87 = DateTime.fromUnixTimestamp(v85):FormatLocalTime("l", v_u_35.LocaleId)
                v80.Owned.RenewLabel.Text = ("SUBSCRIPTION %* %*"):format(v83, v87)
            end
            if v83 == "RENEWS" then
                local function v89()
                    local v88 = v_u_18.translate(game, v_u_79):upper()
                    if p_u_74.UIManager.apps.DialogApp:dialog({
                        ["text"] = ("Cancel subscription: %*?"):format(v88),
                        ["right"] = "Yes",
                        ["left"] = "No"
                    }) == "Yes" then
                        v_u_5.get("ProductsAPI/PromptSubscriptionCancel"):FireServer(v_u_78)
                    end
                end
                p_u_74.UIManager.wrap(v80.Owned.Cancel, "DepthButton"):start({
                    ["mouse_button1_click"] = v89
                }):set_state("cancel")
                v80[v_u_4.mouse_down_or_click()]:connect(v89)
            else
                v80.Owned.Cancel.Visible = false
                v80.Owned.CancelLabel.Text = "Subscription will not renew"
                v80.Owned.CancelLabel.TextWrapped = false
            end
            v80.Owned.Visible = true
        else
            v80.Owned:Destroy()
            v80.Unowned.Description.Text = v_u_18.translate(game, p75.description or v77.Description):upper()
            v80.Unowned.Title.Text = v_u_18.translate(game, v_u_79):upper()
            local function v90()
                p_u_74.UIManager.set_app_visibility(p_u_74.ClassName, false)
                p_u_74.UIManager.apps.SubscriptionConfirmationApp:display_subscription(v_u_78, function()
                    p_u_74.UIManager.set_app_visibility(p_u_74.ClassName, true)
                end)
            end
            p_u_74.UIManager.wrap(v80.Unowned.ViewDetails, "DepthButton"):start({
                ["mouse_button1_click"] = v90
            })
            v80[v_u_4.mouse_down_or_click()]:connect(v90)
            v80.Unowned.Visible = true
        end
        v80.LayoutOrder = p76
        if v81 then
            v80.LayoutOrder = v80.LayoutOrder + #v_u_31
        end
        v80.Parent = p_u_74.content
    else
        warn("Missing subscription product info for:", p75.kind)
    end
end
function v37.is_large(p91)
    return p91.instance.AbsoluteSize.Y > 680
end
function v37.update_size(p92)
    local v93 = v_u_12.get_details()
    if p92:is_large() then
        if v93.BannerEnabled then
            p92.instance.Frame.Size = UDim2.new(0, 487, 0, 371)
            p92.instance.Frame.Body.Size = UDim2.new(1, 0, 1, -138)
            p92.instance.Frame.Body.Position = UDim2.new(0, 0, 0, 138)
            p92.instance.Frame.BannerContent.PaperBackingTop.Position = UDim2.new(0, 0, 0, 0)
            p92.instance.Frame.BannerContent.LargeHeader.Visible = true
            p92.instance.Frame.BannerContent.SmallHeader.Visible = false
        else
            p92.instance.Frame.Size = UDim2.new(0, 487, 0, 380)
            p92.instance.Frame.Body.Size = UDim2.new(1, 0, 1, -40)
            p92.instance.Frame.Body.Position = UDim2.new(0, 0, 0, 40)
            p92.instance.Frame.BannerContent.PaperBackingTop.Position = UDim2.new(0, 212, 0, 27)
            p92.instance.Frame.BannerContent.LargeHeader.Visible = false
            p92.instance.Frame.BannerContent.SmallHeader.Visible = true
        end
    else
        p92.instance.Frame.Size = UDim2.new(0, 487, 0, 273)
        p92.instance.Frame.Body.Size = UDim2.new(1, 0, 1, -40)
        p92.instance.Frame.Body.Position = UDim2.new(0, 0, 0, 40)
        p92.instance.Frame.BannerContent.PaperBackingTop.Position = UDim2.new(0, 212, 0, 27)
        p92.instance.Frame.BannerContent.LargeHeader.Visible = false
        p92.instance.Frame.BannerContent.SmallHeader.Visible = true
        return
    end
end
function v37.refresh_shop_details(p94)
    local v95 = v_u_12.get_details()
    if v95.BannerEnabled then
        p94.instance.Frame.NormalContent.Visible = false
        p94.instance.Frame.BannerContent.Visible = true
        p94.instance.Frame.BannerContent.LargeHeader.BannerText.MainText.Text = v95.BannerHeaderLargeTextMain
        p94.instance.Frame.BannerContent.LargeHeader.BannerText.SubText.Text = v95.BannerHeaderLargeTextSub
        p94.instance.Frame.BannerContent.LargeHeader.Banner.Image = v95.BannerHeaderLargeImage
        p94.instance.Frame.BannerContent.SmallHeader.BannerText.MainText.Text = v95.BannerHeaderSmallTextMain
        p94.instance.Frame.BannerContent.SmallHeader.Banner.Image = v95.BannerHeaderSmallImage
    else
        p94.instance.Frame.NormalContent.Visible = true
        p94.instance.Frame.BannerContent.Visible = false
    end
    p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.BottomTextMain.Text = v95.BucksBottomTextMain
    p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.Gradient.UIGradient.Color = ColorSequence.new(v95.BucksGradientColor)
    p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.Button.Image = v95.BucksButtonImage
    if v95.BucksTopTextEnabled then
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.TopSection.Visible = true
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.TopSection.TopTextMain.Text = v95.BucksTopTextMain
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.TopSection.TopTextSub.Text = v95.BucksTopTextSub
        if v95.BucksTopTextMainOnTop then
            p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.TopSection.TopTextMain.LayoutOrder = 1
            p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.TopSection.TopTextSub.LayoutOrder = 2
        else
            p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.TopSection.TopTextMain.LayoutOrder = 2
            p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.TopSection.TopTextSub.LayoutOrder = 1
        end
    else
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.TextFrame.TopSection.Visible = false
    end
    if v95.AltCurrencyButtonEnabled then
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.Size = UDim2.new(0, 126, 0.5, -2)
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyAlt.Visible = true
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyAlt.Size = UDim2.new(0, 126, 0.5, -2)
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyAlt.TextFrame.BottomTextMain.Text = v95.AltCurrencyBottomTextMain
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyAlt.Gradient.UIGradient.Color = ColorSequence.new(v95.AltCurrencyGradientColor)
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyAlt.Button.Image = v95.AltCurrencyButtonImage
    else
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.Size = UDim2.new(0, 126, 1, 0)
        p94.instance.Frame.Body.CurrencyBuyButtons.BuyAlt.Visible = false
    end
    local v96
    if v95.BannerEnabled then
        if v95.AltCurrencyButtonEnabled then
            v96 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.45, 1), NumberSequenceKeypoint.new(1, 0) })
        else
            v96 = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.35, 1),
                NumberSequenceKeypoint.new(0.55, 1),
                NumberSequenceKeypoint.new(0.9, 0),
                NumberSequenceKeypoint.new(1, 0)
            })
        end
    elseif v95.AltCurrencyButtonEnabled then
        v96 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.45, 1), NumberSequenceKeypoint.new(1, 0) })
    else
        v96 = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.15, 1),
            NumberSequenceKeypoint.new(0.45, 1),
            NumberSequenceKeypoint.new(0.6, 0),
            NumberSequenceKeypoint.new(1, 0)
        })
    end
    p94.instance.Frame.Body.CurrencyBuyButtons.BuyAlt.Gradient.UIGradient.Transparency = v96
    p94.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.Gradient.UIGradient.Transparency = v96
end
function v37.set_premium_item_visible(p97, p98, p99)
    local v100 = v_u_22.keyOf
    local v101 = v_u_33
    assert(v100(v101, p98))
    local v102 = v_u_22.boolean
    assert(v102(p99))
    if v_u_33[p98] ~= p99 then
        v_u_33[p98] = p99
        p97:refresh_gamepasses()
    end
end
function v37.start(p_u_103)
    p_u_103.takedown_promises = {}
    p_u_103.on_close_callbacks = {}
    p_u_103:update_size()
    p_u_103.instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_103:update_size()
    end)
    p_u_103.scrolling_frame = p_u_103.instance.Frame.Body.ScrollComplex.ScrollingFrame
    p_u_103.content = p_u_103.scrolling_frame.Content
    p_u_103.template = p_u_103.content.EntryTemplate
    p_u_103.template.Parent = nil
    p_u_103.subscription_template = p_u_103.content.SubscriptionEntryTemplate
    p_u_103.subscription_template.Parent = nil
    local v104 = { p_u_103.instance.Frame.BannerContent.LargeHeader.ExitButton, p_u_103.instance.Frame.BannerContent.SmallHeader.ExitButton, p_u_103.instance.Frame.NormalContent.Header.ExitButton }
    p_u_103.exit_buttons = {}
    for v105, v106 in pairs(v104) do
        p_u_103.exit_buttons[v105] = p_u_103.UIManager.wrap(v106, "DepthButton"):start({
            ["mouse_button1_click"] = function()
                p_u_103.UIManager.set_app_visibility(p_u_103.ClassName, false)
            end
        })
    end
    v_u_3.register_callback("gamepass_manager", function(_)
        v_u_34("Refreshing gamepasses in shop")
        p_u_103:refresh_gamepasses()
    end)
    v_u_3.register_callback("subscription_manager", function(_)
        if p_u_103.UIManager.is_visible(p_u_103.ClassName) then
            v_u_34("Refreshing subscriptions in shop")
            p_u_103:refresh_gamepasses()
        end
    end)
    p_u_103.instance.Frame.Body.CurrencyBuyButtons.BuyBucks.MouseButton1Down:connect(function()
        p_u_103.UIManager.set_app_visibility(p_u_103.ClassName, false)
        p_u_103.UIManager.set_app_visibility("BucksPurchaseApp", true)
    end)
    p_u_103.instance.Frame.Body.CurrencyBuyButtons.BuyAlt.MouseButton1Down:connect(function()
        p_u_103.UIManager.set_app_visibility(p_u_103.ClassName, false)
        p_u_103.UIManager.set_app_visibility("AltCurrencyPurchaseApp", true)
    end)
    v_u_6.quick_watch({
        ["selection_parent"] = p_u_103.instance.Frame,
        ["default_selection"] = p_u_103.instance.Frame.Body.CurrencyBuyButtons.BuyBucks,
        ["app_name"] = p_u_103.ClassName,
        ["exit_buttons"] = v104
    })
    v_u_12.get_details_changed_signal():Connect(function()
        p_u_103:refresh_shop_details()
        p_u_103:update_size()
    end)
    v_u_3.register_callback("LiveOpsMapType", function()
        p_u_103:refresh_gamepasses()
    end)
    if v_u_13.has_release_happened() == false then
        v_u_13.delay_until_countdown():andThen(function()
            p_u_103:refresh_gamepasses()
        end)
    end
end
return v37