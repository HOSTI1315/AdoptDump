--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.IconButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")("IconButton", v1("CustomButton"))
function v2.disable(p3)
    p3.disabled = true
    p3:run_render_method(p3.props.up_render)
    p3:render()
end
function v2.start(p_u_4, p5)
    p_u_4.props = p5 or {}
    local v_u_6 = p_u_4.props.hover_render
    function p_u_4.props.hover_render(...)
        p_u_4.face_ui_scale.Scale = 1
        p_u_4.shadow_ui_scale.Scale = 1
        p_u_4.instance.Face.Position = p_u_4.face_hover_position
        if v_u_6 then
            v_u_6(...)
        end
    end
    local v_u_7 = p_u_4.props.up_render
    function p_u_4.props.up_render(...)
        p_u_4.face_ui_scale.Scale = 1
        p_u_4.shadow_ui_scale.Scale = 1
        p_u_4.instance.Face.Position = p_u_4.face_initial_position
        if v_u_7 then
            v_u_7(...)
        end
    end
    local v_u_8 = p_u_4.props.down_render
    function p_u_4.props.down_render(...)
        p_u_4.face_ui_scale.Scale = 1.1
        p_u_4.shadow_ui_scale.Scale = 1.1
        if v_u_8 then
            v_u_8(...)
        end
    end
    p_u_4.fire_clicked_events_when_disabled = p5.fire_clicked_events_when_disabled
    p_u_4.face_ui_scale = Instance.new("UIScale")
    p_u_4.face_ui_scale.Parent = p_u_4.instance.Face
    p_u_4.shadow_ui_scale = Instance.new("UIScale")
    p_u_4.shadow_ui_scale.Parent = p_u_4.instance.Shadow
    p_u_4.face_hover_position = p_u_4.instance.Face.Position + (p_u_4.props.hover_offset or UDim2.fromScale(-0.035, -0.05))
    p_u_4.face_initial_position = p_u_4.instance.Face.Position
    p_u_4.instance.MouseEnter:connect(function()
        p_u_4:hover()
    end)
    p_u_4.instance.MouseLeave:connect(function()
        if not p_u_4.props.hold_down then
            p_u_4.is_down = false
        end
        p_u_4:unhover()
    end)
    p_u_4.instance.MouseButton1Down:connect(function(...)
        if not p_u_4.props.run_down_logic_only_on_click then
            p_u_4:down(...)
        end
    end)
    p_u_4.instance.MouseButton1Up:connect(function()
        if not p_u_4.props.hold_down then
            p_u_4.is_down = false
            p_u_4:up()
            p_u_4:render()
        end
    end)
    p_u_4.instance.MouseButton1Click:connect(function(...)
        if p_u_4.props.run_down_logic_only_on_click then
            p_u_4:down(...)
        end
        if not p_u_4.disabled or p_u_4.fire_clicked_events_when_disabled then
            p_u_4:up()
            if p_u_4.props.mouse_button1_click then
                p_u_4.props.mouse_button1_click(...)
            end
        end
    end)
    p_u_4.instance.InputEnded:Connect(function()
        p_u_4:up()
    end)
    p_u_4:render()
    p_u_4.instance:GetPropertyChangedSignal("Visible"):Connect(function()
        if not p_u_4.instance.Visible then
            p_u_4:up()
            p_u_4:unhover()
        end
    end)
    return p_u_4
end
return v2