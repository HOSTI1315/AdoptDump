--// ReplicatedStorage.RoactComponents.Elements.Sliding (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("UIDB")
local v_u_2 = v1("Roact")
local v3 = {}
local v_u_4 = v_u_2.createElement
v3.SlidingTween = v_u_2.Component:extend("SlidingTween")
function v3.SlidingTween.updated(p5, p6, _)
    local v7 = p6 and p6.position or UDim2.new()
    local v8 = p5.props.position or UDim2.new()
    if v8 ~= v7 then
        game:GetService("TweenService"):Create(p5.frame, p5.props.tween_info or TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
            ["Position"] = v8
        }):Play()
    end
end
v3.SlidingTween.didUpdate = v3.SlidingTween.updated
v3.SlidingTween.didMount = v3.SlidingTween.updated
function v3.SlidingTween.render(p_u_9)
    local v10 = p_u_9.props
    local v11 = v10.visible
    return v_u_4("Frame", {
        ["Size"] = v10.size or UDim2.new(1, 0, 1, 0),
        ["Visible"] = v11,
        ["BackgroundTransparency"] = 1,
        [v_u_2.Ref] = function(p12)
            p_u_9.frame = p12
        end
    }, v10[v_u_2.Children])
end
return v3