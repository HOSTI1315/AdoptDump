--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FurniturePickColorsApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SoundPlayer")
local v_u_3 = v1("ColorThemeManager")
local v_u_4 = v1("DownloadClient")
local v_u_5 = v1("XboxSupport")
local v_u_6 = v1("FurnitureDB")
local v_u_7 = v1("TicketQueue")
local v_u_8 = v1("Signal")
local v9 = v1("Class")
local v_u_10 = v1("FurnitureColors")
local v_u_11 = v1("FurnitureBounds")
local v_u_12 = v1("package:Sift")
local v_u_13 = v1("package:Promise")
local v_u_14 = {
    [1] = "Primary",
    [2] = "Secondary",
    [3] = "Tertiary",
    [4] = "Quaternary",
    [5] = "Quinary",
    [6] = "Senary",
    [7] = "Septenary",
    [8] = "Octonary",
    [9] = "Nonary",
    [10] = "Denary",
    ["default"] = "Additional"
}
local v15 = v9("FurniturePickColorsApp", v1("UIBaseApp"))
local function v_u_16()
    return nil
end
local function v_u_23(p17)
    local v18 = p17.PlacementBlock.CFrame
    local v19 = Instance.new("Model")
    v19.Name = "Bounds"
    local v20, v21 = v_u_11.get_furniture_selection_cframe_size(v18, false, { p17 })
    local v22 = CFrame.new(v20.Position)
    v_u_11.create_selection_box(v19, v22, v21, Color3.new(1, 1, 1), 0)
    return v19, v22
end
function v15._init_title_theme_color(p_u_24)
    local v25 = v_u_3.lookup("saturated")
    p_u_24.top.Title.Label.TextColor3 = v25
    p_u_24.top.Title.IconHolder.Icon.ImageColor3 = v25
    v_u_3.get_theme_changed_signal():Connect(function()
        local v26 = v_u_3.lookup("saturated")
        p_u_24.top.Title.Label.TextColor3 = v26
        p_u_24.top.Title.IconHolder.Icon.ImageColor3 = v26
    end)
end
function v15._get_colors(p27)
    local v28 = {}
    for v29, v30 in p27.color_buttons do
        v28[v29] = v30.instance.BackgroundColor3
    end
    return v28
end
function v15._set_color_buttons(p_u_31, p32, p_u_33, _)
    for _, v34 in p_u_31.color_buttons do
        v34.instance:Destroy()
    end
    p_u_31.color_buttons = {}
    for v_u_35, v36 in p32 do
        local v_u_37 = p_u_31.color_button_template:Clone()
        v_u_37.LayoutOrder = v_u_35
        v_u_37.BackgroundColor3 = v36
        v_u_37.Face.Frame.TextLabel.Text = v_u_14[v_u_35] or v_u_14.default
        v_u_37.Parent = p_u_31.scroll_content
        local v_u_38 = nil
        local v43 = {
            ["mouse_button1_click"] = function()
                p_u_31.container.Visible = false
                local v39, v_u_40 = p_u_31.UIManager.apps.ColorPickerApp:queue_with_override({
                    ["request_source"] = "furniture",
                    ["starter_color"] = v_u_37.BackgroundColor3,
                    ["additional_colors"] = { p_u_33[v_u_35] }
                })
                local v41 = v_u_13.fromEvent(p_u_31.colors_picked):andThen(function()
                    v_u_40(nil)
                end)
                local v42 = v39:expect()
                if v42 then
                    v_u_38:set_basic_color(v42)
                    v_u_37.BackgroundColor3 = v42
                    p_u_31.colors_changed:Fire()
                end
                v41:cancel()
                p_u_31.container.Visible = true
            end
        }
        v_u_38 = p_u_31.UIManager.wrap(v_u_37, "DepthButton"):start(v43)
        v_u_38:set_basic_color(v36)
        p_u_31.color_buttons[v_u_35] = v_u_38
    end
    if #p32 <= 3 then
        p_u_31.scroll_content.Parent.Parent.ScrollbarBacking.Visible = false
        p_u_31.scroll_content.Parent.Size = UDim2.new(1, 23, 1, -10)
        p_u_31.scroll_content.Parent.CanvasSize = UDim2.new(0, 0, 0, 0)
    else
        p_u_31.scroll_content.Parent.Parent.ScrollbarBacking.Visible = true
        p_u_31.scroll_content.Parent.Size = UDim2.new(1, -5, 1, -10)
        local v44 = p_u_31.scroll_content.UIListLayout.AbsoluteContentSize.Y
        p_u_31.scroll_content.Parent.CanvasSize = UDim2.new(0, 0, 0, v44 - 10 + 40)
    end
