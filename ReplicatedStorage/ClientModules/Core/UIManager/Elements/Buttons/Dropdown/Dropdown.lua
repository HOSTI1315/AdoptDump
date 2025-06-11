--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.Dropdown (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("XboxSupport")
local v_u_5 = v1("Signal")
local v_u_6 = v1("package:Promise")
local v_u_7 = v1("package:Sift")
local v8 = v1("package:t")
local v_u_9 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true
}
local v_u_10 = game:GetService("TweenService")
local v_u_11 = game:GetService("RunService")
local v_u_12 = game:GetService("GuiService")
local v_u_13 = game:GetService("ContentProvider")
local v_u_14 = game:GetService("UserInputService")
local v15 = v_u_3.get_platform()
local v_u_16 = (v15 == v_u_3.platform.phone or v15 == v_u_3.platform.tablet) and "MouseButton1Click" or "MouseButton1Down"
local v17 = v2("Dropdown", v1("UIBaseElement"))
local v_u_18 = v8.strictInterface({
    ["choose_text"] = v8.optional(v8.string),
    ["choices"] = v8.table,
    ["default"] = v8.optional(v8.integer),
    ["should_localize_choices"] = v8.optional(v8.boolean),
    ["on_choice_changed"] = v8.optional(v8.callback)
})
local function v_u_21(p19)
    for _, v20 in ipairs(p19) do
        if v20.PlaybackState == Enum.PlaybackState.Playing then
            v20.Completed:Wait()
        end
    end
end
function v17._calculate_chooser_height(p22)
    if not p22.chooser_height or p22.chooser_height <= 0 then
        p22.chooser_height = p22.chooser.AbsoluteSize.Y
        if p22.chooser_height < 48 then
            local v23 = p22.option1_template.Button
            local v24 = p22.option2_template.Button
            v24.Image = v23.Image
            v24.SliceCenter = v23.SliceCenter
            local v25 = p22.option1_template.Button
            local v26 = p22.chooser.Button
            v26.Image = v25.Image
            v26.SliceCenter = v25.SliceCenter
        end
        p22.options_container.Position = UDim2.new(0, 0, 0, -p22.chooser_height)
    end
end
function v17._get_num_option_frames_that_will_fit_on_screen(p27)
    local v28, _ = v_u_12:GetGuiInset()
    local v29 = (workspace.CurrentCamera.ViewportSize.Y - v28.Y - p27.scroll_complex.AbsolutePosition.Y) / (p27.chooser_height * 0.7)
    local v30 = math.floor(v29)
    return math.clamp(v30, 0, 9999)
end
function v17._remove_highlight(_, p31)
    if p31:FindFirstChild("Highlight") then
        p31.Highlight:Destroy()
    end
end
function v17._add_highlight(p32, p33)
    if not p33:FindFirstChild("Highlight") then
        local v34 = p33 == p32.chooser and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        local v35 = p33 == p32.chooser and 0.85 or 0.75
        local v36 = Instance.new("ImageLabel")
        v36.Name = "Highlight"
        v36.Image = p33.Button.Image
        v36.ImageTransparency = v35
        v36.ImageColor3 = v34
        v36.ScaleType = Enum.ScaleType.Slice
        v36.SliceCenter = p33.Button.SliceCenter
        v36.Size = p33.Button.Size
        v36.ZIndex = 9999
        v36.BackgroundTransparency = 1
        v36.Parent = p33
    end
end
function v17._refresh_hover_appearance(p37)
    local v38 = (-1 / 0)
    local v39 = nil
    for v40, v41 in pairs(p37.hovered) do
        if v41 and v38 < v40.ZIndex then
            v38 = v40.ZIndex
            v39 = v40
        end
    end
    for _, v42 in ipairs(v_u_7.List.concat(p37.option_frames, { p37.chooser })) do
        if v42 == v39 then
            p37:_add_highlight(v42)
        else
            p37:_remove_highlight(v42)
        end
    end
end
function v17._mark_hovered(p43, p44, p45)
    assert(p44)
    local v46 = typeof(p45) == "boolean"
    assert(v46)
    p43.hovered[p44] = p45
    p43:_refresh_hover_appearance()
end
function v17._register_hoverable(p_u_47, p_u_48)
    p_u_48.Button.MouseEnter:Connect(function()
        if p_u_47.enabled then
            p_u_47:_mark_hovered(p_u_48, true)
        end
    end)
    p_u_48.Button.MouseLeave:Connect(function()
        p_u_47:_mark_hovered(p_u_48, false)
    end)
