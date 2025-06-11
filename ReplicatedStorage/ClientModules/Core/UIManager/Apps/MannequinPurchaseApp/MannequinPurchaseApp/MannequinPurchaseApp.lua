--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MannequinPurchaseApp.MannequinPurchaseApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("InteractionsEngine")
local v_u_4 = v_u_1("VirtualMannequin")
local v_u_5 = v_u_1("Camera")
local v_u_6 = v_u_1("InventoryDB")
local v_u_7 = v_u_1("RarityDB")
local v_u_8 = v_u_1("ControlsDisabler")
local v_u_9 = v_u_1("DeveloperProductDB")
local v_u_10 = v_u_1("XboxSupport")
local v11 = v_u_1("PlatformM")
local v_u_12 = v_u_1("AvatarRotationController")
local v_u_13 = v_u_1("AltCurrencyData")
local v_u_14 = v_u_1("ColorThemeManager")
local v_u_15 = v_u_1("ClientData")
local v_u_16 = v_u_1("Signal")
local v_u_17 = v_u_1("package:Sift")
local v_u_18 = v_u_1("new:ToggleableSignal")
local v_u_19 = game:GetService("RunService")
local v_u_20 = game:GetService("TweenService")
local v21 = game:GetService("LocalizationService")
local v22 = v2("MannequinPurchaseApp", v_u_1("UIBaseApp"))
local v_u_23 = {
    ["small"] = {
        ["top"] = UDim2.new(0, 32, 0.04, -200),
        ["bottom"] = UDim2.new(0.5, 0, 0.95, 200)
    },
    ["big"] = {
        ["top"] = UDim2.new(0, 32, 0.02, -300),
        ["bottom"] = UDim2.new(0.5, 0, 0.97, 300)
    }
}
local v24 = {
    ["small"] = {
        ["top"] = UDim2.new(0, 32, 0.04, 0),
        ["bottom"] = UDim2.new(0.5, 0, 0.95, 0)
    },
    ["big"] = {
        ["top"] = UDim2.new(0, 32, 0.02, 0),
        ["bottom"] = UDim2.new(0.5, 0, 0.97, 0)
    }
}
local v_u_25 = v11.get_platform() == v11.platform.phone and "small" or "big"
local v_u_26 = {
    ["entered"] = {
        ["goal_top"] = v24[v_u_25].top,
        ["goal_bottom"] = v24[v_u_25].bottom,
        ["easing_style"] = Enum.EasingStyle.Back,
        ["easing_direction"] = Enum.EasingDirection.Out,
        ["tween_length"] = 0.8
    },
    ["rotate_began"] = {
        ["goal_top"] = v_u_23[v_u_25].top,
        ["goal_bottom"] = v_u_23[v_u_25].bottom,
        ["easing_style"] = Enum.EasingStyle.Cubic,
        ["easing_direction"] = Enum.EasingDirection.Out,
        ["tween_length"] = 0.6
    },
    ["rotate_ended"] = {
        ["goal_top"] = v24[v_u_25].top,
        ["goal_bottom"] = v24[v_u_25].bottom,
        ["easing_style"] = Enum.EasingStyle.Back,
        ["easing_direction"] = Enum.EasingDirection.Out,
        ["tween_length"] = 0.6
    }
}
local v_u_27 = v21:GetTranslatorForPlayer(game.Players.LocalPlayer)
function v22.get_visibility_changed_signal(p28)
    return p28.visibility_changed_signal
end
function v22.set_mannequin_list(p29, p30, p31)
    for v32, _ in p29.mannequins do
        p29:_remove_mannequin(v32)
    end
    for _, v33 in p30 do
        p29:_add_mannequin(v33)
    end
    if p31 then
        p29.sorted_ids = nil
    else
        p29.sorted_ids = v_u_17.List.map(p30, function(p34)
            return p34.mannequin_id
        end)
    end
    p29.UIManager.set_app_visibility(p29.ClassName, false)
end
function v22._add_mannequin(p35, p36)
    local v37 = p36.mannequin_id
    if not p35.mannequins[v37] then
        local v38 = p35:_get_or_create_viewport_frame(v37)
        p35.virtual_mannequins[v37] = v_u_4.new(v38, p36)
        p35.mannequins[v37] = p36
    end
