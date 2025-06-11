--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.NewSpotlightApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("GetHardwareSafeAreaInsets")
local v_u_4 = v1("TweenHelper")
local v_u_5 = v1("TweenPromise")
local v_u_6 = v1("package:Promise")
local v_u_7 = game:GetService("GuiService")
local v_u_8 = game:GetService("RunService")
local v9 = v3()
local v_u_10 = Vector2.new(v9.left, v9.top)
local v_u_11 = v2("Spotlight")
function v_u_11.__init(p12, p13, p14, p15)
    p12.visible = false
    p12.visibility_promise = v_u_6.resolve()
    p12.instance = p13
    p12.arrow_template = p14
    p12.circle_template = p15
    p12.arrow_tween = v_u_6.resolve()
    p12.arrow_theta = nil
    p12.canvas = p12:_create()
end
function v_u_11._create(p16)
    local v17 = Instance.new("CanvasGroup")
    v17.GroupTransparency = 1
    v17.BackgroundTransparency = 1
    v17.Size = UDim2.new(1, 0, 1, 0)
    v17.Parent = p16.instance
    local v18 = Instance.new("CanvasGroup")
    v18.GroupTransparency = 0.5
    v18.GroupColor3 = Color3.new(0, 0, 0)
    v18.BackgroundTransparency = 1
    v18.Size = UDim2.new(1, 0, 1, 0)
    v18.Name = "blinders"
    v18.Parent = v17
    for _, v19 in {
        "left",
        "top",
        "right",
        "bottom"
    } do
        local v20 = Instance.new("Frame")
        v20.BorderSizePixel = 0
        v20.BackgroundColor3 = Color3.new(1, 1, 1)
        v20.Name = v19
        v20.Parent = v18
    end
    local v21 = p16.circle_template:Clone()
    v21.Name = "circle"
    v21.Size = UDim2.new(0, 0, 0, 0)
    v21.Position = UDim2.new(0, 0, 0, 0)
    v21.Parent = v18
    local v22 = p16.arrow_template:Clone()
    v22.Name = "arrow"
    v22.ZIndex = 2
    v22.Parent = v17
    return v17
end
function v_u_11.enable_arrow(p23, p24)
    if p23.canvas:FindFirstChild("arrow") then
        if p23.canvas.arrow.Visible ~= p24 then
            p23.canvas.arrow.Visible = p24
            p23.arrow_tween:cancel()
            p23.arrow_theta = nil
        end
    end
end
function v_u_11.set_arrow(p25, p26, p27, p28)
    local v29 = p25.canvas.arrow
    local v30 = p28.X / 2
    local v31 = p28.Y / 2
    local v32 = {
        v30,
        v30,
        v31,
        v31
    }
    local v33 = UDim2.new(p27.X.Scale * v32[1], p27.X.Offset * v32[2], p27.Y.Scale * v32[3], p27.Y.Offset * v32[4])
    local v34 = Vector2.new
    local v35 = p28.X
    local v36 = (1 - math.sign(v35)) / 2
    local v37 = p28.Y
    v29.AnchorPoint = v34(v36, (1 - math.sign(v37)) / 2)
    local v38 = v29.AnchorPoint.Y - 0.5
    local v39 = v29.AnchorPoint.X - 0.5
    local v40 = math.atan2(v38, v39)
    v29.Position = p26 + v33
    v29.ZIndex = 2
    if p25.arrow_theta ~= v40 then
        p25.arrow_theta = v40
        local v41 = UDim2.fromOffset(math.cos(v40) * 5, math.sin(v40) * 5)
        v29.ArrowPivot.Rotation = math.deg(v40)
        v29.ArrowPivot.Position = UDim2.fromScale(0.5, 0.5) - v41
        local v42 = v_u_4.tween_info({
            ["time"] = 0.5,
            ["easing_style"] = Enum.EasingStyle.Sine,
            ["easing_direction"] = Enum.EasingDirection.Out,
            ["repeat_count"] = -1,
            ["reverses"] = true
        })
        p25.arrow_tween:cancel()
        p25.arrow_tween = v_u_5.new(v29.ArrowPivot, v42, {
            ["Position"] = UDim2.fromScale(0.5, 0.5) + v41
        })
    end