end
function v17._destroy_option_frames(p49)
    for _, v50 in pairs(p49.option_frames) do
        v50:Destroy()
    end
    p49.option_frames = {}
    for v51, _ in pairs(p49.hovered) do
        if v51.Parent == nil then
            p49.hovered[v51] = nil
        end
    end
end
function v17._refresh_option_frames(p_u_52)
    p_u_52:_destroy_option_frames()
    local v53 = p_u_52:_get_num_option_frames_that_will_fit_on_screen()
    p_u_52:_set_num_choices_visible(v53 == 0 and 1 or v53)
    for v54, v55 in pairs(p_u_52.choices) do
        local v56
        if v54 % 2 == 0 then
            v56 = p_u_52.option2_template:Clone()
        else
            v56 = p_u_52.option1_template:Clone()
        end
        v56.Name = tostring(v54)
        v56.Container.TextLabel.Text = v55
        v56.Container.TextLabel.AutoLocalize = p_u_52.should_localize_choices
        v56.Position = UDim2.new(0, 0, 0, 0)
        v56.Size = UDim2.new(1, 0, 0, p_u_52.chooser_height)
        v56.LayoutOrder = v54
        v56.ZIndex = -v54
        v56.Parent = p_u_52.options_container
        local v57 = p_u_52.option_frames
        table.insert(v57, v56)
    end
    for v_u_58, v59 in pairs(p_u_52.option_frames) do
        v59.Button[v_u_16]:Connect(function()
            p_u_52:select_choice(v_u_58)
        end)
        p_u_52:_register_hoverable(v59)
    end
end
function v17._get_option_frame_position(p60, p61)
    return UDim2.new(0, 0, 0, p60.chooser_height * 0.7 * p61)
end
function v17._stop_expanded_dropdown_render_stepped(p62)
    if p62.render_stepped then
        p62.render_stepped:Disconnect()
        p62.render_stepped = nil
    end
end
function v17._start_expanded_dropdown_render_stepped(p_u_63)
    p_u_63:_stop_expanded_dropdown_render_stepped()
    p_u_63.render_stepped = v_u_11.RenderStepped:Connect(function()
        if p_u_63.instance.Parent == nil then
            p_u_63:_stop_expanded_dropdown_render_stepped()
        end
        for _, v64 in ipairs(p_u_63.option_frames) do
            if v64.Parent then
                local v65 = p_u_63.scroll_complex.AbsolutePosition.Y - p_u_63.chooser_height
                local v66 = p_u_63.chooser_height * 0.3
                local v67 = v64.AbsolutePosition.Y - v65
                local v68 = 1 - math.clamp(v67, 0, v66) / v66
                v64.Shadow.ImageTransparency = v68
            end
        end
    end)
end
function v17._set_scrollframe_enabled(p69, p70)
    if p70 then
        p69.scrolling_frame.ScrollBarImageTransparency = 0
        p69.scroll_complex.ScrollbarBacking.Visible = true
    else
        p69.scrolling_frame.ScrollBarImageTransparency = 1
        p69.scroll_complex.ScrollbarBacking.Visible = false
    end
end
function v17._set_num_choices_visible(p71, p72)
    p71.scroll_complex.Size = UDim2.new(p71.scroll_complex.Size.X, UDim.new(0.7 * p72, 0))
    p71.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, p71.chooser_height * 0.7 * #p71.choices)
    if p72 == 0 then
        p71:_set_scrollframe_enabled(false)
        p71:_stop_expanded_dropdown_render_stepped()
    else
        if #p71.choices <= p72 then
            p71:_set_scrollframe_enabled(false)
        else
            p71:_set_scrollframe_enabled(true)
        end
        p71.clipping_frame.Size = UDim2.new(1, 1000, 1 + 0.7 * p72, 10)
        p71:_start_expanded_dropdown_render_stepped()
    end
