--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AvatarEditorApp.AvatarEditorApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("PlatformM")
local v_u_4 = v_u_1("RouterClient")
local v_u_5 = v_u_1("XboxSupport")
local v6 = v_u_1("Class")
local v_u_7 = v_u_1("Maid")
local v_u_8 = v_u_1("CharWrapperClient")
local v_u_9 = v_u_1("AvatarEditorCamera")
local v_u_10 = v_u_1("InteractionsEngine")
local v_u_11 = v_u_1("ControlsDisabler")
local v_u_12 = v_u_1("Signal")
local v_u_13 = v_u_1("AvatarClientManager")
local v_u_14 = v_u_1("SoundPlayer")
local v_u_15 = v_u_1("new:StreamingHelper")
local v_u_16 = v_u_1("package:Promise")
local v17 = v6("AvatarEditorApp", v_u_1("UIBaseApp"))
local v_u_18 = v_u_3.get_platform()
function v17.can_set_app_visibility(p19, p20)
    local v21 = v_u_1("ObbyM")
    if not p20 or v_u_1("MinigameForcedState").can_edit_avatars() and not v21.is_in_obby() then
        return true
    end
    p19.UIManager.apps.HintApp:hint({
        ["text"] = "You can\'t do that right now!",
        ["yields"] = false,
        ["overridable"] = true,
        ["length"] = 4.5
    })
    return false
end
function v17.show(p_u_22)
    if p_u_22.instance.Frame.Visible == false then
        v_u_13.submit_analytics_event("opened")
    end
    p_u_22.instance.Frame.Visible = true
    v_u_11.disable_controls(p_u_22.ClassName)
    p_u_22.UIManager.apps.CoreGuiApp:set_coregui_disabled(p_u_22.ClassName, Enum.CoreGuiType.Chat)
    p_u_22.UIManager.apps.CoreGuiApp:set_coregui_disabled(p_u_22.ClassName, "touch_gui")
    p_u_22.UIManager.set_app_visibility("BackpackApp", false)
    p_u_22:set_screen("start_screen", 1)
    spawn(function()
        p_u_22:set_initial_gender()
    end)
    v_u_10:disable(p_u_22.ClassName)
end
function v17.hide(p23)
    if p23.instance.Frame.Visible == true then
        v_u_13.submit_analytics_event("closed")
    end
    p23.instance.Frame.Visible = false
    v_u_11.enable_controls(p23.ClassName)
    local v24 = game.Players.LocalPlayer.Character
    if v24 then
        v24 = v24:FindFirstChild("Humanoid")
    end
    if v24 and (p23.old_walkspeed and p23.old_jump_power) then
        v24.WalkSpeed = p23.old_walkspeed
        v24.JumpPower = v_u_2.get("team") == "Babies" and 40 or 50
    end
    workspace.CurrentCamera.FieldOfView = 70
    p23:set_screen("hidden")
    p23.UIManager.apps.CoreGuiApp:reenable_coregui(p23.ClassName, Enum.CoreGuiType.Chat)
    p23.UIManager.apps.CoreGuiApp:reenable_coregui(p23.ClassName, "touch_gui")
    v_u_10:enable(p23.ClassName)
end
function v17.promise_picked_gender(_)
    local v25 = v_u_2.get("gender")
    if v25 then
        return v_u_16.resolve(v25)
    end
    local v_u_26 = v_u_12.new()
    local v_u_28 = v_u_2.register_callback("gender", function(_, p27)
        v_u_26:Fire(p27)
    end)
    return v_u_16.fromEvent(v_u_26):andThen(function(p29)
        v_u_28()
        return p29
    end)
end
function v17.set_initial_gender(p_u_30)
    if not p_u_30.setting_initial_gender then
        p_u_30.setting_initial_gender = true
        spawn(function()
            if v_u_2.get("gender") == nil then
                local v31 = p_u_30.UIManager.apps.GenderStylePickerApp:promise_pick():expect() == "Boys" and "male" or "female"
                v_u_4.get("AvatarAPI/SetGender"):FireServer(v31)
            end
        end)
    end
