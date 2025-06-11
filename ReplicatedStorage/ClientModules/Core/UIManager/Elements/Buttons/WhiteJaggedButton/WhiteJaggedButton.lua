--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.WhiteJaggedButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")("WhiteJaggedButton", v1("UIBaseElement"))
local v_u_3 = game:GetService("TweenService")
local function v_u_8(p4, p5)
    local v6 = p5 and 0.3 or 0
    local v7 = TweenInfo.new(0.2)
    v_u_3:Create(p4.Icon, v7, {
        ["ImageTransparency"] = v6
    }):Play()
    v_u_3:Create(p4.SubjectText, v7, {
        ["TextTransparency"] = v6
    }):Play()
    v_u_3:Create(p4.ActionText, v7, {
        ["TextTransparency"] = v6
    }):Play()
end
function v2.hide(p9)
    p9.button:up()
    p9.instance.Visible = false
end
function v2.show(p10)
    p10.instance.Visible = true
end
function v2.start(p11, p12)
    p11.props = p12 or {}
    local function v14(p13)
        v_u_8(p13, true)
    end
    local function v16(p15)
        v_u_8(p15, false)
    end
    p11.button = p11.UIManager.wrap(p11.instance, "CustomButton"):start({
        ["hover_render"] = v14,
        ["up_render"] = v16,
        ["fire_clicked_events_when_disabled"] = true,
        ["mouse_button1_down"] = p11.props.mouse_button1_down,
        ["mouse_button1_click"] = p11.props.mouse_button1_click
    })
    return p11
end
return v2