--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ToolApp.ToolApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ClientToolManager")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("ToolWrapper")
local v_u_6 = v1("TweenPromise")
local v7 = v1("TweenHelper")
local v_u_8 = v1("package:Promise")
local v_u_9 = game:GetService("ContextActionService")
local v10, v_u_11 = v2("ToolApp", v1("UIBaseApp"))
local v_u_12 = v_u_4.get_platform()
local v_u_13 = v7.tween_info({
    ["time"] = 0.12
})
local v_u_14 = { "holdables", "transport", "pets" }
function v10.__init(p15, ...)
    v_u_11.__init(p15, ...)
end
function v10.show(p16)
    p16.instance.Frame.Visible = true
end
function v10.hide(p17)
    p17.instance.Frame.Visible = false
end
function v10.refresh(p18, _)
    local v19 = p18.UIManager.is_closed({
        "MainMenuApp",
        "AvatarEditorApp",
        "TradeApp",
        "TradePreviewApp",
        "TradeHistoryApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "PlayerSpectateApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "FocusPetApp",
        "MockFocusPetApp",
        "LikesRewardApp"
    })
    if p18.UIManager.apps.HouseEditorWrapperApp.editor_open and p18.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v19 = false
    end
    p18:set_visibility(v19)
end
function v10.set_minigame_locked(p20, p21)
    if p20.minigame_locked ~= p21 then
        local v22
        if p21 then
            v22 = p20.minigame_hotbar
        else
            v22 = p21
        end
        assert(not v22, "ToolApp does not support tool_app_locked and tool_app_hotbar at the same time.")
        p20.minigame_locked = p21
        p20.open_backpack.Parent.Visible = not p21
        p20.hotbar:refresh_minigame_state()
        if p21 and p20.hidden then
            p20:_toggle_hidden()
        end
    end
end
function v10.set_minigame_world_tap_enabled(p23, p24)
    if p23.minigame_world_tap_enabled ~= p24 then
        p23.minigame_world_tap_enabled = p24
    end
end
function v10.set_minigame_hotbar(p25, p26)
    if p25.minigame_hotbar ~= p26 then
        local v27
        if p26 then
            v27 = p25.minigame_locked
        else
            v27 = p26
        end
        assert(not v27, "ToolApp does not support tool_app_locked and tool_app_hotbar at the same time.")
        p25.minigame_hotbar = p26
        p25.open_backpack.Parent.Visible = not p26
        p25.hotbar:refresh_minigame_state()
        if p25.minigame_hotbar and p25.hidden then
            p25:_toggle_hidden()
        end
    end
end
function v10.toggle_editing_hotbar(p28)
    if p28.UIManager.is_visible("BackpackApp") then
        p28.UIManager.set_app_visibility("BackpackApp", false)
    end
    if p28.hotbar.edit_mode then
        p28.hotbar:stop_editing()
    else
        p28.hotbar:start_editing()
    end
end
function v10._update_backpack_icon_size(p29)
    v_u_6.new(p29.open_backpack.UIScale, v_u_13, {
        ["Scale"] = p29.hovering_open_backpack and 1.1 or 1
    })
end
function v10._set_equipped(p_u_30, p31, p32)
    local v33 = false
    for _, v34 in v_u_14 do
        local v35 = p32[v34]
        local v36 = p31[v34]
        if v36 ~= nil or v35 ~= nil then
            if v36 and v35 then
                local v37 = #v36 == #v35
                for v38, v39 in v36 do
                    if not v37 then
                        break
                    end
                    local v40 = v35[v38]
                    if v39.unique == v40.unique then
                        v37 = true
                    else
                        v37 = false
                    end
                end
                if not v37 then
                    goto l6
                end
            else
                ::l6::
                if v35 then
                    v33 = true
                    for _, v41 in v35 do
                        local v42 = p_u_30.active_tools[v41.unique]
                        if v42 then
                            v42:destroy()
                            p_u_30.active_tools[v41.unique] = nil
                        end
                    end
                end
                if v36 then
                    v33 = true
                    for _, v43 in v36 do
                        local v_u_44 = nil
                        v_u_44 = v_u_5.new(v43, function()
                            p_u_30.hotbar:set_using_tool(v_u_44, true)
                        end, function()
                            p_u_30.hotbar:set_using_tool(v_u_44, false)
                        end)
                        p_u_30.active_tools[v43.unique] = v_u_44
                    end
                end
            end
        end
    end
    if v33 then
        p_u_30.hotbar:update()
    end
end
function v10._update_hidden(p45)
    local v46
    if next(p45.visible_locks) then
        v46 = false
    else
        v46 = p45.hidden
    end
    p45:_update_hidden_platform_visuals()
    p45.instance.Frame.Expand.Button.Arrow.Rotation = v46 and 0 or 180
    local v47 = p45.instance.Frame.UIScale.Scale * 30
    local v48 = v_u_8.all
    local v49 = {}
    local v50 = v_u_6.new
    local v51 = p45.instance.Frame.Expand
    local v52 = v_u_13
    local v53 = {}
    local v54
    if v46 then
        v54 = UDim2.new(0.5, 0, 1, 0)
    else
        v54 = p45.initial_expand_pos
    end
    v53.Position = v54
    local v55 = v50(v51, v52, v53)
    local v56 = v_u_6.new
    local v57 = p45.hotbar.instance
    local v58 = v_u_13
    local v59 = {}
    local v60
    if v46 then
        v60 = UDim2.new(0.5, 0, 1, v47)
    else
        v60 = p45.initial_hotbar_pos
    end
    v59.Position = v60
    local v61
    if v46 then
        v61 = Vector2.new(0.5, 0)
    else
        v61 = Vector2.new(0.5, 1)
    end
    v59.AnchorPoint = v61
    __set_list(v49, 1, {v55, v56(v57, v58, v59)})
    return v48(v49)
