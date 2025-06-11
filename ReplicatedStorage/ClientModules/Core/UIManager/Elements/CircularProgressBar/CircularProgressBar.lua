--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.CircularProgressBar (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("TweenPromise")
local v_u_4 = Color3.new(1, 1, 1)
local v_u_5 = NumberSequence.new(0)
local v_u_6 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.495, 0),
    NumberSequenceKeypoint.new(0.505, 1),
    NumberSequenceKeypoint.new(1, 1)
})
local v_u_7 = game:GetService("ReplicatedStorage").Resources.UI_Resources.Templates
local v_u_8 = {
    "PaddingTop",
    "PaddingBottom",
    "PaddingLeft",
    "PaddingRight"
}
local v9 = v2("CircularProgressBar", v1("UIBaseElement"))
function v9.set_progress(p10, p11)
    if p10.tween then
        p10.tween:cancel()
        p10.tween = nil
    end
    p10:_set_progress(p11)
end
function v9.tween_progress(p_u_12, p13, p14)
    if p_u_12.tween then
        p_u_12.tween:cancel()
        p_u_12.tween = nil
    end
    p_u_12.tween = v_u_3.callback(p_u_12.progress, p13, TweenInfo.new(p14, Enum.EasingStyle.Linear), function(p15)
        p_u_12:_set_progress(p15)
    end)
end
function v9.set_color(p16, p17)
    p16.color = p17
    p16:_update()
end
function v9.set_transparency(p18, p19)
    p18.transparency = p19
    p18:_update()
end
function v9.set_padding(p20, p21)
    p20.padding = p21
    p20:_update_size()
end
function v9.set_parent_size(p22, p23)
    p22.known_parent_size = p23
    p22:_update_size()
end
function v9.set_stroke_width(p24, p25)
    p24.stroke_width = p25
    local v26 = UDim.new(0, p25)
    for _, v27 in v_u_8 do
        p24.left_padding[v27] = v26
        p24.right_padding[v27] = v26
    end
    p24:_update()
end
function v9.start(p_u_28)
    p_u_28.bar = v_u_7.CircularProgressBar:Clone()
    p_u_28.bar.Parent = p_u_28.instance
    p_u_28.left_stroke = p_u_28.bar.Left:FindFirstChild("UIStroke", true)
    p_u_28.right_stroke = p_u_28.bar.Right:FindFirstChild("UIStroke", true)
    p_u_28.left_fill = p_u_28.left_stroke.Parent
    p_u_28.right_fill = p_u_28.right_stroke.Parent
    p_u_28.left_padding = p_u_28.bar.Left:FindFirstChild("UIPadding", true)
    p_u_28.right_padding = p_u_28.bar.Right:FindFirstChild("UIPadding", true)
    p_u_28.left_gradient = p_u_28.bar.Left:FindFirstChild("UIGradient", true)
    p_u_28.right_gradient = p_u_28.bar.Right:FindFirstChild("UIGradient", true)
    p_u_28.padding = 0
    p_u_28.stroke_width = 0
    p_u_28.transparency = 0
    p_u_28.color = v_u_4
    p_u_28:_update()
    p_u_28.known_parent_size = nil
    p_u_28:_update_size()
    p_u_28.size_changed = p_u_28.instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_28:_update_size()
    end)
    p_u_28:set_progress(0)
end
function v9.destroy(p29)
    if p29.tween then
        p29.tween:cancel()
        p29.tween = nil
    end
    if p29.size_changed then
        p29.size_changed:Disconnect()
        p29.size_changed = nil
    end
end
function v9._update(p30)
    p30.left_fill.BackgroundColor3 = p30.color
    p30.right_fill.BackgroundColor3 = p30.color
    p30.left_stroke.Color = p30.color
    p30.right_stroke.Color = p30.color
    if p30.stroke_width > 0 then
        p30.left_fill.BackgroundTransparency = 1
        p30.right_fill.BackgroundTransparency = 1
        p30.left_stroke.Enabled = true
        p30.right_stroke.Enabled = true
        p30.left_gradient.Parent = p30.left_stroke
        p30.right_gradient.Parent = p30.right_stroke
        p30.left_stroke.Transparency = p30.transparency
        p30.right_stroke.Transparency = p30.transparency
        p30.left_stroke.Thickness = p30.stroke_width
        p30.right_stroke.Thickness = p30.stroke_width
    else
        p30.left_fill.BackgroundTransparency = p30.transparency
        p30.right_fill.BackgroundTransparency = p30.transparency
        p30.left_stroke.Enabled = false
        p30.right_stroke.Enabled = false
        p30.left_gradient.Parent = p30.left_fill
        p30.right_gradient.Parent = p30.right_fill
    end
end
function v9._update_size(p31)
    local v32 = (p31.known_parent_size or p31.instance.AbsoluteSize) + Vector2.one * (p31.padding * 2)
    p31.bar.Size = UDim2.fromOffset(v32.X, v32.Y)
    p31.bar.Left.Size = UDim2.fromOffset(v32.X * 0.5, v32.Y)
    p31.bar.Right.Size = UDim2.fromOffset(v32.X * 0.5, v32.Y)
    p31.bar.Left.Frame.Size = UDim2.fromOffset(v32.X, v32.Y)
    p31.bar.Right.Frame.Size = UDim2.fromOffset(v32.X, v32.Y)
end
function v9._set_progress(p33, p34)
    p33.progress = p34
    if p34 >= 1 then
        p33.left_gradient.Rotation = 0
        p33.right_gradient.Rotation = 180
        p33.left_gradient.Transparency = v_u_5
        p33.right_gradient.Transparency = v_u_5
        p33.bar.Left.Visible = true
        p33.bar.Right.Visible = true
        return
    elseif p34 > 0.5 then
        p33.left_gradient.Rotation = (p34 - 1) * 360
        p33.right_gradient.Rotation = 180
        p33.left_gradient.Transparency = v_u_6
        p33.right_gradient.Transparency = v_u_5
        p33.bar.Left.Visible = true
        p33.bar.Right.Visible = true
        return
    elseif p34 > 0 then
        p33.right_gradient.Rotation = p34 * 360
        p33.right_gradient.Transparency = v_u_6
        p33.bar.Left.Visible = false
        p33.bar.Right.Visible = true
    else
        p33.bar.Left.Visible = false
        p33.bar.Right.Visible = false
    end
end
return v9