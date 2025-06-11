--// ReplicatedStorage.RoactComponents.Elements.ScrollingFrame (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIDB")
local v_u_3 = v1("Roact")
local v4 = {}
local v_u_5 = v_u_3.createElement
v4.ScrollingFrame = v_u_3.PureComponent:extend("ScrollingFrame")
function v4.ScrollingFrame.render(p6)
    local v7 = p6.props
    local v8 = v7.size
    local v9 = v7.position
    local v10 = v7.canvas_size
    local v11 = v7.background_transparency or 1
    local v12 = v7.background_color3
    local v13 = v7[v_u_3.Children]
    local v14 = v_u_5
    local v15 = {}
    local v16 = v_u_5
    local v17 = {
        ["BackgroundTransparency"] = v11,
        ["BackgroundColor3"] = v12,
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BottomImage"] = v_u_2.ScrollingFrameSliderBottomImage,
        ["MidImage"] = v_u_2.ScrollingFrameSliderMidImage,
        ["TopImage"] = v_u_2.ScrollingFrameSliderTopImage,
        ["ScrollBarThickness"] = 8,
        ["Selectable"] = false,
        ["CanvasSize"] = v10,
        ["ZIndex"] = 2,
        ["BorderSizePixel"] = 0
    }
    local v18 = {
        ["content"] = v_u_5("Frame", {
            ["Size"] = UDim2.new(1, -12, 1, 0),
            ["BackgroundTransparency"] = 1
        }, v13)
    }
    v15.scrolling_frame = v16("ScrollingFrame", v17, v18)
    local v19 = v_u_5
    local v20 = {
        ["Position"] = UDim2.new(1, -12, 0, 0),
        ["Size"] = UDim2.new(0, 16, 1, 0),
        ["BackgroundTransparency"] = 1
    }
    local v21 = {
        ["backing_bottom"] = v_u_5("ImageLabel", {
            ["Position"] = UDim2.new(0, 0, 1, -11),
            ["Size"] = UDim2.new(1, 0, 0, 16),
            ["Image"] = v_u_2.ScrollingBackingBottom,
            ["BackgroundTransparency"] = 1
        }),
        ["backing_mid"] = v_u_5("ImageLabel", {
            ["Position"] = UDim2.new(0, 0, 0, 11),
            ["Size"] = UDim2.new(1, 0, 1, -22),
            ["Image"] = v_u_2.ScrollingBackingMid,
            ["BackgroundTransparency"] = 1
        }),
        ["backing_top"] = v_u_5("ImageLabel", {
            ["Position"] = UDim2.new(0, 0, 0, -5),
            ["Size"] = UDim2.new(1, 0, 0, 16),
            ["Image"] = v_u_2.ScrollingBackingTop,
            ["BackgroundTransparency"] = 1
        })
    }
    v15.scrollbar_backing = v19("Frame", v20, v21)
    return v14("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Position"] = v9,
        ["Size"] = v8
    }, v15)
end
return v4