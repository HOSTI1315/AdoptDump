--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.CurrencyPurchaseBaseApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("PlatformM")
local v_u_4 = v_u_1("RouterClient")
local v_u_5 = v_u_1("XboxSupport")
local v_u_6 = v_u_1("StringUtil")
local v7 = v_u_1("Class")
local v_u_8 = v_u_1("SoundPlayer")
local v_u_9 = v_u_1("ScriptUtil")
local v_u_10 = v_u_1("DeveloperProductDB")
local v_u_11 = v_u_1("CostDiscountHelper")
local v_u_12 = v_u_1("Debug").create_log()
local v_u_13 = v_u_1("Maid")
local v14 = v7("CurrencyPurchaseBaseApp", v_u_1("UIBaseApp"))
function v14._prompt_purchase(p_u_15, p16, p_u_17)
    v_u_4.get("ProductsAPI/PromptProductPurchase"):FireServer(p16)
    local v_u_18 = v_u_9.create_continue()
    local v20 = v_u_4.get_event("ProductsAPI/CurrencyPurchaseComplete").OnClientEvent:connect(function(p19, _)
        if p19 == p_u_17.product_id then
            v_u_18.continue()
            v_u_8.FX:play("GoldSparklePrize")
            if not p_u_15.UIManager.apps[p_u_15.ClassName].visible then
                v_u_4.get("ProductsAPI/SproutCurrency"):FireServer(p_u_15.currency_name)
            end
        end
    end)
    v_u_18.yield()
    v20:disconnect()
    v_u_12("Finalized purchase")
end
function v14.refresh_products(p_u_21, p22)
    p_u_21.product_maid:DoCleaning()
    p_u_21.product_ids = p22
    for v23, v_u_24 in pairs(p22) do
        local v_u_25 = v_u_10[v_u_24]
        local v26 = p_u_21.instance.Frame.Body.Content[v23]
        v26.Contents.Amount.Text = v_u_25.reward_amount
        v26.BottomBar.Price.Cost.TextLabel.Text = v_u_25.cost
        v26.Contents.CurrencyType.Text = p_u_21.currency_human_readable
        if v_u_25.image_id then
            v26.Contents.Image.Image = "rbxassetid://" .. v_u_25.image_id
        end
        local v27 = v_u_25.original_cost
        if v27 then
            v27 = v_u_25.cost < v_u_25.original_cost
        end
        if v27 then
            local v28 = v_u_11.calculate_discount_percent_text(v_u_25.original_cost, v_u_25.cost)
            v26.BottomBar.TextContainer.TextLabel.Text = v28 .. "% OFF!"
        else
            v26.BottomBar.TextContainer.TextLabel.Text = v_u_25.tag or ""
        end
        p_u_21.product_maid:GiveTask(v26.MouseButton1Down:Connect(function()
            p_u_21:_prompt_purchase(v_u_24, v_u_25)
        end))
    end
end
function v14.show(p_u_29)
    if p_u_29.product_ids then
        p_u_29:refresh_products(p_u_29.product_ids)
    end
    p_u_29.instance.Frame.Visible = true
    p_u_29.UIManager.apps.TransitionsApp:set_blur(p_u_29.ClassName, 20, 0.4)
    if v_u_3.get_platform() == v_u_3.platform.phone then
        p_u_29.UIManager.apps.CoreGuiApp:set_coregui_disabled(p_u_29.ClassName, Enum.CoreGuiType.Chat)
    end
    v_u_8.FX:play("InspiringMagic")
    v_u_1("CoreUIInsetHelper").run_once_if_intersecting(p_u_29.exit_button.instance, function(p30)
        p_u_29.exit_button.instance.Position = p_u_29.exit_button.instance.Position + UDim2.fromOffset(-p30 - 4, 0)
    end)
end
function v14.hide(p31)
    v_u_4.get("ProductsAPI/SproutCurrency"):FireServer(p31.currency_name)
    if v_u_3.get_platform() == v_u_3.platform.phone then
        p31.UIManager.apps.CoreGuiApp:reenable_coregui(p31.ClassName, Enum.CoreGuiType.Chat)
    end
    p31.UIManager.apps.TransitionsApp:clear_blur(p31.ClassName)
    p31.instance.Frame.Visible = false
end
function v14.start(p_u_32, p_u_33, p_u_34, p35)
    p_u_32.currency_name = p_u_33
    p_u_32.currency_human_readable = p_u_34
    p_u_32.product_maid = v_u_13.new()
    p_u_32:refresh_products(p35)
    p_u_32.exit_button = p_u_32.UIManager.wrap(p_u_32.instance.Frame.Header.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_32.UIManager.set_app_visibility(p_u_32.ClassName, false)
        end
    })
    p_u_32.balance = p_u_32.instance.Frame.Header.InsetSpace.Balance
    p_u_32.balance.Text = ("You have: %s %s"):format(v_u_6.add_commas_to_number(v_u_2.get(p_u_33)), p_u_34)
    v_u_2.register_callback(p_u_33, function(_, _)
        p_u_32.balance.Text = ("You have: %s %s"):format(v_u_6.add_commas_to_number(v_u_2.get(p_u_33)), p_u_34)
    end)
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_32.instance.Frame,
        ["default_selection"] = p_u_32.instance.Frame.Body.Content.A,
        ["app_name"] = p_u_32.ClassName,
        ["exit_buttons"] = { p_u_32.instance.Frame.Header.ExitButton }
    })
end
return v14