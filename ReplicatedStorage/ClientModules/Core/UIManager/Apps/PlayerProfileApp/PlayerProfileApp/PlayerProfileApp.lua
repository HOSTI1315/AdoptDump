--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfileApp (ModuleScript)

local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("RunService")
local v5 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_6 = v5("Maid")
local v7 = v5("Class")
local v_u_8 = v5("PlatformM")
local v_u_9 = v5("ClientData")
local v_u_10 = v5("XboxSupport")
local v_u_11 = v5("RouterClient")
local v_u_12 = v5("TweenPromise")
local v_u_13 = v5("PlayerProfile")
local v_u_14 = v5("TradeExcluder")
local v15 = v5("SharedConstants")
local v_u_16 = v5("ColorThemeManager")
local v_u_17 = v5("PlayerProfileHelper")
local v_u_18 = v5("PlayerProfileTelemetry")
local v_u_19 = v5("PlayerProfileWidgetsDB")
local v_u_20 = v5("new:ToggleableSignal")
local v_u_21 = v5("package:Sift")
local v_u_22 = v5("package:Promise")
local v_u_23 = v_u_8.get_platform() == "phone"
local v_u_24 = game.Players.LocalPlayer
local v_u_25 = v15.player_profiles
local v_u_26 = v_u_25.disable_stickers ~= true
local v_u_27 = v_u_25.widgets_per_page
local v_u_28 = v_u_25.max_pages
local v_u_29 = {
    ["DEFAULT"] = 50,
    ["HOVER"] = 55,
    ["CLICKED"] = 60,
    ["CLOSED"] = 0
}
local v_u_30 = UDim2.fromOffset(283, 130)
local v_u_31 = {
    ["DEFAULT"] = {
        ["length"] = 418,
        ["name_length"] = 356
    },
    ["CONDENSED"] = {
        ["length"] = 242,
        ["name_length"] = 184
    },
    ["TRADE_VISIBLE"] = {
        ["length"] = 310,
        ["name_length"] = 242
    },
    ["EDIT_VISIBLE"] = {
        ["length"] = 372,
        ["name_length"] = 314
    }
}
local v_u_32 = nil
local v_u_33 = {}
local v_u_34 = {}
local v35 = v7("PlayerProfileApp", v5("UIBaseApp"))
function v35.set_gamepad_selection(p36, p37, p38)
    if p37 == nil or not v_u_8.is_using_gamepad() then
        return false
    end
    if p38 ~= nil and v_u_3.SelectedObject ~= p38 then
        return false
    end
    if not (p37.Visible and p37.Selectable) then
        return false
    end
    p36.watch:select_object(p37)
    return true
end
function v35.show(p39)
    p39.instance.Enabled = true
    if not p39.player_profile then
        p39:open_player_profile_for_user_id(p39._cached_user_id or v_u_24.UserId)
    end
    local v40 = v_u_3
    local v41 = p39.main_selection_group
    v40:AddSelectionTuple("PlayerProfile", unpack(v41))
    p39:_enable_gamepad_page_turn(true)
end
function v35.hide(p42)
    p42.slot_selection_maid:DoCleaning()
    p42.instance.Enabled = false
    p42.loading_spinner:hide()
    p42:close_profile()
end
function v35.refresh(p43, p44)
    local v45 = p43.UIManager.is_closed({ "MinigameInGameApp" })
    if not p44[p43.ClassName] then
        v45 = false
    end
    if p43.UIManager.apps.HideGuiApp:should_hide_app(p43.ClassName) then
        v45 = false
    end
    p43:set_visibility(v45)
end
local function v_u_49()
    local v46 = {}
    for v47, v48 in v_u_19 do
        v46[v47] = {
            ["text"] = v48.display_name,
            ["layout_order"] = v48.layout_order
        }
    end
    return v46
end
local function v_u_57(p50, p_u_51, p52, p53)
    if p_u_51.Visible ~= false then
        local v54 = v_u_33[p_u_51]
        if v54 then
            if p50 < v54.priority then
                return
            end
            v54.tween:cancel()
            v_u_33[p_u_51] = nil
        end
        local v55 = p53 or TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        local v56 = v_u_12.new(p_u_51, v55, {
            ["Size"] = UDim2.fromOffset(p52, p_u_51.Size.Y.Offset)
        }):finally(function()
            v_u_33[p_u_51] = nil
        end)
        v_u_33[p_u_51] = {
            ["priority"] = p50,
            ["tween"] = v56
        }
        return v56
    end
end
function v35._get_first_non_collapsed_slot(p58)
    for v59 = 1, v_u_27 do
        if not p58.collapsed_slots[v59] then
            local v60 = p58.slots[v59].instance
            if v60.Selectable and v60.Visible then
                return v60
            end
        end
    end
    return p58.header.Close
end
function v35._enable_gamepad_page_turn(p_u_61, p62)
    if p62 then
        game:GetService("ContextActionService"):BindActionAtPriority("left_profile_page_turn", function(_, p63)
            if p63 == Enum.UserInputState.Begin then
                local v64 = p_u_61:get_previous_page()
                if p_u_61.page == v64 then
                    return
                end
                p_u_61:open_page(v64)
            end
            return Enum.ContextActionResult.Sink
        end, false, 6000, Enum.KeyCode.ButtonL1)
        game:GetService("ContextActionService"):BindActionAtPriority("right_profile_page_turn", function(_, p65)
            if p65 == Enum.UserInputState.Begin then
                local v66 = p_u_61:get_next_page()
                if p_u_61.page == v66 then
                    return
                end
                p_u_61:open_page(v66)
            end
            return Enum.ContextActionResult.Sink
        end, false, 6000, Enum.KeyCode.ButtonR1)
    else
        game:GetService("ContextActionService"):UnbindAction("left_profile_page_turn")
        game:GetService("ContextActionService"):UnbindAction("right_profile_page_turn")
    end
end
function v35._refresh_expand_buttons(p67)
    p67:_for_each_slot(function(p68)
        if p68.widget and p68.widget.entry.expandable then
            p68.widget:render_expand_buttons()
        end
    end)
end
function v35._for_each_slot(p69, p70)
    for v71, v72 in p69.slots do
        p70(v72, v71)
    end
