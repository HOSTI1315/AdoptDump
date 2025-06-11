--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AmbianceApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("new:AmbiancePropertyHelper")
local v_u_3 = v_u_1("CameraParticlesClient")
local v_u_4 = v_u_1("new:CustomAmbiance")
local v_u_5 = v_u_1("new:AmbianceDB")
local v_u_6 = v_u_1("WeatherClient")
local v_u_7 = v_u_1("RouterClient")
local v_u_8 = v_u_1("TweenPromise")
local v_u_9 = v_u_1("XboxSupport")
local v_u_10 = v_u_1("ClientData")
local v_u_11 = v_u_1("PlatformM")
local v_u_12 = v_u_1("WeatherDB")
local v13 = v_u_1("Class")
local v_u_14 = v_u_1("package:Promise")
local v_u_15 = v2.get_whitelisted_properties()
local v_u_16 = {
    ["Lighting"] = {
        ["icon"] = "rbxassetid://95792454760409",
        ["properties"] = {
            v_u_15.Lighting.ClockTime,
            v_u_15.Lighting.Ambient,
            v_u_15.Lighting.OutdoorAmbient,
            v_u_15.Lighting.ColorShift_Top,
            v_u_15.Lighting.ExposureCompensation
        }
    },
    ["Filters"] = {
        ["icon"] = "rbxassetid://81462919967686",
        ["properties"] = {
            v_u_15.ColorCorrectionEffect.Brightness,
            v_u_15.ColorCorrectionEffect.Contrast,
            v_u_15.ColorCorrectionEffect.Saturation,
            v_u_15.ColorCorrectionEffect.TintColor
        }
    },
    ["Atmosphere"] = {
        ["icon"] = "rbxassetid://85204834561673",
        ["properties"] = {
            v_u_15.Atmosphere.Density,
            v_u_15.Atmosphere.Color,
            v_u_15.Atmosphere.Haze,
            v_u_15.Atmosphere.Glare
        }
    },
    ["Weather"] = {
        ["icon"] = "rbxassetid://85175400365140",
        ["properties"] = {
            v_u_15.SunRaysEffect.Intensity,
            v_u_15.Custom.Snow,
            v_u_15.Custom.Rain,
            v_u_15.Custom.Leaves
        }
    }
}
local v17 = v13("AmbianceApp", v_u_1("UIBaseApp"))
function v17._replicate_ambiance_property(p_u_18, p19, p20, p21)
    p_u_18.queued_properties = p_u_18.queued_properties or {}
    p_u_18.queued_properties[p19] = p_u_18.queued_properties[p19] or {}
    p_u_18.queued_properties[p19][p20] = p21
    p_u_18.replication_promise:cancel()
    p_u_18.replication_promise = v_u_14.delay(0.5):andThen(function()
        p_u_18.last_replication_time = DateTime.now().UnixTimestamp
        v_u_7.get("HousingAPI/UpdateAmbianceProperties"):FireServer(p_u_18.queued_properties)
        p_u_18.queued_properties = {}
    end)
end
function v17._replicate_ambiance(p22)
    p22.replication_promise:cancel()
    local v23
    if p22.active_ambiance then
        v23 = p22.active_ambiance:serialize()
    else
        v23 = nil
    end
    v_u_7.get("HousingAPI/UpdateAmbiance"):FireServer(v23)
end
function v17._is_preset_selected(p24, p25)
    return p25 == p24.selected_ambiance
end
function v17._has_custom_ambiance(p26)
    local v27 = p26.active_ambiance
    if v27 then
        v27 = p26.active_ambiance:has_overrides()
    end
    return v27
end
function v17._get_or_create_custom_ambiance(p28)
    if not p28.active_ambiance then
        p28.active_ambiance = v_u_4.new("live", 3)
        p28:_replicate_ambiance()
    end
    return p28.active_ambiance
