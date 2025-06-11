--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.JaggedButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
v1("UIDB")
v1("PlatformM")
local v_u_3 = v1("ColorThemeManager")
local v4 = v2("JaggedButton", v1("UIBaseElement"))
function v4.hide(p5)
    p5.button:up()
    p5.instance.Visible = false
end
function v4.show(p6)
    p6.instance.Visible = true
end
function v4.start(p_u_7, p8)
    p_u_7.props = p8 or {}
    local function v11(p9)
        local v10 = p_u_7.props.hover_color or v_u_3.lookup("medium_light")
        p9.CenterFill.BackgroundColor3 = v10
        p9.RightFill.ImageColor3 = v10
        p9.LeftFill.ImageColor3 = v10
    end
    local function v14(p12)
        local v13 = p_u_7.props.up_color or v_u_3.lookup("saturated")
        p12.CenterFill.BackgroundColor3 = v13
        p12.RightFill.ImageColor3 = v13
        p12.LeftFill.ImageColor3 = v13
    end
    p_u_7.button = p_u_7.UIManager.wrap(p_u_7.instance, "CustomButton"):start({
        ["hover_render"] = v11,
        ["up_render"] = v14,
        ["disabled_render"] = function(p15)
            local v16 = Color3.fromRGB(150, 150, 150)
            p15.CenterFill.BackgroundColor3 = v16
            p15.RightFill.ImageColor3 = v16
            p15.LeftFill.ImageColor3 = v16
        end,
        ["fire_clicked_events_when_disabled"] = true,
        ["mouse_button1_down"] = p_u_7.props.mouse_button1_down,
        ["mouse_button1_click"] = p_u_7.props.mouse_button1_click
    })
    return p_u_7
end
return v4