end
function v35._initialize_app_buttons(p_u_73)
    p_u_73.exit_button = p_u_73.UIManager.wrap(p_u_73.header.Close, "DepthButton")
    p_u_73.exit_button:set_state("cancel")
    p_u_73.exit_button:start({
        ["mouse_button1_click"] = function()
            p_u_73.UIManager.set_app_visibility(p_u_73.ClassName, false)
        end
    })
    p_u_73.report_button = p_u_73.UIManager.wrap(p_u_73.header.Report, "DepthButton")
    p_u_73.report_button:set_state("cancel")
    local v79 = {
        ["mouse_button1_click"] = function()
            local v74 = p_u_73.page
            local v75 = p_u_73.player_profile.user_id
            local v76, v77, v78 = p_u_73.UIManager.apps.DialogApp:dialog({
                ["dialog_type"] = "ReportScamDialog",
                ["header_format_text"] = "Reporting %s\'s Profile:",
                ["dropdown_text"] = "Choose Report Type",
                ["report_reasons_human_readable"] = v_u_25.report_reasons_human_readable,
                ["report_reasons"] = v_u_25.report_reasons,
                ["suspect_name"] = p_u_73.player_profile.username,
                ["placeholder_text"] = "What happened? (Optional)",
                ["max_length"] = 500,
                ["use_utf8_length"] = true,
                ["left"] = "Cancel",
                ["right"] = "Report"
            })
            if v76 == "Report" then
                v_u_11.get("PlayerProfileAPI/ReportProfile"):FireServer(v75, v77, v78, v74)
                p_u_73.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Thanks for your report!",
                    ["button"] = "Close",
                    ["yields"] = false
                })
                p_u_73.report_button.instance.Visible = false
                v_u_34[v75] = true
            end
        end
    }
    p_u_73.report_button:start(v79)
    p_u_73.edit_profile_button = p_u_73.UIManager.wrap(p_u_73.header.EditProfileButton, "DepthButton")
    p_u_73.edit_profile_button:set_state("selected")
    local v80 = {
        ["mouse_button1_click"] = function()
            if p_u_73.player == v_u_24 then
                if v_u_32 == "stickers" then
                    p_u_73:enable_sticker_editing(true)
                else
                    p_u_73:enable_profile_editing(true)
                end
                p_u_73:set_gamepad_selection(p_u_73.header.EditButtons.PreviewButton)
            end
        end
    }
    p_u_73.edit_profile_button:start(v80)
    p_u_73.trade_button = p_u_73.UIManager.wrap(p_u_73.header.TradeButton, "DepthButton")
    local v82 = {
        ["mouse_button1_click"] = function()
            local v81 = p_u_73.player
            if v81 and v81 ~= v_u_24 then
                if v_u_9.get_server(v81, "in_active_trade") then
                    v_u_11.get("TradeAPI/SpectateTrade"):FireServer(true, v81)
                    return
                elseif not p_u_73.UIManager.apps.TradeApp:check_and_warn_if_trading_restricted() then
                    p_u_73.UIManager.apps.TradeApp:show_scam_warning()
                    v_u_14.include_player(v81)
                    v_u_11.get("TradeAPI/SendTradeRequest"):FireServer(v81)
                    v_u_18.trade_initiated(v81.UserId)
                end
            else
                return
            end
        end
    }
    p_u_73.trade_button:start(v82)
    p_u_73.preview_button = p_u_73.UIManager.wrap(p_u_73.header.EditButtons.PreviewButton, "DepthButton")
    local v83 = {
        ["mouse_button1_click"] = function()
            if p_u_73.is_editing_stickers then
                v_u_32 = "stickers"
            else
                v_u_32 = nil
            end
            p_u_73:enable_profile_editing(false)
            p_u_73:set_gamepad_selection(p_u_73.header.EditProfileButton)
        end
    }
    p_u_73.preview_button:start(v83)
    p_u_73.sticker_button = p_u_73.UIManager.wrap(p_u_73.header.EditButtons.StickerButton, "DepthButton")
    p_u_73.sticker_button:start({
        ["mouse_button1_click"] = function()
            p_u_73:enable_sticker_editing(not p_u_73.is_editing_stickers)
        end
    })
    if not v_u_26 then
        p_u_73.header.EditButtons.StickerButton.Visible = false
        p_u_73.header.EditButtons.PreviewButton.Position = UDim2.fromScale(0.5, 0.5)
        p_u_73.header.EditButtons.PreviewButton.AnchorPoint = Vector2.new(0.5, 0.5)
    end
    local v84 = v_u_23 or v_u_8.get_platform() == "tablet"
    p_u_73.page_left = p_u_73.UIManager.wrap(p_u_73.header.PageButtons.PageLeft, p_u_73.use_condensed_ui and "DepthButton" or "CustomButton")
    local v86 = {
        ["mouse_button1_click"] = function()
            local v85 = p_u_73:get_previous_page()
            if p_u_73.page ~= v85 then
                p_u_73:open_page(v85)
            end
        end,
        ["hover_render"] = not v84 and function()
            v_u_57(1, p_u_73.page_left.instance, v_u_29.HOVER)
        end or nil,
        ["up_render"] = not v84 and function()
            v_u_57(1, p_u_73.page_left.instance, v_u_29.DEFAULT)
        end or nil
    }
    p_u_73.page_left:start(v86)
    p_u_73.page_right = p_u_73.UIManager.wrap(p_u_73.header.PageButtons.PageRight, p_u_73.use_condensed_ui and "DepthButton" or "CustomButton")
    local v88 = {
        ["mouse_button1_click"] = function()
            local v87 = p_u_73:get_next_page()
            if p_u_73.page ~= v87 then
                p_u_73:open_page(v87)
            end
        end,
        ["hover_render"] = not v84 and function()
            v_u_57(1, p_u_73.page_right.instance, v_u_29.HOVER)
        end or nil,
        ["up_render"] = not v84 and function()
            v_u_57(1, p_u_73.page_right.instance, v_u_29.DEFAULT)
        end or nil
    }
    p_u_73.page_right:start(v88)