end
function v17._refresh_live_weather_icon(p29)
    if p29.active_ambiance and p29.active_ambiance.ambiance_kind == "live" then
        if p29:_has_custom_ambiance() then
            return
        end
        p29:clear_ambiance()
    end
    if v_u_6.get_time_of_day() == "DAY" then
        p29.preset_buttons.live.instance.Background.Image = v_u_5.day.icon
    else
        p29.preset_buttons.live.instance.Background.Image = v_u_5.night.icon
    end
end
function v17._refresh_visible_values(p30, p31)
    for v32, v33 in p30.visible_element_data do
        local v34 = v33.element
        local v35 = v33.entry
        local v36
        if v34 == nil then
            v36 = false
        else
            v36 = v35 ~= nil
        end
        local v37 = "Element not found from data at index: " .. v32
        assert(v36, v37)
        local v38 = v35.parent_property
        local v39 = v35.property
        local v40 = p30:_get_or_create_custom_ambiance():get_live_property(v38, v39)
        if v40 == nil then
            v40 = v34.options.default
        end
        v34:set(v40)
        if p31 then
            p30:_replicate_ambiance_property(v38, v39, v40)
        end
    end
end
function v17._refresh_selected_preset(p41, p42)
    local v43 = p42 or {}
    local v44 = not p41.active_ambiance and "live" or p41.active_ambiance.ambiance_kind
    local v45 = v43.ambiance_kind or v44
    local v46
    if v43.selected == nil then
        v46 = v44 == v45
    else
        v46 = v43.selected
    end
    local v47
    if v46 then
        if v43.customized == nil then
            v47 = p41:_has_custom_ambiance()
        else
            v47 = v43.customized
        end
    else
        v47 = v46
    end
    local v48 = p41.preset_body:FindFirstChild(v45)
    v48.Custom.Visible = v47
    v48.Border.Visible = v46
    if v48:FindFirstChild("Live") then
        v48.Live.Visible = not v47
    end
    if v46 and not p41:_is_preset_selected(v45) then
        v48.Border.ImageTransparency = 0
        p41:_refresh_selected_preset({
            ["ambiance_kind"] = p41.selected_ambiance,
            ["selected"] = false
        })
        p41.selected_ambiance = v45
    end
end
function v17._select_ambiance_preset(p49, p50)
    local v51 = p50 ~= nil
    assert(v51, "Ambiance preset name not provided")
    if p49:_has_custom_ambiance() then
        if p49.UIManager.apps.DialogApp:dialog({
            ["text"] = "This will clear all of your custom settings. Are you sure?",
            ["left"] = "No",
            ["right"] = "Yes"
        }) ~= "Yes" then
            return
        end
    elseif p49:_is_preset_selected(p50) then
        return
    end
    local v52 = v_u_5[p50]
    local v53 = v52 ~= nil
    local v54 = "Ambiance entry not found: " .. p50
    assert(v53, v54)
    p49:clear_ambiance()
    if v52.use_live_weather and not v52.live_weather_time then
        local v55 = v_u_1("InteriorsM").get_current_location()
        if v55 then
            v55 = v55.interior
        end
        local v56
        if v55 then
            v56 = v_u_12[v55.Name]
        else
            v56 = v55
        end
        if v56 then
            v_u_6.add_interior_lighting(2, v55.Name, true)
        end
    else
        p49.active_ambiance = v_u_4.new(p50, 3)
    end
    p49:_refresh_selected_preset({
        ["ambiance_kind"] = p50,
        ["selected"] = true
    })
    p49:_replicate_ambiance()
    p49:_refresh_live_weather_icon()
