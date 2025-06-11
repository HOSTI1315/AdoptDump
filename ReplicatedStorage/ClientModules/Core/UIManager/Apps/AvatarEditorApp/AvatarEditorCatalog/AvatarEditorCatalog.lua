--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AvatarEditorApp.AvatarEditorCatalog (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.new.modules.Utf8Tools)
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("ClientData")
local v_u_4 = v_u_2("PlatformM")
local v_u_5 = v_u_2("RouterClient")
local v6 = v_u_2("Class")
local v_u_7 = v_u_2("AvatarCategoriesDB")
local v_u_8 = v_u_2("PetAvatarCategoriesDB")
local v_u_9 = v_u_2("AvatarClientManager")
local v_u_10 = v_u_2("Set")
local v_u_11 = v_u_2("TableUtil")
local v_u_12 = v_u_2("UnlockableCatalogItemsDB")
local v_u_13 = v_u_2("CatalogItemImage")
local v_u_14 = v_u_2("AvatarEditorHelper")
local v_u_15 = v_u_2("InventoryDB")
local v_u_16 = v_u_2("RarityDB")
local v_u_17 = v_u_2("PetAccessoryCompatHelper")
local v_u_18 = v_u_2("Signal")
local v_u_19 = v_u_2("package:Sift")
local v20 = v6("AvatarEditorCatalog", v_u_2("UIBaseElement"))
local v21 = game:GetService("LocalizationService")
local v_u_22 = game:GetService("TweenService")
local v_u_23 = game:GetService("MarketplaceService")
local v_u_24 = utf8.char(57346)
local v_u_25 = v_u_10.new({
    4935527710,
    4935529150,
    4935528365,
    4935529344,
    2725304903,
    2725304998
})
local v_u_26 = {
    [3095466070] = "Oldschool",
    [131830026] = "Mage",
    [131830035] = "Robot",
    [132923214] = "Elder",
    [132923199] = "Werewolf",
    [131830034] = "Superhero",
    [132923200] = "Astronaut",
    [132923221] = "Pirate",
    [131830032] = "Levitation",
    [131830028] = "Knight",
    [131830031] = "Ninja",
    [132923205] = "Bubbly",
    [131830036] = "Stylish",
    [327051961] = "Rthro",
    [131830033] = "Zombie",
    [131830021] = "Vampire",
    [131830024] = "Cartoony",
    [2801602104] = "Dress / Skirt",
    [132923209] = "Toy"
}
local v_u_27 = v_u_4.get_platform()
local v_u_28 = v21:GetTranslatorForPlayer(game.Players.LocalPlayer)
function v20.recalculate_catalog_size(p29)
    local v30 = Vector2.new(game.Players.LocalPlayer:GetMouse().ViewSizeX, game.Players.LocalPlayer:GetMouse().ViewSizeY)
    local v31 = v_u_27 == v_u_4.platform.phone and 0.55 or 0.45
    local v32 = v30.X * v31
    local v33 = math.floor(v32) - p29.CATALOG_SIZE
    local v34 = v33 - (p29.catalog_content.AbsoluteSize.X + v33 - p29.catalog_content.UIPadding.PaddingLeft.Offset * 2) % (p29.ITEM_SIZE + p29.catalog_content.UIGridLayout.CellPadding.X.Offset)
    p29.CATALOG_SIZE = p29.CATALOG_SIZE + v34
    p29.instance.Size = UDim2.new(0, p29.CATALOG_SIZE + p29.CATEGORY_SLIDER_WIDTH, 1, 0)
    if p29.avatar_editor_app:get_screen() == "start_screen" then
        p29.instance.Position = UDim2.new(1, p29.CATALOG_SIZE, 0, 0)
    end
end
function v20.recalculate_sizing(p35)
    p35:recalculate_catalog_size()
    local _ = p35.subcategories.AbsoluteSize.X
end
local function v_u_41(p36, p37)
    local v38 = {}
    for _, v39 in pairs(p36:GetDescendants()) do
        if v39:IsA("GuiObject") then
            table.insert(v38, v39)
        end
    end
    table.insert(v38, p36)
    for _, v40 in pairs(v38) do
        v40.Size = UDim2.new(v40.Size.X.Scale, v40.Size.X.Offset * p37, v40.Size.Y.Scale, v40.Size.Y.Offset * p37)
    end
end
function v20.open(p42)
    v_u_22:create(p42.instance, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Position"] = UDim2.new(1, 0, 0, 0)
    }):Play()
end
function v20.close(p43, p44)
    p43.category = nil
    p43.subcategory = nil
    local v45 = p44 and 0 or 0.5
    v_u_22:create(p43.instance, TweenInfo.new(v45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Position"] = UDim2.new(1, p43.CATALOG_SIZE, 0, 0)
    }):Play()
    if v45 > 0 then
        wait(v45)
    end
    if p43.avatar_editor_app:get_screen() ~= "full_catalog" then
        p43.wrapped_category_slider:deselect_all()
        p43:clear_catalog_items()
    end
end
function v20.clear_catalog_items(p46)
    for _, v47 in pairs(p46.catalog_content:GetChildren()) do
        if v47:IsA("ImageButton") then
            v47:Destroy()
        end
    end
    p46.catalog_scrolling_frame.CanvasPosition = Vector2.new(0, 0)
    p46.page = 1
    p46.query_id = (p46.query_id or 0) + 1
    p46.rendered_item_count = 0
    p46.rendered_border_frames = {}
    p46:_set_no_results_ui(nil)
    p46:_hide_floating_details_bar()