end
function v22._remove_mannequin(p39, p40)
    if p39.mannequins[p40] then
        local v41 = p39.virtual_mannequins
        if v41 then
            v41 = p39.virtual_mannequins[p40]
        end
        if v41 then
            v41:destroy()
        end
        local v42 = p39.viewport_frames
        if v42 then
            v42 = p39.viewport_frames[p40]
        end
        if v42 then
            v42:Destroy()
            p39.viewport_frames[p40] = nil
        end
        if p39.focused_mannequin_id == p40 then
            p39:_focus_mannequin(nil)
        end
        p39.mannequins[p40] = nil
    end
end
function v22.get_current_mannequin(p43)
    local v44 = p43.focused_mannequin_id
    if v44 then
        return p43.mannequins[v44]
    else
        return nil
    end
end
function v22.sort_by_rotation(p_u_45)
    if not p_u_45.sorted_ids then
        local v46 = v_u_17.Dictionary.keys(p_u_45.mannequins)
        local v_u_47 = workspace.CurrentCamera.CFrame.Position
        table.sort(v46, function(p48, p49)
            local v50 = p_u_45.mannequins[p48]
            local v51 = p_u_45.mannequins[p49]
            local v52 = ((v50.spawn_cframe.Position - v_u_47) * Vector3.new(1, 0, 1)).Unit
            local v53 = ((v51.spawn_cframe.Position - v_u_47) * Vector3.new(1, 0, 1)).Unit
            local v54 = v52 ~= v52 and Vector3.new(1, 0, 0) or v52
            local v55 = v53 ~= v53 and Vector3.new(1, 0, 0) or v53
            local v56 = v54.Z * v55.X - v54.X * v55.Z
            local v57 = v54.X * v55.X + v54.Z * v55.Z
            return math.atan2(v56, v57) < 0
        end)
        p_u_45.sorted_ids = v46
    end
end
function v22._refresh_ui(p58)
    local v59 = p58.focused_mannequin_id
    if v59 ~= nil then
        local v60 = p58.mannequins[v59]
        local v61 = nil
        local v62 = nil
        local v63 = nil
        local v64 = nil
        local v65 = nil
        local v66 = v60:get_content_type()
        local v_u_67 = v60:get_content()
        if v66 == "non_robux_accessory" then
            local v68 = v_u_67.accessory_id
            local v69 = v_u_6.pet_accessories[v68]
            local v70 = v69.rarity
            v61 = v69.name
            v62 = v_u_7[v70].name
            local v71 = "BUY ($%s)"
            local v72 = v69.cost
            local v73 = tostring(v72)
            if v69.currency_id == v_u_13.name then
                if v_u_13.buy_icon then
                    v65 = v_u_13.buy_icon
                    v71 = "BUY (%s"
                else
                    v73 = string.format(v_u_13.interaction_format, v69.cost)
                end
            elseif not v69.cost or v69.currency_id ~= nil and v69.currency_id ~= "money" then
                v73 = "$????"
            end
            v63 = string.format(v71, v73)
            v64 = v_u_7[v70].color
            p58.buy_button:set_state("normal")
        elseif v66 == "developer_product" then
            local v74 = v_u_9[v_u_67.developer_product_kind]
            v61 = v74.name
            v63 = ("%d)"):format(v74.cost)
            v64 = Color3.fromRGB(255, 170, 0)
            p58.buy_button:set_state("normal")
            v62 = "PACK"
        elseif v66 == "mannequin" then
            v61 = v_u_67.outfit_name
            v62 = ("BY %s"):format(v_u_67.owner.Name)
            local v75 = v_u_67.is_owner
            if not v75 then
                local v76 = v_u_15.get("outfits") or {}
                v75 = v_u_17.Dictionary.some(v76, function(p77)
                    return p77.source_outfit_version == v_u_67.outfit_version
                end)
            end
            if v75 then
                p58.buy_button:set_state("normal_blue")
                v63 = "WEAR"
            elseif v_u_67.for_sale then
                v63 = v_u_67.price == 0 and "TAKE (FREE)" or ("BUY ($%s)"):format(v_u_67.price)
                p58.buy_button:set_state("normal")
            else
                p58.buy_button:set_state("disabled")
                v63 = "OFF SALE"
            end
            v64 = v_u_14.lookup_specific_color(v_u_14.get_theme_color(), "saturated")
        elseif v66 == "pet" then
            local v78 = v_u_67.pet_kind
            local v79 = v_u_6.pets[v78]
            local v80 = v79.rarity
            v61 = v79.name
            v62 = v_u_7[v80].name
            v64 = v_u_7[v80].color
            p58.buy_button:set_state("normal")
            v63 = "ADOPT ME!"
        end
        p58.buy_button_face.AltCurrencyPrice.Visible = v65 ~= nil
        local v81 = p58.buy_button_face.BucksPrice
        local v82
        if v65 == nil then
            v82 = (v66 == "non_robux_accessory" or v66 == "mannequin") and true or v66 == "pet"
        else
            v82 = false
        end
        v81.Visible = v82
        p58.buy_button_face.RobuxPrice.Visible = v66 == "developer_product"
        local v83 = v_u_27.LocaleId
        local v84, v85
        if string.sub(v83, 1, 3) == "en-" then
            v84 = v61:upper()
            v85 = v62:upper()
        else
            v84 = v_u_27:Translate(workspace, v61)
            v85 = v_u_27:Translate(workspace, v62)
        end
        p58.name_label.Text = v84
        p58.buy_button_face.BucksPrice.Text = v63
        p58.buy_button_face.AltCurrencyPrice.Icon.ImageLabel.Image = v65 or ""
        p58.buy_button_face.AltCurrencyPrice.Price.Text = v63
        p58.buy_button_face.RobuxPrice.Price.Text = v63
        p58.rarity_label.Text = v85
        for _, v86 in p58.rarity_frame_images do
            v86.ImageColor3 = v64
        end
    end
