--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BackpackApp.BackpackApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("Signal")
local v_u_4 = v_u_1("Maid")
local v_u_5 = v_u_1("ClientData")
local v_u_6 = v_u_1("PlatformM")
local v_u_7 = v_u_1("XboxSupport")
local v_u_8 = v_u_1("InventoryDB")
local v_u_9 = v_u_1("ClientToolManager")
local v_u_10 = v_u_1("SettingsHelper")
local v_u_11 = v_u_1("TranslationHelper")
local v_u_12 = v_u_1("SoundPlayer")
local v_u_13 = v_u_1("ToolDB")
local v_u_14 = v_u_1("CloudValues")
local v_u_15 = v_u_1("package:Promise")
local v_u_16 = v_u_1("package:Sift")
local v17 = v_u_1("package:t")
local v_u_24 = {
    ["default"] = {
        ["callback"] = function(p18, p19, p20)
            v_u_9.backpack_equip(p18, {
                ["use_sound_delay"] = not p19,
                ["equip_as_last"] = p20
            })
        end
    },
    ["stickers"] = {
        ["text"] = "Use",
        ["callback"] = function(p_u_21, _, _)
            local v22 = v_u_1("UIManager")
            v22.set_app_visibility("BackpackApp", false)
            local v_u_23 = v22.apps.PlayerProfileApp
            v_u_23:open_player_profile_for_me()
            v_u_23:on_load_call(function()
                v_u_23:enable_sticker_editing(true)
                v_u_23.stickers:render_category("all", p_u_21.kind, v_u_23.stickers.page)
            end)
        end
    }
}
local v_u_25 = {}
local v_u_26 = {
    ["pets"] = "Pets",
    ["pet_accessories"] = "Pet Wear",
    ["strollers"] = "Strollers",
    ["food"] = "Food",
    ["transport"] = "Vehicles",
    ["toys"] = "Toys",
    ["gifts"] = "Gifts",
    ["roleplay"] = "Roleplay",
    ["wings"] = "Wings",
    ["stickers"] = "Stickers",
    ["sticker_packs"] = "Sticker Packs"
}
local v_u_27 = {}
for _, v28 in v_u_24 do
    v28.hold_callback = v28.hold_callback or v28.callback
end
local v_u_29 = v_u_1("BackpackFavoriteTracker")
local v_u_30 = v_u_1("BackpackCategoryButtons")
local v31 = v2("BackpackApp", v_u_1("UIBaseApp"))
function v31.get_equip_override(_, p32)
    if v_u_24[p32] then
        return v_u_24[p32]
    else
        return v_u_24.default
    end
end
function v31.set_promo_buttons_active(p33, p34)
    p33.promo_buttons_active = p34
end
function v31.are_promo_buttons_active(p35)
    return p35.promo_buttons_active
end
function v31.is_picking_item(p36)
    return p36.picking_item
end
function v31.get_last_item_picked_timestamp(p37)
    return p37.last_item_picked_timestamp
end
local v_u_38 = v17.optional(v17.strictInterface({
    ["visible_backpack_categories"] = v17.optional(v17.array(v17.union(v17.keyOf(v_u_26), v17.literal("favorites")))),
    ["sort_priorities"] = v17.optional(v17.map(v17.string, v17.number)),
    ["keep_cached_scroll_positions_on_open"] = v17.optional(v17.boolean),
    ["allow_callback"] = v17.optional(v17.callback),
    ["picking_source"] = v17.optional(v17.string),
    ["friendship_hidden"] = v17.optional(v17.boolean),
    ["no_results_text"] = v17.optional(v17.string)
}))
function v31.set_visible_categories(p39, p40)
    local v41 = p39.categories:get_category()
    if not table.find(p40, v41) then
        p39.categories:select_category(p40[1], true)
    end
    p39.categories:set_visible_categories(p40)
