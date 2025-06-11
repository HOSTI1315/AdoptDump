--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfileCategories.BasePlayerProfileWidget (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Signal")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("TweenPromise")
local v6 = v2("BasePlayerProfileWidget")
function v6.__init(p7, p8, p9)
    p7.UIManager = p8
    p7.instance = p9
    p7.instance.Size = UDim2.fromScale(1, 1)
    p7.editing = nil
    p7.was_editing = nil
    p7.editing_changed_signal = nil
    p7.expanded = false
    p7.page = 1
    p7.slot = 1
    p7.color = nil
    p7.entry = nil
    p7.expand_buttons = nil
    p7.player_profile = nil
    p7.player_profile_app = nil
end
function v6.get_save_data(_)
    error("Not implemented")
end
function v6.render(_)
    error("Not implemented")
end
function v6.start(_, _, _)
    error("Not implemented")
end
function v6.on_shrink(_) end
function v6.on_expand(_) end
function v6.set_profile_editing(_, _) end
function v6.select(_) end
function v6.on_edited(_) end
function v6.recolor(_, _) end
function v6.save(p10)
    if not p10.editing and (p10.player_profile and p10.player_profile.player == game.Players.LocalPlayer) then
        local v11 = p10.player_profile:get_slot_data(p10.page, p10.slot)
        if v11 then
            v11.widget_data = p10:get_save_data()
            v11.temp_data = p10:get_temp_data()
        end
        if p10.editing ~= nil then
            p10.player_profile:update_slot_data(v11, p10.page, p10.slot)
        end
    end
end
function v6.get_temp_data(_) end
function v6.set_page_slot(p12, p13, p14)
    p12.page = p13 or p12.page
    p12.slot = p14 or p12.slot
end
function v6.set_editing(p15, p16)
    if p15.editing ~= p16 then
        p15.was_editing = p15.editing
        p15.editing = p16
        p15:render()
        if p15.editing_changed_signal and p15.was_editing == not p15.editing then
            p15.editing_changed_signal:Fire(p15.editing)
        end
        if p15.was_editing == true and p15.editing == false then
            p15:on_edited()
            p15:save()
        end
    end
end
function v6.get_edited_changed_signal(p17)
    if p17.editing_changed_signal then
        return p17.editing_changed_signal
    end
    p17.editing_changed_signal = v_u_3.new()
    return p17.editing_changed_signal
end
function v6.set_expanded(p18, p19)
    if p18.entry.expandable and p18.expanded ~= p19 then
        p18.expanded = p19
        if p19 then
            p18:on_expand()
        else
            p18:on_shrink()
        end
        p18:render_expand_buttons()
    end
end
function v6.initialize_expand_buttons(p_u_20, p21)
    p_u_20.expand_buttons = p21
    local v_u_22 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v_u_23 = p_u_20.expand_buttons.Left
    local v_u_24 = p_u_20.expand_buttons.Right
    local function v_u_33(p_u_25, p_u_26)
        local v_u_27 = {}
        for _, v28 in p_u_25:GetDescendants() do
            v_u_27[v28] = v28.ImageTransparency
        end
        v_u_5.callback(0, 1, v_u_22, function(p29)
            for _, v30 in p_u_25:GetDescendants() do
                local v31 = v30.Name == "Shadow" and 0.65 or 0
                if p_u_26 then
                    v31 = v31 + 0.2
                end
                local v32 = v_u_27[v30]
                v30.ImageTransparency = v32 + (v31 - v32) * p29
            end
        end)
    end
    local function v_u_38(p34, p35)
        if v_u_4.is_using_gamepad() then
            local v36 = p_u_20.player_profile_app:get_widget(p34)
            if v36 then
                local v37 = v36.instance:FindFirstChild("ExpandButtons")
                if v37 then
                    v37 = v37:FindFirstChild(p35)
                end
                if v37 then
                    p_u_20.player_profile_app:select_slot(p34)
                    p_u_20.player_profile_app:set_gamepad_selection(v37)
                end
            end
        else
            return
        end
    end
    local v39 = v_u_4.get_platform() == "phone" and true or v_u_4.get_platform() == "tablet"
    p_u_20.left_expand = p_u_20.UIManager.wrap(v_u_23, "CustomButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_20.expanded then
                local v40 = p_u_20.slot + (p_u_20.slot % 2 == 0 and 0 or 1)
                if v40 ~= p_u_20.slot then
                    p_u_20.player_profile:swap_slots(p_u_20.page, p_u_20.slot, p_u_20.page, v40, {
                        ["keep_expansion"] = true
                    })
                    p_u_20.player_profile:set_slot_expanded(p_u_20.page, v40, false)
                    v_u_38(v40, v_u_23.Name)
                    return
                end
            end
            p_u_20.player_profile:set_slot_expanded(p_u_20.page, p_u_20.slot, not p_u_20.expanded)
        end,
        ["hover_render"] = not v39 and function()
            v_u_33(v_u_23, false)
        end or nil,
        ["up_render"] = not v39 and function()
            v_u_33(v_u_23, true)
        end or nil
    })
    p_u_20.right_expand = p_u_20.UIManager.wrap(v_u_24, "CustomButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_20.expanded then
                local v41 = p_u_20.slot - (p_u_20.slot % 2 == 0 and 1 or 0)
                if v41 ~= p_u_20.slot then
                    p_u_20.player_profile:swap_slots(p_u_20.page, p_u_20.slot, p_u_20.page, v41, {
                        ["keep_expansion"] = true
                    })
                    p_u_20.player_profile:set_slot_expanded(p_u_20.page, v41, false)
                    v_u_38(v41, v_u_24.Name)
                    return
                end
            end
            p_u_20.player_profile:set_slot_expanded(p_u_20.page, p_u_20.slot, not p_u_20.expanded)
        end,
        ["hover_render"] = not v39 and function()
            v_u_33(v_u_24, false)
        end or nil,
        ["up_render"] = not v39 and function()
            v_u_33(v_u_24, true)
        end or nil
    })
    p_u_20:render_expand_buttons()
end
function v6.render_expand_buttons(p42)
    if p42.expand_buttons then
        if p42.player_profile_app.editing_slot == p42.slot and p42.player_profile_app.is_editing_profile then
            if p42.slot % 2 == 1 then
                p42.left_expand.instance.Visible = p42.expanded
                p42.right_expand.instance.Visible = p42.player_profile_app:get_widget(p42.slot + 1) == nil
            else
                p42.right_expand.instance.Visible = p42.expanded
                p42.left_expand.instance.Visible = p42.player_profile_app:get_widget(p42.slot - 1) == nil
            end
        else
            p42.left_expand.instance.Visible = false
            p42.right_expand.instance.Visible = false
        end
        local v43 = p42.expanded and 180 or 0
        p42.left_expand.instance.Face.Icon.Rotation = v43
        p42.right_expand.instance.Face.Icon.Rotation = v43
    end
end
function v6.destroy(p44)
    p44.instance:Destroy()
end
return v6