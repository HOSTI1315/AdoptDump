--// ReplicatedStorage.ClientModules.UI.PizzaShopDriveThroughSpeechBubbleGui (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Roact")
local v_u_3 = v1("package:Promise")
local v_u_4 = v1("PizzaShopHelper")
local v_u_5 = {
    ["BubblePoint"] = "rbxassetid://10548513503"
}
local v6 = v_u_2.PureComponent:extend("PizzaShopDriveThroughSpeechBubbleGui")
function v6.init(p7)
    p7:setState({
        ["type"] = "Starting"
    })
    local v8, v9 = v_u_2.createBinding(0)
    p7.scalar = v8
    p7.updateScalar = v9
end
function v6.tweenScalar(p_u_10, p_u_11, p_u_12)
    return v_u_3.new(function(p13)
        local v14 = (p_u_11 - p_u_10.scalar:getValue()) / p_u_12
        while p_u_12 > 0 do
            local v15 = task.wait()
            p_u_12 = p_u_12 - v15
            p_u_10.updateScalar(p_u_10.scalar:getValue() + v14 * v15)
        end
        p_u_10.updateScalar(p_u_11)
        p13()
    end)
end
function v6.beFrustrated(p_u_16, p17)
    if p_u_16.state.type == "Waiting" then
        p_u_16:setState({
            ["type"] = p17 or "Frustrated"
        })
        p_u_16:tweenScalar(1, 0.2):andThen(function()
            task.wait(1)
            p_u_16:tweenScalar(0, 0.2):andThen(function()
                p_u_16:setState({
                    ["type"] = "Waiting"
                })
            end)
        end)
    end
end
function v6.beSatisfied(p_u_18)
    if p_u_18.state.type == "Waiting" then
        p_u_18:setState({
            ["type"] = "Satisfied"
        })
        p_u_18:tweenScalar(1, 0.2):andThen(function()
            task.wait(1)
            p_u_18:setState({
                ["type"] = "Finishing"
            })
            p_u_18:tweenScalar(0, 0.5):andThen(function()
                p_u_18:setState({
                    ["type"] = "Finished"
                })
                p_u_18.props.OnFinished()
            end)
        end)
    else
        p_u_18.props.OnFinished()
    end
end
function v6.start(p_u_19)
    p_u_19:setState({
        ["type"] = "Starting"
    })
    p_u_19.updateScalar(0)
    p_u_19:tweenScalar(1, 0.5):andThen(function()
        p_u_19:setState({
            ["type"] = "Waiting"
        })
        p_u_19.updateScalar(0)
    end)
end
function v6.didMount(p_u_20)
    local v21 = p_u_20.props
    p_u_20.frustratedConnection = v21.Frustrated:Connect(function(p22)
        p_u_20:beFrustrated(p22)
    end)
    p_u_20.satisfiedConnection = v21.Satisfied:Connect(function()
        p_u_20:beSatisfied()
    end)
    p_u_20:start()
end
function v6.willUnmount(p23)
    p23.frustratedConnection:Disconnect()
    p23.satisfiedConnection:Disconnect()
end
function v6.render(p_u_24)
    if p_u_24.state.type == "Finished" then
        return nil
    end
    local v25 = p_u_24.props.PizzaType
    local v26 = UDim.new(0.1, 0)
    local v27 = false
    local v28 = nil
    if p_u_24.state.type == "NoBox" then
        v27 = true
        v28 = "\240\159\147\166\226\157\147"
    elseif p_u_24.state.type == "Frustrated" then
        v27 = true
        v28 = "\240\159\152\160"
    elseif p_u_24.state.type == "Satisfied" or p_u_24.state.type == "Finishing" then
        v27 = true
        v28 = "\240\159\152\139"
    end
    local v29 = v_u_2.createFragment
    local v30 = {}
    local v31 = v_u_2.createElement
    local v32 = "Frame"
    local v34 = {
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Size"] = UDim2.new(0.8, 0, 0.8, 0),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
        ["Position"] = UDim2.new(0.5, 0, 0, 0),
        ["BackgroundColor3"] = Color3.new(1, 1, 1),
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = p_u_24.scalar:map(function(p33)
            return p_u_24.state.type ~= "Finishing" and p_u_24.state.type ~= "Starting" and 0 or 1 - p33
        end)
    }
    local v36 = {
        ["Corner"] = v_u_2.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }),
        ["Padding"] = v_u_2.createElement("UIPadding", {
            ["PaddingLeft"] = v26,
            ["PaddingRight"] = v26,
            ["PaddingTop"] = v26,
            ["PaddingBottom"] = v26
        }),
        ["Icon"] = v_u_2.createElement("ImageLabel", {
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["BackgroundTransparency"] = 1,
            ["Image"] = v_u_4.pizza_images_by_type[v25],
            ["ImageTransparency"] = p_u_24.scalar:map(function(p35)
                if p_u_24.state.type == "Starting" then
                    return 1 - p35
                else
                    return p_u_24.state.type == "Finishing" and 1 or p35
                end
            end)
        })
    }
    if v27 then
        v27 = v_u_2.createElement("TextLabel", {
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Text"] = v28,
            ["TextTransparency"] = p_u_24.scalar:map(function(p37)
                return 1 - p37
            end),
            ["ZIndex"] = 2
        })
    end
    v36.Emotion = v27
    v30.Top = v31(v32, v34, v36)
    v30.Bottom = v_u_2.createElement("ImageLabel", {
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Size"] = UDim2.new(1, 0, 0.19999999999999996, 0),
        ["Position"] = UDim2.new(0.5, 0, 1, 0),
        ["ScaleType"] = Enum.ScaleType.Fit,
        ["Image"] = v_u_5.BubblePoint,
        ["BackgroundTransparency"] = 1,
        ["ImageTransparency"] = p_u_24.scalar:map(function(p38)
            return p_u_24.state.type ~= "Finishing" and p_u_24.state.type ~= "Starting" and 0 or 1 - p38
        end)
    })
    return v29(v30)
end
return v6