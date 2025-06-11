--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppPetting (ModuleScript)

local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_5 = v_u_4("new:ActionHelper")
local v6 = v_u_4("Class")
local v_u_7 = v_u_4("Maid")
local v_u_8 = v_u_4("PetPerformanceName")
local v_u_9 = v_u_4("PlatformM")
local v_u_10 = v_u_4("RepeatPromise")
local v_u_11 = v_u_4("RouterClient")
local v_u_12 = v_u_4("Signal")
local v_u_13 = v_u_4("SoundPlayer")
local v_u_14 = v_u_4("TweenHelper")
local v_u_15 = v_u_4("TweenPromise")
local v_u_16 = v_u_4("package:Promise")
local v_u_17 = v_u_4("package:Sift")
local v_u_18 = Vector2.new(1, -1) * 0.5
local v_u_19 = {
    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
}
local v_u_20 = {
    ["AnchorPoint"] = Vector2.new(0.5, 0.7)
}
local v_u_21 = v_u_14.tween_info({
    ["time"] = 0.25
})
local v_u_22 = {
    {
        ["name"] = v_u_8.PettingBlankStare,
        ["level"] = 6
    },
    {
        ["name"] = v_u_8.PettingUpset,
        ["level"] = 5
    },
    {
        ["name"] = v_u_8.PettingShocked,
        ["level"] = 4
    },
    {
        ["name"] = v_u_8.PettingConfused,
        ["level"] = 3
    },
    {
        ["name"] = v_u_8.PettingSilly,
        ["level"] = 0
    }
}
local v23 = v6("FocusPetAppPetting", v_u_4("UIBaseElement"))
function v23.capture_focus(p24, p25)
    p24.maid:DoCleaning()
    p24.example_maid:DoCleaning()
    p24.pet_entity = p25
    p24.petting_promise = nil
    p24.reaction_promise = nil
    p24.frustration_level = 0
    p24.is_petting = false
    p24.is_reacting = false
    p24.is_holding_pet_button = false
    p24:listen_for_petting()
end
function v23.release_focus(p26)
    p26.maid:DoCleaning()
    p26.example_maid:DoCleaning()
    p26.pet_entity = nil
    p26:_delete_mock_ailment()
    p26.is_holding_pet_button = false
