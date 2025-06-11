--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.OfferPane (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("package:Sift")
local v_u_5 = v1("TweenPromise")
local v_u_6 = v1("package:Promise")
local v_u_7 = game:GetService("TweenService")
local v_u_8 = v_u_3.get_platform()
local v_u_9 = {
    ["timed_flag_blacklist"] = {
        ["colored_hair_spray"] = true
    }
}
local v_u_10 = {
    ["Removed"] = "rbxassetid://12340047245",
    ["Changed"] = "rbxassetid://12340047372"
}
local v_u_11 = {
    ["Normal"] = 1,
    ["Removed"] = 2,
    ["Changed"] = 3
}
local v12 = v2("OfferPane", v1("UIBaseElement"))
function v12._get_platform(p13)
    if p13._platform_override then
        return p13._platform_override
    else
        return v_u_8
    end
end
function v12.set_platform_override(p14, p15)
    p14._platform_override = p15
end
function v12.calculate_shown_items(p16, p17, _)
    p16.shown_items = {}
    for _, v18 in p17 do
        local v19 = p16.shown_items
        local v20 = {
            ["item"] = v18,
            ["state"] = v_u_11.Normal
        }
        table.insert(v19, v20)
    end
end
function v12._find_first_removed_shown_item(p21)
    for v22, v23 in p21.shown_items do
        if v23.state == v_u_11.Removed then
            return v23, v22
        end
    end
    return nil, nil
end
function v12._find_shown_item_by_unique(p24, p25)
    for v26, v27 in p24.shown_items do
        if v27.item.unique == p25 then
            return v27, v26
        end
    end
    return nil, nil
end
function v12.set_items(p28, p29)
    if not v_u_4.Dictionary.equalsDeep(p28.items, p29) then
        if p28.props.can_add_and_remove_items then
            p28.shown_items = {}
            for v30, v31 in p29 do
                p28.shown_items[v30] = {
                    ["item"] = v31,
                    ["state"] = v_u_11.Normal
                }
            end
        else
            p28:calculate_shown_items(p29, p28.items)
        end
        if p28.busy_indicators and #p28.items ~= #p29 then
            p28:display_busy({}, true)
        end
        p28.items = p29
        p28:_refresh()
    end
end
function v12.set_accepted(p32, p33)
    p32.accepted = p33
    p32:_refresh()
end
function v12.register_remove_item_pressed_callback(p34, p35)
    local v36 = not p34.remove_item_callback
    assert(v36, "Callback already registered.")
    p34.remove_item_callback = p35
end
function v12.register_add_item_pressed_callback(p37, p38)
    local v39 = not p37.add_item_callback
    assert(v39, "Callback already registered.")
    p37.add_item_callback = p38
end
function v12._refresh(p40)
    if p40.accepted then
        p40.instance.Accepted.ImageTransparency = 0.3
    else
        p40.instance.Accepted.ImageTransparency = 1
    end
    p40:_build_all_slots()
    p40:_refresh_grid_container()
end
function v12._build_all_slots(p_u_41)
    p_u_41:_clear_slots()
    for v42 = 1, p_u_41:_get_num_slots_to_render() do
        local v43 = p_u_41:_build_slot(v42)
        local v44 = p_u_41.shown_items[v42]
        if v44 then
            p_u_41.tooltip:hook_on_hover({
                ["frame"] = v43,
                ["type"] = "item_data",
                ["item_data"] = v44.item,
                ["name_strikethrough"] = v44.state == v_u_11.Removed
            })
        else
            p_u_41.tooltip:hook_on_hover({
                ["frame"] = v43,
                ["type"] = "callback",
                ["callback"] = function()
                    p_u_41.tooltip:hide()
                end
            })
        end
        local v45 = p_u_41.slots
        table.insert(v45, v43)
    end
end
function v12._refresh_grid_container(p46)
    local v47 = p46.instance.Slots
    v47.Selectable = false
    local v48 = v47.Parent
    local v49 = v47:FindFirstChildWhichIsA("UIGridLayout")
    local v50 = v47:FindFirstChildWhichIsA("UIPadding")
    if not v49:GetAttribute("OriginalCellSize") then
        v49:SetAttribute("OriginalCellSize", v49.CellSize)
    end
    if not v48:GetAttribute("OriginalSize") then
        v48:SetAttribute("OriginalSize", v48.Size)
        v48:SetAttribute("OriginalPosition", v48.Position)
    end
    if not v47:GetAttribute("OriginalSize") then
        v47:SetAttribute("OriginalSize", v47.Size)
    end
    if p46:_get_platform() == v_u_3.platform.phone and p46.props.mobile_layout_properties then
        local v51 = #p46.shown_items <= p46.props.num_condensed_slots - 1 and "loose" or "compact"
        local v52 = p46.props.mobile_layout_properties.SlotsGridLayout[v51]
        for v53, v54 in pairs(v52) do
            v49[v53] = v54
        end
        local v55 = p46.props.mobile_layout_properties.SlotsPadding[v51]
        for v56, v57 in pairs(v55) do
            v50[v56] = v57
        end
        v49:SetAttribute("OriginalCellSize", v49.CellSize)
    end
    local v58 = #p46.shown_items
    if p46.props.can_add_and_remove_items then
        v58 = v58 + 1
    end
    if v58 > 9 then
        v49.CellSize = v49:GetAttribute("OriginalCellSize") - UDim2.fromOffset(4, 4)
        v48.Size = v48:GetAttribute("OriginalSize") + UDim2.fromOffset(4, 0)
        v48.Position = v48:GetAttribute("OriginalPosition") - UDim2.fromOffset(2, 0)
        v47.Size = v47:GetAttribute("OriginalSize") - UDim2.fromOffset(4, 0)
    else
        v49.CellSize = v49:GetAttribute("OriginalCellSize")
        v48.Size = v48:GetAttribute("OriginalSize")
        v48.Position = v48:GetAttribute("OriginalPosition")
        v47.Size = v47:GetAttribute("OriginalSize")
    end
    if v50 then
        local v59 = UDim2.fromOffset(0, v50.PaddingTop.Offset + v50.PaddingBottom.Offset)
        local v60 = v49.AbsoluteContentSize
        v47.CanvasSize = UDim2.fromOffset(v60.X, v60.Y) + v59
    end
end
function v12._should_slot_be_add_item_button(p61, p62)
    local v63 = p61.props.num_slots
    local v64 = p61.props.can_add_and_remove_items and (p62 == #p61.shown_items + 1 and #p61.shown_items < v63) and true or false
    if p61.accepted then
        v64 = false
    end
    return v64
end
function v12._build_slot(p_u_65, p_u_66)
    if p_u_65:_should_slot_be_add_item_button(p_u_66) then
        local v67 = p_u_65.slot_template.AddItem:Clone()
        v67.Visible = true
        v67.Name = "AddItem"
        v67.LayoutOrder = p_u_66
        v67.Parent = p_u_65.instance.Slots
        p_u_65.add_item = p_u_65.UIManager.wrap(v67, "DepthButton"):start({
            ["mouse_button1_click"] = function()
                if not p_u_65.mobile_lock_offer_change_until or tick() >= p_u_65.mobile_lock_offer_change_until then
                    p_u_65.add_item_callback()
                end
            end,
            ["shine"] = true
        })
        p_u_65.add_item_button = v67
        return v67
    end
    local v68 = p_u_65.slot_template:Clone()
    v68.Visible = true
    v68.Name = "Slot" .. p_u_66
    v68.LayoutOrder = p_u_66
    v68.AddItem:Destroy()
    v68.Parent = p_u_65.instance.Slots
    local v69 = p_u_65.shown_items[p_u_66]
    if v69 then
        v68.ImageTransparency = 0
        local v_u_70 = v69.item
        p_u_65:_init_slot_item_image(v68, v_u_70)
        if not p_u_65.props.do_not_display_tags then
            p_u_65:_init_slot_tag_display(v68, v_u_70)
        end
        if v69.state == v_u_11.Removed then
            v68.ItemImageTemplate.ImageTransparency = 0.7
            local v71 = Instance.new("ImageLabel")
            v71.Name = "RemovedIcon"
            v71.BackgroundTransparency = 1
            v71.Image = v_u_10.Removed
            v71.ZIndex = 64
            v71.Size = UDim2.fromScale(1, 1)
            v71.Parent = v68
            v68.Activated:Connect(function()
                table.remove(p_u_65.shown_items, p_u_66)
                p_u_65:_refresh()
            end)
        elseif v69.state == v_u_11.Changed then
            local v72 = Instance.new("ImageLabel")
            v72.Name = "ChangedIcon"
            v72.BackgroundTransparency = 1
            v72.Image = v_u_10.Changed
            v72.ZIndex = 64
            v72.AnchorPoint = Vector2.new(1, 1)
            v72.Position = UDim2.fromScale(1, 1)
            v72.Size = UDim2.fromScale(0.4, 0.4)
            v72.Parent = v68
            v68.Activated:Connect(function()
                p_u_65.shown_items[p_u_66].state = v_u_11.Normal
                p_u_65:_refresh()
            end)
        end
        if p_u_65.props.can_add_and_remove_items then
            v68.Activated:Connect(function()
                if p_u_65.mobile_lock_offer_change_until and tick() < p_u_65.mobile_lock_offer_change_until then
                    return
                elseif not p_u_65.accepted then
                    p_u_65.remove_item_callback(v_u_70)
                end
            end)
            return v68
        end
    else
        v68.ImageTransparency = 0.5
        if p_u_65.busy_indicators and p_u_66 == #p_u_65.shown_items + 1 then
            p_u_65.busy_indicators.Parent = v68
        end
    end
    return v68
end
function v12._init_slot_item_image(p73, p74, p75)
    local v76 = p73.UIManager.wrap(p74, "ItemDataImage"):start({
        ["item_data"] = p75,
        ["size"] = "icon"
    })
    if not p73.props.force_display_post_trade_values and (p75.properties.friendship_level or 0) >= 1 then
        p73.UIManager.wrap(p74, "ItemBorderIndicator"):start({
            ["style"] = v76.instance.AbsoluteSize.X >= 40 and "friend" or "friend_small"
        })
    end
    v76.instance.ZIndex = 1
end
function v12._init_slot_tag_display(p77, p78, p79)
    p77.UIManager.wrap(p78, "ItemDataTagDisplay"):start({
        ["fixed_property_size"] = p77.props.fixed_property_size,
        ["item_data"] = p79,
        ["wearing"] = false
    })
end
function v12._clear_slots(p80)
    if p80.busy_indicators then
        p80.busy_indicators.Parent = nil
    end
    for _, v81 in ipairs(p80.slots) do
        v81:Destroy()
    end
    p80.slots = {}
end
function v12._get_num_slots_to_render(p82)
    local v83 = #p82.shown_items
    if p82:_get_platform() == v_u_3.platform.phone and v83 < p82.props.num_condensed_slots then
        return p82.props.num_condensed_slots
    end
    if not p82.props.can_add_and_remove_items then
        v83 = v83 - 1
    end
    local v84 = v83 / 3
    local v85 = math.floor(v84) + 1
    return math.clamp(v85, 3, 6) * 3
end
function v12._tween_grid_size_for_phone(p_u_86)
    if p_u_86.props.mobile_layout_properties then
        local v87 = p_u_86.previous_layout_type or "loose"
        local v88 = #p_u_86.shown_items <= p_u_86.props.num_condensed_slots - 1 and "loose" or "compact"
        p_u_86.previous_layout_type = v88
        local v89 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        v_u_7:Create(p_u_86.instance:FindFirstChild("SlotsGridLayout", true), v89, p_u_86.props.mobile_layout_properties.SlotsGridLayout[v88]):Play()
        local v_u_90 = v_u_7:Create(p_u_86.instance:FindFirstChild("SlotsPadding", true), v89, p_u_86.props.mobile_layout_properties.SlotsPadding[v88])
        v_u_90:Play()
        if v87 ~= v88 then
            for v91, v92 in pairs(p_u_86.slots) do
                v92.Visible = v91 <= p_u_86.props.num_condensed_slots
            end
            p_u_86.mobile_lock_offer_change_until = tick() + 0.3 + 0.1
        end
        coroutine.wrap(function()
            if v_u_90.Completed:Wait() == Enum.PlaybackState.Completed then
                for _, v93 in pairs(p_u_86.slots) do
                    v93.Visible = true
                end
            end
        end)()
    end
end
function v12._look_for_existing_slots(p94)
    for _, v95 in pairs(p94.instance.Slots:GetChildren()) do
        if v95:IsA("ImageButton") and v95.Visible == true then
            local v96 = p94.slots
            table.insert(v96, v95)
        end
    end
end
function v12.get_add_item_button_if_exists(p97)
    if p97.add_item_button and p97.add_item_button.Parent ~= nil then
        return p97.add_item_button
    else
        return nil
    end
end
function v12.reset_shown_items(p98)
    p98.shown_items = {}
end
function v12._get_busy_indicator_instance(p99, p100)
    local v101 = p99.busy_indicators
    if v101 then
        v101 = p99.busy_indicators:FindFirstChild(p100)
    end
    if not v101 then
        v101 = p99.full_pane_busy_indicators
        if v101 then
            v101 = p99.full_pane_busy_indicators:FindFirstChild(p100)
        end
    end
    return v101
end
function v12._start_busy_promise(p_u_102, p_u_103)
    if p_u_103 then
        if p_u_102.busy_indicator_promises[p_u_103] then
            p_u_102:_start_fade_promise(p_u_103, true, false)
        else
            local v_u_104 = p_u_102:_get_busy_indicator_instance(p_u_103)
            if v_u_104 then
                local v105
                if p_u_103 == "picking" or p_u_103 == "profile" then
                    local v106 = TweenInfo.new(2.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1, false, 0.5)
                    local v_u_107 = UDim2.fromScale(0.11, 0.11)
                    local v_u_108
                    if p_u_103 == "profile" then
                        v_u_108 = v_u_104.Dots:GetChildren()
                        v_u_104.Dots.Size = p_u_102.instance.Slots.SlotsGridLayout.CellSize
                    else
                        v_u_108 = v_u_104:GetChildren()
                    end
                    v105 = v_u_5.callback(0, 3, v106, function(p109)
                        local v110 = math.ceil(p109)
                        local v111 = tostring(v110)
                        for _, v112 in v_u_108 do
                            if v112.Name == v111 then
                                local v113 = v_u_7
                                local v114 = p109 % 1 - 0.5
                                local v115 = 0.06999999999999999 * v113:GetValue(1 - math.abs(v114) * 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                                v112.Size = v_u_107 + UDim2.fromScale(v115, v115)
                            else
                                v112.Size = v_u_107
                            end
                        end
                    end)
                else
                    v105 = nil
                end
                if v105 then
                    p_u_102.busy_indicator_promises[p_u_103] = v105
                    p_u_102:_start_fade_promise(p_u_103, true, false)
                    v105:finally(function()
                        v_u_104.Visible = false
                        p_u_102.busy_indicator_promises[p_u_103] = nil
                    end)
                end
                return v105
            end
        end
    else
        return
    end
end
function v12._start_fade_promise(p_u_116, p_u_117, p_u_118, p_u_119)
    if p_u_117 then
        if p_u_116.busy_indicator_promises[p_u_117] ~= nil then
            if p_u_116.busy_indicator_fades[p_u_117] then
                p_u_116.busy_indicator_fades[p_u_117]:cancel()
            end
            local v120 = p_u_116:_get_busy_indicator_instance(p_u_117)
            if v120 then
                local v121
                if p_u_117 == "picking" or p_u_117 == "profile" then
                    if p_u_119 then
                        v120.GroupTransparency = p_u_118 and 0 or 1
                        v121 = v_u_6.resolve()
                    else
                        v121 = v_u_5.new(v120, TweenInfo.new(p_u_118 and 0.7 or 0.35), {
                            ["GroupTransparency"] = p_u_118 and 0 or 1
                        })
                    end
                else
                    v121 = nil
                end
                if v121 then
                    p_u_116.busy_indicator_fades[p_u_117] = v121
                    if p_u_118 then
                        v120.Visible = true
                    else
                        v121:andThen(function()
                            local v_u_122 = p_u_116.busy_indicator_promises[p_u_117]
                            if not p_u_119 then
                                return v_u_6.delay(2):andThen(function()
                                    if v_u_122 and p_u_117 ~= p_u_116.busy then
                                        v_u_122:cancel()
                                    end
                                end)
                            end
                            if v_u_122 and not p_u_118 then
                                v_u_122:cancel()
                            end
                            return v_u_6.resolve()
                        end):finally(function()
                            p_u_116.busy_indicator_fades[p_u_117] = nil
                        end)
                    end
                end
                return v121 or v_u_6.resolve()
            end
        end
    else
        return
    end
end
function v12.display_busy(p123, p124, p125)
    local v126 = p123.busy_indicators or p123.full_pane_busy_indicators
    assert(v126, "No busy indicators found in OfferPane.")
    local v127 = p124 or {}
    local v128 = v127.picking and "picking" or (v127.viewing_profile and "profile" or nil)
    if p123.busy ~= v128 or p125 then
        p123.busy = v128
        local v129 = v128 ~= nil
        for v130, _ in p123.busy_indicator_promises do
            if v130 ~= v128 then
                p123:_start_fade_promise(v130, false, p125)
            end
        end
        local v131
        if v128 then
            v131 = p123.busy_indicator_fades[v128]
        else
            v131 = v128
        end
        if v131 then
            v131:cancel()
        end
        if v129 then
            p123:_start_busy_promise(v128)
        end
        p123:_refresh()
    end
end
function v12._transform_slots(p132)
    local v133 = p132.instance.Slots
    local v134 = Instance.new("ScrollingFrame")
    v134.ScrollingDirection = Enum.ScrollingDirection.Y
    v134.TopImage = "rbxassetid://12498673736"
    v134.MidImage = "rbxassetid://12498662181"
    v134.BottomImage = "rbxassetid://12498673509"
    v134.CanvasSize = UDim2.fromScale(0, 0)
    v134.BorderSizePixel = 0
    v134.ScrollBarThickness = p132.props.scrollbar_thickness or v134.ScrollBarThickness
    for _, v135 in {
        "Size",
        "Position",
        "BackgroundTransparency",
        "Name"
    } do
        v134[v135] = v133[v135]
    end
    v134.Parent = v133.Parent
    for _, v136 in v133:GetChildren() do
        v136.Parent = v134
    end
    v133:Destroy()
end
function v12.toggle_ability_to_add_and_remove_items(p137, p138)
    if p138 ~= p137.props.can_add_and_remove_items then
        p137.props.can_add_and_remove_items = not p137.props.can_add_and_remove_items
        p137:_refresh()
    end
end
function v12.start(p139, p140)
    assert(p140, "Props required.")
    p139.props = p140
    p139.items = {}
    p139.shown_items = {}
    p139.slot_tag_displays = {}
    p139.slots = {}
    p139.mobile_lock_offer_change_until = 0
    p139.accepted = false
    p139.previous_layout_type = "loose"
    p139.busy = nil
    p139.busy_indicator_promises = {}
    p139.busy_indicator_fades = {}
    p139.busy_indicators = p139.instance.Slots.SlotTemplate:FindFirstChild("BusyIndicators")
    if p139.busy_indicators then
        p139.busy_indicators.picking.GroupTransparency = 1
        p139.busy_indicators.Parent = nil
    end
    p139.full_pane_busy_indicators = p139.instance:FindFirstChild("BusyIndicators")
    if p139.full_pane_busy_indicators then
        p139.full_pane_busy_indicators.profile.GroupTransparency = 1
        p139.full_pane_busy_indicators.Visible = true
    end
    p139.slot_template = p139.instance.Slots.SlotTemplate
    p139.slot_template.Visible = false
    if p140.platform_override then
        p139:set_platform_override(p140.platform_override)
    end
    p139:_transform_slots()
    p139:_refresh_grid_container()
    local v141 = v_u_4.Dictionary.copyDeep(v_u_9)
    v141.force_display_post_trade_values = p140.force_display_post_trade_values
    p139.tooltip = p139.UIManager.wrap(p140.app.instance, "ItemTooltip"):start(p140.app, p140.optional_xbox_tablet_parent_override, v141)
    p139.tooltip:set_mouse_leave_frame(p139.instance)
    p139:_look_for_existing_slots()
    return p139
end
return v12