end
function v_u_11.set_blinders(p43, p44, p45)
    local v46 = {
        0.5,
        0.5,
        0,
        0
    }
    local v47 = UDim2.new(p45.X.Scale * v46[1], p45.X.Offset * v46[2], p45.Y.Scale * v46[3], p45.Y.Offset * v46[4])
    local v48 = {
        1,
        1,
        0,
        0
    }
    local v49 = UDim2.new(p45.X.Scale * v48[1], p45.X.Offset * v48[2], p45.Y.Scale * v48[3], p45.Y.Offset * v48[4])
    local v50 = {
        0,
        0,
        0.5,
        0.5
    }
    local v51 = UDim2.new(p45.X.Scale * v50[1], p45.X.Offset * v50[2], p45.Y.Scale * v50[3], p45.Y.Offset * v50[4])
    local v52 = {
        ["left"] = {
            ["Position"] = p44 - v47,
            ["Size"] = UDim2.new(10, 0, 10, 0),
            ["AnchorPoint"] = Vector2.new(1, 0.5)
        },
        ["top"] = {
            ["Position"] = p44 - v51,
            ["Size"] = v49 + UDim2.new(0, 0, 10, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 1)
        },
        ["right"] = {
            ["Position"] = p44 + v47,
            ["Size"] = UDim2.new(10, 0, 10, 0),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        },
        ["bottom"] = {
            ["Position"] = p44 + v51,
            ["Size"] = v49 + UDim2.new(0, 0, 10, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        },
        ["circle"] = {
            ["Position"] = p44,
            ["Size"] = p45,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
    }
    for v53, v54 in v52 do
        local v55 = p43.canvas.blinders:FindFirstChild(v53)
        if v55 then
            for v56, v57 in v54 do
                v55[v56] = v57
            end
        end
    end
end
function v_u_11.set_visible(p58, p59)
    if p58.visible ~= p59 then
        p58.visible = p59
        p58.visibility_promise = v_u_5.new(p58.canvas, TweenInfo.new(0.2), {
            ["GroupTransparency"] = p59 and 0 or 1
        })
    end
    return p58.visibility_promise
end
function v_u_11.Destroy(p_u_60)
    local v_u_61 = p_u_60:set_visible(false)
    v_u_6.try(function()
        v_u_61:await()
        p_u_60.canvas:Destroy()
    end)
end
local function v_u_67(p62)
    local v63 = p62.X
    local v64 = p62.Y
    local v65 = math.max(v63, v64)
    local v66 = Vector2.new(v65, v65)
    return UDim2.fromOffset(v66.X * 1.5, v66.Y * 1.5)
end
local v68 = v2("NewSpotlightApp", v1("UIBaseApp"))
function v68.request(p69)
    return v_u_11.new(p69.instance, p69.arrow_template, p69.circle_template)
end
function v68.target(p70, p_u_71)
    local v_u_72 = p70:request()
    local v_u_73 = v_u_7:GetGuiInset()
    local v_u_82 = v_u_8.RenderStepped:Connect(function()
        local v74, v75, v76 = p_u_71()
        local v77 = v76 or v_u_67
        v_u_72:set_visible(v74 and true or false)
        v_u_72:enable_arrow(v75 and true or false)
        if v74 then
            local v78 = v74.AbsoluteSize
            local v79 = v74.AbsolutePosition + v_u_10 + v78 / 2
            local v80 = UDim2.fromOffset(v79.X, v79.Y + v_u_73.Y)
            local v81 = v77(v78)
            if v75 then
                v_u_72:set_arrow(v80, v81, v75)
            end
            v_u_72:set_blinders(v80, v81)
        end
    end)
    return function()
        v_u_82:Disconnect()
        v_u_82 = nil
        v_u_72:Destroy()
    end
end
function v68.show(p83)
    p83.instance.Enabled = true
end
function v68.hide(p84)
    p84.instance.Enabled = false
end
function v68.start(p85)
    p85.circle_template = p85.instance.Circle
    p85.circle_template.Parent = nil
    p85.arrow_template = p85.instance.Arrow
    p85.arrow_template.Parent = nil
end
return v68