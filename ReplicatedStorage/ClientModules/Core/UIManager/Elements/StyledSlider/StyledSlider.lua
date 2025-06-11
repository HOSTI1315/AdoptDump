--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.StyledSlider (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ColorThemeManager")
local v_u_4 = v1("PlatformM")
local v_u_5 = v_u_4.get_platform()
local v6 = v2("StyledSlider", v1("UIBaseElement"))
local v_u_7 = game:GetService("TweenService")
function v6._get_num_elements(p8)
    return #p8.raw_elements
end
function v6._get_canvas_height(p9, _)
    if p9:_get_num_elements() == 0 then
        return 0
    end
    local v10 = p9.raw_elements[1]
    local v11 = p9.scrolling_frame.UIListLayout.Padding.Offset
    return v10.AbsoluteSize.Y * #p9.raw_elements + v11 * (#p9.raw_elements - 1)
end
function v6.increment_page(p12, p13)
    local v14 = p13 == 1 and true or p13 == -1
    assert(v14)
    if p12:_get_num_elements() ~= 0 then
        local v15 = p12:_get_canvas_height()
        local v16 = p12.scrolling_frame.AbsoluteSize.Y
        local v17 = p12.scrolling_frame.CanvasPosition.Y
        local v18 = v15 - v16
        local v19 = math.clamp(v18, 0, (1 / 0))
        local v20 = v17 + p13 * v16
        local v21 = math.clamp(v20, 0, v19)
        local v22 = p12.raw_elements[1]
        local v23 = p12.scrolling_frame.UIListLayout.Padding.Offset + v22.AbsoluteSize.Y
        if v21 ~= v19 then
            local v24 = v21 / v23
            local v25 = math.floor(v24) * v23
            v21 = math.floor(v25)
        end
        p12:refresh_buttons(v21)
        local v26 = v_u_7:Create(p12.scrolling_frame, TweenInfo.new(0.5), {
            ["CanvasPosition"] = Vector2.new(0, v21)
        })
        p12.last_tween = v26
        p12.tweens_playing = (p12.tweens_playing or 0) + 1
        p12.scrolling_frame.ScrollingEnabled = false
        v26:Play()
        v26.Completed:Wait()
        p12.tweens_playing = p12.tweens_playing - 1
        if p12.tweens_playing == 0 then
            p12.scrolling_frame.ScrollingEnabled = true
            p12.last_tween = nil
        end
    end
end
function v6.refresh_buttons(p27, p28)
    assert(p28)
    if p27:_get_num_elements() == 0 then
        p27.up_button:disable()
        p27.down_button:disable()
        return
    else
        local v29 = p27:_get_canvas_height() - p27.scrolling_frame.AbsoluteSize.Y
        local v30 = math.clamp(v29, 0, (1 / 0))
        if p28 == 0 then
            p27.up_button:disable()
        else
            p27.up_button:enable()
        end
        if p28 == v30 then
            p27.down_button:disable()
        else
            p27.down_button:enable()
        end
    end
end
function v6.deselect_all(p31)
    for _, v32 in ipairs(p31.wrapped_elements) do
        v32:up()
    end
end
function v6.select(p33, p34)
    for _, v35 in ipairs(p33.wrapped_elements) do
        if v35.instance.Name == p34 then
            v35:down()
        end
    end
end
function v6._create_new_wrapped_element(p_u_36, p_u_37)
    return p_u_36.UIManager.wrap(p_u_37, "CustomButton"):start({
        ["hover_render"] = function(p38)
            p38.InnerColor.ImageColor3 = v_u_3.lookup("medium_light")
            p38.ImageColor3 = v_u_3.lookup("background")
            p38.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end,
        ["up_render"] = function(p39)
            p39.InnerColor.ImageColor3 = v_u_3.lookup("saturated")
            p39.ImageColor3 = v_u_3.lookup("background")
            p39.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end,
        ["down_render"] = function(p40)
            p40.InnerColor.ImageColor3 = Color3.fromRGB(255, 255, 255)
            p40.ImageColor3 = Color3.fromRGB(255, 255, 255)
            p40.Icon.ImageColor3 = v_u_3.lookup("saturated")
        end,
        ["hold_down"] = true,
        ["run_down_logic_only_on_click"] = v_u_5 == v_u_4.platform.phone and true or v_u_5 == v_u_4.platform.tablet,
        [(v_u_5 == v_u_4.platform.phone or v_u_5 == v_u_4.platform.tablet) and "mouse_button1_click" or "mouse_button1_down"] = function()
            for _, v41 in ipairs(p_u_36.wrapped_elements) do
                if v41.instance ~= p_u_37 then
                    v41:up()
                end
            end
            if p_u_36.props.on_selected then
                p_u_36.props.on_selected(p_u_37)
            end
        end
    })
end
function v6.clear_elements(p42)
    for _, v43 in ipairs(p42.raw_elements) do
        v43:Destroy()
    end
    p42.wrapped_elements = {}
    p42.raw_elements = {}
    p42.scrolling_frame.CanvasPosition = Vector2.new()
    if p42.last_tween then
        p42.last_tween:Cancel()
        p42.last_tween = nil
    end
end
function v6.insert_element(p44, p45)
    assert(p45:IsA("ImageButton"))
    local v46 = p44:_create_new_wrapped_element(p45)
    p45.Parent = p44.scrolling_frame
    local v47 = p44.wrapped_elements
    table.insert(v47, v46)
    local v48 = p44.raw_elements
    table.insert(v48, p45)
    table.sort(p44.raw_elements, function(p49, p50)
        return p49.LayoutOrder < p50.LayoutOrder
    end)
    local v51 = p44:_get_canvas_height()
    p44.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, v51)
    p44:refresh_buttons(p44.scrolling_frame.CanvasPosition.Y)