end
function v10._toggle_hidden(p62)
    if not next(p62.visible_locks) then
        p62.hidden = not p62.hidden
        return p62:_update_hidden()
    end
end
function v10._update_hidden_platform_visuals(p63)
    local v64 = v_u_4.is_using_gamepad()
    p63.instance.Frame.Expand.Visible = not next(p63.visible_locks)
    p63.instance.Frame.Expand.Button.Visible = not v64
    p63.instance.Frame.Expand.XboxButton.Visible = v64
end
function v10.lock_visible(p65, p66)
    p65.visible_locks[p66] = true
    if p65.hidden then
        return p65:_update_hidden()
    end
    p65:_update_hidden_platform_visuals()
    return v_u_8.resolve()
end
function v10.unlock_visible(p67, p68)
    p67.visible_locks[p68] = nil
    return p67:_update_hidden()
end
function v10.start(p_u_69)
    p_u_69.hidden = false
    p_u_69.minigame_locked = false
    p_u_69.minigame_world_tap_enabled = true
    p_u_69.minigame_hotbar = nil
    p_u_69.active_tools = {}
    p_u_69.visible_locks = {}
    p_u_69.initial_expand_pos = p_u_69.instance.Frame.Expand.Position
    p_u_69.initial_hotbar_pos = p_u_69.instance.Frame.Hotbar.Position
    p_u_69.list_layout = p_u_69.instance:FindFirstChild("UIListLayout", true)
    p_u_69.open_backpack = p_u_69.instance:FindFirstChild("OpenBackpack", true)
    p_u_69.gamepad_support = p_u_69.UIManager.wrap(nil, "ToolAppGamepadSupport")
    p_u_69.gamepad_support:hook_app(p_u_69)
    p_u_69.gamepad_toggle_icon = p_u_69.UIManager.wrap(p_u_69.instance.Frame.Expand.XboxButton, "GamepadIcon")
    p_u_69.gamepad_toggle_icon:start({
        ["key"] = Enum.KeyCode.DPadDown
    })
    p_u_69.hotbar = p_u_69.UIManager.wrap(p_u_69.instance:FindFirstChild("Hotbar", true), "ToolAppHotbar")
    p_u_69.hotbar:start()
    p_u_69.open_backpack.MouseEnter:connect(function()
        p_u_69.hovering_open_backpack = true
        p_u_69:_update_backpack_icon_size()
    end)
    p_u_69.open_backpack.MouseLeave:connect(function()
        p_u_69.hovering_open_backpack = false
        p_u_69:_update_backpack_icon_size()
    end)
    p_u_69.open_backpack[v_u_4.mouse_down_or_click()]:connect(function()
        p_u_69.UIManager.set_app_visibility("BackpackApp")
    end)
    if v_u_12 == v_u_4.platform.phone then
        p_u_69.instance.Frame.UIScale.Scale = 0.7
    end
    v_u_9:BindAction("OpenBackpackPC", function(_, p70, _)
        if p70 == Enum.UserInputState.Begin and (p_u_69.UIManager.is_visible(p_u_69.ClassName) and not (p_u_69.minigame_locked or p_u_69.minigame_hotbar)) then
            local v71 = not p_u_69.UIManager.is_visible("BackpackApp")
            p_u_69.UIManager.set_app_visibility("BackpackApp", v71)
        end
    end, false, Enum.KeyCode.B)
    p_u_69:_update_hidden_platform_visuals()
    v_u_4.get_gamepad_changed():Connect(function()
        p_u_69:_update_hidden_platform_visuals()
    end)
    p_u_69.instance.Frame.Expand.Button.MouseButton1Down:connect(function()
        p_u_69:_toggle_hidden()
    end)
    p_u_69:_set_equipped({}, {})
    v_u_3.get_equipped_changed():Connect(function(p72, p73)
        local v74 = nil
        local v75 = p72 or {}
        local v76 = nil
        local v77 = p73 or {}
        for _, v78 in {
            "strollers",
            "toys",
            "food",
            "gifts",
            "pet_accessories",
            "roleplay"
        } do
            if not v74 and v75[v78] then
                v74 = v75[v78][1]
            end
            if not v76 and v77[v78] then
                v76 = v77[v78][1]
            end
            if v74 and v76 then
                break
            end
        end
        p_u_69:_set_equipped({
            ["holdables"] = { v74 },
            ["transport"] = v75.transport,
            ["pets"] = v75.pets
        }, {
            ["holdables"] = { v76 },
            ["transport"] = v77.transport,
            ["pets"] = v77.pets
        })
    end)
end
return v10