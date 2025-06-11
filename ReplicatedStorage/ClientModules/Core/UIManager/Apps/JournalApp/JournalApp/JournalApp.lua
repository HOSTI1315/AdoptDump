--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.JournalApp.JournalApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("XboxSupport")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("Signal")
local v_u_6 = v1("Maid")
local v_u_7 = v1("ClientData")
local v8 = v1("PetProgressionDB")
local v_u_9 = v1("RarityDB")
local v_u_10 = v1("TweenPromise")
local v_u_11 = v1("ItemHider")
local v_u_12 = v1("Polaroid")
local v_u_13 = v1("SharedConstants")
local v_u_14 = v1("new:TextUtil")
local v_u_15 = v1("package:Promise")
local v16 = v1("package:Sift")
local v17 = v1("package:t")
local v_u_18 = v1("JournalFilters")
local v_u_19 = v1("JournalCollectionData")
local v_u_20 = game:GetService("GuiService")
local v_u_21 = game:GetService("RunService")
local v_u_22 = game:GetService("TweenService")
local v_u_23 = v16.List.concat(v8.age_names, v8.neon_age_names)
local v_u_24 = TweenInfo.new(0.1)
local v_u_27 = {
    ["stickers"] = {
        ["categories"] = { "stickers", "gifts" },
        ["filter"] = function(p25)
            return p25.category ~= "gifts" and true or p25.tool == "StickerPackTool"
        end
    },
    ["gifts"] = {
        ["filter"] = function(p26)
            return p26.tool ~= "StickerPackTool"
        end
    }
}
local v28 = v2("JournalApp", v1("UIBaseApp"))
local function v_u_37(p_u_29, p30)
    local v31 = p_u_29.TextLabel
    v_u_14.on_text_bounds({
        ["Instance"] = v31,
        ["Text"] = p30
    }, function(p32)
        local v33 = p_u_29
        local v34 = UDim2.fromOffset
        local v35 = p32.X + 24
        local v36 = p32.Y + 4
        v33.Size = v34(v35, (math.max(v36, 20)))
    end)
    v31.Text = p30
end
function v28._hook_button_effects(p_u_38, p_u_39)
    local v_u_40 = p_u_39.Rotation
    local v_u_41 = 12 * (p_u_39.LayoutOrder % 2 * 2 - 1)
    local v_u_42 = v_u_15.resolve()
    return {
        ["hover_render"] = function()
            v_u_42:cancel()
            v_u_42 = v_u_10.new(p_u_39, TweenInfo.new(0.25), {
                ["Rotation"] = v_u_40 + v_u_41
            })
        end,
        ["up_render"] = function()
            v_u_42:cancel()
            local v43 = {
                ["Rotation"] = v_u_40
            }
            v_u_42 = v_u_10.new(p_u_39, TweenInfo.new(0.25), v43)
            p_u_39.ImageTransparency = 0
            p_u_39.TextLabel.TextTransparency = 0
        end,
        ["mouse_button1_click"] = function()
            p_u_38.current_category = p_u_39.Name
            p_u_38.dropdown.choices = v_u_18.get_filter_choices(p_u_38.current_category)
            p_u_38.dropdown:select_choice(1)
            p_u_38.scroll.CanvasPosition = Vector2.new(0, 0)
            p_u_38:_render_category()
            p_u_38.watch:select_object_in(p_u_38.content)
        end,
        ["disabled_render"] = function()
            p_u_39.ImageTransparency = 0.75
            p_u_39.TextLabel.TextTransparency = 0.85
        end
    }
end
function v28._set_visible_categories(p44, p45)
    if p45 == nil or #p45 == 0 then
        for _, v46 in p44.category_buttons do
            v46:enable()
        end
    else
        for _, v47 in p44.category_buttons do
            v47:disable()
        end
        for _, v48 in p45 do
            if p44.category_buttons[v48] then
                p44.category_buttons[v48]:enable()
            end
        end
    end