end
function v17.set_camera(p32, p33, p34)
    local v35 = p32.focus_switcher:get_current_character()
    local v36 = v35:FindFirstChild("HumanoidRootPart")
    local v37 = v35:FindFirstChild("Humanoid")
    if v37 then
        if p33 == "full_catalog" and true or p33 == "start_screen" then
            v_u_9.capture_focus(v37)
        else
            local v38 = game.Players.LocalPlayer.Character
            if v38 then
                v38 = v38:FindFirstChild("Humanoid")
            end
            v_u_9.release_focus(v38)
        end
        local v39 = v36.CFrame - v36.CFrame.p
        if p33 == "full_catalog" then
            v_u_9.set_screen_mode("fit_to_screen", v39)
            game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(p34 or 0.5), {
                ["FieldOfView"] = 50
            }):Play()
        elseif p33 == "start_screen" then
            v_u_9.set_screen_mode("front_facing", v39)
            game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(p34 or 0.5), {
                ["FieldOfView"] = 70
            }):Play()
        end
    else
        return
    end
end
function v17.set_screen(p_u_40, p41, p42)
    if p_u_40.screen ~= p41 then
        local v43 = p_u_40.screen
        p_u_40.screen = p41
        p_u_40.transitioning_screens = true
        p_u_40:set_camera(p_u_40.screen, p42)
        if p_u_40.screen == "full_catalog" then
            p_u_40.avatar_controller:listen_avatar_rotation()
            p_u_40.instance.Frame.ChangeAge.Visible = false
            p_u_40.instance.Frame.SwitchCharacterFocus.Visible = false
            p_u_40.change_nickname:hide()
            p_u_40.outfits:hide()
            p_u_40.catalog:open()
            task.delay(0.5, function()
                if p_u_40.screen == "full_catalog" then
                    p_u_40.back_button:show()
                    p_u_40.wearing:show()
                end
            end)
        elseif p_u_40.screen == "start_screen" then
            p_u_40.avatar_controller:listen_avatar_rotation()
            p_u_40.wearing:hide()
            p_u_40.back_button:hide()
            if v43 == "hidden" then
                p_u_40.catalog:close(true)
            else
                p_u_40.catalog:close()
            end
            if p_u_40.screen == "start_screen" then
                p_u_40.change_nickname:show()
                p_u_40.outfits:show()
                p_u_40.instance.Frame.SwitchCharacterFocus.Visible = not p_u_40:is_focusing_mannequin()
                p_u_40.instance.Frame.ChangeAge.Visible = p_u_40:is_focusing_player()
            end
        elseif p41 == "hidden" then
            p_u_40.avatar_controller:stop_listen_avatar_rotation()
            p_u_40.catalog:close(true)
        else
            error("Invalid screen type")
        end
        p_u_40.transitioning_screens = false
    end
end
function v17.is_transitioning_screens(p44)
    return p44.transitioning_screens
end
function v17.get_screen(p45)
    return p45.screen
end
function v17.track_focus_changes(p_u_46)
    p_u_46:bind_to_focus_changed(function(p47, p48, p49)
        p_u_46.char_maid:DoCleaning()
        local v50 = p47:FindFirstChild("Humanoid")
        local v_u_51 = p47:FindFirstChild("HumanoidRootPart")
        if p48 == "pet" and p49 then
            task.spawn(function()
                local v52 = tick() + 3
                while v_u_51.Velocity.magnitude > 0.25 and tick() < v52 do
                    wait()
                end
                if p_u_46:is_focusing_pet() then
                    p_u_46:set_camera(p_u_46.screen, 0.5)
                end
            end)
        else
            p_u_46:set_camera(p_u_46.screen, 0.5)
        end
        if p48 ~= "pet" then
            p_u_46.char_maid:GiveTask(v50:GetPropertyChangedSignal("HipHeight"):connect(function()
                if p_u_46.screen == "full_catalog" or p_u_46.screen == "start_screen" then
                    if p_u_46.UIManager.is_visible(p_u_46.ClassName) then
                        task.wait(0.3)
                        p_u_46:set_camera(p_u_46.screen)
                    end
                else
                    return
                end
            end))
        end
        if p48 == "player" then
            if p_u_46.screen == "start_screen" then
                p_u_46.instance.Frame.ChangeAge.Visible = true
                return
            end
        else
            p_u_46.instance.Frame.ChangeAge.Visible = false
        end
    end)