end
function v20.get_size(p48)
    return p48.instance.Size.X.Offset
end
function v20.get_equipped_ids_set(_, p49, p50, p51)
    local v52 = (v_u_3.get("avatar_manager") or {})[p49] or {}
    local v53 = p49 == "pet" and (v52[p51] or {}) or v52
    local v54 = {}
    local v55
    if p49 == "pet" then
        v55 = v_u_8
    else
        v55 = v_u_7
    end
    if p50 == "all" then
        for _, v56 in pairs(v53) do
            for _, v57 in pairs(v56) do
                v54[v57] = true
            end
        end
        return v54
    end
    if p50 == "other" then
        local v58 = v_u_19.Set.fromList(v55.ordered_categories)
        for v59, v60 in pairs(v53) do
            if not v58[v59] then
                for _, v61 in pairs(v60) do
                    v54[v61] = true
                end
            end
        end
        return v54
    end
    local v62 = {}
    local v63 = v55.categories[p50]
    if v63 and v63.soft_category then
        for _, v65 in v63.subcategory_to_category_remap or {} do
            if typeof(v65) == "table" then
                local v65 = v65.category
            end
            v62[v65] = true
        end
    elseif p50 ~= nil then
        v62[p50] = true
    end
    for v66, _ in v62 do
        local v67 = v53[v66] or {}
        for _, v68 in ipairs(v67) do
            v54[v68] = true
        end
    end
    return v54
end
function v20.refresh_item_borders(p69)
    local v70 = p69.avatar_editor_app:get_focused_avatar_type()
    local v71
    if v70 == "pet" then
        v71 = p69.avatar_editor_app.focus_switcher:get_focused_pet_wrapper()
        if v71 then
            v71 = v71.pet_unique
        end
    else
        v71 = nil
    end
    local v72 = p69:get_equipped_ids_set(v70, p69.category, v71)
    local v73
    if v70 == "pet" then
        local v74 = v_u_3.get("pet_saved_worn_items")
        v73 = v74 and v74.accessory_to_pet_map or {}
    else
        v73 = v72
    end
    local v75 = p69.rendered_border_frames
    for v76, _ in pairs(v75) do
        local v77 = not p69.unequip_prediction_set[v76]
        if v77 then
            v77 = v73[v76]
        end
        if not v77 then
            v75[v76]:destroy()
            v75[v76] = nil
        end
    end
    local v78 = p69.catalog_content
    for v79, _ in pairs(v73) do
        if not p69.unequip_prediction_set[v79] then
            if v75[v79] ~= nil then
                v75[v79]:update_style("worn_by_pet")
            else
                local v80
                if v79 then
                    v80 = v78:FindFirstChild(v79)
                else
                    v80 = v79
                end
                if v80 ~= nil then
                    v75[v79] = p69.UIManager.wrap(v80, "ItemBorderIndicator"):start({
                        ["style"] = "worn_by_pet"
                    })
                end
            end
        end
    end
    for v81, _ in pairs(v72) do
        if v75[v81] ~= nil then
            v75[v81]:update_style("equipped")
        end
    end
end
function v20._get_rendered_subcategories(p82)
    local v83 = p82:get_focused_categories_list()[p82.category]
    local v84 = v83.subcategories
    local v85 = v83.hide_subcategory
    local v86 = {}
    for _, v87 in v84 do
        local v88
        if v85 then
            v88 = v85[v87]
        else
            v88 = v85
        end
        if typeof(v88) == "function" then
            if not v88() then
                ::l8::
                table.insert(v86, v87)
            end
        elseif not v88 then
            goto l8
        end
    end
    return v86
end
function v20.render_subcategories(p_u_89)
    for _, v90 in pairs(p_u_89.subcategories:GetChildren()) do
        if v90:IsA("ImageButton") then
            v90:Destroy()
        end
    end
    local v91 = p_u_89:_get_rendered_subcategories()
    if #v91 > 1 then
        local v_u_92 = {}
        for v93, v_u_94 in pairs(v91) do
            local v95 = p_u_89.subcategory_template:clone()
            v95.Name = v_u_94
            v95.Face.TextLabel.Text = v_u_94
            v95.LayoutOrder = v93
            v95.Parent = p_u_89.subcategories
            local v_u_96 = p_u_89.UIManager.wrap(v95, "DepthButton")
            table.insert(v_u_92, v_u_96)
            if v_u_94 == p_u_89.subcategory then
                v_u_96:set_state("selected")
            end
            v_u_96:start({
                ["mouse_button1_down"] = function()
                    for _, v97 in pairs(v_u_92) do
                        v97:set_state("normal")
                    end
                    v_u_96:set_state("selected")
                    p_u_89.subcategory = v_u_94
                    p_u_89:clear_catalog_items()
                    p_u_89:render_items()
                    p_u_89:render_premium_button()
                    p_u_89:resize_canvas_to_correct_size()
                end
            })
        end
    end