end
function v28._preserve_selection(p_u_49)
    if not v_u_4.is_using_gamepad() then
        return function() end
    end
    local v50 = v_u_20.SelectedObject
    if not v50:IsDescendantOf(p_u_49.content) then
        return function()
            p_u_49.watch:select_object(p_u_49.category.Dropdown)
        end
    end
    local v_u_51 = v50.Parent.Name
    return function()
        local v52 = p_u_49.content:FindFirstChild(v_u_51, true)
        if v52 then
            v52 = v52:FindFirstChild("Button")
        end
        if v52 then
            p_u_49.watch:select_object(v52)
        else
            p_u_49.watch:select_object(p_u_49.category.Dropdown)
        end
    end
end
function v28._request_pet_viewport(p53, p54)
    local v55 = {
        ["variant"] = p53.variant,
        ["update_signal"] = p53.variant_changed
    }
    local v_u_56 = v_u_12.new(p54, p53.popup.Polaroid.ViewportFrame, v55)
    p53.popup_maid:GiveTask(function()
        v_u_56:Destroy()
    end)
end
local v_u_57 = v17.strictInterface({
    ["regular"] = v17.boolean,
    ["neon"] = v17.boolean,
    ["mega_neon"] = v17.boolean
})
function v28._set_enabled_variant_buttons(p58, p59)
    local v60 = v_u_57
    assert(v60(p59))
    for _, v61 in p58.variant_buttons do
        local v62 = p59[v61.Name]
        v61.Selectable = v62
        v61.Visible = v62
        v61.Active = v62
    end
end
function v28._set_variant(p63, p64)
    p63.variant = p64 or "regular"
    p63.variant_changed:Fire(p63.variant)
    p63.variant_tween_maid:DoCleaning()
    for _, v65 in ipairs(p63.variant_buttons) do
        local v66 = v65.Name == p64
        local v_u_67 = v_u_22:Create(v65, v_u_24, {
            ["Position"] = UDim2.new(0, v65.Position.X.Offset, 1, v66 and -6 or 0)
        })
        v_u_67:Play()
        p63.variant_tween_maid:GiveTask(function()
            v_u_67:Cancel()
            v_u_67:Destroy()
        end)
    end
end
function v28._set_non_popup_buttons_active(p68, p69)
    for _, v70 in pairs(p68.content:GetDescendants()) do
        if v70:IsA("ImageButton") and v70.Name == "Button" then
            v70.Active = p69
        end
    end
    p68.dropdown:set_enabled(p69)
    p68.search_box.Active = p69
    p68.search_box.TextEditable = p69
    p68.back_button:set_enabled(p69)
    p68.exit_button:set_enabled(p69)
end
function v28._show_popup(p71, p72)
    p71.restore_selection = p71:_preserve_selection()
    local v73 = v_u_19.get_existing_collection_category(p72.category) or {}
    local v74 = v73[p72.kind] or {}
    local v75 = v73[p72.kind] ~= nil
    local v76 = v74.date_acquired
    local v77, v78, v79, v80, v81
    if v76 then
        v77 = os.date("%m", v76)
        v78 = os.date("%B", v76)
        v79 = os.date("%y", v76)
        v80 = os.date("%Y", v76)
        v81 = os.date("%d", v76)
    else
        v81 = "??"
        v79 = "??"
        v80 = "??"
        v78 = "??"
        v77 = "??"
    end
    local v82 = p71.popup.Polaroid.ViewportFrame.LoadingImage
    v82.Image = p72.image
    v82.Visible = true
    local v83 = v_u_23[v74.age or 0] or "Egg"
    local v84 = v74.mega_neon and "Mega Neon" or v83
    p71.popup_entry = p72
    if next(p72.neon_parts) == nil then
        p71:_set_enabled_variant_buttons({
            ["regular"] = false,
            ["neon"] = false,
            ["mega_neon"] = false
        })
    else
        p71:_set_enabled_variant_buttons({
            ["regular"] = true,
            ["neon"] = true,
            ["mega_neon"] = true
        })
    end
    p71:_set_variant("regular")
    p71:_request_pet_viewport(p72)
    p71.popup.Polaroid.PetName.Text = p72.origin_entry.display_name or p72.name
    p71.popup.Polaroid.PetRarity.Text = v_u_9[p72.rarity].name
    p71.popup.Stats.Date.Icon.TextLabel.Text = v77 .. "/" .. v81 .. "/" .. v79
    p71.popup.Stats.Oldest.TextLabel.Text = v75 and v84 and v84 or "???"
    p71.popup.Stats.Hatched.Icon.TextLabel.Text = v74.hatched or "?"
    v_u_37(p71.popup.Stats.Tags.TagA, p72.origin_entry.origin or "N/A")
    v_u_37(p71.popup.Stats.Tags.TagB, p72.origin_entry.year or "N/A")
    local v85 = "You adopted your first " .. p72.name .. " on " .. v78 .. " " .. v81 .. ", " .. v80 .. "."
    p71.popup.FlashCard.TextLabel.Text = not v75 and "???" or v85
    p71.popup.Visible = true
    p71.popup_input_sink.Visible = true
    p71.popup_shadow.Visible = true
    if p72.is_egg then
        p71.watch:select_object(p71.popup.ExitButton)
    else
        p71.watch:select_object(p71.popup.Polaroid.Variants.regular)
    end
    p71.popup_maid:GiveTask(v_u_3.narrow_selection_parent(p71.popup))
    p71.tooltip:set_enabled(false)
    p71:_set_non_popup_buttons_active(false)