end
local v_u_27 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true
}
function v23.show_example(p_u_28)
    if p_u_28.example then
        if not p_u_28.is_reacting then
            p_u_28.example_maid:DoCleaning()
            p_u_28.example.Gamepad.Visible = v_u_9.is_using_gamepad()
            local v_u_29 = p_u_28.example:FindFirstChild("PettingHand", true)
            local v_u_30 = v_u_29.Parent
            local v_u_31 = v_u_30.Press
            local v_u_32 = p_u_28.example:FindFirstChild("AButton", true).Button
            local v_u_33 = v_u_32.Parent.Press
            v_u_32.Text = v_u_9.get_player_facing_button_name(Enum.KeyCode.ButtonA)
            local v_u_34 = p_u_28.example:FindFirstChild("Thumbstick", true)
            p_u_28.example_maid:GiveTask(v_u_10.new(function()
                v_u_30.Position = UDim2.fromScale(0.5, 0.5 + v_u_18.Y)
                v_u_34.AnchorPoint = Vector2.new(0.5, 0.5)
                v_u_29.AnchorPoint = v_u_20.AnchorPoint
                v_u_32.AnchorPoint = v_u_20.AnchorPoint
                v_u_31.Visible = false
                v_u_31.ImageTransparency = 1
                v_u_31.UIScale.Scale = 1
                v_u_33.Visible = false
                v_u_33.ImageTransparency = 1
                v_u_33.UIScale.Scale = 1
                local v_u_35
                if p_u_28.example.Gamepad.Visible then
                    v_u_35 = v_u_33
                else
                    v_u_35 = v_u_31
                end
                v_u_35.Visible = true
                local v_u_36 = v_u_35.UIScale
                return v_u_16.delay(0.5):andThen(function()
                    return v_u_16.all({ v_u_15.new(v_u_29, v_u_21, v_u_19), v_u_15.new(v_u_32, v_u_21, v_u_19), v_u_16.delay(0.1):andThen(function()
                            return v_u_16.all({ v_u_15.new(v_u_35, v_u_21, {
                                    ["ImageTransparency"] = 0.5
                                }), v_u_15.new(v_u_36, v_u_21, {
                                    ["Scale"] = 1.2
                                }) })
                        end) })
                end):andThen(function()
                    return v_u_16.all({ v_u_15.new(v_u_34, v_u_21, {
                            ["AnchorPoint"] = Vector2.new(0.5, 1)
                        }), v_u_15.new(v_u_35, v_u_21, {
                            ["ImageTransparency"] = 1
                        }) })
                end):andThen(function()
                    return v_u_15.callback(0, 6.283185307179586, v_u_14.tween_info({
                        ["easing_style"] = Enum.EasingStyle.Sine,
                        ["easing_direction"] = Enum.EasingDirection.InOut,
                        ["repeat_count"] = 1,
                        ["time"] = 1
                    }), function(p37)
                        local v38 = math.sin(p37) * v_u_18.X
                        local v39 = math.cos(p37) * v_u_18.Y
                        v_u_30.Position = UDim2.fromScale(0.5 + v38, 0.5 + v39)
                        v_u_34.AnchorPoint = Vector2.new(0.5 - v38, 0.5 - v39)
                    end)
                end):andThen(function()
                    return v_u_15.new(v_u_34, v_u_21, {
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                    })
                end):andThen(function()
                    return v_u_16.all({ v_u_15.new(v_u_29, v_u_21, v_u_20), v_u_15.new(v_u_32, v_u_21, v_u_20) })
                end):andThen(function()
                    return v_u_16.delay(1)
                end)
            end))
            p_u_28.example.Visible = true
            p_u_28.example_maid:GiveTask(function()
                p_u_28.example.Visible = false
            end)
        end
    else
        return
    end
end
function v23.listen_for_petting(p_u_40)
    local v_u_41 = p_u_40.UIManager.apps.FocusPetApp
    local v42 = v_u_41.background_click_out
    local v_u_43 = v_u_41.ailments.instance.AbsoluteSize.X
    p_u_40.maid:GiveTask(v42.InputBegan:Connect(function(p44)
        if v_u_27[p44.UserInputType] then
            local v45 = workspace.CurrentCamera.ViewportSize * 0.5
            if (Vector2.new(p44.Position.X, p44.Position.Y) + v_u_3:GetGuiInset() - v45).Magnitude <= v_u_43 * 0.5 then
                p_u_40.is_holding_pet_button = true
                p_u_40:start_petting()
            end
        end
    end))
    p_u_40.maid:GiveTask(v42.MouseButton1Up:Connect(function()
        p_u_40.is_holding_pet_button = false
        p_u_40:stop_petting()
    end))
    v_u_1:BindActionAtPriority("petting_inputs", function(_, p46)
        if p_u_40.is_petting or v_u_3.SelectedObject == nil and (v_u_41.gamepad_support.watch and (v_u_41.gamepad_support.watch:is_active() and v_u_41.gamepad_support.thumbstick_position.Magnitude < 0.7)) then
            if p46 == Enum.UserInputState.Begin then
                p_u_40.is_holding_pet_button = true
                p_u_40:start_petting()
            else
                p_u_40.is_holding_pet_button = false
                p_u_40:stop_petting()
            end
            return Enum.ContextActionResult.Sink
        end
    end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonA)
    p_u_40.maid:GiveTask(function()
        v_u_1:UnbindAction("petting_inputs")
    end)
end
function v23.update_hand(p_u_47, p_u_48)
    return v_u_16.new(function(p49, _, p50)
        v_u_2.MouseIconEnabled = false
        p_u_47.instance.Visible = true
        while not p50() do
            local v51, v52, _, _ = p_u_48()
            p_u_47.instance.Position = UDim2.fromOffset(v51.X, v51.Y)
            p_u_47.instance.ImageTransparency = v52 and 0 or 0.75
            task.wait()
        end
        p49()
    end):finally(function()
        v_u_2.MouseIconEnabled = true
        p_u_47.instance.Visible = false
    end)
