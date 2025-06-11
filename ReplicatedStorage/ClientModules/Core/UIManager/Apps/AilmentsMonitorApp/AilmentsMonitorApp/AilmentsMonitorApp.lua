--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AilmentsMonitorApp.AilmentsMonitorApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:AilmentsClient")
local v_u_3 = v1("CharWrapperClient")
local v4 = v1("Class")
local v_u_5 = v1("new:ClientAilment")
local v_u_6 = v1("ClientData")
local v_u_7 = v1("EquippedPets")
local v_u_8 = v1("Maid")
local v_u_9 = v1("PlatformM")
local v_u_10 = v1("SettingsHelper")
local v_u_11 = v1("Signal")
local v_u_12 = v1("StateManagerClient")
local v13 = v1("TweenHelper")
local v_u_14 = v1("TweenPromise")
local v_u_15 = v1("XboxSupport")
local v_u_16 = v1("package:Sift")
local v_u_17 = game.Players.LocalPlayer
local v_u_18 = v13.tween_info({
    ["time"] = 0.3,
    ["easing_style"] = Enum.EasingStyle.Back,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v19 = v4("AilmentsMonitorApp", v1("UIBaseApp"))
function v19.show(p20)
    p20.instance.Enabled = true
    p20:_update_relevant_char_wrappers()
end
function v19.hide(p21)
    if p21.mobile_expanded then
        p21.mobile_expanded = false
        p21:_update_mobile_expanded()
    end
    p21.instance.Enabled = false
    p21.signal_close:Fire()
end
function v19.refresh(p_u_22, p23)
    local v24 = p_u_22.UIManager.is_closed({
        "MainMenuApp",
        "AvatarEditorApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "PlayerSpectateApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "FocusPetApp",
        "MockFocusPetApp",
        "NewsApp"
    })
    if not p23[p_u_22.ClassName] then
        v24 = false
    end
    if not v_u_10.get_setting_client({
        ["setting_id"] = "use_ailments_monitor"
    }) then
        v24 = false
    end
    if v_u_2.are_ailments_hidden() then
        v24 = false
    end
    v_u_9.run({
        ["phone"] = function() end,
        ["default"] = function()
            if p_u_22.UIManager.apps.HouseEditorWrapperApp.editor_open then
                p_u_22.instance.Main.Ailments.Position = UDim2.new(0.5, 0, 0, 70)
            else
                p_u_22.instance.Main.Ailments.Position = UDim2.new(0.5, 0, 0, 10)
            end
        end
    })
    p_u_22:set_visibility(v24)
end
function v19.start(p_u_25)
    p_u_25.relevant_char_wrappers = {}
    p_u_25.stack_count = 0
    p_u_25.last_hovered_stack = nil
    p_u_25.mobile_expanded = false
    p_u_25.ailment_stacks = {}
    p_u_25.wrappers_by_kind = {}
    p_u_25.display_maid = v_u_8.new()
    p_u_25.main = p_u_25.instance.Main
    p_u_25.ailments_container = p_u_25.main.Ailments
    p_u_25.mobile_container = p_u_25.main.MobileAilmentContainer
    p_u_25.console_selection = nil
    p_u_25.console_icon = nil
    p_u_25.mobile_close = p_u_25.instance.MobileClose
    p_u_25.mobile_close.Visible = false
    p_u_25.template = p_u_25.ailments_container.AilmentContainer
    p_u_25.template.Parent = nil
    p_u_25.tooltip = p_u_25.UIManager.wrap(p_u_25.instance.PointerBox, "AilmentsMonitorAppTooltip")
    p_u_25.tooltip:start(p_u_25.ailments_container)
    v_u_9.run({
        ["phone"] = function()
            p_u_25.mobile_ailment = p_u_25.UIManager.wrap(p_u_25.mobile_container.Ailment, "Ailment")
            local v26 = {
                ["hide_empty_outline"] = true,
                ["preference_always_visible"] = false,
                ["interactable"] = true,
                ["resize_on_hover"] = true,
                ["show_percentage"] = false,
                ["show_tags"] = true,
                ["on_select"] = function(_)
                    if not p_u_25.mobile_expanded then
                        p_u_25.mobile_expanded = true
                        p_u_25:_update_mobile_expanded()
                    end
                end
            }
            p_u_25.mobile_ailment:start(v26)
            p_u_25.mobile_close.MouseButton1Click:connect(function()
                if p_u_25.mobile_expanded then
                    p_u_25.mobile_expanded = false
                    p_u_25:_update_mobile_expanded()
                end
            end)
            p_u_25.mobile_container.Visible = true
            p_u_25.ailments_container.Visible = false
        end
    })
    p_u_25.signal_open = v_u_11.new()
    p_u_25.signal_close = v_u_11.new()
    p_u_25.watch = v_u_15.watch({
        ["app_name"] = p_u_25.ClassName,
        ["selection_parent"] = p_u_25.ailments_container,
        ["signal_open"] = p_u_25.signal_open,
        ["signal_close"] = p_u_25.signal_close,
        ["default_selection"] = function()
            if p_u_25.console_selection and p_u_25.console_selection.Parent then
                return p_u_25.console_selection
            end
            p_u_25:_on_ailments_changed()
            return p_u_25.console_selection
        end,
        ["setup_button_actions"] = function()
            game:GetService("ContextActionService"):BindAction("MonitorClose", function(_, p27)
                if p27 ~= Enum.UserInputState.Begin or not p_u_25.UIManager.apps.AilmentsMonitorApp.visible then
                    return Enum.ContextActionResult.Pass
                end
                p_u_25.signal_close:Fire()
                return Enum.ContextActionResult.Sink
            end, false, Enum.KeyCode.ButtonB)
            if p_u_25.console_icon then
                p_u_25.console_icon:update({
                    ["key"] = Enum.KeyCode.ButtonB
                })
                p_u_25.console_icon.instance.Size = UDim2.fromOffset(40, 40)
                p_u_25.console_icon.instance.ImageTransparency = 0
            end
        end,
        ["teardown_button_actions"] = function()
            game:GetService("ContextActionService"):UnbindAction("MonitorClose")
            if p_u_25.console_icon then
                p_u_25.console_icon:update({
                    ["key"] = Enum.KeyCode.ButtonL1
                })
                p_u_25.console_icon.instance.Size = UDim2.fromOffset(48, 31)
                p_u_25.console_icon.instance.ImageTransparency = 0.3
            end
        end
    })
    game:GetService("ContextActionService"):BindActionAtPriority("MonitorOpen", function(_, p28)
        if p28 ~= Enum.UserInputState.Begin or not p_u_25.UIManager.apps.AilmentsMonitorApp.visible then
            return Enum.ContextActionResult.Pass
        end
        p_u_25.signal_open:Fire()
        return Enum.ContextActionResult.Sink
    end, false, 5000, Enum.KeyCode.ButtonL1)
    p_u_25:_update_relevant_char_wrappers()
    v_u_10.promise_setting_changed_signal("use_ailments_monitor"):andThen(function(p29)
        p29:Connect(function()
            p_u_25:refresh(p_u_25.UIManager.app_visibilities)
        end)
    end)
    v_u_2.get_ailments_hidden_changed_signal():Connect(function()
        p_u_25:refresh(p_u_25.UIManager.app_visibilities)
    end)
    v_u_2:get_changed_signal():Connect(function()
        p_u_25:_on_ailments_changed()
    end)
    v_u_6.register_callback("roleplay_role", function(p30)
        if p30 == v_u_17 then
            p_u_25:_on_ailments_changed()
        end
    end)
    v_u_6.register_callback("state_manager", function(p31, p32)
        if p31 == v_u_17 then
            p_u_25:_update_relevant_char_wrappers(p32)
        end
    end)
    v_u_6.register_callback("pet_char_wrappers", function(p33)
        if p33 == v_u_17 then
            p_u_25:_update_relevant_char_wrappers()
        end
    end)
    v_u_6.register_callback("char_wrapper", function(p34)
        if p34 == v_u_17 then
            p_u_25:_update_relevant_char_wrappers()
        end
    end)
end
function v19._update_relevant_char_wrappers(p35, p36)
    if p35.instance.Enabled then
        local v37 = p36 or v_u_12.get(v_u_17.Character)
        local v38 = v_u_3.get(v_u_17.Character)
        local v39 = v37 and v_u_12.get_chars_connected_to_me(v37) or {}
        local v40 = v_u_7.get_my_equipped_char_wrappers()
        local v43 = v_u_16.List.map(v_u_16.Dictionary.values(v39), function(p41)
            local v42 = v_u_3.get(p41)
            if v42 then
                if v_u_2.is_relevant_to_local_ailments(v42.player) then
                    if v_u_7.is_wrapper_equipped(v42) then
                        return nil
                    else
                        return v42
                    end
                else
                    return nil
                end
            else
                return nil
            end
        end)
        p35.relevant_char_wrappers = v_u_16.List.join({ v38 }, v40, v43)
        p35:_on_ailments_changed()
    end
end
function v19._on_ailments_changed(p44)
    if p44.instance.Enabled then
        local v45 = {}
        local v46 = {}
        if v_u_6.get("roleplay_role") then
            local v47 = v_u_5.new
            local v48 = game.Players.LocalPlayer
            table.insert(v45, v47(v48, {
                ["components"] = {},
                ["created_timestamp"] = 0,
                ["kind"] = "at_work",
                ["progress"] = 0,
                ["rate"] = 0,
                ["rate_timestamp"] = -1,
                ["sort_order"] = 0
            }))
        else
            for _, v49 in p44.relevant_char_wrappers do
                for _, v50 in v_u_2.get_ailments_for_pet(v49) do
                    local v51 = v50.components.preference
                    local v52
                    if v51 then
                        v52 = v50.kind .. v51.item_kind
                    else
                        v52 = v50.kind
                    end
                    table.insert(v45, v50)
                    v46[v52] = v46[v52] or {}
                    local v53 = v46[v52]
                    table.insert(v53, v49)
                end
            end
        end
        p44.wrappers_by_kind = v46
        p44:_render_ailments_list(v45)
        p44:_render_mobile_ailment(v45)
        p44.tooltip:set_wrappers(p44.wrappers_by_kind)
    end
end
function v19._pick_best_ailment(_, p54)
    if next(p54) then
        return v_u_16.List.reduce(p54, function(p55, p56)
            local v57 = p56:get_rate_finished_timestamp()
            local v58 = p55:get_rate_finished_timestamp()
            local v59 = p56:get_progress()
            local v60 = p55:get_progress()
            if v57 == v58 then
                if v59 == v60 then
                    if p56.created_timestamp == p55.created_timestamp then
                        if p56.sort_order > p55.sort_order then
                            return p56
                        else
                            return p55
                        end
                    elseif p56.created_timestamp > p55.created_timestamp then
                        return p56
                    else
                        return p55
                    end
                elseif v60 < v59 then
                    return p56
                else
                    return p55
                end
            elseif v57 and not v58 then
                return p56
            elseif v58 and not v57 then
                return p55
            elseif v57 < v58 then
                return p56
            else
                return p55
            end
        end)
    else
        return nil
    end
end
function v19._render_ailments_list(p61, p62)
    local v63 = {}
    for _, v64 in p62 do
        local v65 = v64.components.preference
        local v66
        if v65 then
            v66 = v64.kind .. v65.item_kind
        else
            v66 = v64.kind
        end
        v63[v66] = v63[v66] or {}
        local v67 = v63[v66]
        table.insert(v67, v64)
    end
    for v68, v69 in p61.ailment_stacks do
        if not v63[v68] then
            if p61.last_hovered_stack == v69 then
                p61.tooltip:set_ailment(nil)
            end
            v69:destroy()
            v69.instance.Parent:Destroy()
            p61.ailment_stacks[v68] = nil
        end
    end
    for v70, v71 in v63 do
        if p61.ailment_stacks[v70] then
            p61:_update_ailment_stack(p61.ailment_stacks[v70], v71)
        else
            p61.ailment_stacks[v70] = p61:_render_new_ailment_stack(v71)
        end
    end
    local v74 = v_u_16.List.reduce(v_u_16.Dictionary.values(p61.ailment_stacks), function(p72, p73)
        if p73.instance.Parent.LayoutOrder <= p72.instance.Parent.LayoutOrder then
            return p73
        else
            return p72
        end
    end)
    local v75 = p61.console_selection
    local v76
    if v74 then
        v76 = v74.instance
    else
        v76 = nil
    end
    p61.console_selection = v76
    if p61.console_selection and p61.console_selection ~= v75 then
        if p61.console_icon then
            p61.console_icon.instance.Visible = false
            p61.console_icon:destroy()
        end
        p61.console_icon = p61.UIManager.wrap(p61.console_selection.Parent:FindFirstChild("XboxButton"), "GamepadIcon"):start({
            ["key"] = Enum.KeyCode.ButtonL1
        })
        if p61.watch.buttons_active then
            p61.watch:disable_button_actions()
            p61.watch:enable_button_actions()
        end
    end
end
function v19._update_ailment_stack(p77, p78, p79)
    p78:update_ailment((p77:_pick_best_ailment(p79)))
    p78:update_count(#p79)
end
function v19._render_new_ailment_stack(p_u_80, p81)
    local v_u_82 = p_u_80.template:Clone()
    v_u_82.LayoutOrder = p_u_80.stack_count
    p_u_80.stack_count = p_u_80.stack_count + 1
    v_u_82.Parent = p_u_80.ailments_container
    local v_u_83 = p_u_80.UIManager.wrap(v_u_82.Ailment, "Ailment")
    v_u_83:start({
        ["preference_always_visible"] = true,
        ["interactable"] = true,
        ["resize_on_hover"] = true,
        ["show_percentage"] = false,
        ["show_tags"] = true,
        ["on_hover"] = function(p_u_84)
            local v85 = {
                ["phone"] = function() end,
                ["tablet"] = "phone",
                ["default"] = function()
                    p_u_80.last_hovered_stack = v_u_83
                    p_u_80.tooltip:set_ailment(p_u_84)
                    p_u_80.tooltip:set_parent(v_u_82)
                end
            }
            v_u_9.run(v85)
        end,
        ["on_stop_hovering"] = function()
            local v86 = {
                ["phone"] = function() end,
                ["tablet"] = "phone",
                ["default"] = function()
                    if p_u_80.last_hovered_stack == v_u_83 then
                        p_u_80.tooltip:set_ailment(nil)
                    end
                end
            }
            v_u_9.run(v86)
        end,
        ["on_select"] = function(p_u_87)
            local v88 = {
                ["phone"] = function()
                    p_u_80.tooltip:set_ailment(p_u_87)
                    p_u_80.tooltip:set_parent(nil)
                end,
                ["tablet"] = function()
                    p_u_80.tooltip:set_ailment(p_u_87)
                    p_u_80.tooltip:set_parent(v_u_82)
                end
            }
            v_u_9.run(v88)
        end
    })
    p_u_80:_update_ailment_stack(v_u_83, p81)
    return v_u_83
end
function v19._render_mobile_ailment(p89, p90)
    if p89.mobile_ailment then
        local v91 = p89:_pick_best_ailment(p90)
        p89.mobile_ailment:update_ailment(v91)
        p89.mobile_ailment:update_count(#p90)
    end
end
function v19._update_mobile_expanded(p92)
    p92.display_maid:DoCleaning()
    if p92.mobile_expanded then
        p92.main.Position = UDim2.new(0.5, 0, 0.5, 20)
        p92.ailments_container.Visible = true
        p92.mobile_container.Visible = false
        p92.mobile_close.Visible = true
        p92.display_maid:GiveTask(v_u_14.new(p92.main, v_u_18, {
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }))
        p92.UIManager.apps.HideGuiApp:hide_all(p92.ClassName, { p92.ClassName, "DialogApp" })
        p92.UIManager.apps.TransitionsApp:set_blur(p92.ClassName, 10, 0.3)
        p92.UIManager.apps.CoreGuiApp:set_coregui_disabled(p92.ClassName, Enum.CoreGuiType.Chat)
        p92.tooltip:set_ailment(p92.mobile_ailment.ailment)
        p92.tooltip:set_parent(nil)
    else
        p92.main.Position = UDim2.fromScale(0.5, 0.5)
        p92.UIManager.apps.HideGuiApp:unhide_all(p92.ClassName)
        p92.UIManager.apps.TransitionsApp:clear_blur(p92.ClassName)
        p92.UIManager.apps.CoreGuiApp:reenable_coregui(p92.ClassName, Enum.CoreGuiType.Chat)
        p92.ailments_container.Visible = false
        p92.mobile_container.Visible = true
        p92.mobile_close.Visible = false
        p92.tooltip:set_ailment(nil)
    end
end
return v19