end
function v28._hide_popup(p86, p87)
    p86.popup.Visible = false
    p86.popup_shadow.Visible = false
    p86.popup_input_sink.Visible = false
    p86.popup_maid:DoCleaning()
    p86.tooltip:set_enabled(true)
    p86.popup_entry = nil
    p86:_set_non_popup_buttons_active(true)
    if p86.restore_selection and p87 then
        p86.restore_selection()
    end
end
function v28._render_category(p_u_88)
    p_u_88.grid_render_maid:DoCleaning()
    p_u_88.all_categories.Visible = false
    p_u_88.category.Visible = true
    p_u_88.restore_selection = nil
    local v_u_89 = v_u_27[p_u_88.current_category]
    local v90
    if v_u_89 and v_u_89.categories then
        v90 = v_u_89.categories
    else
        v90 = { p_u_88.current_category }
    end
    local v92 = p_u_88.current_filter.get_groups(v90, p_u_88.search_param, function(p91)
        if p_u_88:is_picking() and not p_u_88.picking_allow_callback(p91) then
            return false
        elseif v_u_89 and (v_u_89.filter and not v_u_89.filter(p91)) then
            return false
        else
            return not v_u_11.is_item_hidden(p91)
        end
    end)
    local v93 = {}
    for _, v94 in ipairs(v92) do
        if #v94.entries ~= 0 then
            local v95 = 0
            for _, v96 in pairs(v94.entries) do
                if v_u_19.get_existing_collection_category(v96.category)[v96.kind] then
                    v95 = v95 + 1
                end
            end
            v93[v94.name] = v95
        end
    end
    local v97 = p_u_88.UIManager.wrap(p_u_88.scroll, "GridList"):start()
    for v98, v99 in pairs(v92) do
        if #v99.entries ~= 0 then
            local v100 = p_u_88.title_template:Clone()
            v100.Name = v99.name
            v100.GroupName.Text = v99.name
            v100.Completion.Text = "Completion " .. v93[v99.name] .. "/" .. #v99.entries
            v100.LayoutOrder = v98 * 2 - 1
            v100.Parent = p_u_88.content
            p_u_88.grid_render_maid:GiveTask(v100)
            local v101 = p_u_88.UIManager.wrap(p_u_88.scroll, "JournalItemGrid"):start(p_u_88)
            v101:get_frame().LayoutOrder = v98 * 2
            for _, v102 in ipairs(v99.entries) do
                v101:add(v102.kind, v102)
            end
            v97:add(v101)
        end
    end
    v97:render()
    p_u_88.scroll.CanvasSize = UDim2.new(1, 0, 0, p_u_88.content.UIListLayout.AbsoluteContentSize.Y + 35)
    p_u_88.grid_render_maid:GiveTask(v97)
    p_u_88:_set_non_popup_buttons_active(not p_u_88:is_popup_open())