end
function v35._initialize_slots(p_u_89)
    local v90 = p_u_89.templates.EditHeader
    local v91 = p_u_89.templates.Empty
    local v92 = p_u_89.templates.MoveHere
    local v93 = {}
    local v_u_94 = false
    for v_u_95 = 1, v_u_27 do
        local v_u_96 = p_u_89.body:FindFirstChild("Widget" .. v_u_95)
        local function v_u_102(p97, p98)
            if p_u_89.is_editing_profile and p_u_89.moving_widget then
                local v99 = p97 or p_u_89.moving_widget.page
                local v100 = p98 or p_u_89.moving_widget.slot
                v_u_18.log_widget_edited(p_u_89.moving_widget, "moved", {
                    ["moved_to_page"] = p_u_89.page,
                    ["moved_to_slot"] = v_u_95
                })
                local v101 = p_u_89:get_widget(v_u_95)
                if v101 then
                    v_u_18.log_widget_edited(v101, "moved", {
                        ["moved_to_page"] = p_u_89.moving_widget.page,
                        ["moved_to_slot"] = p_u_89.moving_widget.slot
                    })
                end
                p_u_89.player_profile:swap_slots(v99, v100, p_u_89.page, v_u_95)
                p_u_89:_set_moving_widget(nil)
            end
        end
        local v_u_103 = v92:Clone()
        v_u_103.Visible = false
        v_u_103.Parent = v_u_96
        v_u_103:SetAttribute("SlotIndex", v_u_95)
        p_u_89:mark_priority_ui(v_u_103)
        local v_u_104 = p_u_89.UIManager.wrap(v_u_103.MoveButton, "IconButton"):start({
            ["mouse_button1_click"] = function()
                v_u_102(nil, nil)
            end
        })
        v_u_103.Background.MouseButton1Click:Connect(function()
            v_u_102(nil, nil)
        end)
        if v_u_8.get_platform() == "desktop" then
            v_u_103.Background.ImageTransparency = 0.5
            v_u_103.Background.MouseEnter:Connect(function()
                v_u_103.Background.ImageTransparency = 0.15
            end)
            v_u_103.Background.MouseLeave:Connect(function()
                v_u_103.Background.ImageTransparency = 0.5
            end)
        end
        local v_u_105 = v90:Clone()
        v_u_105.Visible = false
        v_u_105.Parent = v_u_96
        p_u_89:mark_priority_ui(v_u_105)
        local v108 = {
            ["mouse_button1_click"] = function()
                local v106 = p_u_89:get_widget(v_u_95)
                if v106 then
                    local v107 = p_u_89.UIManager.apps.ColorPickerApp:pick_color({
                        ["request_source"] = p_u_89.ClassName .. "/" .. v106.entry.template_name,
                        ["starter_color"] = v106.color
                    })
                    if v107 then
                        v106.color = v107
                        v106:recolor(v107)
                        v106:save()
                        v_u_18.log_widget_edited(v106, "recolored", {
                            ["color"] = v107
                        })
                    end
                end
            end
        }
        p_u_89.UIManager.wrap(v_u_105.Recolor, "IconButton"):start(v108)
        p_u_89.UIManager.wrap(v_u_105.Configure, "IconButton"):start({
            ["mouse_button1_click"] = function()
                p_u_89:edit_widget(v_u_95, true)
                p_u_89:set_gamepad_selection(v_u_105.Accept)
            end
        })
        p_u_89.UIManager.wrap(v_u_105.Accept, "IconButton"):start({
            ["mouse_button1_click"] = function()
                p_u_89:edit_widget(v_u_95, false)
                p_u_89.slot_selection_maid:DoCleaning()
            end
        })
        local v111 = {
            ["mouse_button1_click"] = function()
                local v109 = p_u_89:get_widget(v_u_95)
                if not v_u_94 and v109 then
                    v_u_94 = true
                    local v110 = p_u_89.UIManager.apps.DialogApp:dialog({
                        ["text"] = ("Delete widget: %*?"):format(v109.entry.display_name),
                        ["left"] = "No",
                        ["right"] = "Yes",
                        ["accept_delay"] = 1,
                        ["accept_delay_tick_interval"] = 0.5
                    })
                    v_u_94 = false
                    if v110 == "Yes" then
                        p_u_89.player_profile:remove_widget(p_u_89.page, v_u_95)
                        p_u_89.slot_selection_maid:DoCleaning()
                        v_u_18.log_widget_edited(v109, "removed")
                    end
                end
            end
        }
        p_u_89.UIManager.wrap(v_u_105.Delete, "IconButton"):start(v111)
        p_u_89.UIManager.wrap(v_u_105.Move, "IconButton"):start({})
        local v_u_112 = nil
        local v_u_113 = nil
        local v114 = p_u_89.UIManager.wrap(v_u_105.Move, "UIDragger"):start()
        local v_u_115 = nil
        v114.drag_started:Connect(function()
            if p_u_89.editing_slot then
                p_u_89:edit_widget(p_u_89.editing_slot, false)
            end
            v_u_115 = v_u_1:GetMouseLocation()
        end)
        v114.drag_changed:Connect(function()
            if v_u_112 or (v_u_115 - v_u_1:GetMouseLocation()).Magnitude < 25 then
                return
            else
                v_u_115 = nil
                p_u_89:_set_moving_widget(v_u_95)
                local v116 = p_u_89.slots[v_u_95].widget
                if v116 then
                    v_u_112 = p_u_89.templates.DragWidgetHolder:Clone()
                    if v116.expanded then
                        v_u_112.Size = UDim2.fromOffset(v_u_30.X.Offset * 2, v_u_30.Y.Offset)
                    end
                    p_u_89.instance.Frame.UIScale:Clone().Parent = v_u_112
                    v116.instance:Clone().Parent = v_u_112
                    local v117 = v116.instance.AbsolutePosition
                    v_u_112.GroupTransparency = 0.4
                    v_u_112.Position = UDim2.fromOffset(v117.X, v117.Y)
                    v_u_112.Parent = p_u_89.instance
                    local v118 = v116.instance.AbsolutePosition - v_u_105.Move.AbsolutePosition - v_u_105.Move.AbsoluteSize / 2
                    local v_u_119 = UDim2.fromOffset(v118.X, v118.Y)
                    v_u_113 = v_u_4.RenderStepped:Connect(function()
                        local v120 = v_u_1:GetMouseLocation()
                        local v121 = UDim2.fromOffset(v120.X, v120.Y) + v_u_119
                        v_u_112.Position = v_u_112.Position:Lerp(v121, 0.28)
                    end)
                end
            end
        end)
        v114.drag_ended:Connect(function()
            if not v_u_112 then
                if p_u_89.moving_widget and (p_u_89.moving_widget.slot == v_u_95 and p_u_89.page == p_u_89.moving_widget.page) then
                    p_u_89:_set_moving_widget(nil)
                else
                    p_u_89:_set_moving_widget(v_u_95)
                end
            end
            if v_u_113 then
                v_u_113:Disconnect()
                v_u_113 = nil
            end
            local v122 = v_u_1:GetMouseLocation()
            for _, v123 in v_u_24.PlayerGui:GetGuiObjectsAtPosition(v122.X, v122.Y) do
                if v123:IsA("GuiObject") and (v123.Name == "Background" and v123.Parent.Name == "MoveHere") then
                    local v124 = v123.Parent:GetAttribute("SlotIndex")
                    if v124 then
                        v_u_102(p_u_89.page, v124)
                    end
                    break
                end
            end
            v_u_112:Destroy()
            v_u_112 = nil
            p_u_89:_set_moving_widget(nil)
        end)
        local v125 = {
            ["mouse_button1_click"] = function()
                if v_u_8.is_using_gamepad() then
                    p_u_89:_set_moving_widget(v_u_95)
                    p_u_89.slot_selection_maid:DoCleaning()
                end
            end
        }
        p_u_89.UIManager.wrap(v_u_105.Move, "CustomButton"):start(v125)
        local v_u_126 = v91:Clone()
        v_u_126.Visible = false
        v_u_126.Parent = v_u_96
        local v_u_127 = v_u_49()
        local function v_u_130()
            if p_u_89.is_editing_profile then
                local v128 = {
                    ["dialog_type"] = "ScrollingButtonsDialog",
                    ["header"] = "ADD CATEGORY",
                    ["buttons"] = v_u_127,
                    ["cancelable"] = true,
                    ["cells_per_row"] = 2,
                    ["padding"] = 10
                }
                local v129 = p_u_89.UIManager.apps.DialogApp:dialog(v128)
                if v129 and v129 ~= "cancel" then
                    if p_u_89.is_editing_profile and p_u_89.UIManager.is_visible(p_u_89.ClassName) then
                        if p_u_89.player == v_u_24 and p_u_89.player ~= nil then
                            p_u_89.player_profile:update_slot_data({
                                ["widget_kind"] = v129
                            }, p_u_89.page, v_u_95)
                            p_u_89.player_profile:render_slot(p_u_89.page, v_u_95)
                            v_u_18.log_widget_edited(p_u_89:get_widget(v_u_95), "added")
                            p_u_89:edit_widget(v_u_95, true)
                            p_u_89:set_gamepad_selection(v_u_96)
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        end
        local v_u_131 = p_u_89.UIManager.wrap(v_u_126.AddButton, "IconButton"):start({
            ["mouse_button1_click"] = v_u_130
        })
        p_u_89:mark_priority_ui(v_u_126.AddButton)
        if v_u_8.get_platform() == "desktop" then
            v_u_126.Background.ImageTransparency = 0.25
            v_u_126.Background.MouseEnter:Connect(function()
                v_u_126.Background.ImageTransparency = 0
            end)
            v_u_126.Background.MouseLeave:Connect(function()
                v_u_126.Background.ImageTransparency = 0.25
            end)
        end
        local function v_u_134()
            if v_u_8.is_using_gamepad() then
                local v132 = p_u_89.slots[v_u_95].widget
                if p_u_89.is_editing_profile and p_u_89.moving_widget then
                    if p_u_89.moving_widget.slot == v_u_95 and p_u_89.page == p_u_89.moving_widget.page then
                        p_u_89:_set_moving_widget(nil)
                    else
                        v_u_104:down()
                        v_u_102(nil, nil)
                        task.wait(0.07)
                        v_u_104:up()
                    end
                elseif v132 then
                    local v133
                    if p_u_89.is_editing_profile then
                        if v_u_105.Accept.Visible then
                            v133 = v_u_105.Accept
                        else
                            v133 = v_u_105.Configure
                        end
                    else
                        v133 = v132:select()
                    end
                    if v133 then
                        p_u_89.slot_selection_maid:DoCleaning()
                        p_u_89:set_gamepad_selection(v133)
                        p_u_89.selected_slot = v_u_95
                        p_u_89.slot_selection_maid:GiveTask(function()
                            p_u_89.selected_slot = nil
                            if not p_u_89.collapsed_slots[v_u_95] then
                                p_u_89:set_gamepad_selection(v_u_96)
                            end
                            if p_u_89.editing_slot == v_u_95 then
                                p_u_89:edit_widget(v_u_95, false)
                            end
                        end)
                    end
                elseif p_u_89.is_editing_profile and p_u_89.slots[v_u_95].widget == nil then
                    v_u_131:down()
                    v_u_130()
                    task.wait(0.07)
                    v_u_131:up()
                end
            else
                return
            end
        end
        v_u_96.InputBegan:Connect(function(p135)
            if p135.UserInputType == Enum.UserInputType.Gamepad1 and p135.KeyCode == Enum.KeyCode.ButtonA then
                v_u_134()
            end
        end)
        if v_u_95 == 1 or v_u_95 == 3 then
            v_u_96.NextSelectionLeft = p_u_89.page_left.instance
        else
            v_u_96.NextSelectionRight = p_u_89.page_right.instance
        end
        v93[v_u_95] = {
            ["index"] = v_u_95,
            ["instance"] = v_u_96,
            ["icons"] = v_u_105,
            ["add_widget"] = v_u_126,
            ["move_widget"] = v_u_103,
            ["select"] = v_u_134,
            ["widget"] = nil
        }
    end
    return v93
