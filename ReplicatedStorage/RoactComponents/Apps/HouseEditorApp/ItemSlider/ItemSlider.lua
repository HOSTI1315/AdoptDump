--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.ItemSlider (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Roact")
local v_u_3 = v1("UI")
local v_u_4 = v1("UIDB")
local v_u_5 = v1("package:Sift")
local v_u_6 = require(script.Parent.ItemSliderContents)
local v7 = v_u_2.PureComponent:extend("ItemSlider")
function v7.init(p_u_8)
    function p_u_8.nav_left()
        p_u_8:setState(function(p9)
            local v10 = p_u_8.slider.AbsoluteSize.X / 93
            local v11 = math.floor(v10) * 93
            return {
                ["tween_x"] = (p9.tween_x or 0) + v11
            }
        end)
    end
    function p_u_8.nav_right()
        p_u_8:setState(function(p12)
            local v13 = p_u_8.slider.AbsoluteSize.X / 93
            local v14 = math.floor(v13) * 93
            return {
                ["tween_x"] = (p12.tween_x or 0) - v14
            }
        end)
    end
end
function v7.didUpdate(p15, p16, p17)
    if p15.props.drawer_content == nil then
        return
    elseif p15.props.drawer_content == p16.drawer_content then
        local v18 = p15.slider.AbsoluteSize.X / 93
        local v19 = math.floor(v18) * 93
        local v20 = p15.state.tween_x or 0
        local v21 = v20 < 0
        local v22 = v_u_5.Dictionary.count(p15.props.drawer_content.contents) * 93 - v19 > -v20
        if v21 ~= p17.left_nav_enabled or v22 ~= p17.right_nav_enabled then
            p15:setState({
                ["left_nav_enabled"] = v21,
                ["right_nav_enabled"] = v22
            })
        end
    else
        p15:setState({
            ["tween_x"] = 0
        })
    end
end
function v7.render(p_u_23)
    local v24 = p_u_23.props
    local v25 = v24.size
    local v26 = v24.position
    local v27 = v24.drawer_content
    local v28 = v24.set_drawer
    local v29 = v24.xbox_deselect
    local v30 = v24.signal_close
    local v31 = p_u_23.state.left_nav_enabled
    local v32 = p_u_23.state.right_nav_enabled
    local v33 = v_u_2.createElement
    local v34 = "Frame"
    local v35 = {
        ["Position"] = v26,
        ["Size"] = v25,
        ["BackgroundTransparency"] = 1
    }
    local v36 = {}
    local v37 = v_u_2.createElement
    local v38 = v_u_3.FlatButton
    local v39 = {
        ["size"] = UDim2.new(0, 34, 1, 0)
    }
    local v40
    if v31 then
        v40 = p_u_23.nav_left
    else
        v40 = v31
    end
    v39.mouse_button1_down = v40
    v39.color = v31 and Color3.fromRGB(0, 151, 255) or Color3.fromRGB(162, 162, 162)
    v36.left = v37(v38, v39, {
        ["image"] = v_u_2.createElement("ImageLabel", {
            ["Size"] = UDim2.new(0, 20, 0, 30),
            ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["Image"] = v_u_4.ArrowLeft
        })
    })
    local v41 = v_u_2.createElement
    local v42 = v_u_3.FlatButton
    local v43 = {
        ["size"] = UDim2.new(0, 34, 1, 0),
        ["position"] = UDim2.new(1, 0, 0, 0),
        ["anchor_point"] = Vector2.new(1, 0)
    }
    local v44
    if v32 then
        v44 = p_u_23.nav_right
    else
        v44 = v32
    end
    v43.mouse_button1_down = v44
    v43.color = v32 and Color3.fromRGB(0, 151, 255) or Color3.fromRGB(162, 162, 162)
    v36.right = v41(v42, v43, {
        ["image"] = v_u_2.createElement("ImageLabel", {
            ["Size"] = UDim2.new(0, 20, 0, 30),
            ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["Image"] = v_u_4.ArrowRight
        })
    })
    v36.container = v_u_2.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["ClipsDescendants"] = true,
        ["Size"] = UDim2.new(1, -92, 1, 0),
        ["Position"] = UDim2.new(0, 44, 0, 0),
        [v_u_2.Ref] = function(p45)
            p_u_23.slider = p45
        end
    }, {
        ["item_slider_contents"] = v_u_2.createElement(v_u_6, {
            ["tween_x"] = p_u_23.state.tween_x,
            ["drawer_content"] = v27,
            ["set_drawer"] = v28,
            ["xbox_deselect"] = v29,
            ["signal_close"] = v30
        })
    })
    return v33(v34, v35, v36)
end
return v7