end
function v23.get_reaction(p53)
    for _, v54 in v_u_22 do
        local v55 = v54.name
        if v54.level <= p53.frustration_level then
            return v55
        end
    end
    return v_u_8.PettingSilly
end
function v23.get_hint_text(_)
    local v_u_56 = {
        ["touch"] = "Tap the screen and then drag your finger to pet your pet!",
        ["mouse"] = "Click and then drag the mouse to pet your pet!",
        ["gamepad"] = "Hold the A button and then use the thumbstick to pet your pet!"
    }
    local v57 = {
        ["desktop"] = function()
            if v_u_9.is_using_gamepad() then
                return v_u_56.gamepad
            else
                return v_u_56.mouse
            end
        end,
        ["console"] = function()
            return v_u_56.gamepad
        end,
        ["phone"] = function()
            return v_u_56.touch
        end,
        ["tablet"] = "phone"
    }
    return v_u_9.run(v57)
end
function v23.get_position(p58)
    local v59 = p58.UIManager.apps.FocusPetApp
    local v60 = v59.ailments.instance.AbsoluteSize.X
    if not v_u_9.is_using_gamepad() then
        return v_u_2:GetMouseLocation()
    end
    local v61 = v59.gamepad_support.thumbstick_position
    return workspace.CurrentCamera.ViewportSize * 0.5 + v61 * v60 * 0.25
end
function v23.start_petting(p_u_62, p63)
    local v_u_64 = p_u_62.UIManager.apps.FocusPetApp
    if p_u_62.is_petting or (p_u_62.is_reacting or v_u_64.is_eating) then
        return
    elseif not v_u_5.has_exclusive_tag("dialog") then
        p_u_62.is_petting = true
        local v65 = p63 or "pet_me"
        p_u_62.ailment_kind = v65
        local v_u_66 = p_u_62:_render_mock_ailment()
        v_u_64:hide_ui()
        local v_u_67 = p_u_62:get_position()
        local v_u_68 = 0
        local v_u_69 = tick()
        local v_u_70 = 0
        local v_u_71 = 0
        local v_u_72 = 0
        local v_u_73 = v_u_12.new()
        local function v83()
            local v74 = tick()
            local v75 = p_u_62:get_position()
            local v76 = v74 - v_u_69
            local v77 = v75 - v_u_67
            local v78 = workspace.CurrentCamera.ViewportSize * 0.5
            local v79 = v_u_64.ailments.instance.AbsoluteSize.X
            local v80 = (v75 - v78).Magnitude
            local v81 = v77.X ~= 0 and true or v77.Y ~= 0
            if v81 then
                v_u_68 = v74
            end
            local v82
            if v80 < v79 * 0.5 then
                v82 = v81 or v74 - v_u_68 < 0.25
            else
                v82 = false
            end
            if v82 then
                v82 = p_u_62.is_holding_pet_button
            end
            if v82 then
                v_u_71 = v_u_71 + v76
                v_u_72 = 0
                if v74 - v_u_70 > 0.2 then
                    v_u_13.Pets:play("BoredCloseEyes")
                    v_u_70 = v74
                end
                p_u_62.example_maid:DoCleaning()
            else
                v_u_72 = v_u_72 + v76
            end
            p_u_62:_update_mock_ailment(v_u_71)
            v_u_67 = v75
            v_u_69 = v74
            if v_u_71 > 3 or not v_u_66 and v_u_72 > 1.5 then
                v_u_73:Fire(v_u_71 > 3)
            end
            return v75, v82
        end
        local v84 = v_u_4("PetEntityHelper")
        v84.stage_performance(p_u_62.pet_entity, {
            ["name"] = v_u_8.Petting,
            ["options"] = {
                ["ailment_kind"] = v65,
                ["update_petting"] = v83
            }
        })
        p_u_62.petting_promise = v_u_16.race({ p_u_62:update_hand(v83), v_u_16.fromEvent(v_u_73):andThen(function(p85)
                if p85 then
                    return v_u_16.resolve()
                else
                    return v_u_16.reject()
                end
            end) })
        p_u_62.maid.petting = p_u_62.petting_promise
        local v86 = p_u_62.petting_promise:await()
        v84.end_performance(p_u_62.pet_entity, v_u_8.Petting)
        p_u_62.is_petting = false
        if v86 then
            p_u_62:play_reaction(v_u_8.PettingHappy)
            p_u_62.frustration_level = 0
            local v87 = p_u_62.pet_entity.base.char_wrapper.pet_unique
            if v65 == "pet_me" then
                v_u_11.get("AilmentsAPI/ProgressPetMeAilment"):FireServer(v87)
            elseif v65 == "dirty" then
                v_u_11.get("AilmentsAPI/ProgressDirtyAilment"):FireServer(v87)
            end
        else
            local v88 = p_u_62:get_reaction()
            if v88 == v_u_22[1].name then
                p_u_62.UIManager.apps.HintApp:hint({
                    ["text"] = p_u_62:get_hint_text(),
                    ["overridable"] = true,
                    ["length"] = 3,
                    ["yields"] = false
                })
            end
            p_u_62:play_reaction(v88)
            p_u_62.frustration_level = p_u_62.frustration_level + 1
        end
        p_u_62.UIManager.apps.FocusPetApp.mock_ailment:hide()
        v_u_64:show_ui()
    end