end
function v35._set_slot_configurable(p136, p137, p138)
    local v139 = p136.slots[p137]
    if v139 then
        local v140 = p136:get_widget(p137) ~= nil
        if p136.collapsed_slots[p137] then
            v139.instance.Visible = false
        else
            local v141 = v139.instance
            local v142 = not v140 and p136.is_editing_profile
            if v142 then
                v142 = not p136.is_editing_stickers
            end
            v141.Visible = v142
        end
        if p136.collapsed_slots[p137] then
            v139.icons.Visible = false
            v139.add_widget.Visible = false
            v139.move_widget.Visible = false
            p136:edit_widget(p137, false)
        elseif p138 and v140 then
            v139.icons.Visible = true
            v139.add_widget.Visible = false
            v139.move_widget.Visible = false
        else
            v139.icons.Visible = false
            local v143 = v139.add_widget
            local v144
            if p136.is_editing_profile and not p136.is_editing_stickers then
                v144 = not v140
            else
                v144 = false
            end
            v143.Visible = v144
            v139.move_widget.Visible = false
            p136:edit_widget(p137, false)
        end
        local v145 = p136:get_priority_ui_from_target(v139.add_widget.AddButton)
        if v145 then
            v145.Visible = v139.add_widget.Visible
        end
    end
end
function v35._set_moving_widget(p_u_146, p_u_147, p148, p149)
    if p_u_147 == nil or not p_u_146.is_editing_profile then
        if p_u_146.moving_widget then
            p_u_146.moving_widget = nil
            p_u_146:enable_profile_editing(p_u_146.is_editing_profile)
        end
    else
        local v_u_150 = p148 or p_u_146.page
        local v151
        if p_u_147 > 0 then
            v151 = p_u_147 <= v_u_27
        else
            v151 = false
        end
        assert(v151, "Invalid widget slot index")
        local v152
        if v_u_150 > 0 then
            v152 = v_u_150 <= v_u_28
        else
            v152 = false
        end
        assert(v152, "Invalid widget page index")
        p_u_146:edit_widget(p_u_146.editing_slot, false)
        if p149 then
            p149 = p149.kind
        end
        if not p149 and v_u_150 == p_u_146.page then
            p149 = p_u_146:get_widget(p_u_147)
            if p149 then
                p149 = p149.entry.kind
            end
        end
        p_u_146.moving_widget = {
            ["kind"] = p149,
            ["page"] = v_u_150,
            ["slot"] = p_u_147
        }
        p_u_146:_for_each_slot(function(p153, p154)
            local v155
            if p_u_147 == p154 then
                v155 = v_u_150 == p_u_146.page
            else
                v155 = false
            end
            p153.add_widget.Visible = false
            local v156 = p153.move_widget
            local v157
            if p_u_146.collapsed_slots[p154] == nil then
                v157 = not v155
            else
                v157 = false
            end
            v156.Visible = v157
            p153.icons.Visible = v155
            local v158 = p_u_146:get_priority_ui_from_target(p153.add_widget.AddButton)
            if v158 then
                v158.Visible = false
            end
        end)
    end
end
function v35.edit_widget(p_u_159, p160, p161)
    if p160 == nil then
        return
    else
        local v162
        if p160 > 0 then
            v162 = p160 <= v_u_27
        else
            v162 = false
        end
        assert(v162, "Invalid widget slot index")
        local v163 = p161 == nil and true or p161
        if v163 ~= (p160 == p_u_159.editing_slot) then
            p_u_159:_set_moving_widget(nil)
        end
        local v164 = p_u_159.slots[p160].icons
        if v164 then
            local v165 = p_u_159:get_widget(p160)
            v164.Accept.Visible = v163
            v164.Delete.Visible = v163
            v164.Configure.Visible = not v163
            local v166 = v164.Recolor
            local v167
            if v163 then
                local v168
                if v165 then
                    v168 = v165.entry.colorable
                else
                    v168 = v165
                end
                v167 = v168 == true
            else
                v167 = v163
            end
            v166.Visible = v167
            v164.Move.Visible = not v163
            if p_u_159.update_selection_group_signal then
                p_u_159.update_selection_group_signal:Disconnect()
            end
            if v163 then
                p_u_159:edit_widget(p_u_159.editing_slot, false)
                if v165 then
                    p_u_159.editing_slot = p160
                    v165:set_editing(true)
                    local v_u_169 = {}
                    local function v_u_173(p170)
                        if p_u_159.priority_ui_targets[p170] then
                            p170 = p_u_159.priority_ui_targets[p170]
                            for _, v171 in p170:GetDescendants() do
                                v_u_173(v171)
                            end
                        end
                        if p170 ~= nil then
                            if p170:IsA("GuiObject") then
                                local v172 = v_u_169
                                table.insert(v172, p170)
                                return true
                            end
                        end
                    end
                    for _, v174 in v165.instance:GetDescendants() do
                        v_u_173(v174)
                    end
                    for _, v175 in p_u_159.slots[p160].icons:GetChildren() do
                        v_u_173(v175)
                    end
                    p_u_159.update_selection_group_signal = v165.instance.DescendantAdded:Connect(function(p176)
                        if v_u_173(p176) then
                            v_u_3:RemoveSelectionGroup("EditWidget")
                            local v177 = v_u_169
                            v_u_3:AddSelectionTuple("EditWidget", unpack(v177))
                        end
                    end)
                    v_u_3:RemoveSelectionGroup("PlayerProfile")
                    v_u_3:AddSelectionTuple("EditWidget", unpack(v_u_169))
                end
                v_u_18.log_widget_edited(v165, "edit_started")
            elseif p_u_159.editing_slot == p160 then
                local v178 = p_u_159:get_widget(p_u_159.editing_slot)
                if v178 then
                    v_u_18.log_widget_edited(v178, "edit_ended")
                    v178:set_editing(false)
                end
                p_u_159.editing_slot = nil
                v_u_3:RemoveSelectionGroup("EditWidget")
                local v179 = v_u_3
                local v180 = p_u_159.main_selection_group
                v179:AddSelectionTuple("PlayerProfile", unpack(v180))
            end
            if v165 and v165.entry.expandable then
                v165:render_expand_buttons()
            end
        end
    end
