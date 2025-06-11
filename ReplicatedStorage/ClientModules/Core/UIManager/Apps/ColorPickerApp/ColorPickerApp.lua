--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ColorPickerApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("DepthButtonColorDB")
local v_u_3 = v1("ColorThemeManager")
local v_u_4 = v1("SoundPlayer")
local v_u_5 = v1("UIGradientHelper")
local v_u_6 = v1("TicketQueue")
local v_u_7 = v1("XboxSupport")
local v_u_8 = v1("PlatformM")
local v_u_9 = v1("Polaroid")
local v_u_10 = v1("Signal")
local v11 = v1("Class")
local v_u_12 = v1("package:Sift")
local v_u_13 = v1("package:Promise")
local v_u_14 = game:GetService("HttpService")
local v_u_15 = {
    Color3.fromRGB(196, 40, 28),
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 176, 0),
    Color3.fromRGB(218, 133, 65),
    Color3.fromRGB(239, 184, 56),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(255, 246, 123),
    Color3.fromRGB(249, 214, 46),
    Color3.fromRGB(248, 217, 109),
    Color3.fromRGB(177, 229, 166),
    Color3.fromRGB(31, 128, 29),
    Color3.fromRGB(44, 101, 29),
    Color3.fromRGB(164, 189, 71),
    Color3.fromRGB(217, 228, 167),
    Color3.fromRGB(75, 151, 75),
    Color3.fromRGB(52, 142, 64),
    Color3.fromRGB(13, 105, 172),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(123, 182, 232),
    Color3.fromRGB(35, 71, 139),
    Color3.fromRGB(108, 129, 183),
    Color3.fromRGB(9, 137, 207),
    Color3.fromRGB(152, 194, 219),
    Color3.fromRGB(0, 16, 176),
    Color3.fromRGB(85, 165, 175),
    Color3.fromRGB(67, 84, 147),
    Color3.fromRGB(146, 57, 120),
    Color3.fromRGB(225, 164, 194),
    Color3.fromRGB(190, 104, 98),
    Color3.fromRGB(142, 66, 133),
    Color3.fromRGB(150, 112, 159),
    Color3.fromRGB(167, 94, 155),
    Color3.fromRGB(61, 21, 133),
    Color3.fromRGB(211, 190, 150),
    Color3.fromRGB(86, 66, 54),
    Color3.fromRGB(89, 34, 89),
    Color3.fromRGB(170, 0, 170),
    Color3.fromRGB(98, 37, 209),
    Color3.fromRGB(180, 128, 255),
    Color3.fromRGB(205, 98, 152),
    Color3.fromRGB(255, 152, 220),
    Color3.fromRGB(255, 0, 191),
    Color3.fromRGB(136, 62, 62),
    Color3.fromRGB(143, 76, 42),
    Color3.fromRGB(106, 57, 9),
    Color3.fromRGB(117, 0, 0),
    Color3.fromRGB(191, 183, 177),
    Color3.fromRGB(174, 122, 89),
    Color3.fromRGB(135, 124, 144),
    Color3.fromRGB(116, 134, 157),
    Color3.fromRGB(241, 231, 199),
    Color3.fromRGB(242, 243, 243),
    Color3.fromRGB(248, 248, 248),
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(161, 165, 162),
    Color3.fromRGB(27, 42, 53),
    Color3.fromRGB(17, 17, 17)
}
local function v_u_25(p16)
    local v17 = p16.R
    local v18 = p16.G
    local v19 = p16.B
    local v20 = math.max(v17, v18, v19)
    local v21 = math.min(v17, v18, v19)
    local v22 = v20 - v21
    local v23 = v20 == 0 and 0 or v22 / v20
    local v24 = 0
    if v20 ~= v21 then
        if v20 == v17 then
            v24 = (v18 - v19) / v22 + (v18 < v19 and 6 or 0)
        elseif v20 == v18 then
            v24 = (v19 - v17) / v22 + 2
        elseif v20 == v19 then
            v24 = (v17 - v18) / v22 + 4
        end
        v24 = v24 / 6
    end
    return v24, v23, v20
