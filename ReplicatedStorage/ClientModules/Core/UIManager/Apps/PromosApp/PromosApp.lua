--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PromosApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v_u_1("ClientData")
local v_u_2 = v_u_1("PlatformM")
local v_u_3 = v_u_1("RouterClient")
local v_u_4 = v_u_1("XboxSupport")
local v5 = v_u_1("Class")("PromosApp", v_u_1("UIBaseApp"))
function v5.open_promo(p6, p7)
    if p6.instance[p7].Visible then
        return
    elseif not skip_promos then
        local v8 = UDim2.new(0.5, 0, 1, p6.instance.AbsoluteSize.Y / 2 + 5)
        p6.instance[p7].Position = v8
        p6.instance[p7].Visible = true
        p6.instance[p7]:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        repeat
            wait(0.1)
        until p6.instance[p7].Visible == false
    end
end
function v5.skip_promos(p9)
    skip_promos = true
    for _, v10 in pairs(p9.instance:GetChildren()) do
        v10.Visible = false
    end
end
function v5.buy_promo(p11, p12)
    if not v_u_2.is_using_gamepad() or tick() - p11.promo_made_visible_time >= 3 or v_u_1("UIManager").apps.DialogApp:dialog({
        ["text"] = "Purchase " .. p12 .. "?",
        ["left"] = "Close",
        ["right"] = "Buy"
    }) ~= "Close" then
        v_u_3.get("ProductsAPI/PromptGamepassPurchase"):FireServer(string.lower(p12))
    end
end
function v5.show(p13)
    p13.instance.Enabled = true
end
function v5.hide(p14)
    p14.instance.Enabled = false
end
function v5.start(p_u_15)
    for _, v_u_16 in pairs({ "VIP", "Glider", "Starterpack" }) do
        local v_u_17 = p_u_15.instance[v_u_16]
        v_u_17:GetPropertyChangedSignal("Visible"):connect(function()
            if v_u_17.Visible then
                p_u_15.promo_made_visible_time = tick()
            end
        end)
        local v18 = {
            ["options"] = {
                ["hover_hue_shift"] = -180
            },
            ["mouse_button1_down"] = function()
                p_u_15:buy_promo(v_u_16)
            end
        }
        p_u_15.UIManager.wrap(v_u_17.Buy, "FlatButton"):start(v18)
    end
    for _, v_u_19 in pairs(p_u_15.instance:GetChildren()) do
        p_u_15.UIManager.wrap(v_u_19.Close, "HoverEnlargeButton"):start({
            ["object_to_hover"] = v_u_19.Close,
            ["objects"] = { v_u_19.Close },
            ["enlarge_percentage"] = 1.15,
            ["mouse_button1_click"] = function()
                v_u_19.Visible = false
            end
        })
    end
    for _, v_u_20 in pairs(p_u_15.instance:GetChildren()) do
        local v21 = v_u_20:FindFirstChild("Buy")
        local v22, v23 = v_u_4.get_open_close_signals(v_u_20)
        v_u_4.watch({
            ["selection_parent"] = v_u_20,
            ["default_selection"] = v21,
            ["signal_open"] = v22,
            ["signal_close"] = v23,
            ["setup_button_actions"] = function()
                game:GetService("ContextActionService"):BindAction("PromoClose", function(_, p24)
                    if p24 == Enum.UserInputState.Begin then
                        game:GetService("ContextActionService"):UnbindAction("PromoClose")
                        v_u_20.Visible = false
                    end
                end, false, Enum.KeyCode.ButtonB)
            end,
            ["teardown_button_actions"] = function()
                game:GetService("ContextActionService"):UnbindAction("PromoClose")
            end
        })
    end
end
return v5