end
function v17._initialize_weather_buttons(p_u_57)
    p_u_57.preset_buttons = {}
    for v_u_58, v59 in v_u_5 do
        local v_u_60 = p_u_57.preset_template:Clone()
        if v59.icon then
            v_u_60.Background.Image = v59.icon
            v_u_60.Live:Destroy()
        else
            v_u_60.Background.Image = v_u_5.day.icon
            v_u_60.Live.Visible = true
        end
        v_u_60.Custom.Visible = false
        v_u_60.Border.Visible = false
        v_u_60.Parent = p_u_57.preset_body
        v_u_60.LayoutOrder = v59.order
        v_u_60.Name = v_u_58
        local v_u_61 = false
        local v62 = {
            ["mouse_button1_click"] = function()
                p_u_57:_select_ambiance_preset(v_u_58)
            end,
            ["hover_render"] = function()
                if v_u_61 then
                    return
                else
                    v_u_61 = true
                    if not p_u_57:_is_preset_selected(v_u_58) then
                        v_u_60.Border.ImageTransparency = 1
                        v_u_60.Border.Visible = true
                        v_u_8.new(v_u_60.Border, TweenInfo.new(0.07), {
                            ["ImageTransparency"] = 0.5
                        })
                    end
                end
            end,
            ["up_render"] = function()
                if v_u_61 then
                    v_u_61 = false
                    if not p_u_57:_is_preset_selected(v_u_58) then
                        v_u_8.new(v_u_60.Border, TweenInfo.new(0.07), {
                            ["ImageTransparency"] = 1
                        }):andThen(function()
                            if not p_u_57:_is_preset_selected(v_u_58) then
                                v_u_60.Border.Visible = false
                            end
                        end)
                    end
                else
                    return
                end
            end
        }
        p_u_57.preset_buttons[v_u_58] = p_u_57.UIManager.wrap(v_u_60, "CustomButton"):start(v62)
    end
    p_u_57:_refresh_live_weather_icon()
end
function v17._initialize_settings_elements(p_u_63)
    p_u_63.visible_element_data = {}
    p_u_63.setting_elements = {}
    local v_u_64 = {}
    for v_u_65, v66 in v_u_15 do
        p_u_63.setting_elements[v_u_65] = {}
        for v_u_67, v68 in v66 do
            local v69 = p_u_63.settings_templates:FindFirstChild((("%*Template"):format(v68.type)))
            if v69 then
                local v70 = v68.default
                local v_u_71 = nil
                local function v74(p72, p73)
                    if not p73 then
                        if p72 == v_u_71 then
                            return
                        end
                        v_u_71 = p72
                    end
                    p_u_63:on_value_changed(v_u_65, v_u_67, p72, p73)
                end
                local v75 = v69:Clone()
                v75.Container.Title.Text = v68.name or v_u_67
                v75.Container.Description.Text = v68.description or ""
                v75.Container.Description.Visible = v68.description ~= nil
                v75.Visible = false
                v75.Container.Icon.Image = v68.icon
                v75.Container.Icon.Size = v68.icon_size or v75.Container.Icon.Size
                v75.Container.Icon.ImageColor3 = v68.color
                v75.Container.Title.TextColor3 = v68.color
                v75.Container.Description.TextColor3 = v68.color
                v75.Name = v_u_65 .. "_" .. v_u_67
                v75.Parent = p_u_63.settings_menu.Body
                local v_u_76 = nil
                if v68.type == "Slider" then
                    local v77 = v75.Container.Slider
                    v77.ValueLabel.TextColor3 = v68.color
                    v77.Line.Handle.Icon.ImageColor3 = v68.color
                    local v78 = v68.range
                    local v79 = v68.interval or (v68.show_as_percentage and ((v78.Max - v78.Min) / 1000 or 0.5) or 0.5)
                    local v_u_80 = p_u_63.UIManager.wrap(v77, "Slider"):start({
                        ["min"] = v78.Min,
                        ["max"] = v78.Max,
                        ["interval"] = v79,
                        ["show_as_percentage"] = v68.show_as_percentage == true,
                        ["default"] = v70 or v78.Min + (v78.Max - v78.Min) / 2,
                        ["formatter"] = v68.slider_formatter
                    })
                    v_u_80.dragger.drag_started:Connect(function()
                        for _, v81 in v_u_64 do
                            if v81 ~= v_u_80 then
                                v81.line.Interactable = false
                                v81.handle.Interactable = false
                            end
                        end
                    end)
                    v_u_80.dragger.drag_ended:Connect(function()
                        for _, v82 in v_u_64 do
                            v82.line.Interactable = true
                            v82.handle.Interactable = true
                        end
                    end)
                    local v83 = v_u_80
                    table.insert(v_u_64, v83)
                    v_u_76 = v_u_80
                elseif v68.type == "ColorPicker" then
                    v_u_76 = p_u_63.UIManager.wrap(v75.Container.ColorPicker, "ColorPicker"):start({
                        ["default"] = v70 or Color3.new(1, 1, 1),
                        ["callback"] = function(p84)
                            p_u_63:on_value_changed(v_u_65, v_u_67, p84, true)
                        end
                    })
                elseif v68.type == "Switch" then
                    local v85 = p_u_63.UIManager.wrap(v75.Container.Switch, "Switch")
                    local v86 = {
                        ["color"] = v68.color
                    }
                    if v70 == nil then
                        v70 = false
                    end
                    v86.default = v70
                    v_u_76 = v85:start(v86)
                end
                if not v_u_76 then
                    v75:Destroy()
                    return
                end
                p_u_63.setting_elements[v_u_65][v_u_67] = v_u_76
                v_u_76.changed:Connect(v74)
                v75.Active = true
                v75.Activated:Connect(function(p87)
                    if v_u_11.is_using_gamepad() then
                        if p87.KeyCode == Enum.KeyCode.ButtonA then
                            v_u_76:console_activated()
                        end
                    end
                end)
            else
                warn("Element template does not exist for:", v68.type)
            end
        end
    end
