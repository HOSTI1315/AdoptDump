--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("new:ActionHelper")
local v3 = v_u_1("Class")
local v_u_4 = v_u_1("ControlsDisabler")
local v_u_5 = v_u_1("InteractionsEngine")
local v_u_6 = v_u_1("Maid")
local v_u_7 = v_u_1("PetPerformanceName")
local v_u_8 = v_u_1("PlatformM")
local v_u_9 = v_u_1("RouterClient")
local v_u_10 = v_u_1("new:TutorialHelper")
local v11 = v_u_1("TweenHelper")
local v_u_12 = v_u_1("TweenPromise")
local v_u_13 = v_u_1("package:Promise")
local v_u_14 = game:GetService("GuiService")
local v_u_15 = v_u_8.get_platform()
local v_u_16 = v11.tween_info({
    ["time"] = 0.3
})
local v17 = v3("FocusPetApp", v_u_1("UIBaseApp"))
function v17.capture_focus(p_u_18, p19)
    if p_u_18:can_display() then
        local v_u_20 = v_u_1("PetEntityHelper")
        local v21 = v_u_1("PetEntityManager")
        v_u_9.get("AdoptAPI/FocusPet"):FireServer(p19.char)
        local v_u_22 = v21.get_pet_entity(p19.char)
        if not v_u_22.client_has_control then
            local v26 = v_u_13.new(function(p23, p24, p25)
                while not p25() do
                    if v_u_22.client_has_control then
                        p23()
                        return
                    end
                    if not p_u_18:_pet_entity_is_valid(v_u_22) then
                        p24()
                        return
                    end
                    task.wait()
                end
            end):timeout(5)
            p_u_18.maid:GiveTask(v26)
            if not v26:await() then
                v_u_9.get("AdoptAPI/UnfocusPet"):FireServer(p19.char)
                return
            end
        end
        if p_u_18.char_wrapper then
            p_u_18:release_focus()
        end
        v_u_2.cancel_mutually_exclusive_promises({ "dialog" })
        v_u_5:disable("focus_pet_app")
        p_u_18.exit_button.button:unhover()
        p_u_18.exit_button.button:up()
        p_u_18.char_wrapper = p19
        p_u_18.pet_entity = v_u_22
        p_u_18.UIManager.set_app_visibility(p_u_18.ClassName, true)
        p_u_18.camera:capture_focus(p19)
        p_u_18.ailments:capture_focus(p19)
        p_u_18.pet_selector:capture_focus(p19)
        p_u_18.mock_ailment:capture_focus()
        p_u_18.gamepad_support:capture_focus()
        p_u_18.tooltip:capture_focus()
        p_u_18.petting_handler:capture_focus(v_u_22)
        if v_u_10.is_new_tutorial_running() then
            p_u_18.backpack:hide()
        else
            p_u_18.navigator:capture_focus(p19)
            p_u_18.settings_popup:capture_focus()
            p_u_18.navigator:show()
            p_u_18.backpack:show()
        end
        v_u_20.stage_performance(p_u_18.pet_entity, {
            ["name"] = v_u_7.FocusPet
        })
        p_u_18.maid:GiveTask(function()
            v_u_20.end_performance(p_u_18.pet_entity, v_u_7.FocusPet)
            v_u_5:enable("focus_pet_app")
        end)
        p_u_18.maid:GiveTask(p_u_18:_register_background_click_out(function()
            p_u_18:release_focus()
        end))
        p_u_18.maid:GiveTask(v_u_13.new(function(p27, _, p28)
            while not p28() do
                if not (p_u_18:_pet_entity_is_valid(p_u_18.pet_entity) and p_u_18.pet_entity.client_has_control) then
                    p27()
                    return
                end
                task.wait()
            end
        end):andThen(function()
            p_u_18:release_focus()
        end))
    end