end
function v17._build_clipping_frame(p73)
    local v74 = not p73.clipping_frame
    assert(v74)
    local v75 = Instance.new("Frame")
    v75.Name = "ClippingFrame"
    v75.ClipsDescendants = true
    v75.BackgroundTransparency = 1
    v75.AnchorPoint = Vector2.new(0.5, 0)
    v75.Position = UDim2.new(0.5, 0, 0, 0)
    v75.Size = UDim2.new(1, 0, 1, 0)
    v75.Parent = p73.instance
    p73.clipping_frame = v75
    local v76 = Instance.new("Frame")
    v76.Name = "ContentsFrame"
    v76.BackgroundTransparency = 1
    v76.Size = UDim2.new(0, p73.instance.AbsoluteSize.X, 0, p73.instance.AbsoluteSize.Y)
    v76.AnchorPoint = Vector2.new(0.5, 0)
    v76.Position = UDim2.new(0.5, 0, 0, -1)
    v76.Parent = v75
    p73.scroll_complex.Parent = v76
end
function v17._restore_xbox_selection_parent(p77)
    if p77.revert_selection_parent_callback then
        p77.revert_selection_parent_callback()
        p77.revert_selection_parent_callback = nil
    end
end
function v17._narrow_xbox_selection_parent(p78)
    p78:_restore_xbox_selection_parent()
    p78.revert_selection_parent_callback = v_u_4.narrow_selection_parent(p78.instance)
end
function v17.console_activated(p_u_79)
    local v_u_80 = v_u_12.SelectedObject
    local v_u_81 = v_u_4.get_watch_from_parent(p_u_79.instance)
    p_u_79.chooser.Button.Selectable = true
    v_u_81:select_object(p_u_79.chooser.Button)
    p_u_79:open_choices()
    v_u_81:disable_button_actions()
    v_u_6.race({ v_u_6.fromEvent(v_u_14.InputBegan, function(p82)
            return p82.KeyCode == Enum.KeyCode.ButtonB
        end), v_u_6.fromEvent(v_u_12:GetPropertyChangedSignal("SelectedObject"), function()
            local v83 = v_u_12.SelectedObject
            if v83 then
                v83 = not v_u_12.SelectedObject:IsDescendantOf(p_u_79.instance)
            end
            return v83 and true or false
        end) }):andThen(function()
        p_u_79:close_choices()
        v_u_81:enable_button_actions()
        v_u_81:select_object(v_u_80)
    end)
end
function v17.open_choices(p84)
    if not p84.choosing then
        p84.choosing = true
        p84:_calculate_chooser_height()
        p84:_refresh_option_frames()
        p84.scrolling_frame.CanvasPosition = Vector2.new()
        for v85, v86 in ipairs(p84.option_frames) do
            v86.Shadow.ImageTransparency = 1
            local v87 = 0.3 + (v85 - 1) * 0.05
            local v88 = v_u_10:Create(v86, TweenInfo.new(v87, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                ["Position"] = p84:_get_option_frame_position(v85)
            })
            v_u_10:Create(v86.Shadow, TweenInfo.new(v87, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["ImageTransparency"] = 0
            }):Play()
            v88:Play()
        end
        p84:_narrow_xbox_selection_parent()
    end
end
function v17.close_choices(p_u_89)
    if p_u_89.choosing then
        p_u_89.choosing = false
        p_u_89:_restore_xbox_selection_parent()
        local v_u_90 = p_u_89.option_frames[1]
        local v_u_91 = {}
        for v92 = #p_u_89.option_frames, 1, -1 do
            local v93 = p_u_89.option_frames[v92]
            local v94 = 0.4 - (v92 - 1) * 0.025
            local v95 = v_u_10:Create(v93, TweenInfo.new(v94, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                ["Position"] = UDim2.new(0, 0, 0, 0)
            })
            table.insert(v_u_91, v95)
            local v96 = v_u_10:Create(v93.Shadow, TweenInfo.new(v94 + 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["ImageTransparency"] = 1
            })
            table.insert(v_u_91, v96)
            v96:Play()
            v95:Play()
            if v_u_12.SelectedObject == v93.Button then
                v_u_4.get_watch_from_parent(p_u_89.instance):select_object(p_u_89.chooser.Button)
            end
            v93.Button.Selectable = false
        end
        p_u_89.chooser.Button.Selectable = p_u_89.can_freely_select_chooser
        p_u_89:_set_num_choices_visible(0)
        coroutine.wrap(function()
            v_u_21(v_u_91)
            if v_u_90 and v_u_90.Parent then
                p_u_89:_destroy_option_frames()
            end
        end)()
    end