end
function v17.clear_ambiance(p88)
    if p88.active_ambiance then
        p88.active_ambiance:destroy()
        p88.active_ambiance = nil
    end
end
function v17.on_value_changed(p89, p90, p91, p92, p93)
    local v94 = p89:_get_or_create_custom_ambiance()
    if v94:get_property(p90, p91) ~= p92 then
        local v95 = {
            [p90] = {
                [p91] = p92
            }
        }
        v94:set_properties(v95)
    end
    if p93 ~= true then
        p89:_replicate_ambiance_property(p90, p91, p92)
    end
end
function v17.show_presets_menu(p96)
    local v97 = p96.adjustments_menu.Visible
    p96.adjustments_menu.Visible = false
    p96.settings_menu.Visible = false
    p96:_refresh_selected_preset()
    p96.preset_content.Visible = true
    if v97 then
        p96.watch:select_object(p96.edit_button.instance)
    else
        local v98 = p96.preset_body:FindFirstChild("live")
        p96.watch:select_object(v98)
    end
    p96:_refresh_live_weather_icon()
end
function v17.show_adjustments_menu(p99)
    local v100
    if p99.settings_menu.Visible and p99.last_viewed_group then
        v100 = p99.adjustments_menu.Body:FindFirstChild(p99.last_viewed_group)
    else
        v100 = nil
    end
    p99.last_viewed_group = nil
    p99.adjustments_menu.Visible = true
    p99.settings_menu.Visible = false
    p99.preset_content.Visible = false
    p99.watch:select_object(v100 or p99.adjustments_menu.Body.Lighting)
