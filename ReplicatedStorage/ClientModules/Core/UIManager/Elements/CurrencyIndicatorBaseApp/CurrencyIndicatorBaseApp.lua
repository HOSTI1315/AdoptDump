--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.CurrencyIndicatorBaseApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("PlatformM")
local v_u_4 = v_u_1("StringUtil")
local v5 = v_u_1("Class")
local v_u_6 = v_u_1("ClientStore")
local v_u_7 = v_u_1("SharedConstants")
local v_u_8 = v_u_1("AltCurrencyData")
local v_u_9 = v_u_1("RouterClient")
local v_u_10 = v_u_1("TweenPromise")
local v_u_11 = v_u_1("package:Promise")
local v12 = v5("CurrencyIndicatorBaseApp", v_u_1("UIBaseApp"))
v_u_1("Debug").create_log()
function v12.get_currency(p13)
    return v_u_2.get_server(game.Players.LocalPlayer, p13.unit)
end
function v12.on_currency_changed(p14, p_u_15)
    v_u_2.register_server_on_change_hook(p14.unit, nil, function(p16, p17, _)
        if p16 == game.Players.LocalPlayer then
            p_u_15(p17, false)
        end
    end)
end
function v12.listen_currency_changed(p_u_18)
    local v_u_19 = Instance.new("IntValue")
    local v20 = p_u_18:get_currency()
    if v20 then
        p_u_18.instance.CurrencyIndicator.Container.Amount.Text = string.format(p_u_18.display_format_string, v_u_4.add_commas_to_number(v20))
        v_u_19.Value = v20
    end
    v_u_19.Changed:Connect(function()
        p_u_18.instance.CurrencyIndicator.Container.Amount.Text = string.format(p_u_18.display_format_string, v_u_4.add_commas_to_number(v_u_19.Value))
    end)
    p_u_18:on_currency_changed(function(p21, p22)
        if p21 then
            if p22 then
                v_u_19.Value = p21
            else
                local v23 = p21 - v_u_19.Value
                local v24 = v23 > 4000 and 5 or (v23 > 2000 and 4 or (v23 > 1000 and 3 or (v23 > 500 and 2 or (math.abs(v23) < 8 and 0.7 or 1.5))))
                game:GetService("TweenService"):Create(v_u_19, TweenInfo.new(v24, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Value"] = p21
                }):Play()
            end
        else
            return
        end
    end)
end
function v12.show(p25)
    p25.instance.Enabled = true
end
function v12.hide(p26)
    p26.instance.Enabled = false