end
function v17._pet_entity_is_valid(_, p29)
    local v30 = p29 and (p29.base.char_wrapper and p29.base.char_wrapper.char)
    if v30 then
        v30 = p29.base.char_wrapper.char:IsDescendantOf(workspace)
    end
    return v30
end
function v17.release_focus(p31)
    if p31.char_wrapper then
        v_u_2.cancel_mutually_exclusive_promises({ "dialog" })
        p31.maid:DoCleaning()
        p31.camera:release_focus()
        p31.ailments:release_focus()
        p31.pet_selector:release_focus()
        p31.mock_ailment:release_focus()
        p31.navigator:release_focus()
        p31.gamepad_support:release_focus()
        p31.tooltip:release_focus()
        p31.petting_handler:release_focus()
        local v_u_32 = p31.char_wrapper
        local v33 = p31.pet_entity
        p31.feeder:done_eating_promise(v33):andThen(function()
            task.wait()
            v_u_9.get("AdoptAPI/UnfocusPet"):FireServer(v_u_32.char)
        end)
        p31.char_wrapper = nil
        p31.pet_entity = nil
        p31.is_eating = false
        p31.UIManager.set_app_visibility(p31.ClassName, false)
    end
end
function v17.feed_pet(p_u_34, p35)
    if p_u_34.is_eating then
        p_u_34.UIManager.apps.HintApp:hint({
            ["text"] = "You can\'t feed your pet right now!",
            ["overridable"] = true,
            ["length"] = 2.5,
            ["yields"] = false
        })
    else
        p_u_34.is_eating = true
        p_u_34.maid.feed_promise = v_u_13.race({ p_u_34.feeder:feed_pet(p_u_34.char_wrapper, p35), v_u_13.fromEvent(p_u_34.UIManager.app_visibilities_changed, function(p36, p37)
                local v38
                if p36 == p_u_34.ClassName then
                    v38 = not p37
                else
                    v38 = false
                end
                return v38
            end) }):finally(function()
            p_u_34.is_eating = false
            p_u_34:show_ui()
        end)
    end
end
function v17.select_ailment(p39, p40, p41)
    return p39.ailment_selector:select_ailment(p40, p41)
end
function v17.stop_selecting_ailment(p42)
    p42.ailment_selector:stop_selecting_ailment()
end
function v17.select_choice(p43, p44)
    return p43.choice_selector:select_choice(p44)
end
function v17.stop_selecting_choice(p45)
    p45.choice_selector:stop_selecting_choice()
end
function v17.register_click_out_action(p46, p_u_47)
    local v_u_48 = p46.click_out
    v_u_48.Active = true
    v_u_48.Visible = true
    v_u_48.BackgroundTransparency = 1
    local v_u_49 = v_u_12.new(v_u_48, v_u_16, {
        ["BackgroundTransparency"] = 0.5
    })
    local v_u_50 = v_u_13.fromEvent(v_u_48.Activated):andThen(function()
        task.spawn(p_u_47)
    end):finally(function()
        v_u_49:cancel()
        v_u_48.Active = false
        v_u_48.Visible = false
    end)
    return function()
        v_u_50:cancel()
    end
end
local v_u_51 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true
}
function v17._register_background_click_out(p_u_52, p_u_53)
    local v_u_54 = p_u_52.background_click_out
    v_u_54.Visible = true
    local v_u_59 = v_u_13.fromEvent(v_u_54.InputBegan, function(p55)
        if not v_u_51[p55.UserInputType] then
            return false
        end
        local v56 = workspace.CurrentCamera.ViewportSize * 0.5
        local v57 = Vector2.new(p55.Position.X, p55.Position.Y) + v_u_14:GetGuiInset()
        local v58 = p_u_52.ailments.instance.AbsoluteSize.X
        return (v57 - v56).Magnitude > v58 * 0.5
    end):andThen(function()
        task.spawn(p_u_53)
    end):finally(function()
        v_u_54.Visible = false
    end)
    return function()
        v_u_59:cancel()
    end