end
function v15._reset_to_default_colors(p45, p46)
    for v47, v48 in p45.color_buttons do
        local v49 = p46[v47]
        if v49 then
            v48:set_basic_color(v49)
            v48.instance.BackgroundColor3 = v49
        end
    end
    p45.colors_changed:Fire()
end
function v15._setup_pick_furniture_colors(p_u_50, p51)
    local v52 = p51.kind
    local v53 = p51.starter_colors
    local v54 = p51.world_orientation and p51.world_orientation.Rotation or CFrame.identity
    local v55 = v_u_6[v52]
    local v56
    if v55 then
        v56 = v55.model_name
    else
        v56 = v55
    end
    local v57 = "No furniture entry found for " .. v52
    assert(v55, v57)
    local v58 = "No model name found for " .. v52
    assert(v56, v58)
    local v_u_59
    if v_u_4.is_cached("Furniture", v56) then
        v_u_59 = v_u_4.download("Furniture", v56):Clone()
    else
        v_u_59 = v_u_4.promise_download_copy("Furniture", v56):expect()
    end
    v_u_59.PlacementBlock.CanCollide = false
    v_u_59.PlacementBlock.Transparency = 1
    v_u_59.PrimaryPart = v_u_59.PlacementBlock
    local v60 = v_u_59:FindFirstChild("PlacementTops")
    if v60 then
        for _, v61 in v60:GetChildren() do
            v61.Transparency = 1
            v61.CanCollide = false
        end
    end
    v_u_59:SetPrimaryPartCFrame(v54)
    local v_u_62, v63 = v_u_23(v_u_59)
    local v_u_64 = v63:ToObjectSpace(v54)
    local v65
    if p51.world_orientation then
        local v66, v67
        v66, v65, v67 = v63:ToObjectSpace(workspace.CurrentCamera.CFrame):ToEulerAnglesYXZ()
    else
        v65 = 0
    end
    p_u_50.model_viewer:set_model(v_u_62)
    p_u_50.model_viewer:set_spin_enabled(true)
    p_u_50.model_viewer:reset_rotation(-0.17453292519943295, v65)
    local v_u_69 = p_u_50.model_viewer.control_changed:Connect(function(p68)
        if p68 then
            p_u_50.model_viewer:set_spin_enabled(false)
        end
    end)
    local v70 = table.clone(v53 or {})
    local v71 = v_u_10.get_primary_default_colors(v_u_59)
    local v72 = v_u_10.get_secondary_default_colors(v_u_59)
    local v73 = v_u_12.List.concat(v71, v72)
    for v74, v75 in v73 do
        v70[v74] = v70[v74] or v75
    end
    p_u_50.default_colors = v73
    local v76 = #v71
    p_u_50:_set_color_buttons(v70, v73, (math.max(1, v76)))
    local v_u_77 = nil
    local v_u_78 = p_u_50.colors_changed:Connect(function()
        if v_u_77 then
            v_u_77:Destroy()
        end
        v_u_77 = v_u_59:Clone()
        v_u_77:SetPrimaryPartCFrame(v_u_64)
        v_u_77.Parent = p_u_50.model_viewer:get_model()
        v_u_10.recolor_from_array(v_u_77, p_u_50:_get_colors(), true)
    end)
    p_u_50.colors_changed:Fire()
    return function()
        v_u_69:Disconnect()
        v_u_78:Disconnect()
        p_u_50.model_viewer:set_model(nil)
        v_u_77:Destroy()
        v_u_62:Destroy()
        p_u_50.default_colors = nil
        p_u_50:_set_color_buttons({}, {}, 0)
    end
