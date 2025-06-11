--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.SettingsApp.SettingsApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("Signal")
local v_u_4 = v_u_1("SettingsDB")
local v_u_5 = v_u_1("ClientData")
local v_u_6 = v_u_1("RouterClient")
local v_u_7 = v_u_1("XboxSupport")
local v_u_8 = v_u_1("PolicyHelper")
local v_u_9 = v_u_1("SettingsHelper")
local v_u_10 = v_u_1("package:Promise")
local v_u_11 = v_u_1("package:Sift")
local v_u_12 = require(game.ReplicatedStorage.new.modules.BugScreenshotHelper)
local v13 = v2("SettingsApp", v_u_1("UIBaseApp"))
local function v_u_18(p14)
    local v15 = v_u_11.Set.fromList(p14)
    local v16 = v_u_11.Set.fromList(v_u_5.get("player_tags") or {})
    local v17 = v_u_11.Set.intersection(v15, v16)
    return next(v17) and true or false
end
local v_u_19 = nil
function v13._init_app_height(p20)
    local v21 = p20.instance.Frame
    if not v_u_19 then
        v_u_19 = Vector2.new(v21.Size.X.Offset, v21.Size.Y.Offset)
    end
    local v22 = v_u_19.Y
    local v23 = workspace.CurrentCamera.ViewportSize.Y - 10
    local v24 = math.min(v22, v23)
    v21.Size = UDim2.fromOffset(v_u_19.X, v24)
end
function v13._init_background_music(p25)
    local v_u_26 = v_u_1("Music")
    local v27 = v_u_9.get_setting_client({
        ["setting_id"] = "background_music_volume"
    })
    v_u_26.enable()
    v_u_26.set_master_volume(v27 / 100)
    p25:_get_setting_updated_signal("background_music_volume"):Connect(function(p28)
        v_u_26.set_master_volume(p28 / 100)
    end)
end
function v13._init_sound_effects(p29)
    local v_u_30 = v_u_1("SoundEffects")
    local v31 = v_u_9.get_setting_client({
        ["setting_id"] = "sound_effects_volume"
    })
    v_u_30.set_master_volume(v31 / 100)
    p29:_get_setting_updated_signal("sound_effects_volume"):Connect(function(p32)
        v_u_30.set_master_volume(p32 / 100)
    end)
end
function v13._init_debug_screenshot(p_u_33)
    local v34 = p_u_33:_get_setting_updated_signal("debug_screenshot")
    if v34 then
        v34:Connect(function(_)
            p_u_33.UIManager.set_app_visibility(p_u_33.ClassName, false)
            v_u_12.capture()
            p_u_33.UIManager.set_app_visibility(p_u_33.ClassName, true)
        end)
    end
end
function v13._init_edit_hotbar(p_u_35)
    local v36 = p_u_35:_get_setting_updated_signal("edit_hotbar")
    if v36 then
        v36:Connect(function(_)
            p_u_35.xbox_watch:clear_watch_stack()
            p_u_35.UIManager.set_app_visibility(p_u_35.ClassName, false)
            p_u_35.UIManager.apps.ToolApp:toggle_editing_hotbar()
        end)
    end
end
function v13._init_color_theme_change(p37)
    local v_u_38 = v_u_1("ColorThemeManager")
    local v_u_39 = v_u_38.get_theme_changed_signal()
    p37:_get_setting_updated_signal("theme_color"):Connect(function(p40)
        local v41 = v_u_38.get_theme_color()
        if p40 ~= v41 then
            v_u_38.set_theme_color(p40)
            v_u_39:Fire(v41, v41)
        end
    end)
end
function v13._init_char_interactions_hidden(p42)
    local v_u_43 = v_u_1("CharInteractions")
    p42:_get_setting_updated_signal("char_icons"):Connect(function(p44)
        v_u_43.update_hidden_interaction_setting(not p44)
    end)
end
function v13._show_category(p45, p46)
    for _, v47 in p45.category_contents do
        v47.Visible = false
    end
    for _, v48 in p45.category_settings[p46] do
        local v49 = v48.setting_entry
        local v50
        if v49.hide_if_trading_prohibited and v_u_8.is_trading_prohibited(game.Players.LocalPlayer) or v49.show_for_tags and not v_u_18(v49.show_for_tags) then
            v50 = false
        else
            v50 = not (v49.should_hide and v49.should_hide())
        end
        v48:set_visible(v50)
    end
    local v51 = p45.category_contents[p46]
    local v52 = p45.category_list_layouts[p46]
    v51.Size = UDim2.new(1, 0, 0, v52.AbsoluteContentSize.Y + 35)
    v51.Visible = true
    p45.scrolling_frame.CanvasSize = UDim2.new(0, 0, 0, v51.AbsoluteSize.Y)
end
function v13.show(p53)
    p53.category_dropdown:select_choice(1)
    p53.instance.Frame.Visible = true
end
function v13.hide(p54)
    p54.instance.Frame.Visible = false