end
function v17.show(p_u_60)
    v_u_4.disable_controls(p_u_60.ClassName)
    p_u_60.exit_button.instance.Visible = true
    p_u_60.instance.Frame.Visible = true
    p_u_60.UIManager.apps.CoreGuiApp:set_coregui_disabled(p_u_60.ClassName, Enum.CoreGuiType.Chat)
    p_u_60.UIManager.apps.CoreGuiApp:set_coregui_disabled(p_u_60.ClassName, "touch_gui")
    p_u_60.UIManager.set_app_visibility("BackpackApp", false)
    p_u_60.maid:GiveTask(function()
        p_u_60.UIManager.apps.CoreGuiApp:reenable_coregui(p_u_60.ClassName, Enum.CoreGuiType.Chat)
        p_u_60.UIManager.apps.CoreGuiApp:reenable_coregui(p_u_60.ClassName, "touch_gui")
    end)
end
function v17.hide(p61)
    v_u_4.enable_controls(p61.ClassName)
    p61.exit_button.instance.Visible = false
    p61.instance.Frame.Visible = false
    p61:release_focus()
end
function v17.hide_ui(p62)
    p62.is_ui_hidden = true
    p62.ailments:tween_hide()
    p62.backpack:hide()
    p62.navigator:hide()
    p62.pet_selector:hide()
    p62.camera:recalculate(true)
    p62.gamepad_support:update_display()
end
function v17.show_ui(p63)
    p63.is_ui_hidden = false
    p63.ailments:tween_show()
    p63.pet_selector:show()
    p63.camera:recalculate(true)
    if not v_u_10.is_new_tutorial_running() then
        p63.backpack:show()
        p63.navigator:show()
    end
    p63.gamepad_support:update_display()
end
function v17.check_can_interact_with_pet(p64)
    if not (p64.char_wrapper and p64.char_wrapper.char) then
        return false
    end
    if v_u_1("PetActions").can_interact_with_pet(p64.char_wrapper.char) then
        return true
    end
    p64.UIManager.apps.HintApp:hint({
        ["text"] = "You can\'t do that right now!",
        ["yields"] = false,
        ["overridable"] = true,
        ["length"] = 2
    })
    return false
end
function v17.can_display(p65)
    local v66 = p65.UIManager.is_closed({
        "MainMenuApp",
        "AvatarEditorApp",
        "TradeApp",
        "TradePreviewApp",
        "TradeHistoryApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "PlayerSpectateApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "SettingsApp"
    })
    if p65.UIManager.apps.HideGuiApp:should_hide_app(p65.ClassName) then
        v66 = false
    end
    return v66
end
function v17.refresh(p67, p68)
    local v69 = p67:can_display()
    if not p68[p67.ClassName] then
        v69 = false
    end
    p67:set_visibility(v69)
end
function v17.get_ailment_card_template(p70)
    return p70.ailment_card_template
end
function v17.get_choice_templates(p71)
    return p71.choice_template, p71.primary_choice_template
