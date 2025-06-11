--// ReplicatedStorage.ClientModules.UI.PizzaShopOrderTabletGui (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Roact")
local v_u_3 = v1("package:Flipper")
local v_u_4 = v1("package:RoactFlipper")
local v5 = v1("PizzaShopHelper")
local v_u_6 = {
    ["Background"] = "rbxassetid://10453108991",
    ["Button"] = "rbxassetid://10453108666"
}
local v_u_7 = {
    ["Cheese"] = {
        ["Order"] = 1,
        ["Image"] = v5.pizza_images_by_type.Cheese
    },
    ["Pepperoni"] = {
        ["Order"] = 2,
        ["Image"] = v5.pizza_images_by_type.Pepperoni
    },
    ["Veggie"] = {
        ["Order"] = 3,
        ["Image"] = v5.pizza_images_by_type.Veggie
    },
    ["Hawaiian"] = {
        ["Order"] = 4,
        ["Image"] = v5.pizza_images_by_type.Hawaiian
    }
}
local v8 = v_u_2.PureComponent:extend("PizzaShopOrderTabletGui")
function v8.init(p9)
    p9.feedbackMotor = v_u_3.SingleMotor.new(0)
    p9.feedbackBinding = v_u_4.getBinding(p9.feedbackMotor)
    p9.orderedMotor = v_u_3.SingleMotor.new(0)
    p9.orderedBinding = v_u_4.getBinding(p9.orderedMotor)
    p9.rejectedMotor = v_u_3.SingleMotor.new(0)
    p9.rejectedBinding = v_u_4.getBinding(p9.rejectedMotor)
    p9.canOrder = true
    p9:setState({
        ["orderRejected"] = false,
        ["orderedPizzaImage"] = nil
    })
end
function v8.orderPizza(p10, p11)
    p10.props.OnOrdered(p11)
    p10:setState({
        ["orderedPizzaImage"] = v_u_7[p11].Image
    })
    local v_u_12 = p10.orderedMotor
    v_u_12:setGoal(v_u_3.Instant.new(0))
    task.delay(0.5, function()
        v_u_12:setGoal(v_u_3.Spring.new(1, {
            ["frequency"] = 1,
            ["dampingRatio"] = 1
        }))
    end)
end
function v8.setFeedbackState(p13, p14)
    p13.feedbackMotor:setGoal(v_u_3.Spring.new(p14 and 0 or 1, {
        ["frequency"] = 4,
        ["dampingRatio"] = 1
    }))
end
function v8.setCanOrder(p15, p16)
    p15.canOrder = p16
    p15:setFeedbackState(p16)
end
function v8.rejectOrder(p_u_17)
    p_u_17.canOrder = false
    p_u_17:setState({
        ["orderRejected"] = true
    })
    p_u_17:setFeedbackState(false)
    p_u_17.rejectedMotor:setGoal(v_u_3.Linear.new(1, {
        ["velocity"] = 4
    }))
    task.delay(1, function()
        p_u_17:setFeedbackState(true)
        p_u_17.rejectedMotor:setGoal(v_u_3.Instant.new(0))
        task.wait(0.5)
        p_u_17.canOrder = true
        p_u_17:setState({
            ["orderRejected"] = false
        })
    end)
end
function v8.render(p_u_18)
    local v19 = p_u_18.props
    local v_u_20 = v19.GetHasAccess
    local v_u_21 = v19.OnRejected
    local v_u_22 = v19.GetIsActive
    local v23 = {}
    for v_u_24, v25 in v_u_7 do
        v23[v_u_24] = v_u_2.createElement("ImageButton", {
            ["BackgroundTransparency"] = 1,
            ["Image"] = v_u_6.Button,
            ["LayoutOrder"] = v25.Order,
            [v_u_2.Event.Activated] = function()
                if p_u_18.canOrder then
                    if v_u_22() then
                        if v_u_20 and v_u_20() then
                            p_u_18:orderPizza(v_u_24)
                            p_u_18:setCanOrder(false)
                            task.delay(1, function()
                                p_u_18:setCanOrder(true)
                            end)
                        else
                            p_u_18:rejectOrder()
                            v_u_21()
                        end
                    else
                        p_u_18:rejectOrder()
                        return
                    end
                else
                    return
                end
            end
        }, {
            ["Icon"] = v_u_2.createElement("ImageLabel", {
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.475, 0),
                ["Size"] = UDim2.new(0.7, 0, 0.7, 0),
                ["BackgroundTransparency"] = 1,
                ["Image"] = v25.Image
            })
        })
    end
    local v26 = v_u_2.createElement
    local v27 = "Frame"
    local v28 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["ClipsDescendants"] = true
    }
    local v29 = {
        ["Background"] = v_u_2.createElement("ImageLabel", {
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["Image"] = v_u_6.Background
        }),
        ["Buttons"] = v_u_2.createElement("Frame", {
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["BackgroundTransparency"] = 1
        }, {
            ["Layout"] = v_u_2.createElement("UIGridLayout", {
                ["CellSize"] = UDim2.new(0.45, 0, 0.45, 0),
                ["CellPadding"] = UDim2.new(0.025, 0, 0.025, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["Buttons"] = v_u_2.createFragment(v23)
        })
    }
    local v30 = v_u_2.createElement
    local v31 = "Frame"
    local v34 = {
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = Color3.new(0, 0, 0),
        ["ZIndex"] = 8,
        ["BackgroundTransparency"] = p_u_18.feedbackBinding:map(function(p32)
            return 1 + -0.5 * p32
        end),
        ["Visible"] = p_u_18.feedbackBinding:map(function(p33)
            return p33 > 0
        end)
    }
    local v38 = {
        ["Icon"] = v_u_2.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 8,
            ["Image"] = p_u_18.state.orderedPizzaImage or "",
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.new(0.75, 0, 0.75, 0),
            ["ImageTransparency"] = p_u_18.feedbackBinding:map(function(p35)
                return 1 + -1 * p35
            end),
            ["Position"] = p_u_18.orderedBinding:map(function(p36)
                local v37 = 0.5 + -1 * p36
                return UDim2.new(0.5, 0, v37, 0)
            end)
        })
    }
    local v39 = not p_u_18.state.orderRejected
    if v39 then
        v39 = v_u_2.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextSize"] = 16,
            ["Text"] = "\226\156\133",
            ["ZIndex"] = 9,
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["TextTransparency"] = p_u_18.feedbackBinding:map(function(p40)
                return 1 - p40
            end)
        })
    end
    v38.Check = v39
    local v41 = p_u_18.state.orderRejected
    if v41 then
        v41 = v_u_2.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextSize"] = 16,
            ["Text"] = v_u_22() and "\226\157\140" or "\226\157\140 \240\159\152\180 \226\157\140",
            ["ZIndex"] = 9,
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["TextTransparency"] = p_u_18.feedbackBinding:map(function(p42)
                return 1 - p42
            end),
            ["Position"] = p_u_18.rejectedBinding:map(function(p43)
                local v44 = p43 * 16
                local v45 = math.sin(v44) * 32 * (1 - p43)
                return UDim2.new(0, v45, 0, 0)
            end)
        })
    end
    v38.Rejection = v41
    v29.Feedback = v30(v31, v34, v38)
    return v26(v27, v28, v29)
end
return v8