end
function v17.bind_to_focus_changed(p53, p54)
    p53.focus_switcher.focused_character_changed:connect(p54)
end
function v17.get_focused_char_wrapper(p55)
    local v56 = p55.focus_switcher:get_current_character()
    if v56 then
        v56 = v_u_8.get(v56)
    end
    return v56
end
function v17.get_focused_avatar_type(p57)
    return p57.focus_switcher:get_focused_avatar_type()
end
function v17.get_focused_avatar_rig_type(p58)
    local v59 = p58.focus_switcher:get_focused_avatar_type()
    return v59 == "mannequin" and "player" or v59
end
function v17.set_focused_avatar_type(p60, p61)
    p60.focus_switcher:set_focused_avatar_type(p61)
end
function v17.edit_mannequin(p_u_62, p_u_63, p_u_64, p65)
    local v_u_66 = p_u_62.focus_switcher:get_focused_avatar_type()
    local v67 = v_u_66 ~= "mannequin"
    assert(v67, "Already editing a mannequin.")
    p_u_62.did_save_mannequin = nil
    p_u_62.mannequin_outfit_name = p65 or "Outfit"
    p_u_62.has_unsaved_changes = false
    local v_u_68 = p_u_63.Parent
    local v_u_69 = p_u_63:GetPivot()
    p_u_62.focus_switcher:focus_mannequin(p_u_63)
    p_u_62.UIManager.set_app_visibility("AvatarEditorApp", true)
    p_u_62.avatar_controller:stop_listen_avatar_rotation()
    local v_u_70 = nil
    local v_u_71 = nil
    local v_u_72 = nil
    local v_u_73 = v_u_7.new()
    return v_u_16.new(function(p74, p75)
        local v76 = v_u_4.get("AvatarAPI/StartEditingMannequin"):InvokeServer(p_u_64)
        v_u_72 = v_u_15.await(v76, 10)
        if not v_u_72 then
            warn("Could not load mannequin. Never received the mannequin from the server. StreamingEnabled issue?")
            p75()
        end
        if p_u_62.UIManager.is_visible("AvatarEditorApp") then
            p74()
        else
            p75()
        end
    end):andThen(function()
        p_u_63.Parent = nil
        v_u_72:PivotTo(v_u_69)
        v_u_72.Parent = workspace.CurrentCamera
        v_u_73:GiveTask(v_u_72)
        local v_u_77 = v_u_69 - Vector3.new(0, 1, 0) * (p_u_63.Humanoid.HipHeight - p_u_63.HumanoidRootPart.Size.Y / 2)
        v_u_14.FX:play("PopShort")
        p_u_62.UIManager.apps.SpecialEffectsApp:poof_effect(v_u_77.Position)
        v_u_73:GiveTask(v_u_72.Humanoid:GetPropertyChangedSignal("HipHeight"):Connect(function()
            v_u_72:PivotTo(v_u_77 + Vector3.new(0, 1, 0) * (v_u_72.Humanoid.HipHeight - v_u_72.HumanoidRootPart.Size.Y / 2))
        end))
        v_u_73:GiveTask(v_u_2.register_callback("avatar_manager", function()
            p_u_62.has_unsaved_changes = true
        end))
        p_u_62.focus_switcher:focus_mannequin(v_u_72)
        p_u_62.avatar_controller:listen_avatar_rotation()
        return v_u_16.fromEvent(p_u_62.UIManager.app_visibilities_changed, function(p78, p79)
            local v80
            if p78 == p_u_62.ClassName then
                v80 = not p79
            else
                v80 = false
            end
            return v80
        end)
    end):andThen(function()
        v_u_70 = p_u_62.did_save_mannequin or false
        v_u_71 = p_u_62.mannequin_outfit_name
    end):catch(function()
        v_u_70 = false
        v_u_71 = nil
    end):andThen(function()
        p_u_63:PivotTo(v_u_69)
        p_u_63.Parent = v_u_68
        v_u_73:DoCleaning()
        p_u_62.did_save_mannequin = nil
        p_u_62.mannequin_outfit_name = nil
        p_u_62.has_unsaved_changes = nil
        p_u_62.focus_switcher:set_focused_avatar_type(v_u_66)
        return v_u_70, v_u_71
    end)
