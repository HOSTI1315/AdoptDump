--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ThemedServersApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("XboxSupport")
local v_u_6 = v1("ThemedServersHelper")
local v_u_7 = v1("ColorThemeManager")
local v_u_8 = v1("DepthButtonColorDB")
local v9 = v2("ThemedServersApp", v1("UIBaseApp"))
function v9.show_teleport_message(p10)
    p10.instance.Frame.OptionsGrid.Visible = false
    p10.instance.Frame.TeleportingLabel.Visible = true
    p10.normal_button:hide()
    p10.exit_button:hide()
end
function v9.start(p_u_11)
    local v_u_12 = p_u_11.instance.Frame.UIScale
    v_u_4.run({
        ["desktop"] = function()
            v_u_12.Scale = 1
        end,
        ["phone"] = function()
            v_u_12.Scale = 0.6
        end,
        ["tablet"] = "desktop",
        ["console"] = "desktop"
    })
    p_u_11.exit_button = p_u_11.UIManager.wrap(p_u_11.instance.Frame.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_11.UIManager.set_app_visibility(p_u_11.ClassName, false)
        end
    })
    local v13 = {
        ["mouse_button1_click"] = function()
            p_u_11:show_teleport_message()
            v_u_3.get("ThemedServersAPI/RequestTeleport"):FireServer("main", false)
        end
    }
    p_u_11.normal_button = p_u_11.UIManager.wrap(p_u_11.instance.Frame.LeaveButton, "DepthButton"):start(v13)
    p_u_11.normal_button:set_color_from_entry(v_u_8.orange, true)
    if v_u_6.is_main_place() then
        p_u_11.normal_button:hide()
    end
    local v_u_14 = v_u_6.get_place_type()
    local v_u_15 = p_u_11.instance.Frame.DescriptionBackground.Label
    if v_u_14 == "main" then
        v_u_15.Text = "You are currently in a regular Adopt Me server."
    elseif v_u_14 == "afk" then
        v_u_15.Text = "You are currently in an Adopt Me afk server."
    end
    local v_u_16 = p_u_11.instance.Frame.OptionsGrid
    local v17 = {
        ["mouse_button1_click"] = function()
            p_u_11:show_teleport_message()
            v_u_3.get("ThemedServersAPI/RequestTeleport"):FireServer("trading", false)
        end
    }
    p_u_11.trade_button = p_u_11.UIManager.wrap(v_u_16.TradeFrame.DepthButton, "DepthButton"):start(v17)
    if v_u_6.is_trading_place() then
        p_u_11.trade_button:set_state("unpressable")
        p_u_11.trade_button.instance.Face.Text.Text = "You are here"
    end
    v_u_16.TradeFrame.Visible = false
    local v18 = {
        ["mouse_button1_click"] = function()
            p_u_11:show_teleport_message()
            v_u_3.get("ThemedServersAPI/RequestTeleport"):FireServer("roleplay", false)
        end
    }
    p_u_11.roleplay_button = p_u_11.UIManager.wrap(v_u_16.RoleplayFrame.DepthButton, "DepthButton"):start(v18)
    if v_u_6.is_roleplay_place() then
        p_u_11.roleplay_button:set_state("unpressable")
        p_u_11.roleplay_button.instance.Face.Text.Text = "You are here"
    end
    v_u_16.RoleplayFrame.Visible = false
    task.spawn(function()
        local v19 = v_u_3.get("ThemedServersAPI/GetGroup"):InvokeServer()
        if v19 then
            if v19 == "both" then
                v_u_16.TradeFrame.Visible = true
                v_u_16.RoleplayFrame.Visible = true
            elseif v19 == "roleplaying_only" then
                v_u_16.RoleplayFrame.Visible = true
                if v_u_14 == "main" then
                    v_u_15.Text = "Servers dedicated to roleplaying:"
                    return
                end
            elseif v19 == "trading_only" then
                v_u_16.TradeFrame.Visible = true
                if v_u_14 == "main" then
                    v_u_15.Text = "Servers dedicated to trading:"
                end
            end
        else
            return
        end
    end)
    p_u_11.instance.Frame.TitleBackground.ImageColor3 = v_u_7.lookup("saturated")
    p_u_11.instance.Frame.BackgroundGrid.ImageColor3 = v_u_7.lookup("saturated")
    for _, v20 in p_u_11.instance.Frame.OptionsGrid:GetChildren() do
        if v20:IsA("Frame") then
            v20.TitleBackground.ImageColor3 = v_u_7.lookup("saturated")
            v20.IconBackground.Ring.ImageColor3 = v_u_7.lookup("saturated")
            v20.IconBackground.Icon.ImageColor3 = v_u_7.lookup("saturated")
        end
    end
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_11.instance.Frame,
        ["default_selection"] = p_u_11.instance.Frame.ExitButton,
        ["app_name"] = p_u_11.ClassName,
        ["save_last_selection"] = false,
        ["exit_buttons"] = { p_u_11.instance.Frame.ExitButton }
    })
end
function v9.show(p21)
    p21.instance.Frame.Visible = true
end
function v9.hide(p22)
    p22.instance.Frame.Visible = false
end
return v9