end
function v28.is_popup_open(p103)
    return p103.popup.Visible
end
function v28.open_popup(p104, p105, p106, p107)
    if p105 then
        if p104.current_category ~= p105.category then
            p104.current_category = p105.category
            p104.dropdown.choices = v_u_18.get_filter_choices(p104.current_category)
        end
        local v108 = p104.dropdown:get_choices_set()[p106] or 1
        if v108 then
            p104.dropdown:select_choice(v108)
        end
        p104:_render_category()
        p104:_show_popup(p105)
        local v109 = p107 and p104.content:FindFirstChild(p107)
        if v109 then
            local v110 = v109.AbsolutePosition - v109.Parent.AbsolutePosition
            p104.scroll.CanvasPosition = Vector2.new(0, v110.Y)
        end
    end
end
function v28.render_entry(p_u_111, p_u_112)
    local v113 = (v_u_19.get_existing_collection_category(p_u_112.category) or {})[p_u_112.kind]
    local v114 = Instance.new("Frame")
    v114.Size = p_u_111.entry_template.Size
    v114.BackgroundTransparency = 1
    v114.Name = p_u_112.kind
    local v115 = p_u_111.entry_template:Clone()
    local v116 = v115.IconFrame
    local v117 = p_u_111.UIManager.wrap(v116, "ItemImage"):start({
        ["entry"] = p_u_112
    })
    if v113 then
        if p_u_112.category == "pets" then
            local v118 = (v113.age or 0) > 6
            local v119 = v113.mega_neon
            p_u_111.UIManager.wrap(v116, "TagDisplay"):start({
                ["kind"] = p_u_112.kind,
                ["properties"] = {
                    ["rideable"] = false,
                    ["flyable"] = false,
                    ["neon"] = v118,
                    ["mega_neon"] = v119,
                    ["multiple_tags_visible"] = true
                }
            })
        elseif p_u_112.category == "stickers" then
            p_u_111.UIManager.wrap(v116, "TagDisplay"):start({
                ["kind"] = p_u_112.kind
            })
        end
    elseif not p_u_111:is_picking() then
        local v120 = Instance.new("UIGradient")
        v120.Color = ColorSequence.new(Color3.new(0, 0, 0))
        v120.Parent = v117.image_label
        local v121 = Instance.new("TextLabel")
        v121.Text = "?"
        v121.Font = Enum.Font.GothamBold
        v121.TextColor3 = Color3.new(1, 1, 1)
        v121.BackgroundTransparency = 1
        v121.AnchorPoint = Vector2.new(0.5, 0.5)
        v121.Position = UDim2.new(0.5, 0, 0.5, 0)
        v121.Size = UDim2.new(1, 0, 1, 0)
        v121.TextSize = 30
        v121.TextStrokeTransparency = 0
        v121.ZIndex = 2
        v121.Parent = v116
    end
    local v_u_122 = p_u_112.category == "pets"
    if v_u_122 or p_u_111:is_picking() then
        v115.Activated:Connect(function()
            if p_u_111:is_picking() then
                local v123 = v_u_122
                if v123 then
                    local v124 = p_u_112.is_doll or p_u_112.is_egg
                    v123 = not v124
                end
                if v123 then
                    p_u_111:_display_pet_property_picker(true, p_u_112)
                else
                    p_u_111:try_pick_entry(p_u_112)
                end
            else
                if v_u_122 then
                    p_u_111:_hide_popup()
                    p_u_111:_show_popup(p_u_112)
                end
                return
            end
        end)
    else
        v115.Active = false
    end
    p_u_111.tooltip:hook_on_hover({
        ["frame"] = v115,
        ["type"] = "item_entry",
        ["item_entry"] = p_u_112
    })
    v115.Name = "Button"
    v115.Parent = v114
    return v114
