--// ReplicatedStorage.ClientModules.UI.PizzaShopOrderBoardGui (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Roact")
local v_u_3 = v1("PizzaShopHelper")
local v_u_4 = {
    ["Background"] = "rbxassetid://10617153203",
    ["StickySmall"] = "rbxassetid://10456422386",
    ["StickyBig"] = "rbxassetid://10617152942"
}
local v5 = v_u_2.PureComponent:extend("PizzaShopOrderBoardGui")
function v5.render(p6)
    local v7 = p6.props
    local v8 = v7.Orders
    local v9 = v7.IsActive
    local v10 = #v8
    local v11 = {}
    for v12 = 1, math.min(v10, 5) do
        local v13 = v8[v12]
        local v14 = v_u_3.recipes_by_pizza_type[v13.pizza_type]
        local v15 = {}
        for _, v16 in v_u_3.ordered_toppings do
            if v14[v16] then
                table.insert(v15, v16)
            end
        end
        local v17 = {}
        for v18, v19 in v15 do
            local v20 = v_u_3.get_ingredient_from_topping(v19)
            v17[v20] = v_u_2.createElement("ImageLabel", {
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["BackgroundTransparency"] = 1,
                ["Image"] = v_u_3.ingredient_images_by_name[v20],
                ["LayoutOrder"] = v18
            })
        end
        local v21 = "BigSticky" .. v12
        local v22 = v_u_2.createElement
        local v23 = {
            ["LayoutOrder"] = v12,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0.2, 0, 1, 0)
        }
        local v24 = {
            ["Background"] = v_u_2.createElement("ImageLabel", {
                ["Image"] = v_u_4.StickyBig,
                ["BackgroundTransparency"] = 1,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["ZIndex"] = 2
            }),
            ["Pizza"] = v_u_2.createElement("ImageLabel", {
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.new(0.5, 0, 0.18, 0),
                ["Size"] = UDim2.new(0.62, 0, 0.62, 0),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
                ["BackgroundTransparency"] = 1,
                ["Image"] = v_u_3.pizza_images_by_type[v13.pizza_type],
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ZIndex"] = 4
            })
        }
        local v25 = v_u_2.createElement
        local v26 = {
            ["Size"] = UDim2.new(1, 0, 0.125, 0),
            ["Position"] = UDim2.new(0, 0, 0.725, 0),
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 4
        }
        local v27 = {
            ["Layout"] = v_u_2.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            }),
            ["Icons"] = v_u_2.createFragment(v17)
        }
        v24.Recipe = v25("Frame", v26, v27)
        v11[v21] = v22("Frame", v23, v24)
    end
    local v28 = v_u_2.createElement
    local v29 = "ImageLabel"
    local v30 = {
        ["Image"] = v_u_4.Background,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, 0, 1, 0)
    }
    local v31 = {
        ["Padding"] = v_u_2.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.01, 0)
        }),
        ["Label"] = v_u_2.createElement("TextLabel", {
            ["Size"] = UDim2.new(1, 0, 0.3, 0),
            ["Font"] = Enum.Font.GothamBold,
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.fromRGB(189, 56, 43),
            ["BackgroundTransparency"] = 1,
            ["Text"] = "ORDERS",
            ["ZIndex"] = 4
        })
    }
    local v32
    if v9 then
        local v33 = v_u_2.createElement
        local v34 = {
            ["BackgroundTransparency"] = 1,
            ["Position"] = UDim2.new(0, 0, 0.3, 0),
            ["Size"] = UDim2.new(1, 0, 0.7, 0)
        }
        local v35 = {
            ["Layout"] = v_u_2.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["Stickies"] = v_u_2.createFragment(v11)
        }
        v32 = v33("Frame", v34, v35)
    else
        v32 = v9
    end
    v31.Stickies = v32
    local v36 = not v9
    if v36 then
        v36 = v_u_2.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.7, 0),
            ["Position"] = UDim2.new(0, 0, 0.3, 0),
            ["TextScaled"] = true,
            ["Text"] = "\240\159\152\180"
        })
    end
    v31.ItIsNight = v36
    return v28(v29, v30, v31)
end
return v5