end
function v22._focus_mannequin(p_u_87, p88)
    local v89 = p_u_87.focused_mannequin_id
    if v89 then
        local v90 = p_u_87.mannequins[v89]
        v90:set_is_shadow(false)
        v90:update_animation_state("stopped")
        v90:update_rotation_state("reset")
        p_u_87.virtual_mannequins[v89]:set_active(false)
        if p_u_87.mannequin_content_changed_conn then
            p_u_87.mannequin_content_changed_conn:Disconnect()
            p_u_87.mannequin_content_changed_conn = nil
        end
    end
    p_u_87.focused_mannequin_id = p88
    if p88 ~= nil then
        local v91 = p_u_87.mannequins[p88]
        v91:set_is_shadow(true)
        v91:update_animation_state("idle")
        v91:reset_rotation_for_focus()
        p_u_87.virtual_mannequins[p88]:set_active(true)
        p_u_87.mannequin_content_changed_conn = v91:bind_to_content_changed(function()
            p_u_87:_refresh_ui()
        end)
        workspace.CurrentCamera.CFrame = p_u_87:_get_desired_camera_cframe() * CFrame.new(0, 0, 1)
        p_u_87:_refresh_ui()
    end
end
function v22._get_desired_camera_cframe(p92)
    local v93 = p92.focused_mannequin_id
    local v94 = p92.mannequins[v93]
    local v95 = workspace.CurrentCamera.ViewportSize
    local v96 = v94:get_camera_rotation()
    local v97 = v94:get_focus_cframe()
    local v98 = v94:get_camera_distance()
    local v99 = v94:get_screen_position(v95)
    return v_u_5.calculate_desired_camera_cframe(v96, v95, 40, v97.p, v99, v98)
end
function v22._step(p100, p101)
    if p100.visible then
        if p100.focused_mannequin_id then
            local v102 = workspace.CurrentCamera
            local v103 = p100:_get_desired_camera_cframe()
            if v103 then
                v102.CFrame = v102.CFrame:lerp(v103, 1 - 0.050000000000000044 ^ (p101 * 1))
            end
        else
            return
        end
    else
        return
    end
end
function v22.enter(p104, p105)
    p104.mannequin_id_to_focus = p105
    p104.UIManager.set_app_visibility(p104.ClassName, true)
