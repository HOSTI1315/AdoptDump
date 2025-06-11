--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Effects.ScrollingFrameGradients (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("TweenHelper")
local v_u_4 = v1("TweenPromise")
local v_u_5 = v3.tween_info({
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.Out,
    ["time"] = 0.1
})
local v6 = v2("ScrollingFrameGradients", v1("UIBaseElement"))
function v6._update_gradient_visible(_, p7, p8, p9)
    if p8 ~= p9 then
        v_u_4.new(p7, v_u_5, {
            ["BackgroundTransparency"] = p9 and 0 or 1
        })
    end
end
function v6._on_scrolling_frame_changed(p10)
    local v11 = p10.scrolling_frame.CanvasPosition.Y
    local v12 = p10.scrolling_frame.AbsoluteCanvasSize.Y
    local v13 = p10.scrolling_frame.AbsoluteWindowSize.Y
    local v14, v15
    if v12 == v13 then
        v14 = false
        v15 = false
    else
        v14 = v11 - 5 > 0
        if v11 + 5 < v12 - v13 then
            v15 = true
        else
            v15 = false
        end
    end
    p10:_update_gradient_visible(p10.top_gradient, p10.top_visible, v14)
    p10:_update_gradient_visible(p10.bottom_gradient, p10.bottom_visible, v15)
    p10.top_visible = v14
    p10.bottom_visible = v15
    if p10.can_update_canvas_offset then
        p10.last_canvas_offset = v11
    end
end
function v6.start(p_u_16, p17)
    local v18 = p17 or {}
    p_u_16.scrolling_frame = v18.scrolling_frame or p_u_16.instance.ScrollingFrame
    p_u_16.top_gradient = v18.top_gradient or p_u_16.instance.TopGradient
    p_u_16.bottom_gradient = v18.bottom_gradient or p_u_16.instance.BottomGradient
    p_u_16.top_gradient.BackgroundTransparency = 1
    p_u_16.bottom_gradient.BackgroundTransparency = 1
    p_u_16:_on_scrolling_frame_changed()
    p_u_16.scrolling_frame.Changed:Connect(function()
        p_u_16:_on_scrolling_frame_changed()
    end)
    return p_u_16
end
return v6