end
function v17.is_focusing_player(p81)
    return p81.focus_switcher:get_focused_avatar_type() == "player"
end
function v17.is_focusing_pet(p82)
    return p82.focus_switcher:get_focused_avatar_type() == "pet"
end
function v17.is_focusing_mannequin(p83)
    return p83.focus_switcher:get_focused_avatar_type() == "mannequin"
end
function v17.get_focus_switcher_instance(p84)
    return p84.instance.Frame.SwitchCharacterFocus
end
function v17.get_nickname_instance(p85)
    return p85.instance.Frame.Nickname
end
function v17._run_china_logic(p86)
    local v87 = require(game.ReplicatedStorage.ChinaPolicyService)
    assert(v87:IsReady())
    if v87:IsActive() then
        p86.instance.Frame.Catalog.Visible = false
    end
end
function v17._update_button_visibilities(p88)
    local v89 = v_u_1("MinigameForcedState")
    p88.instance.Frame.SwitchCharacterFocus.Visible = v89.can_change_age()
    p88.instance.Frame.ChangeAge.Visible = v89.can_change_age()
end
function v17.refresh(p90, p91)
    p90:set_visibility(p91[p90.ClassName])
    p90:_update_button_visibilities()
end
function v17.start(p_u_92)
    p_u_92.screen = "hidden"
    p_u_92.char_maid = v_u_7.new()
    p_u_92.focus_switcher = p_u_92.UIManager.wrap(p_u_92.instance.Frame.SwitchCharacterFocus, "AvatarEditorFocusSwitcher"):start(p_u_92)
    p_u_92.wearing = p_u_92.UIManager.wrap(p_u_92.instance.Frame.Wearing, "AvatarEditorWearing"):start(p_u_92)
    p_u_92.catalog = p_u_92.UIManager.wrap(p_u_92.instance.Frame.Catalog, "AvatarEditorCatalog"):start(p_u_92, {
        ["category_selected"] = function(p93)
            p_u_92.wearing:set_category(p93)
        end
    })
    p_u_92.change_nickname = p_u_92.UIManager.wrap(p_u_92.instance.Frame.Nickname, "AvatarEditorNickname"):start(p_u_92)
    p_u_92.outfits = p_u_92.UIManager.wrap(p_u_92.instance.Frame.Outfits, "AvatarEditorOutfits"):start(p_u_92)
    p_u_92.avatar_controller = p_u_92.UIManager.wrap(p_u_92.instance, "AvatarEditorController"):start(p_u_92)
    p_u_92.back_button = p_u_92.UIManager.wrap(p_u_92.instance.Frame.BackButton, "JaggedButton"):start({
        [(v_u_18 == v_u_3.platform.phone or v_u_18 == v_u_3.platform.tablet) and "mouse_button1_click" or "mouse_button1_down"] = function()
            p_u_92:set_screen("start_screen")
        end,
        ["hover_color"] = Color3.fromRGB(234, 108, 158),
        ["up_color"] = Color3.fromRGB(237, 44, 121)
    })
    local v_u_94 = false
    local v96 = {
        ["mouse_button1_down"] = function()
            if v_u_1("MinigameForcedState").can_change_age() then
                if not v_u_94 then
                    v_u_94 = true
                    local v95 = v_u_2.get("team") == "Parents" and "Babies" or "Parents"
                    p_u_92.UIManager.apps.TransitionsApp:transition({
                        ["length"] = 0.75,
                        ["start_transparency"] = 1,
                        ["end_transparency"] = 0
                    })
                    v_u_4.get("TeamAPI/ChooseTeam"):InvokeServer(v95, {
                        ["dont_respawn"] = true,
                        ["source_for_logging"] = "avatar_editor"
                    })
                    p_u_92.UIManager.apps.TransitionsApp:transition({
                        ["length"] = 0.75,
                        ["start_transparency"] = 0,
                        ["end_transparency"] = 1
                    })
                    v_u_94 = false
                end
            else
                p_u_92.UIManager.apps.HintApp:hint({
                    ["text"] = "You can\'t do that right now!",
                    ["yields"] = false,
                    ["overridable"] = true,
                    ["length"] = 4.5
                })
                return
            end
        end
    }
    p_u_92.change_age_button = p_u_92.UIManager.wrap(p_u_92.instance.Frame.ChangeAge, "WhiteJaggedButton"):start(v96)
    v_u_2.register_callback_plus_existing("team", function(p97, p98)
        if p97 == game.Players.LocalPlayer then
            local v99 = p_u_92.instance.Frame.ChangeAge
            if p98 == "Babies" then
                v99.ActionText.TextColor3 = Color3.fromRGB(44, 162, 255)
                v99.SubjectText.TextColor3 = Color3.fromRGB(44, 162, 255)
                v99.SubjectText.Text = "PARENT"
                v99.Icon.Image = "rbxassetid://4684218044"
            else
                v99.ActionText.TextColor3 = Color3.fromRGB(253, 113, 42)
                v99.SubjectText.TextColor3 = Color3.fromRGB(253, 113, 42)
                v99.SubjectText.Text = "BABY"
                v99.Icon.Image = "rbxassetid://4684218214"
            end
        else
            return
        end
    end)
    if v_u_18 == v_u_3.platform.phone then
        local v100 = Instance.new("UIScale")
        v100.Scale = 0.6
        v100.Parent = p_u_92.instance.Frame.BackButton
        p_u_92.instance.Frame.BackButton.Size = UDim2.new(0, 145, 0, 61)
        p_u_92.instance.Frame.BackButton.Position = UDim2.new(0, 8, 0, 58)
        p_u_92.instance.Frame.ChangeAge.UIScale.Scale = 0.6
        p_u_92.instance.Frame.ChangeAge.Position = UDim2.new(1, -100, 1, -70)
        p_u_92.instance.Frame.SwitchCharacterFocus.UIScale.Scale = 0.6
        p_u_92.instance.Frame.SwitchCharacterFocus.Position = UDim2.new(1, -100, 1, -10)
        local v101 = game.Players.LocalPlayer:GetMouse().ViewSizeX
        local v102 = game.Players.LocalPlayer:GetMouse().ViewSizeX
        if v101 <= 670 or v102 <= 305 then
            p_u_92.instance.Frame.BackButton.Size = UDim2.new(0, 80, 0, 61)
            p_u_92.instance.Frame.BackButton.TextLabel.Text = "X"
        end
    else
        p_u_92.instance.Frame.ChangeAge.Position = UDim2.new(1, -200, 1, -85)
        p_u_92.instance.Frame.SwitchCharacterFocus.Position = UDim2.new(1, -200, 1, -10)
    end
    p_u_92:track_focus_changes()
    p_u_92.back_button:hide()
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_92.instance.Frame,
        ["default_selection"] = function()
            if p_u_92.screen == "full_catalog" then
                return p_u_92.back_button.instance
            else
                return p_u_92.instance.Frame.Nickname
            end
        end,
        ["save_last_selection"] = false,
        ["app_name"] = p_u_92.ClassName
    })
    spawn(function()
        p_u_92:_run_china_logic()
    end)
end
return v17