end
function v23.stop_petting(p89)
    if p89.is_petting then
        if p89:get_ailment_index() then
            p89:show_example()
        elseif p89.petting_promise then
            p89.petting_promise:cancel()
            p89.petting_promise = nil
            p89.ailment_kind = nil
        end
    else
        return
    end
end
function v23.play_reaction(p_u_90, p_u_91)
    local v_u_92 = v_u_4("PetEntityHelper")
    p_u_90.is_reacting = true
    p_u_90.example_maid:DoCleaning()
    v_u_92.stage_performance(p_u_90.pet_entity, {
        ["name"] = p_u_91
    })
    p_u_90.reaction_promise = v_u_92.promise_performance_ended(p_u_90.pet_entity, p_u_91):finally(function()
        v_u_92.end_performance(p_u_90.pet_entity, p_u_91)
    end)
    p_u_90.maid.reacting = p_u_90.reaction_promise
    p_u_90.reaction_promise:await()
    p_u_90.is_reacting = false
end
function v23.get_ailment_index(p_u_93)
    local v94 = p_u_93.UIManager.apps.FocusPetApp.ailments.ailments_list
    return v_u_17.List.findWhere(v94, function(p95)
        if p95 then
            p95 = p95.kind == p_u_93.ailment_kind
        end
        return p95
    end)
end
function v23._render_mock_ailment(p96)
    local v97 = p96.UIManager.apps.FocusPetApp
    p96:_delete_mock_ailment()
    local v98 = p96:get_ailment_index()
    if not v98 then
        return false
    end
    p96.mock_ailment = v_u_4("new:ClientAilment").new(game.Players.LocalPlayer, {
        ["components"] = {},
        ["created_timestamp"] = 0,
        ["kind"] = p96.ailment_kind,
        ["progress"] = 0,
        ["rate"] = 0,
        ["rate_timestamp"] = -1,
        ["sort_order"] = 0
    })
    p96:_update_mock_ailment(0)
    v97.mock_ailment:set_slot(v98)
    v97.mock_ailment:show()
    return true
end
function v23._update_mock_ailment(p99, p100)
    if p99.mock_ailment then
        p99.mock_ailment.progress = p100 / 3
        p99.UIManager.apps.FocusPetApp.mock_ailment:update_ailment(p99.mock_ailment)
    end
end
function v23._delete_mock_ailment(p101)
    if p101.mock_ailment then
        p101.UIManager.apps.FocusPetApp.mock_ailment:update_ailment(nil)
        p101.mock_ailment:destroy()
        p101.mock_ailment = nil
    end
end
function v23.start(p102)
    p102.maid = v_u_7.new()
    p102.example_maid = v_u_7.new()
    p102.example = p102.UIManager.apps.FocusPetApp.instance:FindFirstChild("PettingExample", true)
    p102.example.Visible = false
end
return v23