end
local v125 = v17.optional
local v126 = v17.strictInterface
local v127 = {
    ["visible_journal_categories"] = v17.optional(v17.array(v17.keyOf({
        ["pets"] = "Pets",
        ["pet_accessories"] = "Pet Wear",
        ["strollers"] = "Strollers",
        ["food"] = "Food",
        ["transport"] = "Vehicles",
        ["toys"] = "Toys",
        ["gifts"] = "Gifts",
        ["stickers"] = "Stickers"
    }))),
    ["allow_callback"] = v17.optional(v17.callback),
    ["pet_property_picker_options"] = v17.optional(v17.strictInterface({
        ["header_text"] = v17.string,
        ["confirm_text"] = v17.string
    }))
}
local v_u_128 = v125(v126(v127))
function v28.is_picking(p129)
    return p129.picking_promise:getStatus() == v_u_15.Status.Started
end
function v28.pick_entry(p_u_130, p131)
    local v132 = v_u_128
    assert(v132(p131))
    local v133 = p131 or {}
    if v133.visible_journal_categories then
        local v134 = #v133.visible_journal_categories >= 1
        assert(v134, "At least one category must be visible.")
    end
    local v135 = v133.allow_callback
    local v136 = v135 == nil and function(_)
        return true
    end or v135
    if p_u_130:is_picking() then
        p_u_130.picking_promise:cancel()
    end
    p_u_130.picking_allow_callback = v136
    p_u_130.pet_property_picker_options = v133.pet_property_picker_options
    p_u_130.UIManager.set_app_visibility(p_u_130.ClassName, true)
    p_u_130:_set_visible_categories(v133.visible_journal_categories)
    if v133.visible_journal_categories and #v133.visible_journal_categories == 1 then
        p_u_130.current_category = v133.visible_journal_categories[1]
        p_u_130:_render_category()
        p_u_130.watch:select_object(p_u_130.content)
    elseif v133.visible_journal_categories then
        p_u_130.watch:select_object(p_u_130.all_categories[v133.visible_journal_categories[1]])
    else
        p_u_130.watch:select_object(p_u_130.all_categories.pets)
    end
    p_u_130.picking_promise = v_u_15.fromEvent(p_u_130.entry_picked)
    p_u_130.picking_promise:finally(function()
        p_u_130.picking_allow_callback = nil
        p_u_130.pet_property_picker_options = nil
        p_u_130.UIManager.set_app_visibility(p_u_130.ClassName, false)
        p_u_130:_set_visible_categories(nil)
        p_u_130:_display_pet_property_picker(false)
    end)
    local v137, v138 = p_u_130.picking_promise:await()
    if v137 and v138 then
        return v138.entry, v138.properties
    else
        return nil
    end
end
function v28.try_pick_entry(p_u_139, p_u_140, p141)
    if not p_u_139:is_picking() then
        return false
    end
    if v_u_15.try(function()
        if p_u_140 == nil then
            return false
        else
            return v_u_15.try(function()
                return p_u_139.picking_allow_callback(p_u_140)
            end):catch(function(p142)
                warn(p142)
                return false
            end):expect()
        end
    end):catch(function(p143)
        warn(p143)
        return false
    end):expect() then
        p_u_139.entry_picked:Fire({
            ["entry"] = p_u_140,
            ["properties"] = p141
        })
    else
        p_u_139.picking_promise:cancel()
    end
    return true
end
function v28._set_picked_pet_property(p144, p145, p146)
    p144.picked_pet_properties[p145] = p146 == true and true or nil
    if p146 then
        if p145 == "neon" then
            p144.picked_pet_properties.mega_neon = nil
        elseif p145 == "mega_neon" then
            p144.picked_pet_properties.neon = nil
        end
    end
    p144.property_picker_tag_display:update_tags(p144.picked_pet_properties)
    for v147, v148 in p144.pet_property_buttons do
        local v149 = p144.property_picker_tag_display:is_visible(v147)
        p144.picked_pet_properties[v147] = v149 == true and true or nil
        v148.instance.BackgroundTransparency = v149 and 0 or 0.5
        local v150 = p144.pet_pick_icon_properties[v147]
        if v150 then
            v150.Visible = v149
        end
    end