end
function v35.set_slot_expanded(p_u_181, p182, p183, p184)
    local v185
    if p182 > 0 then
        v185 = p182 <= v_u_27
    else
        v185 = false
    end
    assert(v185, "Invalid widget slot index")
    local v186 = p184 or {}
    if p_u_181.collapsed_slots[p182] then
        return
    else
        local v_u_187 = v_u_17.get_neighboring_index(p182)
        local v_u_188 = p183 and p182 and p182 or nil
        if v_u_188 ~= p_u_181.collapsed_slots[v_u_187] then
            local v_u_189 = p_u_181.slots[p182].instance
            local v_u_190 = p_u_181.slots[v_u_187].instance
            if v186 and v186.no_tween then
                if p183 then
                    v_u_189.Size = UDim2.fromOffset(v_u_30.X.Offset * 2, v_u_30.Y.Offset)
                    v_u_190.Size = UDim2.fromOffset(0, v_u_30.Y.Offset)
                else
                    v_u_189.Size = v_u_30
                    v_u_190.Size = v_u_30
                end
                p_u_181.collapsed_slots[v_u_187] = v_u_188
                p_u_181:_set_slot_configurable(v_u_187, v_u_188 == nil)
                v_u_190.Visible = not p183
            elseif p183 then
                v_u_12.callback(0, 1, TweenInfo.new(0.12), function(p191)
                    local v192 = v_u_30.X.Offset * p191
                    v_u_189.Size = UDim2.fromOffset(v_u_30.X.Offset + v192, v_u_30.Y.Offset)
                    v_u_190.Size = UDim2.fromOffset(v_u_30.X.Offset - v192, v_u_30.Y.Offset)
                end):andThen(function()
                    p_u_181.collapsed_slots[v_u_187] = v_u_188
                    p_u_181:_set_slot_configurable(v_u_187, false)
                    v_u_190.Visible = false
                end)
            else
                p_u_181.collapsed_slots[v_u_187] = v_u_188
                p_u_181:_set_slot_configurable(v_u_187, true)
                v_u_190.Visible = true
                v_u_12.callback(0, 1, TweenInfo.new(0.12), function(p193)
                    local v194 = v_u_30.X.Offset * p193
                    v_u_189.Size = UDim2.fromOffset(v_u_30.X.Offset * 2 - v194, v_u_30.Y.Offset)
                    v_u_190.Size = UDim2.fromOffset(v194, v_u_30.Y.Offset)
                end)
            end
            local v195 = p_u_181:get_widget(p182)
            if v195 then
                v195:set_expanded(p183)
            end
        end
    end
end
function v35.enable_sticker_editing(p_u_196, p197)
    if not p197 or v_u_26 then
        if p197 and not p_u_196.is_editing_profile then
            p_u_196:enable_profile_editing(true)
        end
        v_u_18.toggle_sticker_editing(p197)
        local v198 = p_u_196.sticker_button.instance.Face.TextContainer
        if p197 then
            p_u_196:_set_moving_widget(nil)
            p_u_196.stickers:show()
            p_u_196.sticker_button:set_state("normal")
            v198.Icon.Image = "rbxassetid://15624107783"
            v198.Icon.Size = UDim2.fromOffset(27, 29)
            v198.TextLabel.Text = "Edit"
            v198.TextLabel.Size = UDim2.new(0.3, 0, 1, -2)
            if p_u_196.is_editing_stickers ~= p197 then
                v_u_3:RemoveSelectionGroup("PlayerProfile")
                v_u_3:RemoveSelectionGroup("EditWidget")
                p_u_196:set_gamepad_selection(p_u_196.header.EditButtons.StickerButton)
            end
            p_u_196.tooltip:set_enabled(false)
        else
            p_u_196.stickers:hide()
            p_u_196.sticker_button:set_state("normal")
            v198.Icon.Image = "rbxassetid://15624399809"
            v198.Icon.Size = UDim2.fromOffset(28, 28)
            v198.TextLabel.Text = "Stickers"
            v198.TextLabel.Size = UDim2.new(0.6, 0, 1, -2)
            if p_u_196.is_editing_stickers ~= p197 then
                local v199 = v_u_3
                local v200 = p_u_196.main_selection_group
                v199:AddSelectionTuple("PlayerProfile", unpack(v200))
            end
            p_u_196.tooltip:set_enabled(true)
        end
        p_u_196.is_editing_stickers = p197
        p_u_196:_for_each_slot(function(p201, p202)
            local v203 = p_u_196
            local v204 = p_u_196.is_editing_profile
            if v204 then
                v204 = not p_u_196.is_editing_stickers
            end
            v203:_set_slot_configurable(p202, v204)
            p201.instance.Selectable = not p_u_196.is_editing_stickers
        end)
    end
end
function v35.enable_profile_editing(p_u_205, p_u_206)
    p_u_205.is_editing_profile = p_u_206
    p_u_205:enable_sticker_editing(false)
    v_u_18.toggle_editing(p_u_206)
    local v207 = p_u_205.header.EditProfileButton
    local v208 = not p_u_206
    if v208 then
        v208 = p_u_205.player == v_u_24
    end
    v207.Visible = v208
    local v209 = p_u_205.header.TradeButton
    local v210 = not p_u_206
    if v210 then
        if p_u_205.player == nil or p_u_205.player == v_u_24 then
            v210 = false
        else
            v210 = not v_u_9.get("in_active_trade")
        end
    end
    v209.Visible = v210
    p_u_205.header.EditButtons.Visible = p_u_206
    p_u_205.header.DisplayInfo.Visible = not p_u_206
    if not p_u_206 then
        p_u_205:_set_moving_widget(nil)
        local v211 = v_u_31.DEFAULT
        if p_u_205.use_condensed_ui then
            v211 = v_u_31.CONDENSED
        elseif p_u_205.header.TradeButton.Visible then
            v211 = v_u_31.TRADE_VISIBLE
        elseif p_u_205.header.EditProfileButton.Visible then
            v211 = v_u_31.EDIT_VISIBLE
        end
        p_u_205.header.DisplayInfo.Size = UDim2.new(0, v211.length, 1, 0)
        p_u_205.name_frame.Size = UDim2.fromOffset(v211.name_length, 50)
        local v212 = p_u_205.name_frame
        local v213 = UDim2.fromOffset
        local v214 = v211.name_length
        local v215 = p_u_205.name_frame.TextBounds.X
        v212.Size = v213(math.min(v214, v215), 50)
    end
    p_u_205:_for_each_slot(function(p216, p217)
        p_u_205:_set_slot_configurable(p217, p_u_206)
        if p216.widget then
            p216.widget:set_profile_editing(p_u_205.is_editing_profile)
        end
    end)
    if not p_u_205.is_editing_profile then
        local v218 = nil
        if not p_u_206 and (p_u_205.player_profile and p_u_205.player_profile:is_page_empty(p_u_205.page)) then
            for v219 = p_u_205.page, 1, -1 do
                if v218 then
                    break
                end
                v218 = not p_u_205.player_profile:is_page_empty(v219) and v219
            end
            for v220 = p_u_205.page + 1, v_u_28 do
                if v218 then
                    v218 = v218 or 1
                    goto l20
                end
                v218 = not p_u_205.player_profile:is_page_empty(v220) and v220
            end
            v218 = v218 or 1
            goto l20
        end
        ::l20::
        if v218 then
            p_u_205:open_page(v218)
        end
    end
    p_u_205:_refresh_turn_page_buttons()
end
function v35.select_slot(p221, p222)
    local v223 = p221.slots[p222]
    if v223 then
        v223 = p221.slots[p222].select()
    end
    return v223
end
function v35.get_widget(p224, p225)
    local v226 = p224.slots[p225]
    if v226 then
        v226 = p224.slots[p225].widget
    end
    return v226
end
function v35.load_slot(p227, p228, p229)
    if p228 == nil then
        p227:remove_widget(p229)
    else
        p227:add_widget(p229, p228)
    end