end
local function v_u_42(p26, p27, p28)
    local v29 = nil
    local v30 = nil
    local v31 = nil
    local v32 = p26 * 6
    local v33 = math.floor(v32)
    local v34 = p26 * 6 - v33
    local v35 = p28 * (1 - p27)
    local v36 = p28 * (1 - v34 * p27)
    local v37 = p28 * (1 - (1 - v34) * p27)
    local v38 = v33 % 6
    if v38 == 0 then
        v36 = v35
        v35 = v37
    elseif v38 == 1 then
        local v39 = v36
        v36 = v35
        v35 = p28
        p28 = v39
    elseif v38 == 2 then
        v36 = v37
        local v40 = v35
        v35 = p28
        p28 = v40
    elseif v38 == 3 then
        local v41 = v36
        v36 = p28
        p28 = v35
        v35 = v41
    elseif v38 == 4 then
        v36 = p28
        p28 = v37
    elseif v38 ~= 5 then
        v36 = v31
        v35 = v30
        p28 = v29
    end
    return Color3.new(p28, v35, v36)
end
local function v_u_50(p43, p44)
    local v_u_45 = p43:Clone()
    v_u_45.ZIndex = 2
    v_u_45.Name = "Overlay"
    v_u_45.Visible = false
    v_u_45.ClipsDescendants = true
    v_u_45.Parent = p43.Parent
    v_u_45:ClearAllChildren()
    local v_u_46 = p44:Clone()
    v_u_46.Parent = v_u_45
    return v_u_45, function(p47)
        if not v_u_45.Visible then
            return nil
        end
        local v48 = Instance.new("Frame")
        v48.BackgroundTransparency = 1
        v48.Size = v_u_46.CellSize
        v48.LayoutOrder = p47
        v48.Parent = v_u_45
        local v49 = Instance.new("ImageButton")
        v49.AnchorPoint = Vector2.new(0.5, 0.5)
        v49.Position = UDim2.new(0.5, 0, 0.5, 0)
        v49.Size = UDim2.new(1, 0, 1, 0) + v_u_46.CellPadding
        v49.BackgroundTransparency = 1
        v49.BorderSizePixel = 0
        v49.Parent = v48
        return v49
    end
end
local v_u_51 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true
}
local v_u_52 = { "Hex", "RGB" }
local v_u_53 = v11("ColorPickerAdvanced")
function v_u_53.__init(p54, p55, p56)
    p54.app = p55
    p54.content = p56
    p54.h = 1
    p54.s = 1
    p54.v = 1
    p54.numeric_type_index = 1
    p54.tools = p54.content.Left.Tools
    p54.picker = p54.content.Left.Picker
    p54.slider = p54.content.Left.Slider
    p54.swatches = p54.content.Right.SavedSwatches
    p54.split_gradient = nil
    p54.saved_colors = nil
    p54:_init_picker()
    p54:_init_slider(20)
    p54:_init_numeric_type()
    p54:_init_saved_colors()
end
function v_u_53._set_hsv(p57, p58, p59, p60)
    p57.h = p58
    p57.s = p59
    p57.v = p60
    p57:_refresh_numeric_type()
    p57.slider.Pin.Position = UDim2.new(p58, 0, 0.5, 0)
    p57.picker.Pin.Position = UDim2.new(p59, 0, 1 - p60, 0)
    p57.picker.Color.UIGradient.Color = ColorSequence.new(v_u_5.evaluate(p58, p57.split_gradient))
    p57.app:_set_color(p57:get_color())
end
function v_u_53._save_color(p61, p62)
    local v63 = #p61.saved_colors.default_colors
    while true do
        local v64 = #p61.saved_colors.saved
        local v65 = v63 - 1
        if math.max(0, v65) >= v64 then
            break
        end
        table.remove(p61.saved_colors.saved)
    end
    if #p61.saved_colors.saved < v63 then
        local v66 = p61.saved_colors.saved
        table.insert(v66, 1, p62)
    end
    p61:_refresh_saved_colors()
