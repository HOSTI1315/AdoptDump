--// ReplicatedStorage.RoactComponents.Elements.Textboxes (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIDB")
local v_u_3 = v1("Roact")
local v_u_4 = v1("TableUtil")
local v5 = {}
local v_u_6 = v_u_3.createElement
function v5.StyledTextbox(p7)
    local _ = p7.icon
    local v8 = p7.style
    local v_u_9 = p7.text or ""
    local v_u_10 = p7.data_type
    local v_u_11 = p7.default
    local v_u_12 = p7.text_changed
    local v_u_13 = p7.on_enter_pressed
    local v_u_14 = p7.min
    local v_u_15 = p7.max
    local v16 = p7.disabled
    local v17 = p7.textbox_offset
    local v18 = p7.font
    local v19 = p7.text_margin or 0
    local v20 = p7.text_x_alignment
    local v21 = p7.text_y_alignment
    local v22 = p7.placeholder_text
    local v23 = p7.size
    local v24 = p7.position
    local v25 = p7.clear_text_on_focus
    local v26 = {}
    local v27 = nil
    local v28 = nil
    local v29 = nil
    local v30 = nil
    local v31 = nil
    local v32 = nil
    local v33 = nil
    local v34 = nil
    local v35 = nil
    if v8 == "MULTILINE_BOX" then
        v31 = p7.backgroundcolor3
        v34 = p7.text_size
        v35 = p7.text_color3
        v20 = Enum.TextXAlignment.Left
        v21 = Enum.TextYAlignment.Top
        v25 = false
        v32 = true
        v33 = false
    elseif v8 == "DARK_WITH_WHITE_OUTLINE" then
        v29 = Color3.new(1, 1, 1)
        v31 = Color3.new(0.27450980392156865, 0.27450980392156865, 0.27450980392156865)
    else
        v27 = v_u_2.RoundedBacking5px
        v30 = Color3.fromRGB(0, 108, 255)
        v35 = Color3.fromRGB(255, 255, 255)
        v28 = 1
    end
    local v36 = v33 == nil and true or v33
    local v46 = {
        [v_u_3.Event.FocusLost] = function(p37, p38)
            if v_u_10 == "INT" then
                local v39 = p37.Text
                local v40 = tonumber(v39)
                if v40 == nil or math.floor(v40) ~= v40 then
                    local v41 = v_u_11
                    p37.Text = tostring(v41)
                end
            end
            if v_u_10 == "INT" then
                local v42 = p37.Text
                local v43 = tonumber(v42)
                local v44 = v_u_14 or (-1 / 0)
                local v45 = v_u_15 or (1 / 0)
                p37.Text = math.clamp(v43, v44, v45)
            end
            if v_u_12 and p37.Text ~= v_u_9 then
                v_u_12(p37.Text)
                if p38 and v_u_13 then
                    v_u_13()
                end
            end
        end,
        ["PlaceholderColor3"] = Color3.new(0.7, 0.7, 0.7),
        ["PlaceholderText"] = v22,
        ["ClearTextOnFocus"] = v25,
        ["MultiLine"] = v32
    }
    v26.textbox = v_u_6(v16 and "TextLabel" or "TextBox", v_u_4.merge({
        ["Size"] = UDim2.new(1, -v19 * 2, 1, -v19 * 2),
        ["Text"] = v_u_9,
        ["BackgroundTransparency"] = 1,
        ["TextColor3"] = v35 or Color3.new(1, 1, 1),
        ["TextScaled"] = v36,
        ["TextSize"] = v34,
        ["Font"] = v18 or Enum.Font.SourceSansBold,
        ["Position"] = UDim2.new(0, v19, 0, v19) + (v17 or UDim2.new()),
        ["TextXAlignment"] = v20 or Enum.TextXAlignment.Center,
        ["TextYAlignment"] = v21,
        ["TextWrapped"] = v32
    }, v16 and ({} or v46) or v46))
    return v_u_6("ImageLabel", {
        ["Size"] = v23,
        ["Position"] = v24,
        ["Image"] = v27,
        ["ImageColor3"] = v30,
        ["BackgroundTransparency"] = v28,
        ["ScaleType"] = Enum.ScaleType.Slice,
        ["SliceCenter"] = Rect.new(6, 6, 24, 24),
        ["BorderColor3"] = v29,
        ["BackgroundColor3"] = v31
    }, v26)
end
return v5