end
function v35.remove_widget(p230, p231)
    local v232
    if p231 > 0 then
        v232 = p231 <= v_u_27
    else
        v232 = false
    end
    assert(v232, "Invalid widget slot index")
    p230:edit_widget(p231, false)
    local v233 = p230:get_widget(p231)
    p230.slots[p231].widget = nil
    if v233 then
        if v233.page ~= p230.page then
            local v234 = p230.player_profile:get_slot_data(v233.page, v233.slot)
            if v234 then
                v234.temp_data = v233:get_temp_data()
            end
            p230.player_profile:update_slot_data(v234, v233.page, v233.slot, true)
        end
        v233:destroy()
    end
    p230:_set_slot_configurable(p231, p230.is_editing_profile)
    p230.slots[p231].instance.ZIndex = 0
    p230:set_slot_expanded(p231, false, {
        ["no_tween"] = true
    })
    p230:_refresh_expand_buttons()
end
function v35.add_widget(p235, p236, p237)
    if p235.player_profile then
        local v238
        if p236 > 0 then
            v238 = p236 <= v_u_27
        else
            v238 = false
        end
        assert(v238, "Invalid widget slot index")
        p235:remove_widget(p236)
        local v239 = v_u_17.get_widget_entry_from_slot_data(p237)
        assert(v239, "No such PlayerProfile widget exists")
        local v240 = p235.templates.Widgets:FindFirstChild(v239.template_name)
        local v241 = "No such PlayerProfile widget instance exists: " .. v239.template_name .. ", make sure the template is in the Templates.Widgets folder"
        assert(v240, v241)
        local v242 = v240:Clone()
        v242.AnchorPoint = Vector2.new(1, 0)
        v242.Position = UDim2.fromScale(1, 0)
        v242.Parent = p235.slots[p236].instance
        v242.Parent.ZIndex = p236
        p235:update_theme_color(v242)
        local v243 = p235.UIManager.wrap(v242, v239.template_name .. "PlayerProfileWidget")
        v243.entry = v239
        v243.player_profile = p235.player_profile
        v243.player_profile_app = p235
        if v239.expandable then
            local v244 = v242:FindFirstChild("ExpandButtons")
            if not v244 then
                v244 = p235.templates.ExpandButtons:Clone()
                v244.Parent = v242
            end
            v243:initialize_expand_buttons(v244)
            v243.expanded = p237.expanded == true
        end
        v243:set_page_slot(p235.page, p236)
        local v245
        if p237.widget_data then
            v245 = v_u_21.Dictionary.copyDeep(p237.widget_data)
        else
            v245 = nil
        end
        local v246
        if p237.temp_data then
            v246 = v_u_21.Dictionary.copyDeep(p237.temp_data)
        else
            v246 = nil
        end
        v243:start(v245, v246)
        v243:set_profile_editing(p235.is_editing_profile)
        v243:set_editing(false)
        p235.slots[p236].widget = v243
        p235:_set_slot_configurable(p236, p235.is_editing_profile)
        p235:edit_widget(p236, false)
        if v239.expandable and p237.expanded then
            v243:set_expanded(true)
            p235:set_slot_expanded(p236, true, {
                ["no_tween"] = true
            })
        end
        p235:_refresh_expand_buttons()
        return v243
    end
end
function v35.update_theme_color(p247, p248)
    local v249 = p247.player_profile and p247.player_profile:get_property("color") or v_u_16.get_theme_color()
    if p248 then
        v_u_16.set_theme_color_for_instance(p247, p248, v249)
    else
        v_u_16.set_theme_color_for_specific_app(p247, v249)
        for _, v250 in p247.slots do
            if v250.widget and v250.widget.instance then
                p247:update_theme_color(v250.widget.instance)
            end
        end
    end
end
function v35.mark_priority_ui(p_u_251, p_u_252)
    if p_u_251.priority_ui and p_u_251.priority_ui[p_u_252] then
        return
    elseif not p_u_251.priority_layer:IsDescendantOf(p_u_251.priority_layer) then
        local v_u_253 = {}
        for _, v254 in { "Size", "Position", "AnchorPoint" } do
            v_u_253[v254] = p_u_252[v254]
        end
        local v_u_255 = p_u_252:Clone()
        v_u_255:ClearAllChildren()
        v_u_255.Visible = false
        v_u_255.Parent = p_u_252.Parent
        p_u_252.AnchorPoint = Vector2.new(0.5, 0.5)
        p_u_252.Parent = p_u_251.priority_layer
        local v_u_256 = v_u_255.Destroying:Connect(function()
            p_u_251:remove_priority_ui(p_u_252)
        end)
        local v_u_257 = Instance.new("UIScale")
        v_u_257.Parent = p_u_252
        v_u_257.Name = "PriorityLayerScale"
        p_u_251.priority_ui_targets[v_u_255] = p_u_252
        p_u_251.priority_ui[p_u_252] = {
            ["target"] = v_u_255,
            ["scale"] = v_u_257,
            ["cached_properties"] = v_u_253,
            ["cleanup"] = function()
                v_u_256:Disconnect()
                p_u_251.priority_ui[p_u_252] = nil
                p_u_251.priority_ui_targets[v_u_255] = nil
                v_u_257:Destroy()
                if v_u_255 and v_u_255:IsDescendantOf(workspace) then
                    v_u_255:Destroy()
                    for v258, v259 in v_u_253 do
                        p_u_252[v258] = v259
                    end
                    p_u_252.Parent = v_u_255.Parent
                else
                    p_u_252:Destroy()
                end
            end
        }
        if not p_u_251.priority_ui_connection then
            local v_u_260 = v_u_3:GetGuiInset()
            p_u_251.priority_ui_connection = v_u_20.newConnect(v_u_4.Heartbeat, function()
                local v261 = p_u_251.instance.Frame.UIScale.Scale
                for v262, v263 in p_u_251.priority_ui do
                    if v262.Visible then
                        local v264 = v263.target.AbsoluteSize
                        v262.Size = UDim2.fromOffset(v264.X / v261, v264.Y / v261)
                        local v265 = v263.target.AbsolutePosition + v264 * Vector2.new(0.5, 0.5)
                        v262.Position = UDim2.fromOffset(v265.X, v265.Y + v_u_260.Y)
                        v263.scale.Scale = v261
                    end
                end
            end):WithProperty(p_u_251.instance, "Enabled")
        end
    end
end
function v35.get_priority_ui_from_target(p266, p267)
    if p267 then
        p267 = p266.priority_ui_targets[p267]
    end
    return p267
end
function v35.remove_priority_ui(p268, p269)
    if p268.priority_ui[p269] then
        p268.priority_ui[p269].cleanup()
    end
    if next(p268.priority_ui) == nil then
        p268.priority_ui_connection:Disconnect()
        p268.priority_ui_connection = nil
    end