end
function v_u_53._refresh_saved_colors(p67)
    for v68 = 1, #p67.saved_colors.default_colors do
        local v69 = p67.saved_colors.buttons[v68]
        local v70 = p67.saved_colors.saved[v68] or p67.saved_colors.default_colors[v68 - #p67.saved_colors.saved]
        v69.instance.BackgroundColor3 = v70
        v69.wrapped:set_basic_color(v70)
    end
end
function v_u_53._refresh_numeric_type(p71)
    local v72 = p71:get_color()
    local v73 = v_u_52[p71.numeric_type_index]
    local v74 = v72:ToHex():upper()
    local v75 = {}
    for v76 in v74:gmatch("..") do
        local v77 = tonumber(v76, 16)
        table.insert(v75, v77)
    end
    p71.tools.Type.TextLabel.Text = v73
    p71.tools.RGBValue.TextBox.Text = table.concat(v75, ", ")
    p71.tools.HexValue.TextBox.Text = v74
    p71.tools.RGBValue.Visible = v73 == "RGB"
    p71.tools.HexValue.Visible = v73 == "Hex"
end
function v_u_53._init_slider(p_u_78, p79)
    p_u_78.slider.Gradient:ClearAllChildren()
    local v80 = {}
    for v81 = 0, p79 - 1 do
        local v82 = v81 / (p79 - 1)
        local v83 = v_u_42(v82, 1, 1)
        local v84 = ColorSequenceKeypoint.new
        table.insert(v80, v84(v82, v83))
    end
    p_u_78.split_gradient = v_u_5.from_keypoints(v80)
    for v85, v86 in p_u_78.split_gradient do
        local v87 = v_u_5.create_rounded_gradient
        local v88 = v86.sequence
        local v89 = {}
        local v90
        if v85 == 1 then
            v90 = UDim.new(0, 8)
        else
            v90 = UDim.new(0, 0)
        end
        v89.top_left = v90
        local v91
        if v85 == #p_u_78.split_gradient then
            v91 = UDim.new(0, 8)
        else
            v91 = UDim.new(0, 0)
        end
        v89.top_right = v91
        local v92
        if v85 == #p_u_78.split_gradient then
            v92 = UDim.new(0, 8)
        else
            v92 = UDim.new(0, 0)
        end
        v89.bottom_right = v92
        local v93
        if v85 == 1 then
            v93 = UDim.new(0, 8)
        else
            v93 = UDim.new(0, 0)
        end
        v89.bottom_left = v93
        local v94 = v87(v88, v89)
        v94.Size = UDim2.new(v86.to - v86.from, 0, 1, 0)
        v94.Position = UDim2.new(v86.from, 0, 0, 0)
        v94.Parent = p_u_78.slider.Gradient
    end
    local v_u_95 = p_u_78.app.UIManager.wrap(p_u_78.slider.Pin, "UIDragger"):start()
    local function v99(p96, p97)
        local v98 = (Vector2.new(p97.Position.X, p97.Position.Y) - p96.Parent.AbsolutePosition).X / p96.Parent.AbsoluteSize.X
        p_u_78:_set_hsv(math.clamp(v98, 0, 1), p_u_78.s, p_u_78.v)
    end
    p_u_78.slider.InputBegan:Connect(function(p100)
        if v_u_51[p100.UserInputType] then
            v_u_95:force_start_drag(p100)
        end
    end)
    v_u_95.drag_started:Connect(v99)
    v_u_95.drag_changed:Connect(v99)
end
function v_u_53._init_picker(p_u_101)
    local v_u_102 = p_u_101.app.UIManager.wrap(p_u_101.picker.Pin, "UIDragger"):start()
    local function v110(p103, p104)
        local v105 = (Vector2.new(p104.Position.X, p104.Position.Y) - p103.Parent.AbsolutePosition) / p103.Parent.AbsoluteSize
        local v106 = v105.X
        local v107 = math.clamp(v106, 0, 1)
        local v108 = 1 - v105.Y
        local v109 = math.clamp(v108, 0, 1)
        p_u_101:_set_hsv(p_u_101.h, v107, v109)
    end
    p_u_101.picker.InputBegan:Connect(function(p111)
        if v_u_51[p111.UserInputType] then
            v_u_102:force_start_drag(p111)
        end
    end)
    v_u_102.drag_started:Connect(v110)
    v_u_102.drag_changed:Connect(v110)
end
function v_u_53._init_numeric_type(p_u_112)
    local v113 = p_u_112.tools.Type
    local v114 = p_u_112.tools.RGBValue
    local v115 = p_u_112.tools.HexValue
    v113.Right.Buttons.Up.Activated:Connect(function()
        p_u_112.numeric_type_index = (p_u_112.numeric_type_index + -1 - 1) % #v_u_52 + 1
        p_u_112:_refresh_numeric_type()
    end)
    v113.Right.Buttons.Down.Activated:Connect(function()
        p_u_112.numeric_type_index = (p_u_112.numeric_type_index + 1 - 1) % #v_u_52 + 1
        p_u_112:_refresh_numeric_type()
    end)
    local function v120(p_u_116, p_u_117)
        local v_u_118 = true
        p_u_116:GetPropertyChangedSignal("Text"):Connect(function()
            local v119 = p_u_116:IsFocused() and (v_u_118 and p_u_117(p_u_116.Text))
            if v119 then
                v_u_118 = false
                p_u_112:set_color(v119)
                v_u_118 = true
            end
        end)
        p_u_116.FocusLost:Connect(function()
            v_u_118 = false
            p_u_112:set_color(p_u_112:get_color())
            v_u_118 = true
        end)
    end
    v120(v115.TextBox, function(p121)
        local v122 = p121:upper():gsub("[^%dABCDEF]+", "")
        if #p121 == 6 and #v122 == 6 then
            return Color3.fromHex(v122)
        else
            return nil
        end
    end)
    v120(v114.TextBox, function(p123)
        local v124 = {}
        for v125, v126 in p123:gsub("[^%d,]+", ""):split(",") do
            local v127 = tonumber(v126)
            if v127 and (v127 >= 0 and v127 <= 255) then
                v124[v125] = v127
            end
        end
        if #v124 == 3 then
            return Color3.fromRGB(unpack(v124))
        else
            return nil
        end
    end)
end
function v_u_53._init_saved_colors(p_u_128)
    local v129 = p_u_128.swatches.Container
    local v_u_130, v131 = v_u_50(v129, v129.UIGridLayout)
    v_u_8.run({
        ["tablet"] = "phone",
        ["phone"] = function()
            v_u_130.Visible = true
        end
    })
    local v_u_132 = false
    local v133 = p_u_128.swatches.Container.AddMore
    local v134 = p_u_128.app.UIManager.wrap(v133, "DepthButton")
    local v137 = {
        ["options"] = {
            ["click_box"] = v131(v133.LayoutOrder)
        },
        ["shine"] = true,
        ["mouse_button1_down"] = function()
            if not v_u_132 then
                v_u_132 = true
                local v135 = p_u_128.app:_get_color()
                local v136 = p_u_128.saved_colors.saved[1]
                if v136 then
                    v136 = p_u_128.saved_colors.saved[1]:ToHex()
                end
                if v135:ToHex() ~= v136 then
                    p_u_128:_save_color(v135)
                end
                v_u_132 = false
            end
        end
    }
    v134:start(v137):set_basic_color(v_u_2.green.base)
    local v138 = {}
    for _, v139 in p_u_128.swatches.Container:GetChildren() do
        if v139:IsA("ImageButton") and (v139.Visible and v139.LayoutOrder > 0) then
            table.insert(v138, v139)
        end
    end
    table.sort(v138, function(p140, p141)
        return p140.LayoutOrder < p141.LayoutOrder
    end)
    local v142 = {}
    local v143 = {}
    for v144, v_u_145 in v138 do
        local v146 = (v144 - 1) / (#v138 - 1)
        local v147 = 1 - v146 + v146 * #v_u_15
        local v148 = v_u_15[math.floor(v147)]
        table.insert(v142, v148)
        local v149 = p_u_128.app.UIManager.wrap(v_u_145, "DepthButton")
        local v150 = {
            ["options"] = {
                ["click_box"] = v131(v_u_145.LayoutOrder)
            },
            ["mouse_button1_down"] = function()
                p_u_128.app:_set_color(v_u_145.BackgroundColor3)
            end
        }
        local v151 = v149:start(v150)
        v_u_145.BackgroundColor3 = v148
        v151:set_basic_color(v148)
        v143[v144] = {
            ["instance"] = v_u_145,
            ["wrapped"] = v151
        }
    end
    p_u_128.saved_colors = {
        ["saved"] = {},
        ["buttons"] = v143,
        ["default_colors"] = v142
    }
    p_u_128:_refresh_saved_colors()
end
function v_u_53.set_color(p152, p153)
    if p152:get_color():ToHex() ~= p153:ToHex() then
        p152:_set_hsv(v_u_25(p153))
    end
end
function v_u_53.get_color(p154)
    return v_u_42(p154.h, p154.s, p154.v)
end
local v155 = v11("ColorPickerApp", v1("UIBaseApp"))
function v155._init_title_theme_color(p_u_156)
    local v157 = v_u_3.lookup("saturated")
    p_u_156.top.Title.Label.TextColor3 = v157
    p_u_156.top.Title.IconHolder.Icon.ImageColor3 = v157
    v_u_3.get_theme_changed_signal():Connect(function()
        local v158 = v_u_3.lookup("saturated")
        p_u_156.top.Title.Label.TextColor3 = v158
        p_u_156.top.Title.IconHolder.Icon.ImageColor3 = v158
    end)
end
function v155._init_pick_buttons(p_u_159)
    local v160 = {}
    local v161 = {
        ["mouse_button1_click"] = function()
            p_u_159.color_picked:Fire(p_u_159:_get_color())
        end,
        ["mouse_button1_down"] = function()
            v_u_4.FX:play("BambooButton")
        end
    }
    v160.Confirm = p_u_159.UIManager.wrap(p_u_159.bottom.Confirm, "DepthButton"):start(v161)
    local v162 = {
        ["mouse_button1_click"] = function()
            if not p_u_159.close_disabled then
                p_u_159.color_picked:Fire(nil)
            end
        end,
        ["mouse_button1_down"] = function()
            v_u_4.FX:play("BambooButton")
        end
    }
    v160.Close = p_u_159.UIManager.wrap(p_u_159.top.Close, "DepthButton"):start(v162)
    return v160
end
function v155._init_category_buttons(p_u_163)
    local v164 = {}
    for _, v_u_165 in p_u_163.top.Categories:GetChildren() do
        if v_u_165:IsA("ImageButton") then
            v164[v_u_165.Name] = p_u_163.UIManager.wrap(v_u_165, "DepthButton"):start({
                ["mouse_button1_down"] = function()
                    if p_u_163.selected_category ~= v_u_165.Name then
                        p_u_163:_select_category(v_u_165.Name)
                    end
                end
            })
        end
    end
    return v164
end
function v155._set_category_pallette(p166, p167, p168)
    local v169 = p166.category_buttons[p167]
    local v170 = "Category not found " .. p167
    assert(v169, v170)
    local v171 = p167 ~= "Advanced"
    assert(v171, "Advance category cannot have a pallette set")
    p166.category_pallettes[p167] = p168
end
function v155._generate_swatches(p_u_172, p173)
    local v174 = #p173 <= 60
    assert(v174, "Too many colors specified. Can only fit a max of 60!")
    for _, v175 in p_u_172.swatch_buttons do
        v175.instance:Destroy()
    end
    if p_u_172.swatch_overlay then
        p_u_172.swatch_overlay:Destroy()
    end
    local v176 = p_u_172.content.Swatches.Container
    local v_u_177, v178 = v_u_50(v176, v176.UIGridLayout)
    p_u_172.swatch_buttons = {}
    p_u_172.swatch_overlay = v_u_177
    v_u_8.run({
        ["tablet"] = "phone",
        ["phone"] = function()
            v_u_177.Visible = true
        end
    })
    for v179, v_u_180 in p173 do
        local v181 = p_u_172.content.Swatches.ColorTemplate:Clone()
        v181.Name = v179
        v181.LayoutOrder = v179
        v181.Visible = true
        v181.Parent = p_u_172.content.Swatches.Container
        local v182 = p_u_172.UIManager.wrap(v181, "DepthButton"):start({
            ["options"] = {
                ["click_box"] = v178(v179)
            },
            ["mouse_button1_down"] = function()
                p_u_172:_set_color(v_u_180)
            end
        })
        v182:set_basic_color(v_u_180)
        local v183 = p_u_172.swatch_buttons
        table.insert(v183, v182)
    end
end
function v155._set_categories_visible(p184, p185)
    for v186, v187 in p185 do
        p184.category_buttons[v186].instance.Visible = v187
    end
end
function v155._select_category(p188, p189)
    local v190 = p188.category_buttons[p189]
    local v191 = "No category exists by name " .. p189
    assert(v190, v191)
    p188.selected_category = p189
    for _, v192 in p188.category_buttons do
        v192.state = nil
        v192:set_state("normal")
        v192:set_color_from_entry(v_u_2.green, true)
    end
    v190:set_color_from_entry(v_u_2.orange, true)
    if p189 == "Advanced" then
        p188.content.Advanced.Visible = true
        p188.content.Swatches.Visible = false
    else
        p188.content.Advanced.Visible = false
        p188.content.Swatches.Visible = true
        p188:_generate_swatches(p188.category_pallettes[p189] or {})
    end
end
function v155._set_result_color(p193, p194)
    p193.bottom.Result.BackgroundColor3 = p194
end
function v155._set_preview_color(p195, p196)
    if p195.preview_callback then
        p195.preview_callback(p196)
    end
    p195.update_preview:Fire(p196)
end
function v155._get_color(p197)
    return p197.bottom.Result.BackgroundColor3
end
function v155._set_color(p198, p199)
    p198:_set_result_color(p199)
    p198:_set_preview_color(p199)
    p198.advanced:set_color(p199)
    if p198.validate_confirm then
        local v200 = p198.validate_confirm(p199)
        p198.pick_buttons.Confirm:set_state(v200 and "normal" or "disabled")
    else
        p198.pick_buttons.Confirm:set_state("normal")
    end
end
function v155._set_pick_color_options(p201, p202)
    local v203 = p202 or {}
    local v204 = v203.starter_color
    local v205 = v203.forced_colors or {}
    local v206 = v203.suggested_colors or {}
    local v207 = v203.additional_colors and (table.clone(v203.additional_colors) or {}) or {}
    local v208 = v203.request_source or v_u_14:GenerateGUID(false)
    local v209 = p201.prev_request_source ~= v208
    p201.prev_request_source = v208
    p201.validate_confirm = v203.validate_confirm or nil
    p201.preview_callback = v203.preview_callback
    if v204 then
        local v210 = false
        for _, v211 in v207 do
            if v211:ToHex() == v204:ToHex() then
                v210 = true
                break
            end
        end
        if not v210 then
            table.insert(v207, v204)
        end
    end
    p201.close_disabled = v203.no_cancel and true or false
    p201.pick_buttons.Close.instance.Visible = not p201.close_disabled
    p201.pick_buttons.Confirm.instance.Face.TextLabel.Text = v203.confirm_text or "Confirm"
    local v212 = "Basic"
    local v213 = {
        ["Basic"] = true,
        ["Suggested"] = true,
        ["Advanced"] = true
    }
    if #v205 == 0 then
        if v203.no_advanced or p201.advanced_disabled then
            v213.Advanced = false
        end
        local v215 = v_u_12.List.filter(v207, function(p214)
            return not v_u_12.List.find(v_u_15, p214)
        end)
        p201:_set_category_pallette("Basic", v_u_12.List.concat(v_u_15, v215))
        p201:_set_category_pallette("Suggested", v206)
        if #v206 > 0 then
            v212 = "Suggested"
        else
            v213.Suggested = false
        end
    else
        v213.Basic = false
        v213.Advanced = false
        p201:_set_category_pallette("Basic", {})
        p201:_set_category_pallette("Suggested", v205)
        v212 = "Suggested"
    end
    p201:_set_color(v204 or v205[1] or (v206[1] or v_u_15[1]))
    p201:_set_categories_visible(v213)
    if v209 or (not v213[p201.selected_category] and true or false) then
        p201:_select_category(v212)
    else
        p201:_select_category(p201.selected_category)
    end
    local v216 = 0
    for _, v217 in v213 do
        if v217 then
            v216 = v216 + 1
        end
    end
    p201.top.Categories.Visible = v216 > 1
    p201.top.Title.Visible = v216 <= 1
    if v203.preview_entry then
        local v218 = {
            ["starter_color"] = v204,
            ["update_signal"] = p201.update_preview
        }
        p201.polaroid = v_u_9.new(v203.preview_entry, p201.preview.ViewportFrame, v218)
        p201.preview.Visible = true
    else
        p201.preview.Visible = false
    end
end
function v155.queue_with_override(p_u_219, p_u_220)
    local v_u_221 = false
    local v_u_222 = false
    local function v_u_224(p223)
        v_u_221 = false
        p_u_219.UIManager.set_app_visibility(p_u_219.ClassName, false)
        return table.unpack(p223)
    end
    local v_u_225 = false
    local function v_u_226(...)
        if not v_u_225 then
            v_u_225 = true
            return v_u_224(...)
        end
    end
    local v_u_227, v_u_228 = p_u_219.ticket_queue:queue(function()
        v_u_221 = true
        p_u_219:_set_pick_color_options(p_u_220)
        p_u_219.UIManager.set_app_visibility(p_u_219.ClassName, true)
        if p_u_220.play_pop_sound or p_u_220.play_pop_sound == nil then
            v_u_4.FX:play("Pop")
        end
        return v_u_13.fromEvent(p_u_219.color_picked):andThen(function(...)
            return v_u_226(table.pack(...))
        end)
    end)
    local function v229()
        return v_u_221
    end
    local function v231(p230)
        if not v_u_222 and p_u_219.ticket_queue:is_ticket_active(v_u_228) then
            v_u_222 = true
            p_u_219.color_picked:Fire(p230)
        end
    end
    v_u_13.try(function()
        v_u_227:await()
        v_u_226(table.pack(nil))
    end)
    return v_u_227, v229, v231
end
function v155.pick_color(p232, p233)
    local v234, _ = p232:queue_with_override(p233)
    return v234:expect()
end
function v155.show(p235)
    p235.instance.Body.Visible = true
end
function v155.hide(p236)
    p236.instance.Body.Visible = false
    if p236.polaroid then
        p236.instance.Preview.Visible = false
        p236.polaroid:Destroy()
        p236.polaroid = nil
    end
end
function v155.start(p_u_237)
    p_u_237.instance.Enabled = true
    p_u_237.ticket_queue = v_u_6.new()
    p_u_237.prev_request_source = nil
    p_u_237.close_disabled = false
    p_u_237.advanced_disabled = v_u_8.is_using_gamepad()
    p_u_237.color_picked = v_u_10.new()
    p_u_237.selected_category = nil
    p_u_237.category_pallettes = {}
    p_u_237.swatch_overlay = nil
    p_u_237.swatch_buttons = {}
    p_u_237.inner = p_u_237.instance.Body.Inner
    p_u_237.content = p_u_237.inner.Content
    p_u_237.bottom = p_u_237.inner.Bottom
    p_u_237.top = p_u_237.inner.Top
    p_u_237.preview = p_u_237.instance.Preview
    p_u_237.update_preview = v_u_10.new()
    p_u_237.polaroid = nil
    p_u_237.pick_buttons = p_u_237:_init_pick_buttons()
    p_u_237.category_buttons = p_u_237:_init_category_buttons()
    p_u_237.advanced = v_u_53.new(p_u_237, p_u_237.content.Advanced)
    p_u_237:_init_title_theme_color()
    v_u_7.quick_watch({
        ["selection_parent"] = p_u_237.instance.Body,
        ["default_selection"] = p_u_237.pick_buttons.Confirm.instance,
        ["app_name"] = p_u_237.ClassName,
        ["exit_buttons"] = { p_u_237.pick_buttons.Close.instance },
        ["close_override"] = function()
            if not p_u_237.close_disabled then
                p_u_237.color_picked:Fire(nil)
            end
            return false
        end
    })
end
return v155