end
function v22.show(p106)
    local v107 = v_u_1("CharacterHider")
    p106.rotation_controller:start_input_step_binding(p106.ClassName .. "AvatarRotationController")
    p106.viewport_frame_container.Visible = false
    p106.background_tint.Enabled = true
    v_u_8.disable_controls(p106.ClassName)
    v_u_3:disable(p106.ClassName)
    p106.UIManager.apps.CoreGuiApp:set_coregui_disabled(p106.ClassName, Enum.CoreGuiType.Chat)
    p106.UIManager.apps.CoreGuiApp:set_coregui_disabled(p106.ClassName, "touch_gui")
    p106.instance.Frame.Visible = true
    p106.UIManager.set_app_visibility("BackpackApp", false)
    p106.top_frame.Position = v_u_23[v_u_25].top
    p106.bottom_frame.Position = v_u_23[v_u_25].bottom
    p106.UIManager.apps.TransitionsApp:transition({
        ["length"] = 0.4,
        ["start_transparency"] = 1,
        ["end_transparency"] = 0,
        ["yields"] = true
    })
    p106.UIManager.apps.TransitionsApp:set_blur(p106.ClassName, 12, 0.4)
    local v108 = workspace.CurrentCamera
    v108.CameraType = Enum.CameraType.Scriptable
    v108.FieldOfView = 40
    v107.hide_all_chars()
    p106:_focus_mannequin(p106.mannequin_id_to_focus)
    p106:sort_by_rotation()
    p106.viewport_frame_container.Visible = true
    for _, v109 in p106.virtual_mannequins do
        v109:start_pre_render()
    end
    task.wait(0.4)
    p106:_play_ui_tween("entered")
    for _, v110 in p106.virtual_mannequins do
        v110:stop_pre_render()
    end
    p106.rotation_controller:reset()
    p106.visibility_changed_signal:Fire(true)
    p106.UIManager.apps.TransitionsApp:transition({
        ["length"] = 0.4,
        ["start_transparency"] = 0,
        ["end_transparency"] = 1
    })
end
function v22.hide(p111)
    local v112 = v_u_1("CharacterHider")
    p111.rotation_controller:stop_input_step_binding()
    v_u_8.enable_controls(p111.ClassName)
    v_u_3:enable(p111.ClassName)
    p111.UIManager.apps.CoreGuiApp:reenable_coregui(p111.ClassName, Enum.CoreGuiType.Chat)
    p111.UIManager.apps.CoreGuiApp:reenable_coregui(p111.ClassName, "touch_gui")
    p111.instance.Frame.Visible = false
    p111.UIManager.apps.TransitionsApp:clear_blur(p111.ClassName)
    p111.background_tint.Enabled = false
    p111:_focus_mannequin(nil)
    v112.show_all_chars()
    local v113 = workspace.CurrentCamera
    v113.CameraType = Enum.CameraType.Custom
    v113.FieldOfView = 70
    p111.visibility_changed_signal:Fire(false)
end
function v22.hide_cancel_button(p114)
    p114.bottom_frame.CancelButton.Visible = false
end
function v22.show_cancel_button(p115)
    p115.bottom_frame.CancelButton.Visible = true
