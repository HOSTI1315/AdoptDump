--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppAilments (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:AilmentsClient")
local v3 = v1("Class")
local v_u_4 = v1("new:ClientAilment")
local v_u_5 = v1("ClientData")
local v_u_6 = v1("Maid")
local v_u_7 = v1("SharedConstants")
local v_u_8 = v1("Signal")
local v9 = v1("TweenHelper")
local v_u_10 = v1("TweenPromise")
local v_u_11 = v9.tween_info({
    ["time"] = 0.5,
    ["easing_style"] = Enum.EasingStyle.Back,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_12 = v9.tween_info({
    ["time"] = 0.2,
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v13 = v3("FocusPetAppAilments", v1("UIBaseElement"))
function v13.capture_focus(p_u_14, p_u_15)
    p_u_14.maid:DoCleaning()
    p_u_14:update_ailments(p_u_15)
    p_u_14:show()
    p_u_14.maid:GiveTask(v_u_2.get_changed_signal():Connect(function(p16)
        if p16 == p_u_15.player then
            p_u_14:update_ailments(p_u_15)
        end
    end))
    p_u_14.maid:GiveTask(v_u_5.register_callback("roleplay_role", function(p17, _)
        if p17 == p_u_15.player then
            p_u_14:update_ailments(p_u_15)
        end
    end))
end
function v13.release_focus(p18)
    p18.maid:DoCleaning()
    p18:hide()
    p18.ailments_list = {}
    p18.hovered_index = nil
end
function v13.show(p19)
    p19.hidden = false
    p19.instance.GroupTransparency = 1
    p19.instance.Visible = true
    for _, v20 in p19.containers do
        v20.End.Position = UDim2.fromScale(0.5, 0.5)
        p19.maid:GiveTask(v_u_10.new(v20.End, v_u_11, {
            ["Position"] = UDim2.fromScale(0.5, 0)
        }))
    end
    p19.maid:GiveTask(v_u_10.new(p19.instance, v_u_11, {
        ["GroupTransparency"] = 0
    }))
end
function v13.hide(p21)
    p21.hidden = true
    p21.instance.GroupTransparency = 0
    p21.instance.Visible = false
end
function v13.tween_show(p22)
    p22.hidden = false
    p22.instance.GroupTransparency = 1
    p22.instance.Visible = true
    local v23 = p22.UIManager.apps.FocusPetApp.mock_ailment:get_slot()
    for v24, v25 in p22.containers do
        if v24 == v23 then
            v25.End.Position = UDim2.fromScale(0.5, 0)
        else
            v25.End.Position = UDim2.fromScale(0.5, -0.1)
            p22.maid:GiveTask(v_u_10.new(v25.End, v_u_12, {
                ["Position"] = UDim2.fromScale(0.5, 0)
            }))
        end
    end
    p22.maid:GiveTask(v_u_10.new(p22.instance, v_u_12, {
        ["GroupTransparency"] = 0
    }))
end
function v13.tween_hide(p26)
    p26.hidden = true
    p26.instance.GroupTransparency = 0
    p26.instance.Visible = true
    local v27 = p26.UIManager.apps.FocusPetApp.mock_ailment:get_slot()
    for v28, v29 in p26.containers do
        if v28 == v27 then
            v29.End.Position = UDim2.fromScale(0.5, 0)
        else
            v29.End.Position = UDim2.fromScale(0.5, 0)
            p26.maid:GiveTask(v_u_10.new(v29.End, v_u_12, {
                ["Position"] = UDim2.fromScale(0.5, -0.1)
            }))
        end
    end
    p26.maid:GiveTask(v_u_10.new(p26.instance, v_u_12, {
        ["GroupTransparency"] = 1
    }))
end
function v13.update_ailments(p30, p31)
    if v_u_5.get("roleplay_role") then
        p30:_render_at_work(p31)
    else
        local v32 = v_u_2.get_ailments_for_pet(p31)
        p30.ailments_list = {}
        for _, v33 in v32 do
            local v34 = p30.ailments_list
            table.insert(v34, v33)
        end
        table.sort(p30.ailments_list, function(p35, p36)
            if p35.created_timestamp == p36.created_timestamp then
                return p35.sort_order < p36.sort_order
            else
                return p35.created_timestamp < p36.created_timestamp
            end
        end)
        for v37, v38 in p30.ailments do
            v38:update_ailment(p30.ailments_list[v37])
            if p30.hovered_index == v37 then
                p30.ailment_hovered_signal:Fire(p30.ailments_list[v37])
            end
        end
    end
end
function v13._render_at_work(p39, p40)
    p39.ailments_list = { nil, nil, (v_u_4.new(p40.player, {
            ["components"] = {},
            ["created_timestamp"] = 0,
            ["kind"] = "at_work",
            ["progress"] = 0,
            ["rate"] = 0,
            ["rate_timestamp"] = -1,
            ["sort_order"] = 0
        })) }
    for v41, v42 in p39.ailments do
        v42:update_ailment(p39.ailments_list[v41])
        v42.empty.Visible = false
        if p39.hovered_index == v41 then
            p39.ailment_hovered_signal:Fire(p39.ailments_list[v41])
        end
    end
end
function v13._on_ailment_hovered(p43, p44)
    if not p43.hidden then
        if p43.hovered_index ~= p44 then
            p43.hovered_index = p44
            p43.ailment_hovered_signal:Fire(p43.ailments_list[p44])
        end
    end
end
function v13._on_ailment_stopped_hovering(p45, p46)
    if not p45.hidden then
        if p45.hovered_index == p46 then
            p45.hovered_index = nil
            p45.ailment_hovered_signal:Fire(nil)
        end
    end
end
function v13._on_ailment_selected(p47, p48)
    if not p47.hidden then
        p47.ailment_selected_signal:Fire(p48)
    end
end
function v13.get_ailment_selected_signal(p49)
    return p49.ailment_selected_signal
end
function v13.get_ailment_hovered_signal(p50)
    return p50.ailment_hovered_signal
end
function v13.move_to_slot(_, p51, p52)
    local v53 = v_u_7.max_concurrent_ailments
    local v54 = -120 + (p52 - 1) / (v53 - 1) * 120 * 2
    p51.Rotation = v54
    p51.End.Rotation = -v54
end
function v13.start(p_u_55)
    p_u_55.maid = v_u_6.new()
    p_u_55.hidden = true
    p_u_55.instance.Visible = false
    p_u_55.instance.GroupTransparency = 1
    p_u_55.hovered_index = 0
    p_u_55.template = p_u_55.instance.AilmentContainer
    p_u_55.template.Parent = nil
    local v56 = v_u_7.max_concurrent_ailments
    p_u_55.ailment_hovered_signal = v_u_8.new()
    p_u_55.ailment_selected_signal = v_u_8.new()
    p_u_55.containers = {}
    p_u_55.ailments = {}
    p_u_55.ailments_list = {}
    for v_u_57 = 1, v56 do
        local v58 = p_u_55.template:Clone()
        p_u_55:move_to_slot(v58, v_u_57)
        v58.Parent = p_u_55.instance
        p_u_55.containers[v_u_57] = v58
        p_u_55.ailments[v_u_57] = p_u_55.UIManager.wrap(v58.End, "Ailment")
        p_u_55.ailments[v_u_57]:start({
            ["preference_always_visible"] = true,
            ["interactable"] = true,
            ["resize_on_hover"] = true,
            ["show_percentage"] = true,
            ["show_tags"] = true,
            ["on_select"] = function(p59)
                p_u_55:_on_ailment_selected(p59)
            end,
            ["on_hover"] = function()
                p_u_55:_on_ailment_hovered(v_u_57)
            end,
            ["on_stop_hovering"] = function()
                p_u_55:_on_ailment_stopped_hovering(v_u_57)
            end
        })
    end
end
return v13