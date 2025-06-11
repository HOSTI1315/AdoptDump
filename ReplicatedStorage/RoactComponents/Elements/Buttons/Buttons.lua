--// ReplicatedStorage.RoactComponents.Elements.Buttons (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIDB")
local v_u_3 = v1("Roact")
local v4 = {}
local v_u_5 = v_u_3.createElement
local function v_u_10(p6)
    local v7 = v_u_5
    local v8 = {
        ["Size"] = UDim2.new(1, 0, 0, 11),
        ["Position"] = UDim2.new(0, 0, 1, -3),
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["BackgroundTransparency"] = 1,
        ["ClipsDescendants"] = true
    }
    local v9 = {
        ["rounded"] = v_u_5("ImageLabel", {
            ["Image"] = "rbxassetid://836164959",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 40),
            ["Position"] = UDim2.new(0, 0, 1, 0),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["ImageColor3"] = p6.BackgroundColor,
            ["ScaleType"] = Enum.ScaleType.Slice,
            ["SliceCenter"] = Rect.new(10, 10, 20, 20)
        }),
        ["triangle"] = v_u_5("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -1),
            ["Size"] = UDim2.fromOffset(11, 6),
            ["Image"] = "rbxassetid://12185372485"
        })
    }
    return v7("Frame", v8, v9)
end
v4.FlatButton = v_u_3.PureComponent:extend("FlatButton")
function v4.FlatButton.init(p_u_11)
    function p_u_11.on_mouse_button1_down(...)
        if not p_u_11.props.disabled then
            p_u_11:setState({
                ["button_down"] = true
            })
            local v12 = p_u_11.props.mouse_button1_down
            if v12 then
                v12(...)
            end
        end
    end
    function p_u_11.on_mouse_button1_click(...)
        if not p_u_11.props.disabled then
            local v13 = p_u_11.props.mouse_button1_click
            if v13 then
                v13(...)
            end
        end
    end
    function p_u_11.on_activated(...)
        if not p_u_11.props.disabled then
            local v14 = p_u_11.props.on_activated
            if v14 then
                v14(...)
            end
        end
    end
    function p_u_11.on_mouse_button1_up()
        if not p_u_11.props.disabled then
            p_u_11:setState({
                ["button_down"] = false
            })
        end
    end
    function p_u_11.on_mouse_enter()
        if not p_u_11.props.disabled then
            p_u_11:setState({
                ["hover"] = true
            })
        end
    end
    function p_u_11.on_mouse_leave()
        if not p_u_11.props.disabled then
            p_u_11:setState({
                ["hover"] = false
            })
        end
    end
end
function v4.FlatButton.render(p15)
    local v16 = p15.props
    local v17 = v16.position or UDim2.new()
    local v18 = v16.size
    local v19 = v16.anchor_point
    local v20 = v16[v_u_3.Children]
    local v21 = p15.state.hover
    local v22 = v16.color or (v16.imagecolor3 or Color3.fromRGB(0, 151, 255))
    local v23 = Color3.new
    local v24 = v22.r + 0.15
    local v25 = math.clamp(v24, 0, 1)
    local v26 = v22.g + 0.15
    local v27 = math.clamp(v26, 0, 1)
    local v28 = v22.b + 0.15
    local v29 = v23(v25, v27, (math.clamp(v28, 0, 1)))
    if v21 then
        v22 = v29
    end
    local v30 = v16.render_dropdown_triangle and {
        ["dropdown_triangle"] = v_u_10({
            ["TriangleColor"] = Color3.new(1, 1, 1),
            ["BackgroundColor"] = v29
        }),
        ["new_children"] = v_u_5("Frame", {
            ["Size"] = UDim2.new(1, 0, 1, -11),
            ["BackgroundTransparency"] = 1
        }, v20)
    } or v20
    local v31 = p15.state.button_down
    local v32 = v16.layout_order
    local v33 = v16.style or "ROUND"
    local v34 = v16.selectable
    local v35 = nil
    local v36 = nil
    if v33 == "ROUND" then
        v35 = v_u_2.FlatButtonDown
        v36 = v_u_2.FlatButtonUp
    elseif v33 == "FLAT" then
        v35 = v_u_2.SquareFlatButtonDown
        v36 = v_u_2.SquareFlatButtonUp
    else
        error("Not valid style")
    end
    local v37 = v16[v_u_3.Ref]
    local v38 = v_u_5
    local v39 = "ImageButton"
    local v40 = {}
    if v31 then
        v36 = v35 or v36
    end
    v40.Image = v36
    v40.ScaleType = Enum.ScaleType.Slice
    v40.SliceCenter = Rect.new(10, 10, 20, 20)
    v40.BackgroundTransparency = 1
    if v31 then
        v17 = v17 + UDim2.new(0, 0, 0, 3) or v17
    end
    v40.Position = v17
    v40.ImageColor3 = v22
    v40.Size = v18
    v40.AnchorPoint = v19
    v40.LayoutOrder = v32
    v40.Selectable = v34
    v40[v_u_3.Event.MouseButton1Down] = p15.on_mouse_button1_down
    v40[v_u_3.Event.MouseButton1Click] = p15.on_mouse_button1_click
    v40[v_u_3.Event.Activated] = p15.on_activated
    v40[v_u_3.Event.MouseButton1Up] = p15.on_mouse_button1_up
    v40[v_u_3.Event.MouseEnter] = p15.on_mouse_enter
    v40[v_u_3.Event.MouseLeave] = p15.on_mouse_leave
    v40[v_u_3.Ref] = v37
    return v38(v39, v40, v30)