end
function v22._go_to_next_mannequin(p116)
    local v117 = v_u_17.List.find(p116.sorted_ids, p116.focused_mannequin_id)
    p116:_focus_mannequin(p116.sorted_ids[v117 % #p116.sorted_ids + 1])
end
function v22._go_to_previous_mannequin(p118)
    local v119 = v_u_17.List.find(p118.sorted_ids, p118.focused_mannequin_id)
    p118:_focus_mannequin(p118.sorted_ids[(v119 - 2) % #p118.sorted_ids + 1])
end
function v22._buy_focused_mannequin(p_u_120)
    local v121 = p_u_120.focused_mannequin_id
    if v121 == nil then
        return
    else
        local v122 = p_u_120.mannequins[v121]
        if not v122.is_buying then
            v122.is_buying = true
            v122:buy(function()
                p_u_120:_refresh_ui()
            end)
            v122.is_buying = false
        end
    end
end
function v22._play_ui_tween(p123, p124)
    local v125 = v_u_26[p124]
    local v126 = v125.goal_top
    local v127 = v125.goal_bottom
    local v128 = v125.easing_style
    local v129 = v125.easing_direction
    local v130 = v125.tween_length
    v_u_20:Create(p123.bottom_frame, TweenInfo.new(v130, v128, v129), {
        ["Position"] = v127
    }):Play()
    v_u_20:Create(p123.top_frame, TweenInfo.new(v130, v128, v129), {
        ["Position"] = v126
    }):Play()
end
function v22._on_rotate_began(p131)
    p131:_play_ui_tween("rotate_began")
end
function v22._on_rotate_ended(p132)
    p132:_play_ui_tween("rotate_ended")
end
function v22._get_or_create_viewport_frame(p133, p134)
    local v135 = p133.viewport_frames[p134]
    if v135 == nil then
        v135 = p133.viewport_frame_template:Clone()
        v135.Parent = p133.viewport_frame_container
        v135.CurrentCamera = workspace.CurrentCamera
        p133.viewport_frames[p134] = v135
    end
    return v135
end
function v22.start(p_u_136)
    p_u_136.focused_mannequin_id = nil
    p_u_136.mannequins = {}
    p_u_136.virtual_mannequins = {}
    p_u_136.sorted_ids = nil
    p_u_136.visibility_changed_signal = v_u_16.new()
    p_u_136.rotate_area = p_u_136.instance.Frame.RotateArea
    p_u_136.viewport_frame_container = p_u_136.instance.Frame.ViewportFrameContainer
    local v137 = p_u_136.viewport_frame_container.ViewportFrameTemplate
    p_u_136.viewport_frame_template = v137
    v137.Parent = nil
    p_u_136.viewport_frames = {}
    local v138 = Instance.new("ColorCorrectionEffect")
    v138.Brightness = 0.07
    v138.Contrast = -0.1
    v138.Saturation = -0.2
    v138.Enabled = false
    v138.Parent = game.Lighting
    p_u_136.background_tint = v138
    local v139 = p_u_136.instance.Frame.Foreground.Bottom
    local v140 = p_u_136.instance.Frame.Foreground.Top
    p_u_136.bottom_frame = v139
    p_u_136.top_frame = v140
    p_u_136.name_label = v140.NameTag.TextLabel
    p_u_136.rarity_label = v140.RarityTag.TextLabel
    p_u_136.buy_button_face = v139.BuyButton.Face
    p_u_136.rarity_frame_images = { v140.RarityTag.ContentsCenter, v140.RarityTag.ContentsCenter.ContentsLeftTear, v140.RarityTag.ContentsCenter.ContentsRightTear }
    p_u_136.UIManager.wrap(v139.CancelButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_136.UIManager.set_app_visibility(p_u_136.ClassName, false)
        end
    })
    p_u_136.UIManager.wrap(v139.LeftArrow, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_136:_go_to_previous_mannequin()
        end
    })
    p_u_136.UIManager.wrap(v139.RightArrow, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_136:_go_to_next_mannequin()
        end
    })
    p_u_136.buy_button = p_u_136.UIManager.wrap(v139.BuyButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_136:_buy_focused_mannequin()
        end
    })
    local v141 = v_u_12.new(p_u_136.ClassName)
    v141:bind_to_rotated(function(p142, p143)
        local v144 = p_u_136.focused_mannequin_id
        if v144 ~= nil then
            local v145 = p_u_136.mannequins[v144]
            v145:update_rotation_state("paused")
            local v146 = nil
            if p142 == "drag" then
                v146 = p143 * 1
            elseif p142 == "thumbstick" then
                v146 = p143 * 0.5
            end
            v145:adjust_rotation(v146)
        end
    end)
    v141:bind_to_on_rotating_changed(function(p147)
        if p147 then
            p_u_136:_on_rotate_began()
        else
            p_u_136:_on_rotate_ended()
        end
    end)
    v141:set_can_start_rotation_callback(function(p148, p149)
        if p_u_136.focused_mannequin_id == nil then
            return false
        end
        if p149.game_processed_event then
            return false
        end
        if p148 ~= "drag" then
            return true
        end
        local v150 = p149.position
        local v151 = p_u_136.rotate_area
        local v152 = v151.AbsolutePosition
        local v153 = v151.AbsolutePosition + v151.AbsoluteSize
        local v154
        if v150.X >= v152.X and (v150.X <= v153.X and v150.Y >= v152.Y) then
            v154 = v150.Y <= v153.Y
        else
            v154 = false
        end
        return v154
    end)
    p_u_136.rotation_controller = v141
    v_u_18.newConnect(v_u_19.Heartbeat, function(p155)
        p_u_136:_step(p155)
    end):WithProperty(p_u_136.instance.Frame, "Visible")
    v_u_10.quick_watch({
        ["selection_parent"] = p_u_136.instance.Frame,
        ["default_selection"] = v139.BuyButton,
        ["app_name"] = p_u_136.ClassName
    })
    if v_u_25 == "small" then
        p_u_136.bottom_frame.UIListLayout.Padding = UDim.new(0, 5)
        p_u_136.bottom_frame.BuyButton.Size = UDim2.fromOffset(185, 42)
        p_u_136.bottom_frame.CancelButton.Size = UDim2.fromOffset(185, 42)
        p_u_136.bottom_frame.BuyButton.Face.RobuxPrice.Icon.Size = UDim2.new(0, 20, 0, 20)
        p_u_136.bottom_frame.BuyButton.Face.RobuxPrice.Icon.ImageLabel.Image = "rbxassetid://9113240025"
        p_u_136.bottom_frame.LeftArrow.Size = UDim2.fromOffset(42, 42)
        p_u_136.bottom_frame.RightArrow.Size = UDim2.fromOffset(42, 42)
        p_u_136.bottom_frame.LeftArrow.Face.ArrowIcon.Size = UDim2.fromOffset(17, 23)
        p_u_136.bottom_frame.LeftArrow.Face.ArrowIcon.Image = "rbxassetid://4855615438"
        p_u_136.bottom_frame.RightArrow.Face.ArrowIcon.Size = UDim2.fromOffset(17, 23)
        p_u_136.bottom_frame.RightArrow.Face.ArrowIcon.Image = "rbxassetid://4855615438"
        p_u_136.bottom_frame.RightArrow.Face.ArrowIcon.ImageRectOffset = Vector2.new(17, 0)
        p_u_136.bottom_frame.RightArrow.Face.ArrowIcon.ImageRectSize = Vector2.new(-17, 23)
        p_u_136.top_frame.Size = UDim2.new(0, 250, 0, 64)
        local v156 = p_u_136.top_frame.NameTag
        v156.Image = "rbxassetid://4855615635"
        v156.SliceCenter = Rect.new(1, 10, 11, 54)
        v156.LeftTear.Size = UDim2.new(0, 20, 1, 0)
        v156.LeftTear.Image = "rbxassetid://4855615572"
        v156.RightTear.Size = UDim2.new(0, 20, 1, 0)
        v156.RightTear.Image = "rbxassetid://4855615499"
        local v157 = p_u_136.top_frame.RarityTag
        v157.Position = UDim2.new(1, -20, 1, -16)
        v157.Size = UDim2.new(0, 150, 0, 38)
        v157.TextLabel.Size = UDim2.new(1, 0, 1, -20)
        local v158 = v157.ContentsCenter
        v158.Size = UDim2.new(1, 0, 0, 38)
        v158.Image = "rbxassetid://4855615362"
        v158.ContentsLeftTear.Size = UDim2.fromOffset(13, 37)
        v158.ContentsLeftTear.Image = "rbxassetid://4855615295"
        v158.ContentsRightTear.Size = UDim2.fromOffset(20, 37)
        v158.ContentsRightTear.Image = "rbxassetid://4855615227"
        local v159 = v157.StrokeCenter
        v159.Position = UDim2.new(0, -2, 0.5, 0)
        v159.Size = UDim2.new(1, 10, 0, 34)
        v159.Image = "rbxassetid://4855615175"
        v159.StrokeLeftTear.Size = UDim2.fromOffset(12, 34)
        v159.StrokeLeftTear.Image = "rbxassetid://4855615104"
        v159.StrokeRightTear.Size = UDim2.fromOffset(9, 34)
        v159.StrokeRightTear.Image = "rbxassetid://4855615026"
    end
end
return v22