end
function v20.resize_canvas_to_correct_size(p98)
    local v99 = p98:_get_rendered_subcategories()
    if v_u_27 == v_u_4.platform.phone then
        p98.subcategories.Size = UDim2.new(1, 4, 0, 70)
        p98.instance.Main.Body.ScrollComplex.Size = p98.instance.Main.Body.ScrollComplex.Size + UDim2.new(0, 0, 0, 15)
    end
    if p98.original_scroll_complex_size == nil then
        p98.original_scroll_complex_size = p98.instance.Main.Body.ScrollComplex.Size
        p98.original_subcategories_size = p98.subcategories.Size
    end
    if #v99 <= 1 then
        p98.instance.Main.Body.ScrollComplex.Size = p98.original_scroll_complex_size + UDim2.new(0, 0, 0, p98.original_subcategories_size.Y.Offset)
        p98.subcategories.Size = p98.original_subcategories_size - UDim2.new(0, 0, 0, p98.original_subcategories_size.Y.Offset)
    elseif #v99 <= 3 then
        p98.instance.Main.Body.ScrollComplex.Size = p98.original_scroll_complex_size + UDim2.new(0, 0, 0, p98.original_subcategories_size.Y.Offset / 2)
        p98.subcategories.Size = p98.original_subcategories_size - UDim2.new(0, 0, 0, p98.original_subcategories_size.Y.Offset / 2)
        p98.subcategories.UIGridLayout.CellSize = UDim2.new(1 / #v99, -4, 1, -4)
    else
        p98.instance.Main.Body.ScrollComplex.Size = p98.original_scroll_complex_size
        p98.subcategories.Size = p98.original_subcategories_size
        if #v99 == 4 then
            p98.subcategories.UIGridLayout.CellSize = UDim2.new(0.5, -4, 0.5, -4)
        else
            p98.subcategories.UIGridLayout.CellSize = UDim2.new(0.3333333333333333, -4, 0.5, -4)
        end
    end
    if not (p98.premium_unlock_button.Visible or p98.navigate_to_hat_shop_button.Visible) then
        p98.instance.Main.Body.ScrollComplex.Size = p98.instance.Main.Body.ScrollComplex.Size + UDim2.new(0, 0, 0, p98.premium_unlock_button.Size.Y.Offset)
    end
end
function v20.put_on(p100, p101, p102)
    local v103
    if p100.category == "faces" then
        v103 = p100.subcategory == "Exclusive"
    else
        v103 = false
    end
    local v104
    if v103 then
        v104 = (v_u_25:has(p102) or p100:authorize_premium_face_gamepass_or_prompt()) and true or false
    else
        local v105
        if p101 == "pet" then
            v105 = nil
        else
            v105 = v_u_12[p102] or nil
        end
        if v105 and not v_u_10.new(v_u_3.get("unlocked_catalog_items")):has(p102) then
            if v_u_2("ShopM").pre_buy(v105.cost, {
                ["purchase_confirmation_message"] = "Unlock " .. v105.name .. " for $%d?",
                ["prompt_confirmation"] = true
            }) then
                v_u_5.get("AvatarAPI/UnlockItem", p102):FireServer(p102, p101)
                v104 = false
            else
                v104 = false
            end
        else
            v104 = true
        end
    end
    if v104 then
        local v106 = p100.avatar_editor_app:get_focused_avatar_type()
        local v107
        if v106 == "pet" then
            v107 = p100.avatar_editor_app.focus_switcher:get_focused_pet_wrapper()
        else
            v107 = nil
        end
        local v108 = v_u_9.convert_soft_category_to_actual_category(v106, p100.category, p100.subcategory, p102)
        v_u_9.put_on(v106, v108, p102, v107)
    end
end
function v20.set_text(p109, p110, p111, p112)
    local v113 = v_u_3.get("gamepass_manager")
    local v114
    if p109.category == "faces" then
        v114 = p109.subcategory == "Exclusive"
    else
        v114 = false
    end
    local v115 = v_u_11.is_member(v113, "premium_faces")
    if v114 and (v_u_25:has(p112) and not v115) then
        p111.TextLabel.Text = "Free!"
        return
    elseif p109.category == "animations" then
        local v116 = v_u_26[p112]
        if v116 then
            p111.TextLabel.Text = v116
        else
            p111.TextLabel.Text = ""
        end
    else
        local v117
        if p110 == "pet" then
            v117 = nil
        else
            v117 = v_u_12[p112] or nil
        end
        if v117 and not v_u_10.new(v_u_3.get("unlocked_catalog_items")):has(p112) then
            p111.TextLabel.Text = "$" .. v117.cost
        else
            p111.TextLabel:Destroy()
        end
    end
end
function v20._set_no_results_ui(p118, p119, p120)
    local v121 = p118.catalog_scroll_complex.NoResultsFoundFrame
    if p119 then
        v121.Visible = true
        v121.TextLabel.Text = p119
    else
        v121.Visible = false
    end
    if p120 then
        p118.catalog_scroll_complex.NoResultsFoundFrame.ClearSearch.Visible = false
    else
        p118.catalog_scroll_complex.NoResultsFoundFrame.ClearSearch.Visible = true
    end
end
function v20._show_floating_details_bar(p_u_122, p123, p124, p125)
    p_u_122:_hide_floating_details_bar()
    if p123 == "pet" then
        return
    else
        local v126 = p125[p124]
        if v126 then
            local v127 = v126.name
            local v128 = v126.creator
            local v129 = v126.price
            if v127 then
                if v128 then
                    p_u_122.floating_bar_asset_details = v126
                    p_u_122.floating_details_bar.Parent = p_u_122.floating_details_bar_original_parent
                    p_u_122.floating_details_bar.DetailsFrame.ItemName.Text = v127
                    local v130 = v_u_28:Translate(workspace, (("By: %*"):format(v128)))
                    if v129 and p124 ~= 98752422639730 then
                        p_u_122.floating_details_bar.DetailsFrame.ItemCreator.Text = ("%* | %*"):format(v130, v129)
                        p_u_122.floating_details_bar.DetailsFrame.ItemCreator.TextXAlignment = Enum.TextXAlignment.Right
                        p_u_122.floating_details_bar.BuyItem.Visible = true
                        p_u_122.floating_details_bar.DetailsFrame.Size = p_u_122.floating_bar_details_frame_original_size
                    else
                        p_u_122.floating_details_bar.DetailsFrame.ItemCreator.Text = v130
                        p_u_122.floating_details_bar.DetailsFrame.ItemCreator.TextXAlignment = Enum.TextXAlignment.Center
                        p_u_122.floating_details_bar.BuyItem.Visible = false
                        p_u_122.floating_details_bar.DetailsFrame.Size = UDim2.new(1, 0, 1, 0)
                    end
                    p_u_122.floating_details_bar.Size = p_u_122.float_details_bar_original_size
                    local v131 = p_u_122.floating_details_bar.DetailsFrame.AbsoluteSize.X
                    local v132 = v131 - p_u_122.floating_details_bar.DetailsFrame.ItemName.TextBounds.X
                    local v133 = v131 - p_u_122.floating_details_bar.DetailsFrame.ItemCreator.TextBounds.X
                    local v134 = math.min(v132, v133)
                    p_u_122.floating_details_bar.Size = p_u_122.float_details_bar_original_size - UDim2.new(0, v134, 0, 0)
                    task.spawn(function()
                        local v135 = p_u_122.catalog_scrolling_frame.CanvasPosition.Y
                        while true do
                            local v136 = v135 - p_u_122.catalog_scrolling_frame.CanvasPosition.Y
                            if math.abs(v136) >= 6 or not p_u_122.floating_details_bar.Parent then
                                break
                            end
                            task.wait()
                        end
                        p_u_122.floating_details_bar.Parent = nil
                    end)
                end
            else
                return
            end
        else
            return
        end
    end
end
function v20._hide_floating_details_bar(p137)
    p137.floating_details_bar.Parent = nil
end
function v20.render_items(p_u_138)
    p_u_138.item_renders_in_progress = (p_u_138.item_renders_in_progress or 0) + 1
    local v139 = p_u_138.query_id
    if p_u_138.search_param then
        p_u_138:_set_no_results_ui("Loading...", true)
    end
    local v_u_140 = p_u_138.avatar_editor_app:get_focused_avatar_type()
    local v_u_141 = p_u_138.avatar_editor_app:get_focused_avatar_rig_type()
    local v142 = nil
    local v_u_143
    if v_u_140 == "pet" then
        v_u_143 = v_u_9.get_pet_accessories_from_inventory(p_u_138.category, p_u_138.subcategory, p_u_138.page, p_u_138.search_param) or {}
        table.sort(v_u_143, function(p144, p145)
            local v146 = v_u_14.get_accessory_item_by_unique_client(p144)
            local v147 = v_u_14.get_accessory_item_by_unique_client(p145)
            local v148 = v_u_15.pet_accessories[v146.id]
            local v149 = v_u_15.pet_accessories[v147.id]
            local v150 = v_u_16[v148.rarity].value
            local v151 = v_u_16[v149.rarity].value
            if v150 == v151 then
                return v148.name < v149.name
            else
                return v151 < v150
            end
        end)
    else
        v_u_143 = v_u_9.get_items_from_catalog(v_u_141, p_u_138.category, p_u_138.subcategory, p_u_138.page, p_u_138.search_param) or {}
        v142 = nil
    end
    if p_u_138.query_id == v139 then
        local v_u_152 = {}
        task.spawn(function()
            v_u_152 = v_u_9.get_item_details(v_u_141, v_u_143)
        end)
        local v_u_153 = v_u_152
        for _, v_u_154 in pairs(v_u_143) do
            local v_u_155 = v_u_9.convert_soft_category_to_actual_category(v_u_141, p_u_138.category, p_u_138.subcategory, v_u_154)
            local v156 = p_u_138.item_template:clone()
            v156.ItemImage.Image = v_u_13.get(v_u_141, v_u_155, v_u_154)
            v156.Name = v_u_154
            p_u_138:set_text(v_u_141, v156, v_u_154)
            v156.Parent = p_u_138.catalog_content
            v156[v_u_4.mouse_down_or_click()]:Connect(function()
                local v157, v158
                if v_u_140 == "pet" then
                    v157 = p_u_138.avatar_editor_app.focus_switcher:get_focused_pet_wrapper()
                    if v157 then
                        v158 = v157.pet_unique
                    else
                        v158 = v157
                    end
                else
                    v158 = nil
                    v157 = nil
                end
                if p_u_138:get_equipped_ids_set(v_u_140, "all", v158)[v_u_154] then
                    p_u_138:_hide_floating_details_bar()
                    p_u_138.unequip_prediction_set[v_u_154] = true
                    v_u_9.take_off(v_u_140, v_u_155, v_u_154, v157)
                else
                    if v_u_155 == "packages" then
                        if p_u_138.time_package_put_on and os.clock() - p_u_138.time_package_put_on < 2 then
                            return
                        end
                        p_u_138.time_package_put_on = os.clock()
                    end
                    p_u_138:_show_floating_details_bar(v_u_140, v_u_154, v_u_153)
                    p_u_138:put_on(v_u_140, v_u_154)
                end
            end)
            if v_u_140 == "pet" then
                local v159 = v_u_14.get_accessory_item_by_unique_client(v_u_154)
                if v159 then
                    local v160 = {
                        ["frame"] = v156,
                        ["type"] = "item_entry",
                        ["item_entry"] = v_u_15.pet_accessories[v159.id]
                    }
                    p_u_138.tooltip:hook_on_hover(v160)
                end
                local v161 = p_u_138.avatar_editor_app:get_focused_char_wrapper()
                if v161 then
                    v161 = v161.pet_id
                end
                local v162 = v_u_14.get_accessory_item_by_unique_client(v_u_154).kind
                if v161 and not v_u_17.can_equip_on_pet(v162, v161) then
                    v156.ImageColor3 = Color3.fromRGB(127, 127, 127)
                    v156.ItemImage.ImageColor3 = Color3.fromRGB(127, 127, 127)
                    v156.ItemImage.ImageTransparency = 0.25
                end
            end
            p_u_138.rendered_item_count = p_u_138.rendered_item_count + 1
        end
        local v163 = v_u_3.get("roblox_catalog_finished_loading")
        if p_u_138.search_param == nil or p_u_138.rendered_item_count ~= 0 then
            if v163 or (p_u_138.rendered_item_count ~= 0 or (v_u_140 == "pet" or p_u_138.category == "other")) then
                p_u_138:_set_no_results_ui(nil)
            else
                p_u_138:_set_no_results_ui("The Roblox catalog is not available yet. Try again in a few minutes.", true)
            end
        elseif v142 == "catalog_not_loaded" then
            p_u_138:_set_no_results_ui("The Roblox catalog is not available yet. Try again in a few minutes.")
        else
            p_u_138:_set_no_results_ui((("No results found for \"%*\""):format(p_u_138.search_param)))
        end
        p_u_138:refresh_item_borders()
    end
    p_u_138.item_renders_in_progress = p_u_138.item_renders_in_progress - 1
    return v_u_143
end
function v20.authorize_premium_face_gamepass_or_prompt(_)
    local v164 = v_u_3.get("gamepass_manager")
    if v_u_11.is_member(v164, "premium_faces") then
        return true
    end
    v_u_5.get("ProductsAPI/PromptGamepassPurchase"):FireServer("premium_faces")
    return false
end
function v20.render_premium_button(p165)
    local v166 = v_u_3.get("gamepass_manager")
    local v167 = p165.category == "faces" and p165.subcategory == "Exclusive" and not v_u_11.is_member(v166, "premium_faces")
    if not v167 then
        if p165.category == "particles" and p165.subcategory == "Exclusive" or p165.category == "wings" and p165.subcategory == "Exclusive" then
            v167 = true
        elseif p165.category == "skirts" then
            v167 = p165.subcategory == "General"
        else
            v167 = false
        end
    end
    p165.premium_unlock_button.Visible = v167
    if v167 then
        if p165.category == "faces" then
            p165.premium_unlock_button.Face.TextLabel.Text = "Unlock All Faces"
            return
        end
        p165.premium_unlock_button.Face.TextLabel.Text = "You have: " .. v_u_3.get("money") .. " Bucks"
    end
end
function v20.render_navigate_to_hat_shop_button(p168)
    if p168.avatar_editor_app:is_focusing_pet() then
        p168.navigate_to_hat_shop_button.Visible = true
    else
        p168.navigate_to_hat_shop_button.Visible = false
    end
end
function v20.refresh_catalog(p169)
    p169:clear_catalog_items()
    p169:render_subcategories()
    p169:render_items()
    p169:render_premium_button()
    p169:render_navigate_to_hat_shop_button()
    p169:resize_canvas_to_correct_size()
end
function v20.reset_search(p170)
    p170.catalog_header.Search.TextBox.Text = ""
    p170.search_param = nil
end
function v20.select_category(p171, p172)
    p171.wrapped_category_slider:select(p172)
end
function v20.get_focused_categories_list(p173)
    if p173.avatar_editor_app:is_focusing_pet() then
        return v_u_8.categories
    else
        return v_u_7.categories
    end
end
function v20.refresh_categories_list(p174)
    local v175 = p174.avatar_editor_app:get_focused_avatar_type() == "pet" and v_u_8 or v_u_7
    p174.wrapped_category_slider:clear_elements()
    for v176, v177 in pairs(v175.ordered_categories) do
        local v178 = v175.categories[v177]
        local v179 = p174.category_template:Clone()
        v179.Name = v177
        v179.Icon.Image = "rbxassetid://" .. (v178.image or "")
        v179.LayoutOrder = v176
        p174.wrapped_category_slider:insert_element(v179)
    end
end
function v20.get_category_list_button(p180, p181)
    return p180.wrapped_category_slider:get_element_by_name(p181)
end
function v20.start(p_u_182, p183, p184)
    p_u_182.category_selected = v_u_18.new()
    p_u_182.avatar_editor_app = p183
    p_u_182.props = p184
    p_u_182.instance.Visible = true
    p_u_182.CATEGORY_SLIDER_SCALE = v_u_27 == v_u_4.platform.phone and 0.75 or 1
    p_u_182.CATEGORY_SLIDER_WIDTH = 128 * p_u_182.CATEGORY_SLIDER_SCALE
    p_u_182.CATALOG_SIZE = 588
    p_u_182.ITEM_BASE_SIZE = v_u_27 == v_u_4.platform.phone and 75 or 100
    p_u_182.ITEM_SIZE = p_u_182.ITEM_BASE_SIZE + 6
    p_u_182.catalog_scroll_complex = p_u_182.instance.Main.Body.ScrollComplex
    p_u_182.catalog_scrolling_frame = p_u_182.catalog_scroll_complex.ScrollingFrame
    p_u_182.catalog_content = p_u_182.catalog_scrolling_frame.Content
    p_u_182.subcategories = p_u_182.instance.Main.Body.SubCategories
    p_u_182.catalog_header = p_u_182.instance.Main.Body.Header
    p_u_182.category_slider = p_u_182.instance.CategorySlider
    p_u_182.premium_unlock_button = p_u_182.instance.Main.Body.PremiumUnlock
    p_u_182.navigate_to_hat_shop_button = p_u_182.instance.Main.Body.NavigateToHatShop
    p_u_182.floating_details_bar = p_u_182.instance.Main.Body.ScrollComplex.FloatingDetailsBar
    p_u_182.floating_details_bar_original_parent = p_u_182.floating_details_bar.Parent
    p_u_182.floating_details_bar.Parent = nil
    p_u_182.floating_details_bar.DetailsFrame.ItemName.AutoLocalize = false
    p_u_182.floating_details_bar.DetailsFrame.ItemCreator.AutoLocalize = false
    p_u_182.category_slider.Size = UDim2.new(0, p_u_182.CATEGORY_SLIDER_WIDTH, 1, 0)
    p_u_182.instance.Size = UDim2.new(0, p_u_182.CATALOG_SIZE + p_u_182.CATEGORY_SLIDER_WIDTH, 1, 0)
    p_u_182.catalog_content.UIGridLayout.CellSize = UDim2.new(0, p_u_182.ITEM_SIZE, 0, p_u_182.ITEM_SIZE)
    if v_u_27 == v_u_4.platform.phone then
        p_u_182.premium_unlock_button.Size = p_u_182.premium_unlock_button.Size - UDim2.new(0, 0, 0, 10)
        p_u_182.navigate_to_hat_shop_button.Size = p_u_182.navigate_to_hat_shop_button.Size - UDim2.new(0, 0, 0, 10)
        p_u_182.instance.Main.Body.ScrollComplex.Size = p_u_182.instance.Main.Body.ScrollComplex.Size + UDim2.new(0, 0, 0, 10)
        p_u_182.catalog_header.Size = UDim2.new(1, 0, 0, 35)
        p_u_182.instance.Main.Body.ScrollComplex.Size = p_u_182.instance.Main.Body.ScrollComplex.Size + UDim2.new(0, 0, 0, 5)
        p_u_182.catalog_header.Search.Icon.Size = UDim2.new(0, 16, 0, 16)
        p_u_182.catalog_header.Search.TextBox.Position = UDim2.new(0, 26, 0.05, 0)
        p_u_182.subcategories.UIGridLayout.CellPadding = UDim2.new(0, 2, 0, 2)
        p_u_182.subcategories.UIGridLayout.CellSize = UDim2.new(0.333, -2, 0.5, -2)
        local v185 = Instance.new("UIScale")
        v185.Scale = p_u_182.CATEGORY_SLIDER_SCALE
        v185:clone().Parent = p_u_182.category_slider.DownArrowButtonContainer
        v185:clone().Parent = p_u_182.category_slider.UpArrowButtonContainer
        for _, v186 in pairs(p_u_182.category_slider.ClippingFrame.ScrollingFrame:GetChildren()) do
            if v186:IsA("ImageButton") then
                v_u_41(v186, 0.75)
            end
        end
        p_u_182.category_slider.ClippingFrame.ScrollingFrame.UIListLayout.Padding = UDim.new(0, 5)
        p_u_182.category_slider.ClippingFrame.ScrollingFrame.Position = p_u_182.category_slider.ClippingFrame.ScrollingFrame.Position - UDim2.new(0, 0, 0, 10)
        p_u_182.instance.Main.Size = UDim2.new(1, -p_u_182.CATEGORY_SLIDER_WIDTH, 1, 0)
        p_u_182.floating_details_bar.Position = UDim2.new(0.5, -13, 1, 5)
        p_u_182.floating_details_bar.Size = UDim2.new(1, -40, 0, 40)
        p_u_182.floating_details_bar.UIPadding.PaddingLeft = UDim.new(0, 20)
        p_u_182.floating_details_bar.UIPadding.PaddingRight = UDim.new(0, 20)
        p_u_182.floating_details_bar.BuyItem.UIPadding.PaddingBottom = UDim.new(0, 3)
        p_u_182.floating_details_bar.BuyItem.UIPadding.PaddingLeft = UDim.new(0, 3)
        p_u_182.floating_details_bar.BuyItem.UIPadding.PaddingRight = UDim.new(0, 3)
        p_u_182.floating_details_bar.BuyItem.UIPadding.PaddingTop = UDim.new(0, 3)
        p_u_182.floating_details_bar.BuyItem.BuyButton.Icon.Size = UDim2.new(0, 28, 0, 28)
        p_u_182.floating_details_bar.BuyItem.BuyButton.Icon.Image = "rbxassetid://14555732818"
        p_u_182.floating_details_bar.DetailsFrame.Size = UDim2.new(1, -45, 1, 0)
    end
    p_u_182.float_details_bar_original_size = p_u_182.floating_details_bar.Size
    p_u_182.float_details_bar_original_position = p_u_182.floating_details_bar.Position
    p_u_182.floating_bar_details_frame_original_size = p_u_182.floating_details_bar.DetailsFrame.Size
    p_u_182.category_template = p_u_182.category_slider.ClippingFrame.ScrollingFrame.CategoryTemplate
    p_u_182.category_template.Parent = nil
    p_u_182.item_template = p_u_182.catalog_content.ItemTemplate
    p_u_182.item_template.Parent = nil
    p_u_182.subcategory_template = p_u_182.subcategories.SubCategoryTemplate
    p_u_182.subcategory_template.Parent = nil
    p_u_182.cached_category_buttons = {}
    p_u_182.wrapped_category_slider = p_u_182.UIManager.wrap(p_u_182.category_slider, "StyledSlider"):start({
        ["on_selected"] = function(p187)
            local v188 = p_u_182:get_focused_categories_list()
            p_u_182.category = p187.Name
            p_u_182.subcategory = v188[p_u_182.category].subcategories[1]
            p_u_182.avatar_editor_app:set_screen("full_catalog")
            p_u_182.category_selected:Fire(p_u_182.category)
            p_u_182.props.category_selected(p_u_182.category)
            p_u_182:reset_search(true)
            p_u_182:refresh_catalog()
        end
    })
    p_u_182:refresh_categories_list()
    p_u_182.avatar_editor_app:bind_to_focus_changed(function(_, _)
        p_u_182:refresh_categories_list()
    end)
    p_u_182.floating_details_bar.BuyItem.BuyButton[v_u_4.mouse_down_or_click()]:Connect(function()
        if p_u_182.UIManager.apps.DialogApp:dialog({
            ["text"] = ("%* is selling %* for %*%*. Once purchased, it can be worn across all Roblox experiences."):format(p_u_182.floating_bar_asset_details.creator, p_u_182.floating_bar_asset_details.name, v_u_24, p_u_182.floating_bar_asset_details.price),
            ["left"] = "Cancel",
            ["right"] = "Buy"
        }) == "Cancel" then
            return
        elseif p_u_182.floating_bar_asset_details.bundle_id then
            v_u_23:PromptBundlePurchase(game.Players.LocalPlayer, p_u_182.floating_bar_asset_details.bundle_id)
        else
            v_u_23:PromptPurchase(game.Players.LocalPlayer, p_u_182.floating_bar_asset_details.asset_id)
        end
    end)
    p_u_182.floating_details_bar.MouseButton1Click:Connect(function()
        p_u_182:_hide_floating_details_bar()
    end)
    p_u_182.tooltip = p_u_182.UIManager.wrap(p183.instance, "ItemTooltip"):start(p183, p_u_182.navigate_to_hat_shop_button)
    p_u_182.tooltip:set_mouse_leave_frame(p_u_182.catalog_content)
    p_u_182.tooltip:set_hover_options({
        ["valid_platforms"] = {
            ["desktop"] = true,
            ["console"] = true,
            ["tablet"] = true,
            ["phone"] = true
        },
        ["position"] = {
            ["x_clamped"] = false,
            ["y_clamped"] = false,
            ["x_flip"] = true,
            ["y_flip"] = false
        }
    })
    p_u_182.UIManager.wrap(p_u_182.premium_unlock_button, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_182.category == "faces" then
                p_u_182:authorize_premium_face_gamepass_or_prompt()
            else
                p_u_182.UIManager.set_app_visibility("BucksPurchaseApp")
            end
        end,
        ["shine"] = true
    })
    p_u_182.UIManager.wrap(p_u_182.navigate_to_hat_shop_button, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_182.UIManager.set_app_visibility("AvatarEditorApp", false)
            p_u_182.UIManager.apps.GuideArrowApp:navigate("HatShop")
        end,
        ["shine"] = true
    })
    v_u_3.register_callback("money", function(p189, p190)
        if p189 == game.Players.LocalPlayer then
            if p190 then
                if string.find(p_u_182.premium_unlock_button.Face.TextLabel.Text, "You have: ") then
                    p_u_182.premium_unlock_button.Face.TextLabel.Text = "You have: " .. p190 .. " Bucks"
                end
            end
        else
            return
        end
    end)
    v_u_3.register_callback("avatar_manager", function(_, _, _)
        p_u_182:refresh_item_borders()
        p_u_182.unequip_prediction_set = {}
    end)
    v_u_3.register_callback("gamepass_manager", function()
        if p_u_182.avatar_editor_app:get_screen() == "full_catalog" then
            p_u_182:refresh_catalog()
        end
    end)
    v_u_3.register_callback("unlocked_catalog_items", function()
        if p_u_182.avatar_editor_app:get_screen() == "full_catalog" then
            p_u_182:refresh_catalog()
        end
    end)
    v_u_3.register_callback("pet_saved_worn_items", function()
        p_u_182:refresh_item_borders()
        p_u_182.unequip_prediction_set = {}
    end)
    p_u_182.instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_182:recalculate_sizing()
    end)
    p_u_182.catalog_content.UIGridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        p_u_182.catalog_scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, p_u_182.catalog_content.UIGridLayout.AbsoluteContentSize.Y + 40)
    end)
    local v_u_191 = p_u_182.catalog_header.Search.TextBox
    v_u_191.Focused:Connect(function()
        v_u_191.PlaceholderText = ""
    end)
    local v_u_192 = false
    local v_u_193 = v_u_191.Text
    v_u_191:GetPropertyChangedSignal("Text"):Connect(function()
        if v_u_192 then
            return
        else
            local v194, v195 = v_u_1.sanitize_and_check_length(v_u_191.Text, {
                ["limit_graphemes"] = 40
            })
            if v194 then
                v_u_193 = v195
            else
                v_u_192 = true
                v_u_191.Text = v_u_193
                v_u_192 = false
            end
        end
    end)
    v_u_191.FocusLost:Connect(function()
        v_u_191.PlaceholderText = "Enter Search..."
        local v196 = string.match(v_u_193, "^%s*(.-)%s*$")
        if v196 == "" then
            p_u_182.search_param = nil
        else
            p_u_182.search_param = v196
        end
        p_u_182:refresh_catalog()
    end)
    p_u_182.UIManager.wrap(p_u_182.catalog_scroll_complex.NoResultsFoundFrame.ClearSearch, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_182:reset_search()
            p_u_182:refresh_catalog()
        end,
        ["shine"] = false
    })
    p_u_182:reset_search()
    p_u_182.gender = v_u_3.get("gender") or "female"
    p_u_182.catalog_header.CatalogType.TextLabel.Text = p_u_182.gender == "male" and "Guys Catalog" or "Girls Catalog"
    v_u_3.register_server_on_change_hook("gender", nil, function(_, p197)
        p_u_182.gender = p197
        p_u_182.catalog_header.CatalogType.TextLabel.Text = p_u_182.gender == "male" and "Guys Catalog" or "Girls Catalog"
        v_u_9.clear_cache("player")
        if p_u_182.avatar_editor_app:get_screen() == "full_catalog" then
            p_u_182:refresh_catalog()
        end
    end)
    local v_u_198 = false
    p_u_182.catalog_header.CatalogType.MouseButton1Click:Connect(function()
        if v_u_198 then
            return
        else
            v_u_198 = true
            local v199 = p_u_182.gender == "female" and "male" or "female"
            local v200 = v199 == "male" and "Guys Catalog" or "Girls Catalog"
            if p_u_182.UIManager.apps.DialogApp:dialog({
                ["text"] = "Switch to " .. v200 .. "?",
                ["left"] = "No",
                ["right"] = "Yes"
            }) == "No" then
                v_u_198 = false
            else
                p_u_182.gender = v199
                p_u_182.catalog_header.CatalogType.TextLabel.Text = v200
                v_u_5.get("AvatarAPI/SetGender"):FireServer(p_u_182.gender)
                wait(0.5)
                v_u_198 = false
            end
        end
    end)
    local function v_u_204(p201)
        local v202, v203
        if p201 == "pet" then
            v202 = UDim2.new(1, 0, 1, 0)
            v203 = false
        else
            v202 = UDim2.new(0.6, 0, 1, 0)
            v203 = true
        end
        p_u_182.catalog_header.CatalogType.Visible = v203
        p_u_182.catalog_header.Search.Size = v202
    end
    p_u_182.avatar_editor_app:bind_to_focus_changed(function(_, p205)
        v_u_204(p205)
    end)
    v_u_204(p_u_182.avatar_editor_app:get_focused_avatar_type())
    spawn(function()
        while wait(0.1) do
            if p_u_182.avatar_editor_app:get_screen() == "full_catalog" then
                if not p_u_182.avatar_editor_app:is_focusing_pet() and (p_u_182.item_renders_in_progress == nil or p_u_182.item_renders_in_progress == 0) and p_u_182.catalog_scrolling_frame.CanvasPosition.Y >= p_u_182.catalog_scrolling_frame.CanvasSize.Y.Offset - p_u_182.catalog_scrolling_frame.AbsoluteSize.Y - p_u_182.ITEM_SIZE * 1.5 then
                    p_u_182.page = p_u_182.page + 1
                    if #p_u_182:render_items() == 0 then
                        p_u_182.page = p_u_182.page - 1
                        wait(2)
                    end
                end
            else
                wait(2)
            end
        end
    end)
    p_u_182:recalculate_sizing()
    p_u_182.instance.Position = UDim2.new(1, p_u_182.CATALOG_SIZE, 0, 0)
    p_u_182.rendered_border_frames = {}
    p_u_182.unequip_prediction_set = {}
    p_u_182.page = 1
    p_u_182.query_id = 1
    p_u_182.rendered_item_count = 0
    return p_u_182
end
return v20