end
function v17.start(p_u_72)
    p_u_72.maid = v_u_6.new()
    p_u_72.click_out = p_u_72.instance.Frame.ClickOut
    p_u_72.background_click_out = p_u_72.click_out:Clone()
    p_u_72.background_click_out.ZIndex = -10
    p_u_72.background_click_out.Parent = p_u_72.click_out.Parent
    p_u_72.ailment_card_template = p_u_72.instance.AilmentCard
    p_u_72.ailment_card_template.Parent = nil
    p_u_72.choice_template = p_u_72.instance.ActionChoice
    p_u_72.choice_template.Parent = nil
    p_u_72.primary_choice_template = p_u_72.instance.PrimaryActionChoice
    p_u_72.primary_choice_template.Parent = nil
    p_u_72.char_wrapper = nil
    p_u_72.pet_entity = nil
    p_u_72.is_eating = false
    p_u_72.is_ui_hidden = false
    p_u_72.camera = p_u_72.UIManager.wrap(nil, "FocusPetAppCamera")
    p_u_72.camera:start(p_u_72)
    p_u_72.ailments = p_u_72.UIManager.wrap(p_u_72.instance.Frame.Ailments, "FocusPetAppAilments")
    p_u_72.ailments:start()
    p_u_72.pet_selector = p_u_72.UIManager.wrap(p_u_72.instance.Frame.PetSelector, "FocusPetAppPetSelector")
    p_u_72.pet_selector:start()
    p_u_72.mock_ailment = p_u_72.UIManager.wrap(p_u_72.instance.Frame.MockAilment, "FocusPetAppMockAilment")
    p_u_72.mock_ailment:start()
    p_u_72.feeder = p_u_72.UIManager.wrap(nil, "FocusPetAppFeeder")
    p_u_72.feeder:start()
    p_u_72.backpack = p_u_72.UIManager.wrap(p_u_72.instance:FindFirstChild("OpenBackpack", true), "FocusPetAppBackpack")
    p_u_72.backpack:start()
    p_u_72.navigator = p_u_72.UIManager.wrap(p_u_72.instance.Frame, "FocusPetAppNavigator")
    p_u_72.navigator:start()
    p_u_72.ailment_selector = p_u_72.UIManager.wrap(p_u_72.instance.ChooseAilment, "FocusPetAppAilmentSelector")
    p_u_72.ailment_selector:start()
    p_u_72.choice_selector = p_u_72.UIManager.wrap(p_u_72.instance.ChooseAction, "FocusPetAppChoiceSelector")
    p_u_72.choice_selector:start()
    p_u_72.gamepad_support = p_u_72.UIManager.wrap(p_u_72.instance.Frame.GamepadSupport, "FocusPetAppGamepadSupport")
    p_u_72.gamepad_support:start()
    p_u_72.tooltip = p_u_72.UIManager.wrap(p_u_72.instance.Frame.Tooltip, "FocusPetAppTooltip")
    p_u_72.tooltip:start()
    p_u_72.settings_popup = p_u_72.UIManager.wrap(nil, "FocusPetAppSettingsPopup")
    p_u_72.settings_popup:start()
    p_u_72.petting_handler = p_u_72.UIManager.wrap(p_u_72.instance.PettingHand, "FocusPetAppPetting")
    p_u_72.petting_handler:start()
    p_u_72.exit_button = p_u_72.UIManager.wrap(p_u_72.instance.Frame.BackButton, "JaggedButton")
    p_u_72.exit_button:start({
        [(v_u_15 == v_u_8.platform.phone or v_u_15 == v_u_8.platform.tablet) and "mouse_button1_click" or "mouse_button1_down"] = function()
            p_u_72:release_focus()
        end,
        ["hover_color"] = Color3.fromRGB(234, 108, 158),
        ["up_color"] = Color3.fromRGB(237, 44, 121)
    })
    p_u_72.UIManager.wrap(p_u_72.exit_button.instance.XboxButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonB,
        ["on_update"] = function(_, p73)
            local v74 = p_u_72.exit_button.instance.Shortcut
            local v75 = not p73
            if v75 then
                v75 = v_u_8.get_platform() == v_u_8.platform.desktop
            end
            v74.Visible = v75
        end
    })
    if v_u_15 == v_u_8.platform.phone then
        for _, v76 in p_u_72.instance.Frame:GetChildren() do
            local v77 = v76:FindFirstChildWhichIsA("UIScale")
            if v77 then
                v77.Scale = 0.7
            end
        end
        p_u_72.exit_button.instance.Parent = p_u_72.instance
    end
    task.spawn(function()
        v_u_1("InteriorsM").on_location_changing:Connect(function()
            if p_u_72.char_wrapper then
                p_u_72:release_focus()
            else
                v_u_2.cancel_mutually_exclusive_promises({ "dialog" })
            end
        end)
    end)
end
return v17