end
function v12.refresh(p27, _)
    local v28 = p27.UIManager.is_closed({
        "MainMenuApp",
        "AvatarEditorApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "PlayerSpectateApp",
        "FocusPetApp",
        "MockFocusPetApp",
        "LikesRewardApp"
    })
    local v29 = v_u_3.get_platform()
    if p27.unit == "money" or p27.unit == "coop_budget" then
        local v30 = v_u_1("HouseClient")
        local v31 = v30.get_current_house_owner()
        if p27.unit == "coop_budget" then
            local v32 = v_u_2.get("house_interior")
            if v32 then
                v32 = v32.allows_coop_building
            end
            if v29 == v_u_3.platform.phone then
                if v28 then
                    if v31 then
                        if v31 == game.Players.LocalPlayer then
                            v28 = false
                        else
                            v28 = v30.can_edit_current_house()
                        end
                    else
                        v28 = v31
                    end
                end
            elseif v28 then
                if v32 then
                    v28 = v30.can_edit_current_house()
                else
                    v28 = v32
                end
            end
        elseif v29 == v_u_3.platform.phone then
            v28 = not (v28 and v31) or v31 == game.Players.LocalPlayer
        end
        local v33 = nil
        if v29 == v_u_3.platform.phone then
            if p27.UIManager.apps.HouseEditorWrapperApp.editor_open then
                if p27.UIManager.apps.HouseEditorWrapperApp.drawer_open then
                    v28 = v28 and true
                    v33 = "BUILD"
                else
                    v28 = false
                end
            end
            if p27.UIManager.app_visibilities.BucksPurchaseApp and p27.unit == "money" then
                v28 = true
                v33 = "CURRENCY_PURCHASE"
            end
        end
        p27:set_visibility(v28)
        p27.instance.DisplayOrder = p27.original_display_order
        if v29 == v_u_3.platform.phone and v28 then
            local v34 = 1
            local v35, v36
            if v33 == "CURRENCY_PURCHASE" then
                v35 = UDim2.new(0.5, 0, 0, 5)
                v36 = Vector2.new(0.5, 0)
                v34 = 10
            elseif v33 == "BUILD" then
                v35 = UDim2.new(1, -6, 1, -182)
                v36 = Vector2.new(1, 1)
            else
                v35 = UDim2.new(1, 0, 0, 0)
                v36 = Vector2.new(1, 0)
            end
            local v37 = p27.instance.CurrencyIndicator
            v37.Position = v35
            v37.AnchorPoint = v36
            p27.instance.DisplayOrder = v34
            return
        end
    else
        if p27.unit == v_u_8.name and (v_u_8.hide_indicator or not v_u_8.enabled) then
            v28 = false
        end
        if v_u_6.store:getState().house_editor_state ~= "Disabled" then
            v28 = false
        end
        local v38 = nil
        if p27.UIManager.app_visibilities.AltCurrencyPurchaseApp then
            v28 = true
            v38 = "CURRENCY_PURCHASE"
        elseif p27.UIManager.app_visibilities.BucksPurchaseApp then
            v28 = false
        end
        p27:set_visibility(v28)
        p27.instance.DisplayOrder = p27.original_display_order
        if v29 == v_u_3.platform.phone and v28 then
            local v39 = 1
            local v40, v41
            if v38 == "CURRENCY_PURCHASE" then
                v40 = UDim2.new(0.5, 0, 0, 5)
                v41 = Vector2.new(0.5, 0)
                v39 = 10
            else
                v40 = UDim2.new(1, -181.5, 0, 0)
                v41 = Vector2.new(1, 0)
            end
            local v42 = p27.instance.CurrencyIndicator
            v42.Position = v40
            v42.AnchorPoint = v41
            p27.instance.DisplayOrder = v39
        end
    end
end
function v12.is_visible(p43)
    return p43.instance.Enabled
end
function v12.connect_click(p44, p45)
    return p44.instance.CurrencyIndicator.ClickHoverBox[v_u_3.mouse_down_or_click()]:Connect(p45)
end
function v12.connect_hover(p_u_46, p_u_47)
    local v48 = p_u_46.instance.CurrencyIndicator.ClickHoverBox
    v48.MouseEnter:Connect(function()
        if p_u_47 == nil or p_u_47() then
            game:GetService("TweenService"):Create(p_u_46.instance.CurrencyIndicator.Container.UIScale, TweenInfo.new(0.1), {
                ["Scale"] = 1.15
            }):Play()
        end
    end)
    v48.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(p_u_46.instance.CurrencyIndicator.Container.UIScale, TweenInfo.new(0.1), {
            ["Scale"] = 1
        }):Play()
    end)
end
function v12.on_click(p49)
    local v50 = p49.unit
    if v50 == "money" then
        p49.UIManager.set_app_visibility("BucksPurchaseApp", true)
        return
    elseif v50 == v_u_8.name and v_u_8.purchasable then
        p49.UIManager.set_app_visibility("AltCurrencyPurchaseApp", true)
    elseif v50 == "coop_budget" then
        if p49.coop_prompt_open then
            return
        end
        p49.coop_prompt_open = true
        local v51 = v_u_1("UIManager")
        local v52 = (v_u_1("InteriorsM").get_current_location() or {}).house_owner
        if v52 == game.Players.LocalPlayer then
            local v53 = v51.apps.DialogApp
            local v54 = {
                ["text"] = "Set new budget (limit is $" .. v_u_4.add_commas_to_number(v_u_7.coop_building_max_budget) .. "):"
            }
            local v55 = v_u_2.get_server(v52, "housing_coop").budget
            v54.existing_text = tostring(v55)
            v54.left = "Cancel"
            v54.right = "Deposit"
            local v56, v57 = v53:free_response_dialog(v54)
            if v56 == "Deposit" and tonumber(v57) then
                v_u_9.get("HousingAPI/CoopSetBudget"):FireServer((tonumber(v57)))
            end
        end
        p49.coop_prompt_open = false
    end