end
function v28._display_pet_property_picker(p151, p152, p153)
    if p152 then
        if p153 == nil then
            p152 = false
        else
            p152 = p151.pet_property_picker_options ~= nil
        end
    end
    if p151.denarrow_pet_property_picker then
        p151.denarrow_pet_property_picker()
        p151.denarrow_pet_property_picker = nil
    end
    if p152 then
        p151.entry_being_picked = p153
        p151.picked_pet_properties = {}
        for v154, _ in v_u_13.player_profiles.valid_pet_properties do
            p151:_set_picked_pet_property(v154, false)
        end
        p151.pet_property_picker_page.Buttons.ButtonTemplate.Face.TextLabel.Text = p151.pet_property_picker_options.confirm_text
        p151.pet_property_picker_page.Header.TextLabel.Text = p151.pet_property_picker_options.header_text
        p151.pet_property_picker_page.Body.Item.Icon.Image = p153.image or ""
        p151.denarrow_pet_property_picker = v_u_3.narrow_selection_parent(p151.pet_property_picker_page)
    end
    p151.pet_property_picker_page.Visible = p152
    p151.popup_input_sink.Visible = p152
    p151.popup_shadow.Visible = p152
    p151.tooltip:set_enabled(not p152)
    p151:_set_non_popup_buttons_active(not p152)
    if p152 then
        p151.watch:select_object(p151.pet_property_picker_page.Buttons.ButtonTemplate)
    end
end
function v28.show(p155)
    if p155.UIManager.is_visible("BackpackApp") then
        p155.UIManager.set_app_visibility("BackpackApp", false)
    end
    p155.all_categories.Visible = true
    p155.instance.Book.Visible = true
    p155.category.Visible = false
end
function v28.hide(p156)
    p156:_hide_popup()
    p156.instance.Book.Visible = false
    p156.picking_promise:cancel()
end
function v28.refresh(p157, p158)
    local v159 = p157.UIManager.is_closed({
        "MainMenuApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "TradePreviewApp",
        "TradeHistoryApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp"
    })
    if not p158[p157.ClassName] then
        v159 = false
    end
    if p157.UIManager.apps.HouseEditorWrapperApp.editor_open and p157.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v159 = false
    end
    p157:set_visibility(v159)