end
function v17.show_settings_menu(p101, p102)
    local v103
    if p102 then
        v103 = v_u_16[p102]
    else
        v103 = nil
    end
    local v104 = v103 ~= nil
    local v105 = "Settings group not found: " .. p102
    assert(v104, v105)
    p101.last_viewed_group = p102
    for _, v106 in p101.visible_element_data do
        v106.instance.Visible = false
    end
    p101.visible_element_data = {}
    for v107, v108 in v103.properties do
        local v109 = v108.parent_property
        local v110 = v108.property
        local v111 = p101.setting_elements[v109]
        if v111 then
            v111 = p101.setting_elements[v109][v110]
        end
        local v112 = v111 ~= nil
        local v113 = "Element not found: " .. v108.name
        assert(v112, v113)
        local v114 = v111.instance.Parent.Parent
        v114.LayoutOrder = v107
        v114.Visible = true
        local v115 = p101.visible_element_data
        table.insert(v115, {
            ["element"] = v111,
            ["instance"] = v114,
            ["entry"] = v108
        })
    end
    for v116, v117 in p101.visible_element_data do
        local v118 = v117.instance
        local v119 = p101.visible_element_data[v116 - 1]
        local v120 = p101.visible_element_data[v116 + 1]
        if v119 then
            v118.NextSelectionUp = v119.instance
        else
            v118.NextSelectionUp = p101.settings_menu.Header.BackButton
        end
        if v120 then
            v118.NextSelectionDown = v120.instance
        else
            v118.NextSelectionDown = nil
        end
    end
    p101:_refresh_visible_values(false)
    p101.settings_menu.Header.Title.Text = v103.title or p102
    p101.settings_menu.Header.Icon.Image = v103.icon
    local v121 = p101.settings_menu.AbsoluteSize.Y - p101.settings_menu.Body.AbsoluteSize.Y
    for v122, v123 in p101.visible_element_data do
        v121 = v121 + v123.instance.Size.Y.Offset
        if v122 > 1 then
            v121 = v121 + p101.settings_menu.Body.UIListLayout.Padding.Offset
        end
    end
    p101.settings_menu.Size = UDim2.fromOffset(p101.settings_menu.Size.X.Offset, v121)
    p101.adjustments_menu.Visible = false
    p101.settings_menu.Visible = true
    p101.preset_content.Visible = false
    local v124 = p101.visible_element_data[1]
    if v124 then
        p101.watch:select_object(v124.instance)
    end
end
function v17.show(p125)
    p125.preset_content.Visible = true
    p125.instance.Enabled = true
    p125:show_presets_menu()
end
function v17.hide(p126)
    p126.instance.Enabled = false
    p126.adjustments_menu.Visible = false
    p126.settings_menu.Visible = false
    p126.preset_content.Visible = false
end
function v17.refresh(p127, p128)
    local v129 = p127.UIManager.is_closed({
        "MainMenuApp",
        "RoleplayPayApp",
        "AvatarEditorApp",
        "PlayerSpectateApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "FocusPetApp",
        "MockFocusPetApp"
    })
    if not p128[p127.ClassName] then
        v129 = false
    end
    if not p127.UIManager.apps.HouseEditorWrapperApp:is_topbar_visible() then
        v129 = false
    end
    if p127.UIManager.apps.HideGuiApp:should_hide_app(p127.ClassName) then
        v129 = false
    end
    p127:set_visibility(v129)