end
v4.IconButton = v_u_3.PureComponent:extend("IconButton")
function v4.IconButton.init(p_u_41)
    function p_u_41.on_mouse_button1_down(...)
        p_u_41:setState({
            ["button_down"] = true
        })
        local v42 = p_u_41.props.mouse_button1_down
        if v42 then
            v42(...)
        end
    end
    function p_u_41.on_mouse_button1_click(...)
        local v43 = p_u_41.props.mouse_button1_click
        if v43 then
            v43(...)
        end
    end
    function p_u_41.on_mouse_button1_up()
        p_u_41:setState({
            ["button_down"] = false
        })
    end
    function p_u_41.on_mouse_leave()
        p_u_41:setState({
            ["hover"] = false
        })
    end
    function p_u_41.on_mouse_enter()
        p_u_41:setState({
            ["hover"] = true
        })
    end
end
function v4.IconButton.render(p44)
    local v45 = p44.props
    local v46 = v45.position
    local v47 = v45.size
    local v48 = v45.anchor_point
    local v49 = v45.image
    local v50 = v45[v_u_3.Children]
    local v51 = v45.layout_order
    local v52 = v45.initial_color
    local v53 = v45.active_color
    local v54 = v45.modal
    local v55 = p44.state.button_down
    local v56 = p44.state.hover
    local v57 = v45[v_u_3.Ref]
    return v_u_5("ImageButton", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = v47,
        ["Position"] = v46,
        ["AnchorPoint"] = v48,
        ["Image"] = v49,
        ["Visible"] = v45.visible,
        ["LayoutOrder"] = v51,
        ["Modal"] = v54,
        ["ImageColor3"] = (v56 or v55) and v53 and v53 or v52,
        [v_u_3.Event.MouseButton1Down] = p44.on_mouse_button1_down,
        [v_u_3.Event.MouseButton1Click] = p44.on_mouse_button1_click,
        [v_u_3.Event.MouseButton1Up] = p44.on_mouse_button1_up,
        [v_u_3.Event.MouseEnter] = p44.on_mouse_enter,
        [v_u_3.Event.MouseLeave] = p44.on_mouse_leave,
        [v_u_3.Ref] = v57
    }, v50)
end
function v4.ButtonText(p58)
    local v59 = p58.text
    local v60 = p58.nudge_y or -2
    local v61 = p58.text_stroke_transparency
    local v62 = p58.size or UDim2.new(0.8, 0, 0.8, 0)
    local v63 = p58.visible
    return v_u_3.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = v62,
        ["Position"] = UDim2.new((1 - v62.X.Scale) / 2, 0, (1 - v62.Y.Scale) / 2, v60),
        ["Text"] = v59,
        ["TextScaled"] = true,
        ["TextColor3"] = Color3.new(1, 1, 1),
        ["Font"] = Enum.Font.SourceSansBold,
        ["TextStrokeTransparency"] = v61,
        ["Visible"] = v63
    })
end
return v4