end
function v31.force_visible_categories(p_u_42, p43)
    local v44
    if p43 == nil then
        v44 = v_u_16.Dictionary.keys(v_u_26)
        table.insert(v44, "favorites")
    else
        v44 = table.clone(p43)
    end
    local v45 = v_u_27
    table.insert(v45, v44)
    p_u_42:set_visible_categories(v44)
    return function()
        table.remove(v_u_27, #v_u_27)
        if next(v_u_27) then
            p_u_42:set_visible_categories(v_u_27[#v_u_27])
        else
            p_u_42.categories:reset_visible_categories()
        end
    end
end
function v31.pick_item(p46, p47)
    local v48 = v_u_38
    assert(v48(p47))
    local v49 = p47 or {}
    if v49.visible_backpack_categories then
        local v50 = #v49.visible_backpack_categories >= 1
        assert(v50, "At least one category must be visible.")
    end
    if v49.no_results_text then
        p46.no_results_text = v49.no_results_text
    end
    p46.friendship_hidden_during_picking = v49.friendship_hidden and true or false
    p46.keep_cached_scroll_positions_on_open = v49.keep_cached_scroll_positions_on_open and true or false
    local v51 = v49.allow_callback
    local v52 = v51 == nil and function(_)
        return true
    end or v51
    if p46.picking_item then
        p46:try_pick_item(nil)
    end
    local v53 = p46.tooltip.hover.options
    local v54 = v_u_16.Dictionary.copyDeep(v53)
    v54.valid_platforms.tablet = true
    v54.valid_platforms.phone = true
    p46.tooltip.hover:set_options(v54)
    p46.picking_item = true
    p46.picking_source = v49.picking_source
    p46.picking_allow_callback = v52
    p46.picking_priorities = v49.sort_priorities or {}
    local v55 = p46:force_visible_categories(v49.visible_backpack_categories)
    p46.UIManager.set_app_visibility(p46.ClassName, true)
    local v56 = p46.item_picked:Wait()
    p46.last_item_picked_timestamp = os.clock()
    p46.picking_item = false
    p46.picking_source = nil
    p46.picking_allow_callback = nil
    p46.picking_priorities = nil
    v55()
    p46.UIManager.set_app_visibility(p46.ClassName, false)
    p46.tooltip.hover:set_options(v53)
    p46.no_results_text = p46.default_no_results_text
    return v56
end
function v31.try_pick_item(p_u_57, p_u_58)
    if not p_u_57.picking_item then
        return false
    end
    if v_u_15.try(function()
        return p_u_58 == nil and true or v_u_15.try(function()
            return p_u_57.picking_allow_callback(p_u_58)
        end):catch(function(p59)
            warn(p59)
            return false
        end):expect()
    end):catch(function(p60)
        warn(p60)
        return false
    end):expect() then
        p_u_57.item_picked:Fire(p_u_58)
    else
        p_u_57.item_picked:Fire(nil)
    end
    return true
end
function v31.refresh_rendered_items(p_u_61, p62)
    if p_u_61.UIManager.app_visibilities.BackpackApp then
        if p_u_61.render_thread == nil or coroutine.status(p_u_61.render_thread) == "dead" then
            p_u_61.render_thread = task.spawn(function()
                p_u_61:_render_category_async()
                while p_u_61.render_again do
                    p_u_61.render_again = false
                    p_u_61:_render_category_async()
                end
                p_u_61.render_thread = nil
            end)
        elseif not p62 then
            p_u_61.render_again = true
        end
    else
        p_u_61.render_queued = true
        return
    end
end
function v31.get_stack_count(p63, p64)
    return p63.item_count_by_unique[p64.unique] or 1
end
function v31.select_category(p65, p66)
    p65.categories:select_category(p66)
end
function v31.set_item_unique_hidden(p67, p68, p69)
    p67.item_hider:set_item_unique_hidden(p68, p69)
end
function v31.reset_hidden_item_tag(p70, p71)
    p70.item_hider:reset_hidden_item_tag(p71)
end
function v31.remove_item_unique_hidden(p72, p73, p74)
    p72.item_hider:remove_item_unique_hidden(p73, p74)
end
function v31.check_if_item_hidden(p75, p76)
    return p75.item_hider:check_if_item_hidden(p76)
end
function v31.is_filtered_out(p77, p78)
    if p77.filter:is_filtered_out(p78) then
        return true
    end
    local v79 = p77.search_bar.search_param
    local v80 = v_u_8[p78.category][p78.id]
    if v79 then
        local v81 = v_u_25[v80.name]
        if not v81 then
            v81 = v_u_11.translate(workspace, v80.name)
            v_u_25[v80.name] = v81
        end
        local v82 = v79:lower()
        local v83 = string.find(v81:lower(), v82, 1, true)
        local v84 = p78.properties.rp_name
        if v84 then
            v84 = string.find(p78.properties.rp_name:lower(), v82, 1, true)
        end
        if not (v83 or v84) then
            return true
        end
    end
    if p77.picking_item then
        if v80.is_hidden_unless_picking_source and p77.picking_source ~= v80.is_hidden_unless_picking_source then
            return true
        end
        if not p77.picking_allow_callback(p78) then
            return true
        end
    elseif v80.is_hidden_unless_picking_source ~= nil then
        return true
    end
    return false
end
function v31.client_predict_item_uses_left(_, p_u_85)
    if p_u_85 then
        local v86 = v_u_8[p_u_85.category][p_u_85.id]
        local v87 = v_u_13[v86.tool]
        local v88 = v86.uses
        p_u_85.properties.uses_left = p_u_85.properties.uses_left or v88
        if p_u_85.properties.uses_left == nil and v88 then
            p_u_85.properties.uses_left = v88
        end
        if p_u_85.properties.uses_left then
            local v89 = p_u_85.properties
            v89.uses_left = v89.uses_left - 1
        end
        if p_u_85.properties.uses_left and (p_u_85.properties.uses_left <= 0 and not v87.on_no_uses_left) then
            v_u_9.unequip(p_u_85)
        end
        return function()
            if p_u_85.properties.uses_left then
                local v90 = p_u_85.properties
                v90.uses_left = v90.uses_left + 1
            end
        end
    end
end
function v31.client_predict_consume_item(p_u_91, p_u_92)
    local v_u_93 = p_u_91:client_predict_item_uses_left(p_u_92)
    p_u_91:set_item_unique_hidden(p_u_92.unique, "consumed_food")
    return function()
        v_u_93()
        p_u_91:remove_item_unique_hidden(p_u_92.unique, "consumed_food")
    end
end
function v31._render_category_async(p_u_94)
    if not v_u_14:getValue("optimization", "backpack_keep_buttons_until_refresh") then
        p_u_94.render_maid:DoCleaning()
    end
    p_u_94.xbox_selection:cache()
    p_u_94.item_count_by_unique = {}
    local v_u_95 = p_u_94.categories:get_category()
    local v96, v97, v98 = v_u_30.get_buttons(v_u_95, v_u_14:getValue("optimization", "backpack_refresh_yields"))
    if v_u_14:getValue("optimization", "backpack_refresh_yields") then
        task.wait()
    end
    if v_u_14:getValue("optimization", "backpack_keep_buttons_until_refresh") then
        p_u_94.render_maid:DoCleaning()
    end
    local v99 = p_u_94.UIManager.wrap(p_u_94.scroll, "GridList"):start()
    debug.profilebegin("BackpackApp:_render_category_async make_buttons")
    local v100 = {}
    for _, v101 in v96 do
        local v102
        if v101.type == "item" then
            v102 = v_u_8[v101.item_data.category][v101.item_data.kind]
        else
            v102 = false
        end
        local v103 = v102 and v102.grid_category or v101.category
        local v104 = v100[v103]
        if v101.item_data then
            p_u_94.item_count_by_unique[v101.item_data.unique] = v101.count
        end
        if not v104 then
            local v105 = p_u_94.categories:get_category_layout_order(v103) * 2
            v104 = p_u_94.UIManager.wrap(p_u_94.content, "BackpackItemGrid"):start(p_u_94)
            v104:get_frame().LayoutOrder = v105
            v100[v103] = v104
            v99:add(v104)
        end
        v104:add(v101.unique, v101)
    end
    debug.profileend()
    local v106 = v99:get_count()
    local v107 = 0
    for v108, v109 in pairs(v100) do
        local v110 = v109:get_frame()
        if v106 > 1 then
            local v111 = p_u_94.content.CategoryTitle:Clone()
            v111.Name = "header_" .. v108
            v111.TextLabel.Text = v_u_26[v108]
            v111.LayoutOrder = v110.LayoutOrder - 1
            v111.Selectable = false
            v111.Visible = true
            v111.Parent = p_u_94.content
            v107 = v107 + v111.AbsoluteSize.Y
            p_u_94.render_maid:GiveTask(v111)
        end
        local v112 = v109:get_height()
        v110.Name = v108
        v110.Size = UDim2.new(1, 0, 0, v112)
        v107 = v107 + v112
    end
    local v113 = Instance.new("Frame")
    v113.Name = "BottomPadding"
    v113.Size = UDim2.new(1, 0, 0, 35)
    v113.BackgroundTransparency = 1
    v113.LayoutOrder = 9999
    v113.Parent = p_u_94.content
    v99:render()
    p_u_94.render_maid:GiveTask(v113)
    p_u_94.render_maid:GiveTask(v99)
    p_u_94.content.NoResults.Text = p_u_94.no_results_text
    if p_u_94.picking_item then
        p_u_94.content.NoResults.Visible = v98 == 0
    else
        local v114 = p_u_94.content.NoResults
        local v115
        if v_u_95 == "favorites" or v97 <= 0 then
            v115 = false
        else
            v115 = v98 == 0
        end
        v114.Visible = v115
    end
    local v116 = p_u_94.content.NoFavorites
    local v117
    if v_u_95 == "favorites" then
        v117 = v106 == 0
    else
        v117 = false
    end
    v116.Visible = v117
    p_u_94.scroll.CanvasSize = UDim2.new(0, 0, 0, v107 + 35)
    p_u_94.button_creator:clear_unused_states(v100)
    p_u_94.xbox_selection:select_best(v100)
    if p_u_94.cached_scroll_positions[v_u_95] then
        p_u_94.scroll.CanvasPosition = p_u_94.cached_scroll_positions[v_u_95]
    end
    p_u_94.cached_scroll_positions[v_u_95] = p_u_94.scroll.CanvasPosition
    p_u_94.render_maid:GiveTask(p_u_94.scroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        p_u_94.cached_scroll_positions[v_u_95] = p_u_94.scroll.CanvasPosition
    end))
end
function v31.show(p_u_118)
    if not p_u_118.keep_cached_scroll_positions_on_open then
        p_u_118.cached_scroll_positions = {}
        p_u_118.scroll.CanvasPosition = Vector2.new(0, 0)
    end
    p_u_118.keep_cached_scroll_positions_on_open = false
    if not v_u_10.get_setting_client({
        ["setting_id"] = "backpack_retain_filter"
    }) then
        p_u_118.filter:reset()
    end
    v_u_29.cache_favorites()
    v_u_30.recalculate_equipped_cache()
    if p_u_118.UIManager.is_visible("JournalApp") then
        p_u_118.UIManager.set_app_visibility("JournalApp", false)
    end
    p_u_118:refresh_rendered_items()
    if not v_u_14:getValue("optimization", "backpack_no_redundant_refresh_on_show") and p_u_118.render_queued then
        p_u_118:_render_category()
        p_u_118.render_queued = false
    end
    v_u_12.Interface:play("Backpack/Open")
    p_u_118.instance.Frame.Visible = true
    v_u_1("CoreUIInsetHelper").run_once_if_intersecting(p_u_118.exit_button.instance, function(p119)
        p_u_118.exit_button.instance.Position = p_u_118.exit_button.instance.Position + UDim2.fromOffset(-p119 - 4, 0)
    end)
end
function v31.hide(p120)
    p120.render_maid:DoCleaning()
    p120.filter:set_visible(false)
    p120.tooltip:hide()
    p120.instance.Frame.Visible = false
    if p120.is_initial_hide then
        p120.is_initial_hide = false
    else
        v_u_12.Interface:play("Backpack/Close")
    end
    p120:try_pick_item(nil)
end
function v31.refresh(p121, p122)
    local v123 = p121.UIManager.is_closed({
        "MainMenuApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "TradePreviewApp",
        "TradeHistoryApp",
        "PlayerSpectateApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "LikesRewardApp"
    })
    if not p122[p121.ClassName] then
        v123 = false
    end
    if p121.UIManager.apps.HouseEditorWrapperApp.editor_open and p121.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v123 = false
    end
    p121:set_visibility(v123)
end
function v31._find_category_of_newly_added_item(p124, p125, p126)
    local v127 = p126 or {}
    for v128, v129 in pairs(p125 or {}) do
        for v130, v131 in pairs(v129) do
            if v127[v128] == nil or v127[v128][v130] == nil then
                local v132 = v_u_8[v131.category][v131.kind]
                return p124.categories:get_associated_backpack_category(v132.grid_category or v131.category)
            end
        end
    end
end
function v31._find_category_of_newly_equipped_item(p133, p134, p135)
    local v136 = p135 or {}
    for v137, v138 in p134 or {} do
        local v139 = {}
        local v140 = nil
        for _, v141 in v136[v137] or {} do
            v139[v141.unique] = true
        end
        for _, v142 in v138 do
            if not v139[v142.unique] then
                v140 = v142
                break
            end
        end
        if v140 then
            local v143 = v_u_8[v140.category][v140.kind]
            return p133.categories:get_associated_backpack_category(v143.grid_category or v140.category)
        end
    end
    return nil
end
function v31.start(p_u_144)
    local v145 = p_u_144.instance.Frame.InputSink
    local v146 = p_u_144.instance.Frame.Body
    local v147 = p_u_144.instance.Frame.Filter
    local v148 = p_u_144.instance.Frame.Header
    local v149 = v146.ScrollComplex.ScrollingFrame
    local v150 = v149.Content
    local v151 = v148.InsetSpace.Filter.FilterButton
    v145.Visible = false
    v147.Visible = false
    p_u_144.sink = v145
    p_u_144.scroll = v149
    p_u_144.content = v150
    p_u_144.cached_scroll_positions = {}
    p_u_144.item_count_by_unique = {}
    p_u_144.render_queued = true
    p_u_144.render_again = false
    p_u_144.render_thread = nil
    p_u_144.render_maid = v_u_4.new()
    p_u_144.promo_buttons_active = true
    p_u_144.category_changed = v_u_3.new()
    p_u_144.picking_item = false
    p_u_144.item_picked = v_u_3.new()
    p_u_144.last_item_picked_timestamp = -1
    p_u_144.default_no_results_text = v150.NoResults.Text
    p_u_144.no_results_text = p_u_144.default_no_results_text
    p_u_144.tooltip = p_u_144.UIManager.wrap(p_u_144.instance, "BackpackTooltip"):start(p_u_144)
    p_u_144.item_hider = p_u_144.UIManager.wrap(v150, "BackpackItemHider"):start(p_u_144)
    p_u_144.button_creator = p_u_144.UIManager.wrap(v150, "BackpackButtonCreator"):start(p_u_144)
    p_u_144.xbox_selection = p_u_144.UIManager.wrap(v150, "BackpackXboxSelection"):start(p_u_144)
    p_u_144.filter = p_u_144.UIManager.wrap(v147, "BackpackFilter"):start(p_u_144, v151)
    p_u_144.search_bar = p_u_144.UIManager.wrap(v148.InsetSpace.Search.TextBox, "GenericSearchBar"):start(function()
        p_u_144:refresh_rendered_items()
    end)
    p_u_144.categories = p_u_144.UIManager.wrap(v146.Categories, "BackpackCategories"):start(p_u_144)
    p_u_144.filter.visibility_changed:Connect(function(p152)
        p_u_144.tooltip:hide()
        p_u_144.tooltip:set_hover_active(not p152)
    end)
    v_u_5.register_server_on_change_hook("inventory", nil, function(_, p153, p154)
        local v155 = not p_u_144.UIManager.is_visible("BackpackApp") and p_u_144:_find_category_of_newly_added_item(p153, p154)
        if v155 then
            p_u_144:select_category(v155)
        end
        p_u_144:refresh_rendered_items()
    end)
    v_u_5.register_server_on_change_hook("equip_manager", nil, function(_, p156, p157)
        local v158 = not p_u_144.UIManager.is_visible("BackpackApp") and p_u_144:_find_category_of_newly_equipped_item(p156, p157)
        if v158 then
            p_u_144:select_category(v158)
        end
        p_u_144:refresh_rendered_items()
    end)
    v_u_5.register_server_on_change_hook("pet_saved_worn_items", nil, function(_, _, _)
        if p_u_144.categories.category == "pet_accessories" then
            p_u_144:refresh_rendered_items()
        end
    end)
    p_u_144.exit_button = p_u_144.UIManager.wrap(v148.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_144.UIManager.set_app_visibility(p_u_144.ClassName, false)
        end
    })
    v_u_6.run({
        ["desktop"] = function()
            p_u_144.scroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                if p_u_144.tooltip:is_pinned() then
                    p_u_144.tooltip:hide()
                end
            end)
        end,
        ["phone"] = function()
            p_u_144.instance.Frame.AnchorPoint = Vector2.new(0.5, 0.5)
            p_u_144.instance.Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        end
    })
    p_u_144.watch = v_u_7.quick_watch({
        ["selection_parent"] = p_u_144.instance.Frame,
        ["default_selection"] = function()
            local v159 = p_u_144.categories:get_category()
            if v159 then
                v159 = p_u_144.categories.buttons[v159]
            end
            return v159 or p_u_144.categories:get_default_console_selection()
        end,
        ["app_name"] = p_u_144.ClassName,
        ["exit_buttons"] = { v148.ExitButton },
        ["quick_open_button"] = Enum.KeyCode.ButtonY,
        ["close_override"] = function()
            if p_u_144.tooltip:check_if_close_override() then
                p_u_144.tooltip:close_pinned_console()
                return false
            end
            if not p_u_144.filter:get_visible() then
                return true
            end
            p_u_144.filter:set_visible(false)
            return false
        end
    })
    p_u_144.is_initial_hide = true
    p_u_144.keep_cached_scroll_positions_on_open = false
end
return v31