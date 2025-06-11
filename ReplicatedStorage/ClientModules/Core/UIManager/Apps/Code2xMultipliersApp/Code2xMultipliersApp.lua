--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.Code2xMultipliersApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("FormatHelper")
local v_u_3 = v1("TweenHelper")
local v_u_4 = v1("LiveOpsTime")
local v_u_5 = v1("ClientData")
local v_u_6 = v1("Signal")
local v7 = v1("Class")
local v_u_8 = game:GetService("TweenService")
local v9 = v7("Code2xMultipliersApp", v1("UIBaseApp"))
function v9._get_icon_to_remaining_time(p10)
    local v11 = {
        ["both"] = 0,
        ["bucks"] = 0,
        ["aging"] = 0
    }
    local v12 = p10:get_remaining_time("bucks")
    local v13 = p10:get_remaining_time("aging")
    local v14 = v12 > 0
    local v15 = v13 > 0
    local v16 = v12 - v13
    local v17
    if v14 then
        if v15 then
            v17 = math.abs(v16) <= 0.1
        else
            v17 = v15
        end
    else
        v17 = v14
    end
    if v17 then
        v11.both = math.max(v12, v13)
        return v11
    end
    if v14 then
        v11.bucks = v12
    end
    if v15 then
        v11.aging = v13
    end
    return v11
end
function v9._create_icon_instance(p18, p19, p20)
    local v21 = p18.template:Clone()
    v21.Name = "Icon" .. p19
    v21.Visible = true
    v21.AnchorPoint = Vector2.new(0.5, 0.5)
    v21.Position = UDim2.new(0.5, 0, 0.5, 0)
    v21.LayoutOrder = p20
    v21.Parent = p18.layout
    for _, v22 in v21.Container.Backing.Icons:GetChildren() do
        v22.Visible = v22.Name == p19
    end
    v_u_8:Create(v21.Container.RadialPinstripe, v_u_3.tween_info({
        ["time"] = 48,
        ["easing_style"] = Enum.EasingStyle.Linear,
        ["repeat_count"] = -1
    }), {
        ["Rotation"] = 360
    }):Play()
    return v21
end
function v9._refresh_icons(p23)
    local v24 = false
    for v25, v26 in p23:_get_icon_to_remaining_time() do
        local v27 = p23.icons[v25]
        if v27 then
            local v28 = v26 > 0
            if v28 then
                local v29 = v_u_2.get_time_breakdown(v26)
                local v30 = v27.Container.Backing.ColorBacking.TimerLabel
                if v29.days > 0 then
                    v30.Text = ("%s DAYS"):format(v29.days)
                else
                    v30.Text = ("%02d:%02d:%02d"):format(v29.hours, v29.minutes, v29.seconds)
                end
            end
            v24 = v28 ~= v27.Visible and true or v24
            v27.Visible = v28
        end
    end
    if v24 and p23.UIManager.has_initialized() then
        p23.icon_visibility_changed:Fire()
    end
end
function v9._refresh_layout_container_size(p31)
    local v32 = p31.layout.UIListLayout.AbsoluteContentSize
    p31.layout_container.Size = UDim2.fromOffset(v32.X, v32.Y)
end
function v9.get_remaining_time(_, p33)
    local v34 = v_u_5.get("bucks_aging_multiplier_manager")
    local v35
    if v34 then
        local v36 = v34.timestamp or -1
        local v37 = (v34.time_remaining or {})[p33] or -1
        local v38 = v_u_4.now() - v36
        local v39 = v37 - math.max(0, v38)
        v35 = math.max(0, v39)
    else
        v35 = 0
    end
    return v35
end
function v9.is_multiplier_active(p40, p41)
    local v42 = p40:get_remaining_time(p41)
    if v42 then
        return v42 > 0
    else
        return false
    end
end
function v9.is_any_multiplier_active(p43)
    return p43:is_multiplier_active("bucks") or p43:is_multiplier_active("aging")
end
function v9.hide(p44)
    p44.instance.Enabled = false
end
function v9.show(p45)
    p45:_refresh_icons()
    p45.instance.Enabled = true
end
function v9.refresh(p46, p47)
    local v48 = p46.UIManager.is_closed({
        "MainMenuApp",
        "RoleplayPayApp",
        "AvatarEditorApp",
        "PlayerSpectateApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp"
    })
    if not p47[p46.ClassName] then
        v48 = false
    end
    p46:set_visibility(v48)
end
function v9.start(p_u_49)
    p_u_49.layout_container = p_u_49.instance.LayoutContainer
    p_u_49.layout = p_u_49.layout_container.Layout
    p_u_49.template = p_u_49.layout.Template
    p_u_49.template.Parent = nil
    p_u_49.icons = {
        ["both"] = p_u_49:_create_icon_instance("Both", 3),
        ["bucks"] = p_u_49:_create_icon_instance("Bucks", 2),
        ["aging"] = p_u_49:_create_icon_instance("Aging", 1)
    }
    p_u_49.icon_visibility_changed = v_u_6.new()
    p_u_49.icon_visibility_changed:Connect(function()
        p_u_49.UIManager.refresh_all_apps()
    end)
    task.spawn(function()
        while true do
            if p_u_49.UIManager.is_visible(p_u_49.ClassName) then
                p_u_49:_refresh_icons()
            end
            task.wait(1)
        end
    end)
    p_u_49:_refresh_layout_container_size()
    p_u_49.layout.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        p_u_49:_refresh_layout_container_size()
    end)
    p_u_49.layout_container.LayoutOrder = 5000
    p_u_49.UIManager.apps.SharedLayoutsApp:register_to_topbar(p_u_49.layout_container, {
        ["padding_top"] = UDim.new(0, 6),
        ["on_refresh"] = function()
            local v50 = p_u_49.UIManager.apps.SharedLayoutsApp.topbar:is_clipping(p_u_49.layout_container)
            p_u_49.layout.Visible = not v50
        end
    })
end
return v9