end
function v13._get_setting_updated_signal(p55, p56)
    return p55.updated_signals[p56]
end
function v13.get_setting(p57, p58)
    local v59 = v_u_4.by_id[p58]
    assert(v59, ("%s does not have a valid entry in the settings DB"):format(p58))
    local v60 = p57.setting_containers[p58]
    if v60 then
        return v60:get()
    end
end
function v13.set_setting(p61, p62, p63)
    local v64 = v_u_4.by_id[p62]
    local v65 = p61.setting_containers[p62]
    assert(v64, "Setting entry did not exist")
    local v66 = v64.validation(p63)
    assert(v66, "Setting failed validation")
    v65:set(p63)
end
function v13.start(p_u_67)
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        p_u_67:_init_app_height()
    end)
    p_u_67:_init_app_height()
    p_u_67.category_names = {}
    p_u_67.category_contents = {}
    p_u_67.category_list_layouts = {}
    p_u_67.category_settings = {}
    p_u_67.scrolling_frame = p_u_67.instance.Frame.ScrollComplex.ScrollingFrame
    p_u_67.updated_signals = {}
    p_u_67.setting_containers = {}
    for v68, v69 in ipairs(v_u_4.by_category) do
        if not v69.hidden then
            p_u_67.category_settings[v69.category_name] = {}
            local v70 = Instance.new("Frame")
            v70.Size = UDim2.new(1, 0, 0, 1)
            v70.Parent = p_u_67.scrolling_frame
            local v71 = Instance.new("UIListLayout")
            v71.Padding = UDim.new(0, 2)
            v71.HorizontalAlignment = Enum.HorizontalAlignment.Left
            v71.SortOrder = Enum.SortOrder.LayoutOrder
            v71.Parent = v70
            for v72, v_u_73 in ipairs(v69.settings) do
                local v_u_74 = v_u_9.get_setting_server({
                    ["setting_id"] = v_u_73.id,
                    ["use_transform"] = false
                })
                local v75 = p_u_67.UIManager.wrap(v70, "SettingContainer"):start(v_u_73, v_u_74)
                v75.template.LayoutOrder = v72
                v75.template.ZIndex = -v72
                local v_u_76 = v_u_3.new()
                p_u_67.updated_signals[v_u_73.id] = v_u_76
                p_u_67.setting_containers[v_u_73.id] = v75
                p_u_67.category_settings[v69.category_name][v_u_73.id] = v75
                local v_u_77 = v_u_10.resolve()
                v75.setting_changed:Connect(function()
                    local v_u_78 = v_u_9.get_setting_client({
                        ["setting_id"] = v_u_73.id,
                        ["use_transform"] = false
                    })
                    local v79 = v_u_73.hash(v_u_78)
                    local v80 = v_u_73.hash(v_u_74)
                    v_u_74 = v_u_78
                    if v79 ~= v80 then
                        v_u_76:Fire(v_u_73.transform(v_u_78))
                        if v_u_73.save_to_server_after_idle_for_seconds then
                            v_u_77:cancel()
                            v_u_77 = v_u_10.delay(v_u_73.save_to_server_after_idle_for_seconds):andThen(function()
                                v_u_6.get("SettingsAPI/SetSetting"):FireServer(v_u_73.id, v_u_78)
                            end)
                        end
                    end
                end)
            end
            v70.Name = v69.category_name
            v70.Visible = false
            v70.BackgroundTransparency = 1
            v70.Selectable = false
            p_u_67.category_contents[v69.category_name] = v70
            p_u_67.category_names[v68] = v69.category_name
            p_u_67.category_list_layouts[v69.category_name] = v71
        end
    end
    p_u_67.category_dropdown = p_u_67.UIManager.wrap(p_u_67.instance.Frame.Heading.Dropdown, "Dropdown"):start({
        ["choose_text"] = "Choose Setting",
        ["choices"] = p_u_67.category_names,
        ["on_choice_changed"] = function(_, p81)
            p_u_67:_show_category(p81)
        end
    })
    p_u_67.UIManager.wrap(p_u_67.instance.Frame.Heading.Close, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_67.UIManager.set_app_visibility(p_u_67.ClassName, false)
        end
    })
    p_u_67.xbox_watch = v_u_7.quick_watch({
        ["selection_parent"] = p_u_67.instance.Frame,
        ["default_selection"] = p_u_67.category_dropdown.chooser.Button,
        ["save_last_selection"] = false,
        ["app_name"] = p_u_67.ClassName,
        ["exit_buttons"] = { p_u_67.instance.Frame.Heading.Close }
    })
    coroutine.wrap(function()
        p_u_67:_init_background_music()
        p_u_67:_init_sound_effects()
        p_u_67:_init_color_theme_change()
        p_u_67:_init_char_interactions_hidden()
        p_u_67:_init_debug_screenshot()
        p_u_67:_init_edit_hotbar()
    end)()
end
return v13