end
function v12.start(p_u_58, p_u_59, p60)
    p_u_58.unit = p_u_59
    p_u_58.display_format_string = p60
    p_u_58.original_display_order = p_u_58.instance.DisplayOrder
    p_u_58.toast_list = p_u_58.instance.CurrencyIndicator:FindFirstChild("ToastList")
    local v61 = p_u_58.toast_list
    if v61 then
        v61 = p_u_58.toast_list:FindFirstChild("ToastLabelTemplate")
    end
    p_u_58.toast_label_template = v61
    if p_u_58.toast_label_template then
        p_u_58.toast_label_template.Parent = nil
    end
    p_u_58.active_toasts = {}
    p_u_58.toast_counter = 0
    coroutine.wrap(function()
        p_u_58:listen_currency_changed()
    end)()
    p_u_58:connect_click(function()
        p_u_58:on_click()
    end)
    if v_u_3.get_platform() == v_u_3.platform.desktop then
        p_u_58:connect_hover(function()
            return p_u_59 == "money" and true or (p_u_59 == v_u_8.name and v_u_8.purchasable and true or p_u_59 == "coop_budget" and (v_u_1("InteriorsM").get_current_location() or {}).house_owner == game.Players.LocalPlayer)
        end)
    end
end
local function v_u_65(p62)
    local v63 = p62.Label
    local v64 = v63.UIStroke
    return v_u_11.all({ v_u_10.new(v63, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["TextTransparency"] = 1
        }), v_u_10.new(v64, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Transparency"] = 1
        }) })
end
local function v_u_68(p66)
    local v_u_67 = p66.UIScale
    return v_u_10.new(v_u_67, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Scale"] = 1
    }):finally(function()
        v_u_67.Scale = 1
    end)
end
function v12.toast_currency_change_message(p_u_69, p70, p71)
    local v_u_72 = p_u_69.toast_counter
    local v73 = p_u_69.active_toasts[v_u_72]
    if v73 then
        local v_u_74 = v73.label
        if not v73.fade_promise then
            v73.fade_promise = v_u_65(v_u_74):andThen(function()
                v_u_74:Destroy()
                p_u_69.active_toasts[v_u_72] = nil
            end)
            local v75 = p_u_69.active_toasts[v_u_72 - 1]
            if v75 and v75.rescale_promise then
                v75.rescale_promise:cancel()
            end
            local v76 = v_u_68(v_u_74)
            p_u_69.active_toasts[v_u_72].rescale_promise = v76
        end
    end
    local v_u_77 = p_u_69.toast_counter - 1
    p_u_69.toast_counter = v_u_77
    local v78 = p70 > 0 and "+" or "-"
    local v_u_79 = p_u_69.toast_label_template:Clone()
    v_u_79.Label.Text = ("%*%* (%*)"):format(v78, v_u_4.add_commas_to_number(p70), p71)
    v_u_79.Label.Position = UDim2.new(0, 0, 0, -40)
    v_u_79.LayoutOrder = p_u_69.toast_counter
    p_u_69.active_toasts[v_u_77] = {
        ["label"] = v_u_79,
        ["key"] = v_u_77,
        ["fade_promise"] = nil,
        ["rescale_promise"] = nil
    }
    v_u_79.UIScale.Scale = 1.5
    v_u_10.new(v_u_79.Label, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Position"] = UDim2.new(0, 0, 0, 0)
    })
    v_u_79.Size = UDim2.new(1, 0, 0, 0)
    v_u_10.new(v_u_79, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(1, 0, 0, 15)
    }):andThenCall(v_u_11.delay, 2):andThenCall(function()
        if p_u_69.active_toasts[v_u_77] == nil then
            return
        elseif not p_u_69.active_toasts[v_u_77].fade_promise then
            local v80 = v_u_65(v_u_79):andThen(function()
                v_u_79:Destroy()
                p_u_69.active_toasts[v_u_77] = nil
            end)
            p_u_69.active_toasts[v_u_77].fade_promise = v80
        end
    end)
    v_u_79.Parent = p_u_69.toast_list
end
return v12