end
function v17.start(p_u_130)
    p_u_130.queued_properties = {}
    p_u_130.last_replication_time = 0
    p_u_130.replication_promise = v_u_14.resolve()
    p_u_130.active_ambiance = nil
    p_u_130.selected_ambiance = "live"
    p_u_130.preset_content = p_u_130.instance.PresetContent
    p_u_130.preset_body = p_u_130.preset_content.Body
    p_u_130.adjustments_menu = p_u_130.instance.AdjustmentsMenu
    p_u_130.settings_menu = p_u_130.instance.SettingsMenu
    p_u_130.settings_templates = p_u_130.settings_menu.Templates
    p_u_130.settings_templates.Parent = nil
    p_u_130.preset_template = p_u_130.preset_body.Template
    p_u_130.preset_template.Parent = nil
    p_u_130.preset_content.Header.Title.Text = "Ambiance Editor"
    p_u_130:_initialize_weather_buttons()
    p_u_130:_initialize_settings_elements()
    p_u_130.edit_button = p_u_130.UIManager.wrap(p_u_130.preset_content.Header.EditButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_130:show_adjustments_menu()
        end
    })
    p_u_130.UIManager.wrap(p_u_130.adjustments_menu.Header.BackButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_130:show_presets_menu()
        end
    }):set_state("selected")
    p_u_130.UIManager.wrap(p_u_130.settings_menu.Header.BackButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_130:show_adjustments_menu()
        end
    }):set_state("selected")
    p_u_130.UIManager.wrap(p_u_130.settings_menu.Header.Reset, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_130.UIManager.apps.DialogApp:dialog({
                ["text"] = "Are you sure you want to reset these settings?",
                ["left"] = "No",
                ["right"] = "Yes"
            }) == "Yes" then
                if p_u_130.active_ambiance then
                    local v131 = {}
                    for _, v132 in p_u_130.visible_element_data do
                        local v133 = v132.entry
                        local v134 = v133.parent_property
                        local v135 = v133.property
                        v131[v134] = v131[v134] or {}
                        if not table.find(v131[v134], v135) then
                            local v136 = v131[v134]
                            table.insert(v136, v135)
                        end
                    end
                    p_u_130.active_ambiance:reset_properties(v131)
                    p_u_130:_refresh_visible_values(true)
                end
            end
        end
    }):set_state("cancel")
    p_u_130.exit_button = p_u_130.UIManager.wrap(p_u_130.preset_content.Header.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_130.UIManager.set_app_visibility(p_u_130.ClassName, false)
        end
    })
    for _, v_u_137 in p_u_130.adjustments_menu.Body:GetChildren() do
        if v_u_137:IsA("ImageButton") then
            p_u_130.UIManager.wrap(v_u_137, "DepthButton"):start({
                ["mouse_button1_click"] = function()
                    p_u_130:show_settings_menu(v_u_137.Name)
                end
            })
        end
    end
    task.spawn(function()
        local v138 = v_u_1("InteriorsM")
        local v139 = v138.get_current_location()
        while not v139 do
            v139 = v138.on_location_changed:Wait()
        end
        local v_u_140 = nil
        v_u_10.register_callback_plus_existing("house_interior", function(p141, p142)
            if p141 == game.Players.LocalPlayer then
                local v143
                if p142 then
                    v143 = p142.unique
                else
                    v143 = p142
                end
                if v143 ~= v_u_140 then
                    v_u_140 = v143
                    p_u_130:clear_ambiance()
                    p_u_130.UIManager.set_app_visibility(p_u_130.ClassName, false)
                end
                if p142 and p142.ambiance then
                    if p_u_130.active_ambiance and p_u_130.UIManager.is_visible(p_u_130.ClassName) then
                        return
                    end
                    p_u_130.active_ambiance = v_u_4.deserialize(p142.ambiance)
                else
                    p_u_130:clear_ambiance()
                end
                p_u_130:_refresh_selected_preset()
            end
        end)
    end)
    v_u_7.get_event("WeatherAPI/WeatherUpdated").OnClientEvent:Connect(function(_)
        p_u_130:_refresh_live_weather_icon()
    end)
    v_u_3.get_changed_signal():Connect(function()
        if p_u_130.last_viewed_group == "Weather" and p_u_130.settings_menu.Visible then
            p_u_130:_refresh_visible_values(false)
        end
    end)
    p_u_130.watch = v_u_9.quick_watch({
        ["selection_parent"] = p_u_130.instance,
        ["default_selection"] = p_u_130.exit_button.instance,
        ["app_name"] = p_u_130.ClassName,
        ["exit_buttons"] = { p_u_130.exit_button.instance },
        ["close_override"] = function()
            if p_u_130.settings_menu.Visible then
                p_u_130:show_adjustments_menu()
                return false
            end
            if not p_u_130.adjustments_menu.Visible then
                return true
            end
            p_u_130:show_presets_menu()
            return false
        end
    })
end
return v17