end
function v35._refresh_turn_page_buttons(p270)
    local v271 = p270._cached_page or 1
    local v272 = p270.page
    p270._cached_page = v272
    for _, v273 in { "left", "right" } do
        local v274, v_u_275, v276
        if v273 == "left" then
            v274 = p270.page_left
            v_u_275 = p270:get_previous_page() ~= p270.page
            v276 = v272 < v271
        else
            v274 = p270.page_right
            v_u_275 = p270:get_next_page() ~= p270.page
            if v271 < v272 then
                v276 = true
            else
                v276 = false
            end
        end
        local v_u_277 = v274.instance
        if v_u_275 == v_u_277:GetAttribute("is_active") then
            local v278 = (not p270.use_condensed_ui and v276 and true or false) and v_u_57(2, v_u_277, v_u_29.CLICKED, TweenInfo.new(0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
            if v278 then
                v278:andThen(function()
                    local v279 = v_u_57
                    local v280 = 1
                    local v281 = v_u_277
                    local v282
                    if v_u_23 or v_u_8.get_platform() == "tablet" then
                        v282 = v_u_29.DEFAULT
                    else
                        v282 = v_u_29.HOVER
                    end
                    return v279(v280, v281, v282, TweenInfo.new(0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.In))
                end)
            end
        else
            v_u_277:SetAttribute("is_active", v_u_275)
            if p270.use_condensed_ui then
                v_u_277.Visible = v_u_275
            else
                v_u_277.Visible = true
                local v283 = v_u_57
                local v284 = 5
                local v285
                if v_u_275 then
                    v285 = v_u_29.DEFAULT
                else
                    v285 = v_u_29.CLOSED
                end
                local v286 = TweenInfo.new
                local v287 = 0.15
                local v288 = Enum.EasingStyle.Back
                local v289
                if v_u_275 then
                    v289 = Enum.EasingDirection.Out
                else
                    v289 = Enum.EasingDirection.In
                end
                local v290 = v283(v284, v_u_277, v285, v286(v287, v288, v289))
                if v290 then
                    p270:set_gamepad_selection(p270:_get_first_non_collapsed_slot(), v_u_277)
                    v290:andThen(function()
                        if not v_u_275 then
                            v_u_277.Visible = false
                        end
                    end)
                end
            end
        end
    end
end
function v35.get_next_page(p291)
    if not p291.player_profile then
        return p291.page
    end
    if not p291.is_editing_profile then
        for v292 = p291.page + 1, v_u_28 do
            if not p291.player_profile:is_page_empty(v292) then
                return v292
            end
        end
        return p291.page
    end
    local v293 = p291.page + 1
    local v294 = v_u_28
    return math.min(v293, v294)
end
function v35.get_previous_page(p295)
    if p295.player_profile then
        if p295.is_editing_profile then
            local v296 = p295.page - 1
            return math.max(v296, 1)
        else
            for v297 = p295.page - 1, 1, -1 do
                if not p295.player_profile:is_page_empty(v297) then
                    return v297
                end
            end
            return p295.page
        end
    else
        return p295.page
    end
end
function v35.open_page(p_u_298, p299)
    if p_u_298.player_profile then
        p_u_298.slot_selection_maid:DoCleaning()
        local v300 = v_u_3.SelectedObject
        local v301 = p_u_298.moving_widget
        p_u_298:edit_widget(p_u_298.editing_slot, false)
        p_u_298.page = p299
        v_u_18.viewed_page(p299)
        p_u_298:_for_each_slot(function(_, p302)
            p_u_298.player_profile:render_slot(p_u_298.page, p302)
        end)
        p_u_298:_refresh_turn_page_buttons()
        p_u_298.stickers:get_canvas():load_page(p_u_298.page)
        p_u_298:enable_sticker_editing(p_u_298.is_editing_stickers)
        if v301 and (p_u_298.is_editing_profile and not p_u_298.is_editing_stickers) then
            p_u_298:_set_moving_widget(v301.slot, v301.page, {
                ["kind"] = v301.kind
            })
        end
        if v300 then
            for v303 = 1, v_u_27 do
                local v304 = p_u_298.slots[v303]
                if v300 == v304.instance and (p_u_298.collapsed_slots[v303] or not p_u_298:set_gamepad_selection(v304.instance)) and not p_u_298:set_gamepad_selection(p_u_298.slots[v_u_17.get_neighboring_index(v303)].instance) then
                    p_u_298:set_gamepad_selection(p_u_298:_get_first_non_collapsed_slot())
                end
            end
        end
    end
end
function v35.get_page(p305)
    return p305.page
end
function v35.set_header_info(p306, p307)
    local v308 = p307 or {}
    local v309 = p306.header.DisplayInfo
    if v308.profile_icon then
        v309.IconFrame.PlayerIcon.Image = v308.profile_icon
    end
    if v308.username then
        v309.NameFrame.Text = v308.username
        if not p306.loading then
            p306:enable_profile_editing(p306.is_editing_profile)
        end
    end
    if v308.in_trade ~= nil then
        local v310 = v308.in_trade
        local v311 = p306.header.TradeButton
        local v312 = v310 and "rbxassetid://14263447845" or "rbxassetid://2925181065"
        if p306.use_condensed_ui then
            v311.Face.Icon.Image = v312
            return
        end
        v311.Face.TextContainer.Icon.Image = v312
        v311.Face.TextContainer.TextLabel.Text = v310 and "Spectate Trade" or "Trade"
    end
end
function v35.load_start(p_u_313)
    p_u_313.loading = true
    if p_u_313.loading_maid then
        p_u_313.loading_maid:DoCleaning()
    end
    p_u_313.loading_maid = p_u_313.loading_maid or v_u_6.new()
    local v_u_314 = v_u_3.SelectedObject
    if v_u_314 == p_u_313.header.Close or v_u_314 and not v_u_314:IsDescendantOf(p_u_313.instance) then
        v_u_314 = nil
    end
    p_u_313:set_gamepad_selection(p_u_313.header.Close)
    local v_u_315 = p_u_313.stickers:get_canvas()
    v_u_315.instance.Visible = false
    if p_u_313.player_profile.loading then
        p_u_313.loading_spinner:show()
        p_u_313.body.Visible = false
        for _, v_u_316 in p_u_313.header:GetChildren() do
            if v_u_316.Visible and v_u_316.Name ~= "Close" then
                v_u_316.Visible = false
                p_u_313.loading_maid:GiveTask(function()
                    v_u_316.Visible = true
                end)
            end
        end
        v_u_315:load_sticker_data({})
    end
    p_u_313.loading_maid:GiveTask(function()
        local v317 = p_u_313
        local v318 = p_u_313.player_profile
        if v318 then
            v318 = p_u_313.player_profile.player
        end
        v317.player = v318
        p_u_313:enable_profile_editing(p_u_313.player == v_u_24)
        p_u_313:update_theme_color()
        p_u_313:open_page(1)
        v_u_315:load_sticker_data(p_u_313.player_profile:get_sticker_data())
        v_u_315.instance.Visible = true
        local v319 = p_u_313.report_button.instance
        local v320 = not v_u_34[p_u_313.player_profile.user_id]
        if v320 then
            v320 = p_u_313.player ~= v_u_24
        end
        v319.Visible = v320
        p_u_313.body.Visible = true
        p_u_313.loading_spinner:hide()
        if v_u_8.is_using_gamepad() then
            if v_u_314 then
                p_u_313:set_gamepad_selection(v_u_314)
            end
            if v_u_3.SelectedObject == p_u_313.header.Close then
                p_u_313:set_gamepad_selection(p_u_313:_get_first_non_collapsed_slot())
            end
        end
        p_u_313.loading = false
    end)
    if not p_u_313.player_profile.loading then
        p_u_313:on_load_complete()
    end
end
function v35.on_load_complete(p321)
    if p321.loading_maid then
        p321.loading_maid:DoCleaning()
    end
end
function v35.on_load_call(p322, p323)
    if p322.loading then
        p322.loading_maid:GiveTask(p323)
    else
        p323()
    end
end
function v35.close_profile(p324)
    if p324.player_profile then
        p324._cached_user_id = p324.player_profile.user_id
        p324.player_profile:destroy()
        p324.player_profile = nil
        p324:enable_sticker_editing(false)
        p324:enable_profile_editing(false)
        p324:_set_moving_widget(nil)
        v_u_3:RemoveSelectionGroup("PlayerProfile")
        v_u_3:RemoveSelectionGroup("EditWidget")
        p324:_enable_gamepad_page_turn(false)
        v_u_18.reconcile_log_session()
        p324.stickers:get_canvas():load_sticker_data({})
        p324.report_button.instance.Visible = false
        if v_u_9.get("in_active_trade") then
            v_u_11.get("TradeAPI/ToggleBusyIndication"):FireServer({
                ["viewing_profile"] = false
            })
        end
    end
    p324:set_header_info({
        ["profile_icon"] = "rbxassetid://17072601861",
        ["username"] = "",
        ["in_trade"] = false
    })
end
function v35.open_player_profile_for_me(p325)
    p325:open_player_profile_for_user_id(v_u_24.UserId)
end
function v35.open_player_profile_for_user_id(p326, p327)
    p326._cached_user_id = nil
    local v328 = p327 or v_u_24.UserId
    if v328 == v_u_24.UserId then
        p326.stickers:update_available_stickers()
    end
    p326:close_profile()
    p326.player_profile = v_u_13.new(v328, p326)
    p326.UIManager.set_app_visibility("PlayerProfileApp", true)
    p326:load_start()
    v_u_18.begin_log_session(v328)
    if v_u_9.get("in_active_trade") then
        v_u_11.get("TradeAPI/ToggleBusyIndication"):FireServer({
            ["viewing_profile"] = true
        })
    end
    return true
end
function v35.open_player_profile_snapshot(p329, p330)
    local v331 = v_u_2:JSONDecode(p330) or {}
    p329.player_profile = v_u_13.new(v331.user_id, p329, v331)
    p329.UIManager.set_app_visibility("PlayerProfileApp", true)
    p329:load_start()
    return true
end
function v35.start(p_u_332)
    p_u_332.page = 1
    p_u_332.is_editing_profile = false
    p_u_332.is_editing_stickers = false
    p_u_332.editing_slot = nil
    p_u_332.moving_widget = nil
    p_u_332.selected_slot = nil
    p_u_332.use_condensed_ui = false
    p_u_332.priority_ui = {}
    p_u_332.priority_ui_targets = {}
    p_u_332.priority_layer = p_u_332.instance.PriorityLayer
    local v_u_333 = p_u_332.instance.Frame.Background.AbsoluteSize
    local function v338()
        local v334 = p_u_332.instance.AbsoluteSize
        local v335 = v334.X / v_u_333.X * 0.7
        local v336 = v334.Y / v_u_333.Y * 0.7
        local v337 = math.min(v335, v336)
        p_u_332.instance.Frame.UIScale.Scale = math.clamp(v337, 0.8, 2)
    end
    local v339 = p_u_332.instance.AbsoluteSize
    local v340 = v339.X / v_u_333.X * 0.7
    local v341 = v339.Y / v_u_333.Y * 0.7
    local v342 = math.min(v340, v341)
    p_u_332.instance.Frame.UIScale.Scale = math.clamp(v342, 0.8, 2)
    if v_u_23 then
        local v343 = p_u_332.instance.AbsoluteSize
        p_u_332.use_condensed_ui = v343.X < 660 and true or v343.Y < 370
    else
        p_u_332.instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(v338)
    end
    p_u_332.templates = p_u_332.instance.Frame.Body.Templates
    p_u_332.templates.Parent = nil
    p_u_332.header = p_u_332.instance.Frame.Header[p_u_332.use_condensed_ui and "phone" or "desktop"]
    p_u_332.instance.Frame.Header.desktop.Visible = not p_u_332.use_condensed_ui
    p_u_332.instance.Frame.Header.phone.Visible = p_u_332.use_condensed_ui
    p_u_332.body = p_u_332.instance.Frame.Body
    p_u_332.name_frame = p_u_332.header.DisplayInfo.NameFrame
    p_u_332.header_selection_group = {}
    p_u_332.main_selection_group = {}
    for _, v344 in p_u_332.body:GetChildren() do
        if v344:IsA("GuiObject") and v344.Selectable then
            local v345 = p_u_332.main_selection_group
            table.insert(v345, v344)
        end
    end
    for _, v346 in p_u_332.header:GetDescendants() do
        if v346:IsA("GuiObject") and v346.Selectable then
            local v347 = p_u_332.main_selection_group
            table.insert(v347, v346)
            local v348 = p_u_332.header_selection_group
            table.insert(v348, v346)
        end
    end
    p_u_332.tooltip = p_u_332.UIManager.wrap(p_u_332.instance, "JournalTooltip"):start(p_u_332, p_u_332.instance.TooltipContainer)
    p_u_332.tooltip:set_mouse_leave_frame(p_u_332.body)
    p_u_332.tooltip:set_hover_options({
        ["valid_platforms"] = {
            ["desktop"] = true,
            ["console"] = true,
            ["tablet"] = true,
            ["phone"] = true
        },
        ["position"] = {
            ["x_clamped"] = false,
            ["y_clamped"] = false,
            ["x_flip"] = false,
            ["y_flip"] = false
        }
    })
    p_u_332.tooltip.tooltip:get_container().ZIndex = 15
    p_u_332.stickers = p_u_332.UIManager.wrap(p_u_332.instance.Frame.StickerMode, "ProfileStickers"):start({
        ["page_count"] = v_u_28,
        ["selection_group"] = p_u_332.header_selection_group
    })
    p_u_332.stickers:hide()
    local v349 = p_u_332.stickers:get_canvas()
    v349:get_active_signal():Connect(function(p350)
        if p350 then
            p_u_332.instance.Frame.StickerMode.ZIndex = 12
        else
            p_u_332.instance.Frame.StickerMode.ZIndex = 8
        end
    end)
    v349:get_removed_signal():Connect(function(p351, _, p352)
        if p_u_332.player_profile then
            p_u_332.player_profile:save_sticker_data(p352, p351)
        end
    end)
    v349:get_applied_signal():Connect(function(p353, p354)
        if p_u_332.player_profile then
            p_u_332.player_profile:save_sticker_data(p354, p353.unique, p353)
        end
    end)
    p_u_332:_initialize_app_buttons()
    p_u_332.loading_spinner = p_u_332.UIManager.wrap(p_u_332.instance.Frame.LoadingSpinnerOverlay, "UGCLoadingSpinner"):start()
    p_u_332.slots = p_u_332:_initialize_slots()
    p_u_332.collapsed_slots = {}
    p_u_332.slot_selection_maid = v_u_6.new()
    v_u_8.get_gamepad_changed():Connect(function()
        p_u_332.slot_selection_maid:DoCleaning()
    end)
    p_u_332.watch = v_u_10.quick_watch({
        ["selection_parent"] = p_u_332.instance,
        ["default_selection"] = function()
            local v355 = p_u_332.header.Close
            if p_u_332.is_editing_stickers then
                return p_u_332.header.EditButtons.StickerButton
            end
            if p_u_332.body.Visible then
                v355 = p_u_332:_get_first_non_collapsed_slot()
            end
            return v355
        end,
        ["app_name"] = p_u_332.ClassName,
        ["exit_buttons"] = { p_u_332.header.Close },
        ["close_override"] = function()
            if p_u_332.stickers:get_canvas():get_active_sticker() then
                p_u_332.stickers:get_canvas():apply()
                return false
            end
            if p_u_332.moving_widget ~= nil then
                p_u_332:_set_moving_widget(nil)
                return false
            end
            if p_u_332.selected_slot then
                p_u_332.slot_selection_maid:DoCleaning()
                return false
            end
            if not p_u_332.stickers:is_carousel_selected() then
                return true
            end
            p_u_332.stickers.selection_maid:DoCleaning()
            return false
        end
    })
    local v_u_356 = v_u_22.resolve()
    v_u_9.register_callback("inventory", function()
        v_u_356:cancel()
        v_u_356 = v_u_22.delay(1):andThen(function()
            v_u_11.get("PlayerProfileAPI/RefreshProfile"):InvokeServer(v_u_24)
        end)
    end)
    v_u_9.register_callback_plus_existing("in_active_trade", function(p357, p358)
        if p357 == v_u_24 then
            if p357 ~= p_u_332.player then
                p_u_332:enable_profile_editing(false)
            end
        elseif p357 == p_u_332.player then
            p_u_332:set_header_info({
                ["in_trade"] = p358 == true
            })
        end
    end)
    task.spawn(function()
        while true do
            v_u_11.get("PlayerProfileAPI/RefreshProfile"):InvokeServer(v_u_24)
            task.wait(300)
        end
    end)
end
return v35