end
function v15.queue_with_override(p_u_79, p_u_80)
    local v_u_81 = false
    local v_u_82 = false
    local v_u_83 = v_u_16
    local function v_u_85(p84)
        v_u_81 = false
        v_u_83()
        p_u_79.UIManager.set_app_visibility(p_u_79.ClassName, false)
        return table.unpack(p84)
    end
    local v_u_86 = false
    local function v_u_87(...)
        if not v_u_86 then
            v_u_86 = true
            return v_u_85(...)
        end
    end
    local v_u_88, v_u_89 = p_u_79.ticket_queue:queue(function()
        v_u_81 = true
        v_u_83 = p_u_79:_setup_pick_furniture_colors(p_u_80)
        p_u_79.UIManager.set_app_visibility(p_u_79.ClassName, true)
        if p_u_80.play_pop_sound or p_u_80.play_pop_sound == nil then
            v_u_2.FX:play("Pop")
        end
        return v_u_13.fromEvent(p_u_79.colors_picked):andThen(function(...)
            return v_u_87(table.pack(...))
        end)
    end)
    local function v90()
        return v_u_81
    end
    local function v92(p91)
        if not v_u_82 and p_u_79.ticket_queue:is_ticket_active(v_u_89) then
            v_u_82 = true
            p_u_79.colors_picked:Fire(p91)
        end
    end
    v_u_13.try(function()
        v_u_88:await()
        v_u_87(table.pack(nil))
    end)
    return v_u_88, v90, v92
end
function v15.pick_colors(p93, p94)
    local v95, _ = p93:queue_with_override(p94)
    return v95:expect()
end
function v15.show(p96)
    p96.instance.Body.Visible = true
end
function v15.hide(p97)
    p97.instance.Body.Visible = false
end
function v15.start(p_u_98)
    p_u_98.instance.Enabled = true
    p_u_98.ticket_queue = v_u_7.new()
    p_u_98.container = p_u_98.instance.Body.Container
    p_u_98.inner = p_u_98.container.Inner
    p_u_98.content = p_u_98.inner.Content
    p_u_98.bottom = p_u_98.inner.Bottom
    p_u_98.top = p_u_98.inner.Top
    p_u_98.scroll_content = p_u_98.content.Right.Inner.Scroll.ScrollComplex.ScrollingFrame.Content
    p_u_98.color_button_template = p_u_98.scroll_content.ColorButtonTemplate
    p_u_98.color_button_template.Parent = nil
    p_u_98.color_buttons = {}
    p_u_98.default_colors = nil
    p_u_98.colors_picked = v_u_8.new()
    p_u_98.colors_changed = v_u_8.new()
    p_u_98.model_viewer = p_u_98.UIManager.wrap(p_u_98.content.Left.ViewportFrame, "ModelViewer3D"):start({
        ["target_x_rotation"] = -0.17453292519943295,
        ["field_of_view"] = 70,
        ["can_input"] = true
    })
    local v_u_99 = false
    local v100 = {
        ["mouse_button1_click"] = function()
            if not v_u_99 then
                v_u_99 = true
                if p_u_98.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Do you want to reset the furniture to its default coloring?",
                    ["left"] = "No",
                    ["right"] = "Yes"
                }) == "Yes" and p_u_98.default_colors then
                    p_u_98:_reset_to_default_colors(p_u_98.default_colors)
                end
                v_u_99 = false
            end
        end,
        ["mouse_button1_down"] = function()
            v_u_2.FX:play("BambooButton")
        end
    }
    p_u_98.UIManager.wrap(p_u_98.content.Right.Inner.Defaults, "DepthButton"):start(v100):set_state("selected")
    local v101 = {
        ["mouse_button1_click"] = function()
            p_u_98.colors_picked:Fire(p_u_98.UIManager.is_visible(p_u_98.ClassName) and p_u_98:_get_colors() or nil)
        end,
        ["mouse_button1_down"] = function()
            v_u_2.FX:play("BambooButton")
        end
    }
    local v102 = p_u_98.UIManager.wrap(p_u_98.bottom.Confirm, "DepthButton"):start(v101)
    local v103 = {
        ["mouse_button1_click"] = function()
            p_u_98.colors_picked:Fire(nil)
        end,
        ["mouse_button1_down"] = function()
            v_u_2.FX:play("BambooButton")
        end
    }
    p_u_98.UIManager.wrap(p_u_98.top.Close, "DepthButton"):start(v103)
    p_u_98:_init_title_theme_color()
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_98.instance.Body,
        ["default_selection"] = v102.instance,
        ["app_name"] = p_u_98.ClassName,
        ["exit_buttons"] = { p_u_98.top.Close },
        ["close_override"] = function()
            if p_u_98.container.Visible then
                p_u_98.colors_picked:Fire(nil)
            end
            return false
        end
    })
end
return v15