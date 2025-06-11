--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.UIApps.ScreenTapApp (ModuleScript)

local v_u_1 = game:GetService("ContextActionService")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v2("Class")
local v_u_4 = v2("ClickTapInWorldExclusionList")
local v_u_5 = v2("ClientToolManager")
local v_u_6 = v2("Maid")
local v_u_7 = v2("PlatformM")
local v_u_8 = v2("package:Promise")
local v_u_9 = v2("RepeatPromise")
local v10 = v2("TweenHelper")
local v_u_11 = v2("TweenPromise")
local v12 = v3("ScreenTapApp", v2("UIBaseApp"))
local v_u_13 = {
    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
}
local v_u_14 = {
    ["AnchorPoint"] = Vector2.new(0.5, 0.4)
}
local v_u_15 = {
    ["AnchorPoint"] = Vector2.new(0.5, 0.7)
}
local v_u_16 = v10.tween_info({
    ["time"] = 0.25
})
function v12.show(p_u_17)
    p_u_17.instance.Enabled = true
    local v_u_18 = p_u_17.default.PettingHand
    local v_u_19 = p_u_17.gamepad.Button
    local v_u_20 = p_u_17.default.Press
    local v_u_21 = p_u_17.gamepad.Press
    local v_u_22 = p_u_17.default.Press.UIScale
    local v_u_23 = p_u_17.gamepad.Press.UIScale
    p_u_17.maid:GiveTask(v_u_9.new(function()
        v_u_18.AnchorPoint = v_u_14.AnchorPoint
        v_u_19.AnchorPoint = v_u_15.AnchorPoint
        v_u_20.ImageTransparency = 1
        v_u_21.ImageTransparency = 1
        v_u_22.Scale = 1
        v_u_23.Scale = 1
        return v_u_8.delay(0.5):andThen(function()
            return v_u_8.all({ v_u_11.new(v_u_18, v_u_16, v_u_13), v_u_11.new(v_u_19, v_u_16, v_u_13), v_u_8.delay(0.1):andThen(function()
                    return v_u_8.all({
                        v_u_11.new(v_u_20, v_u_16, {
                            ["ImageTransparency"] = 0.5
                        }),
                        v_u_11.new(v_u_21, v_u_16, {
                            ["ImageTransparency"] = 0.5
                        }),
                        v_u_11.new(v_u_22, v_u_16, {
                            ["Scale"] = 1.2
                        }),
                        v_u_11.new(v_u_23, v_u_16, {
                            ["Scale"] = 1.2
                        })
                    })
                end) })
        end):andThen(function()
            return v_u_8.all({ v_u_11.new(v_u_20, v_u_16, {
                    ["ImageTransparency"] = 1
                }), v_u_11.new(v_u_21, v_u_16, {
                    ["ImageTransparency"] = 1
                }) })
        end):andThen(function()
            return v_u_8.all({ v_u_11.new(v_u_18, v_u_16, v_u_14), v_u_11.new(v_u_19, v_u_16, v_u_15) })
        end):andThen(function()
            return v_u_8.delay(1)
        end)
    end))
    p_u_17.maid:GiveTask(v_u_4.register((-1 / 0), function()
        p_u_17.UIManager.set_app_visibility(p_u_17.ClassName, false)
        return "pass"
    end))
    v_u_1:BindActionAtPriority("ScreenTapApp", function(_, p24)
        if p24 == Enum.UserInputState.Begin then
            p_u_17.UIManager.set_app_visibility(p_u_17.ClassName, false)
        end
        return Enum.ContextActionResult.Pass
    end, false, (1 / 0), Enum.KeyCode.ButtonR2)
    p_u_17.maid:GiveTask(function()
        v_u_1:UnbindAction("ScreenTapApp")
    end)
    p_u_17.maid:GiveTask(v_u_8.fromEvent(v_u_5.get_equipped_changed(), function()
        return not next(v_u_5.get_equipped_by_category("toys"))
    end):andThen(function()
        p_u_17.UIManager.set_app_visibility(p_u_17.ClassName, false)
    end))
end
function v12.hide(p25)
    p25.instance.Enabled = false
    p25.maid:DoCleaning()
end
function v12.can_display(p26)
    local v27 = p26.UIManager.is_closed({
        "AvatarEditorApp",
        "BackpackApp",
        "FocusPetApp",
        "MannequinPurchaseApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "PlayerSpectateApp",
        "SettingsApp"
    })
    if p26.UIManager.apps.HideGuiApp:should_hide_app(p26.ClassName) then
        v27 = false
    end
    return v27
end
function v12.refresh(p28, p29)
    if p29[p28.ClassName] and not p28:can_display() then
        p28.UIManager.set_app_visibility(p28.ClassName, false)
    else
        p28:set_visibility(p29[p28.ClassName])
    end
end
function v12._refresh_gamepad(p30)
    p30.gamepad.Visible = v_u_7.is_using_gamepad()
    p30.default.Visible = not v_u_7.is_using_gamepad()
end
function v12.start(p_u_31)
    p_u_31.default = p_u_31.instance.Main.Default
    p_u_31.gamepad = p_u_31.instance.Main.Gamepad
    p_u_31.gamepad.Button.TextLabel.Text = v_u_7.get_player_facing_button_name(Enum.KeyCode.ButtonR2)
    p_u_31.maid = v_u_6.new()
    p_u_31:_refresh_gamepad()
    v_u_7.get_gamepad_changed():Connect(function()
        p_u_31:_refresh_gamepad()
    end)
end
return v12