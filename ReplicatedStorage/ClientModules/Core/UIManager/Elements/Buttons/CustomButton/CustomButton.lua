--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.CustomButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
v1("UIHelpers")
local v3 = v2("CustomButton", v1("UIBaseElement"))
function v3.run_render_method(p4, p5)
    if p5 then
        p5(p4.instance)
    end
end
function v3.render(p6)
    if p6.disabled then
        p6:run_render_method(p6.props.disabled_render)
        return
    elseif p6.is_down then
        p6:run_render_method(p6.props.down_render or (p6.props.hover_render or p6.props.up_render))
        return
    elseif p6.is_hovering then
        p6:run_render_method(p6.props.hover_render or p6.props.up_render)
    else
        p6:run_render_method(p6.props.up_render)
    end
end
function v3.up(p7)
    if p7.is_down == true then
        p7.is_down = false
        p7:render()
    end
end
function v3.down(p8, ...)
    p8.is_down = true
    p8:render()
    if p8.props.mouse_button1_down and (not p8.disabled or p8.fire_clicked_events_when_disabled) then
        p8.props.mouse_button1_down(...)
    end
end
function v3.disable(p9)
    p9.disabled = true
    p9:render()
end
function v3.enable(p10)
    p10.disabled = false
    p10:render()
end
function v3.hover(p11)
    p11.is_hovering = true
    p11:render()
end
function v3.unhover(p12)
    p12.is_hovering = false
    p12:render()
end
function v3.start(p_u_13, p14)
    p_u_13.props = p14 or {}
    p_u_13.fire_clicked_events_when_disabled = p14.fire_clicked_events_when_disabled
    p_u_13.instance.MouseEnter:connect(function()
        p_u_13:hover()
    end)
    p_u_13.instance.MouseLeave:connect(function()
        if not p_u_13.props.hold_down then
            p_u_13.is_down = false
        end
        p_u_13:unhover()
    end)
    p_u_13.instance.MouseButton1Down:connect(function(...)
        if not p_u_13.props.run_down_logic_only_on_click then
            p_u_13:down(...)
        end
    end)
    p_u_13.instance.MouseButton1Up:connect(function()
        if not p_u_13.props.hold_down then
            p_u_13.is_down = false
            p_u_13:render()
        end
    end)
    p_u_13.instance.MouseButton1Click:connect(function(...)
        if p_u_13.props.run_down_logic_only_on_click then
            p_u_13:down(...)
        end
        if p_u_13.props.mouse_button1_click and (not p_u_13.disabled or p_u_13.fire_clicked_events_when_disabled) then
            p_u_13.props.mouse_button1_click(...)
        end
    end)
    p_u_13:render()
    return p_u_13
end
return v3