end
function v17._select_choice(p97, p98, p99)
    assert(p98)
    local v100 = p97.choices[p98]
    assert(v100)
    p97.choice_index = p98
    p97.choice = v100
    p97.chooser.Container.TextLabel.Text = v100
    p97.chooser.Container.TextLabel.AutoLocalize = p97.should_localize_choices
    if not p99 and p97.on_choice_changed then
        p97.on_choice_changed(p98, v100)
    end
    p97.changed:Fire(p98)
    p97:close_choices()
end
function v17.select_choice(p101, p102)
    p101:_select_choice(p102, false)
end
function v17.get_selected_choice(p103)
    return p103.choice_index, p103.choice
end
function v17.get_choices_set(p104)
    return v_u_7.Dictionary.map(p104.choices, function(p105, p106)
        return p106, p105
    end)
end
function v17.set_enabled(p107, p108)
    p107.enabled = p108
    p107.chooser.Button.Active = p108
end
function v17.get(p109)
    return p109.choice_index
end
function v17.set(p110, p111)
    p110:select_choice(p111)
end
function v17.start(p_u_112, p113)
    local v114 = v_u_18(p113)
    assert(v114, "Options failed to validate.")
    p_u_112.options = v_u_7.Dictionary.copy(p113)
    p_u_112.enabled = true
    p_u_112.changed = v_u_5.new()
    p_u_112.should_localize_choices = not p_u_112.options.should_localize_choices and true or p_u_112.options.should_localize_choices
    p_u_112.choose_text = p_u_112.options.choose_text or "Choose One"
    p_u_112.choices = p_u_112.options.choices
    p_u_112.on_choice_changed = p_u_112.options.on_choice_changed
    p_u_112.chooser = p_u_112.instance.Chooser
    p_u_112.chooser.Container.TextLabel.Text = p_u_112.choose_text
    p_u_112.chooser.Container.TextLabel.AutoLocalize = p_u_112.should_localize_choices
    p_u_112.can_freely_select_chooser = p_u_112.chooser.Button.Selectable
    p_u_112.option_frames = {}
    p_u_112.hovered = {}
    p_u_112.choosing = false
    p_u_112.option1_template = p_u_112.instance.Option1Template
    p_u_112.option2_template = p_u_112.instance.Option2Template
    p_u_112.option1_template.Visible = true
    p_u_112.option2_template.Visible = true
    p_u_112.option1_template.Parent = nil
    p_u_112.option2_template.Parent = nil
    p_u_112.scroll_complex = p_u_112.instance.ScrollComplex
    p_u_112.scrolling_frame = p_u_112.scroll_complex.ScrollingFrame
    p_u_112.scroll_complex.Visible = true
    p_u_112.options_container = p_u_112.scrolling_frame.Content
    p_u_112:_calculate_chooser_height()
    p_u_112:_build_clipping_frame()
    p_u_112:_set_num_choices_visible(0)
    p_u_112.input_began = v_u_14.InputBegan:Connect(function(p115, _)
        if not v_u_3.is_using_gamepad() then
            if p_u_112.choosing and v_u_9[p115.UserInputType] then
                local v116 = p_u_112.chooser.AbsolutePosition
                local v117 = p_u_112.chooser.AbsoluteSize
                local v118 = Vector2.new(v116.X, v116.Y)
                local v119 = Vector2.new(v116.X + v117.X, v116.Y + v117.Y + p_u_112:_get_option_frame_position(#p_u_112.option_frames).Y.Offset)
                local v120 = Rect.new(v118, v119)
                local v121 = v_u_14:GetMouseLocation() - v_u_12:GetGuiInset()
                if v121.X < v120.Min.X or (v121.X > v120.Max.X or (v121.Y < v120.Min.Y or v121.Y > v120.Max.Y)) then
                    p_u_112:close_choices()
                end
            end
        end
    end)
    p_u_112.chooser.Button[v_u_16]:Connect(function()
        if p_u_112.enabled then
            if p_u_112.choosing then
                p_u_112:close_choices()
            else
                p_u_112:open_choices()
            end
        else
            return
        end
    end)
    p_u_112:_register_hoverable(p_u_112.chooser)
    task.spawn(function()
        v_u_13:PreloadAsync({ p_u_112.option1_template.Button, p_u_112.option2_template.Button })
    end)
    if p_u_112.options.default then
        p_u_112:_select_choice(p_u_112.options.default, true)
    end
    return p_u_112
end
function v17.destroy(p122)
    p122.instance:Destroy()
    if p122.render_stepped then
        p122.render_stepped:Disconnect()
    end
    if p122.input_began then
        p122.input_began:Disconnect()
    end
end
return v17