end
function v28.start(p_u_160)
    local v_u_161 = p_u_160.instance.Desktop
    local v_u_162 = p_u_160.instance.Phone
    v_u_4.run({
        ["desktop"] = function()
            local v163 = workspace.CurrentCamera.ViewportSize
            if v163.X < 746 or v163.Y < 464 then
                v_u_161:Destroy()
                v_u_162.Name = "Book"
            else
                v_u_162:Destroy()
                v_u_161.Name = "Book"
            end
        end,
        ["phone"] = function()
            v_u_161:Destroy()
            v_u_162.Name = "Book"
        end,
        ["tablet"] = "desktop",
        ["console"] = "desktop"
    })
    p_u_160.picking_promise = v_u_15.resolve()
    p_u_160.entry_picked = v_u_5.new()
    p_u_160.category = p_u_160.instance.Book.Category
    p_u_160.content = p_u_160.category.Body.ScrollComplex.ScrollingFrame.Content
    p_u_160.scroll = p_u_160.content.Parent
    p_u_160.title_template = p_u_160.content.TitleTemplate
    p_u_160.title_template.Parent = nil
    p_u_160.row_template = p_u_160.content.RowTemplate
    p_u_160.row_template.Parent = nil
    p_u_160.cells_per_row = p_u_160.instance.Book.CellsPerRow.Value
    p_u_160.entry_template = p_u_160.row_template.EntryTemplate
    p_u_160.entry_template.Parent = nil
    p_u_160.grid_render_maid = v_u_6.new()
    p_u_160.all_categories = p_u_160.instance.Book.AllCategories
    p_u_160.current_category = "pets"
    p_u_160.category_buttons = {}
    for _, v164 in p_u_160.all_categories:GetChildren() do
        if v164:IsA("ImageButton") then
            p_u_160.category_buttons[v164.Name] = p_u_160.UIManager.wrap(v164, "CustomButton"):start(p_u_160:_hook_button_effects(v164))
        end
    end
    p_u_160.popup_entry = nil
    p_u_160.popup_maid = v_u_6.new()
    p_u_160.popup = p_u_160.instance.Book.Popup
    p_u_160.popup_input_sink = p_u_160.instance.Book.PopupInputSink
    p_u_160.popup_shadow = p_u_160.instance.Book.Shadow
    p_u_160.variant = "regular"
    p_u_160.variant_changed = v_u_5.new()
    p_u_160.UIManager.wrap(p_u_160.popup.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_160:_hide_popup(true)
        end
    })
    p_u_160.variant_buttons = {}
    p_u_160.variant_tween_maid = v_u_6.new()
    for v165, v_u_166 in ipairs(p_u_160.popup.Polaroid.Variants:GetChildren()) do
        if v_u_166:IsA("ImageButton") then
            p_u_160.variant_buttons[v165] = v_u_166
            v_u_166.Activated:Connect(function()
                p_u_160:_set_variant(v_u_166.Name)
            end)
        end
    end
    p_u_160.search_param = nil
    p_u_160.search_box = p_u_160.category.Search.TextBox
    p_u_160.search_box.FocusLost:Connect(function()
        local v167 = p_u_160
        local v168 = p_u_160.search_box.Text
        local v169
        if not v168 or v168:gsub("%s+", "") == "" then
            v169 = nil
        else
            v169 = v168:gsub("^%s+", ""):gsub("%s+$", "")
        end
        v167.search_param = v169
        p_u_160.search_box.Text = p_u_160.search_param or ""
        v_u_21.RenderStepped:Wait()
        p_u_160.scroll.CanvasPosition = Vector2.new(0, 0)
        p_u_160:_render_category()
        if p_u_160:is_popup_open() then
            local v170 = p_u_160.popup_entry
            p_u_160:_hide_popup()
            p_u_160:_show_popup(v170)
        end
    end)
    p_u_160.pet_property_picker_page = p_u_160.instance.Book.PetPropertySelection
    p_u_160.pet_property_picker_page.Visible = false
    p_u_160.UIManager.wrap(p_u_160.pet_property_picker_page.Buttons.ButtonTemplate, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_160:try_pick_entry(p_u_160.entry_being_picked, p_u_160.picked_pet_properties)
        end
    })
    p_u_160.pet_property_buttons = {}
    for _, v_u_171 in p_u_160.pet_property_picker_page.Body.Properties:GetChildren() do
        if v_u_171:IsA("ImageButton") then
            p_u_160.pet_property_buttons[v_u_171.name] = p_u_160.UIManager.wrap(v_u_171, "CustomButton"):start({
                ["mouse_button1_click"] = function()
                    p_u_160:_set_picked_pet_property(v_u_171.Name, not p_u_160.picked_pet_properties[v_u_171.Name])
                end
            })
        end
    end
    p_u_160.pet_pick_icon_properties = {}
    for _, v172 in p_u_160.pet_property_picker_page.Body.Item.Properties:GetChildren() do
        if v172:IsA("Frame") or v172:IsA("ImageLabel") then
            p_u_160.pet_pick_icon_properties[v172.Name] = v172
        end
    end
    p_u_160.property_picker_tag_display = p_u_160.UIManager.wrap(p_u_160.pet_property_picker_page.Body.Item.Properties, "TagDisplay"):start({
        ["fixed_property_size"] = v_u_4.get_platform() == "phone" and 18 or 20
    })
    p_u_160.confirm_properties_exit_button = p_u_160.UIManager.wrap(p_u_160.pet_property_picker_page.Header.ExitButton, "DepthButton")
    p_u_160.confirm_properties_exit_button:set_state("cancel")
    p_u_160.confirm_properties_exit_button:start({
        ["mouse_button1_click"] = function()
            p_u_160:_display_pet_property_picker(false)
        end
    })
    p_u_160.exit_button = p_u_160.UIManager.wrap(p_u_160.instance.Book.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_160.UIManager.set_app_visibility(p_u_160.ClassName, false)
            p_u_160.search_box.Text = ""
            p_u_160.search_param = nil
        end
    })
    p_u_160.back_button = p_u_160.UIManager.wrap(p_u_160.category.BackButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_160.category.Visible = false
            p_u_160.all_categories.Visible = true
            p_u_160.search_box.Text = ""
            p_u_160.search_param = nil
            p_u_160.watch:select_object(p_u_160.all_categories:FindFirstChild(p_u_160.current_category))
        end
    })
    p_u_160.current_filter = v_u_18.rarity
    p_u_160.instance.Book.Visible = true
    p_u_160.dropdown = p_u_160.UIManager.wrap(p_u_160.category.Dropdown, "Dropdown"):start({
        ["choose_text"] = p_u_160.current_filter.name,
        ["choices"] = v_u_18.get_filter_choices(p_u_160.current_category),
        ["on_choice_changed"] = function(_, p173)
            p_u_160.current_filter = v_u_18[p173.gsub(p173, "(%u)", "_%1"):lower():sub(2, -1)]
            p_u_160.scroll.CanvasPosition = Vector2.new(0, 0)
            p_u_160:_render_category()
            p_u_160:_hide_popup(true)
        end
    })
    p_u_160.tooltip = p_u_160.UIManager.wrap(p_u_160.instance, "JournalTooltip"):start(p_u_160, p_u_160.instance.Book)
    p_u_160.tooltip:set_mouse_leave_frame(p_u_160.category.Body)
    p_u_160.tooltip:set_hover_options({
        ["valid_platforms"] = {
            ["desktop"] = true,
            ["console"] = true,
            ["tablet"] = true,
            ["phone"] = true
        },
        ["position"] = {
            ["x_clamped"] = false,
            ["y_clamped"] = false,
            ["x_flip"] = false,
            ["y_flip"] = false
        }
    })
    v_u_4.run({
        ["phone"] = function()
            p_u_160.instance.Book.AnchorPoint = Vector2.new(0.5, 0.5)
            p_u_160.instance.Book.Position = UDim2.new(0.5, 0, 0.5, 0)
        end
    })
    p_u_160.watch = v_u_3.quick_watch({
        ["selection_parent"] = p_u_160.instance.Book,
        ["default_selection"] = function()
            if p_u_160.popup.Visible then
                return p_u_160.popup.ExitButton
            elseif p_u_160.pet_property_picker_page.Visible then
                return p_u_160.pet_property_picker_page.Buttons.ButtonTemplate
            else
                return p_u_160.all_categories.pets
            end
        end,
        ["app_name"] = p_u_160.ClassName,
        ["exit_buttons"] = { p_u_160.instance.Book.ExitButton, p_u_160.popup.ExitButton, p_u_160.confirm_properties_exit_button.instance },
        ["close_override"] = function()
            if p_u_160:is_popup_open() then
                p_u_160:_hide_popup(true)
                return false
            end
            if p_u_160.pet_property_picker_page.Visible then
                p_u_160:_display_pet_property_picker(false)
                return false
            end
            if not p_u_160.category.Visible then
                return true
            end
            p_u_160.category.Visible = false
            p_u_160.all_categories.Visible = true
            p_u_160.watch:select_object(p_u_160.all_categories:FindFirstChild(p_u_160.current_category))
            return false
        end
    })
    v_u_7.register_callback_plus_existing("journal_collection", function(_, _, _)
        p_u_160:_render_category()
        if p_u_160:is_popup_open() then
            local v174 = p_u_160.popup_entry
            p_u_160:_hide_popup()
            p_u_160:_show_popup(v174)
        end
    end)
    v_u_7.register_server_on_change_hook("inventory", nil, v_u_19.commit_collection)
    p_u_160:_hide_popup()
end
return v28