end
function v6.get_element_by_name(p52, p53)
    return p52.scrolling_frame:FindFirstChild(p53)
end
function v6.start(p_u_54, p55)
    p_u_54.props = p55 or {}
    p_u_54.page = 0
    p_u_54.wrapped_elements = {}
    p_u_54.raw_elements = {}
    p_u_54.cached_elements = {}
    p_u_54.scrolling_frame = p_u_54.instance.ClippingFrame.ScrollingFrame
    local function v57(p56)
        p56.InnerColor.ImageColor3 = v_u_3.lookup("medium_light")
    end
    local function v59(p58)
        p58.InnerColor.ImageColor3 = v_u_3.lookup("saturated")
    end
    local function v61(p60)
        p60.InnerColor.ImageColor3 = Color3.fromRGB(150, 150, 150)
    end
    p_u_54.down_button = p_u_54.UIManager.wrap(p_u_54.instance.DownArrowButtonContainer.DownArrowButton, "CustomButton"):start({
        ["hover_render"] = v57,
        ["up_render"] = v59,
        ["disabled_render"] = v61,
        ["fire_clicked_events_when_disabled"] = true,
        ["mouse_button1_down"] = function()
            p_u_54:increment_page(1)
        end
    })
    p_u_54.up_button = p_u_54.UIManager.wrap(p_u_54.instance.UpArrowButtonContainer.UpArrowButton, "CustomButton"):start({
        ["hover_render"] = v57,
        ["up_render"] = v59,
        ["disabled_render"] = v61,
        ["fire_clicked_events_when_disabled"] = true,
        ["mouse_button1_down"] = function()
            p_u_54:increment_page(-1)
        end
    })
    p_u_54.scrolling_frame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        if p_u_54.scrolling_frame.ScrollingEnabled then
            p_u_54:refresh_buttons(p_u_54.scrolling_frame.CanvasPosition.Y)
        end
    end)
    return p_u_54
end
return v6