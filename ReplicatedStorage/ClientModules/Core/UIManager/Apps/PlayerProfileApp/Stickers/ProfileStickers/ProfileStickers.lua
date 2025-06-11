--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.Stickers.ProfileStickers (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v3 = v1("Class")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("ClientData")
local v_u_6 = v1("StickersDB")
local v_u_7 = v1("InventoryDB")
local v_u_8 = v1("XboxSupport")
local v_u_9 = v1("PlayerProfileTelemetry")
local v_u_10 = v1("package:Sift")
local v_u_11 = game:GetService("GuiService")
local v_u_12 = game:GetService("UserInputService")
local v_u_13 = game:GetService("HttpService")
local v_u_14 = game:GetService("TweenService")
local v_u_15 = game.Players.LocalPlayer
local v_u_16 = v_u_4.get_platform() == "phone"
local v17 = v3("ProfileStickers", v1("UIBaseElement"))
function v17._select_first_item(p18)
    if p18.first_possible_selection then
        v_u_8.get_watch_from_parent(p18.first_possible_selection):select_object(p18.first_possible_selection)
    end
end
function v17._refresh_sticker_count(p19, p20)
    local v21 = #(p19.available_uniques_by_tag.all[p20] or {})
    if p19.item_frames and p19.item_frames[p20] then
        p19.item_frames[p20].CountLabel.Text = v21 < 100 and ("x" .. v21 or "x99+") or "x99+"
        p19.item_frames[p20].ImageLabel.ImageTransparency = v21 == 0 and 0.3 or 0
    end
end
function v17._sticker_removed(p22, p23, p24)
    if (v_u_5.get("inventory") or {}).stickers[p23] then
        local v25 = p22.available_uniques_by_tag.all[p24] or {}
        if not table.find(v25, p23) then
            table.insert(v25, p23)
            p22.available_uniques_by_tag.all[p24] = v25
            for _, v26 in v_u_7.stickers[p24].tags do
                p22.available_uniques_by_tag[v26] = p22.available_uniques_by_tag[v26] or {}
                p22.available_uniques_by_tag[v26][p24] = v25
            end
            p22:_refresh_sticker_count(p24)
        end
    else
        return
    end
end
function v17._sticker_used(p27, p28, p29)
    local v30
    if v_u_6.stickers[p28].unlimited then
        v30 = v_u_13:GenerateGUID(false)
    else
        local v31 = p27.available_uniques_by_tag.all[p28] or {}
        if #v31 == 0 then
            return
        end
        v30 = table.remove(v31)
        p27:_refresh_sticker_count(p28)
    end
    local v32, v33
    if v30 then
        v32, v33 = p27.canvas:add(v30, p28, p29)
        if v33 then
            v_u_9.log_sticker_edited(v33, p27.canvas.page, "added")
        end
    else
        v32 = nil
        v33 = nil
    end
    return v32, v33
end
function v17.render_selection_page(p_u_34, p35, p36)
    local v37 = #p_u_34.items
    local v38 = v37 / 6
    local v39 = math.ceil(v38)
    local v40 = math.max(1, v39)
    local v41 = math.clamp(p35, 1, v40)
    if p_u_34.page == v41 then
        return
    else
        p_u_34.page = v41
        for _, v42 in p_u_34.content:GetChildren() do
            if v42:IsA("Frame") then
                v42:Destroy()
            end
        end
        local v43 = (v41 - 1) * 6 + 1
        local v44 = math.min(v43, v37)
        local v45 = v44 + 6 - 1
        local v46 = math.min(v45, v37)
        p_u_34.item_frames = {}
        local v47 = nil
        for v48 = v44, v46 do
            local v_u_49 = (p_u_34.category and v_u_6.stickers or v_u_6.categories)[p_u_34.items[v48]]
            if v_u_49 then
                local v_u_50 = p_u_34.template:Clone()
                v_u_50.Name = v_u_49.kind
                v_u_50.ImageLabel.Image = v_u_49.image
                v_u_50.Parent = p_u_34.content
                v_u_50.CountLabel.Visible = p_u_34.category ~= nil
                p_u_34.item_frames[v_u_49.kind] = v_u_50
                if v_u_49.flipbook_properties then
                    p_u_34.UIManager.wrap(v_u_50.ImageLabel, "FlipbookLabel"):start(v_u_49.flipbook_properties, nil, not v_u_16 and "large" or nil)
                end
                if v48 == v44 then
                    p_u_34.first_possible_selection = v_u_50.ImageButton
                end
                if p_u_34.category then
                    if v_u_49.unlimited then
                        v_u_50.CountLabel.Text = "\225\128\145"
                    else
                        local v51 = #(p_u_34.available_uniques_by_tag.all[v_u_49.kind] or {})
                        v_u_50.CountLabel.Text = v51 < 100 and ("x" .. v51 or "x99+") or "x99+"
                        if v51 == 0 then
                            v_u_50.ImageLabel.ImageTransparency = 0.3
                        end
                    end
                    v_u_50.Title:Destroy()
                    local v52 = p_u_34.UIManager.wrap(v_u_50.ImageButton, "UIDragger"):start()
                    local v_u_53 = nil
                    local v_u_54 = false
                    v52.drag_started:Connect(function()
                        v_u_53 = v_u_12:GetMouseLocation()
                    end)
                    v52.drag_changed:Connect(function(_, p55)
                        if not v_u_54 and (v_u_53 - v_u_12:GetMouseLocation()).Magnitude >= 25 then
                            v_u_54 = true
                            local v56 = (v_u_12:GetMouseLocation() - p_u_34.canvas.instance.AbsolutePosition - Vector2.new(0, v_u_11:GetGuiInset().Y)) / p_u_34.canvas.instance.AbsoluteSize
                            local v57 = p_u_34:_sticker_used(v_u_49.kind, {
                                ["position"] = { v56.X, v56.Y }
                            })
                            if v57 and p_u_34.canvas.move_draggers[v57] then
                                p_u_34.canvas.move_draggers[v57]:force_start_drag(p55)
                            end
                        end
                    end)
                    v52.drag_ended:Connect(function()
                        if not v_u_54 then
                            p_u_34:_sticker_used(v_u_49.kind)
                        end
                        v_u_53 = nil
                        v_u_54 = false
                    end)
                    v_u_50.ImageButton.MouseButton1Click:Connect(function()
                        if v_u_4.is_using_gamepad() then
                            p_u_34:_sticker_used(v_u_49.kind)
                        end
                    end)
                else
                    v_u_50.ImageLabel.Size = UDim2.fromScale(0.85, 0.85)
                    v_u_50.Title.NameLabel.Text = v_u_49.name
                    p_u_34.UIManager.wrap(v_u_50.ImageButton, "CustomButton"):start({
                        ["mouse_button1_click"] = function()
                            p_u_34:render_category(v_u_49.kind)
                            p_u_34:_select_first_item()
                        end,
                        ["hover_render"] = function()
                            v_u_50.Title.Rotation = 5
                        end,
                        ["up_render"] = function()
                            v_u_50.Title.Rotation = 0
                        end
                    })
                end
                if v_u_49.kind == p36 then
                    p_u_34:select_carousel()
                    v47 = v_u_50.ImageButton
                end
            end
        end
        local v58 = v_u_11.SelectedObject
        local v59 = p_u_34.left_button.instance
        local v60 = p_u_34.right_button.instance
        v59.Visible = v44 > 1
        v60.Visible = v46 < v37
        if v47 then
            v_u_8.get_watch_from_parent(v47):select_object(v47)
        elseif v58 == v59 and v59.Visible == false or v58 == v60 and v60.Visible == false then
            p_u_34:_select_first_item()
        end
    end
end
function v17.render_category(p61, p62, p63, p64)
    if p62 and (p62 == p61.category and not p64) then
        return
    end
    p61.category = p62
    local v65
    if p62 then
        v65 = v_u_6.categories[p62]
    else
        v65 = p62
    end
    if v65 then
        p61.items = v_u_10.Dictionary.keys(p61.available_uniques_by_tag[p62]) or {}
        p61.selector.Header.CategoryTitle.Text = v65.name
        p61.selector.Header.Position = UDim2.fromOffset(59, 4)
        table.sort(p61.items, function(p66, p67)
            local v68 = v_u_6.stickers[p66]
            local v69 = v_u_6.stickers[p67]
            return v68.name <= v69.name
        end)
    else
        p61.items = v_u_10.List.filter(v_u_10.Dictionary.keys(p61.available_uniques_by_tag) or {}, function(p70)
            return v_u_6.categories[p70] ~= nil
        end)
        p61.selector.Header.CategoryTitle.Text = "Stickers"
        p61.selector.Header.Position = UDim2.fromOffset(15, 4)
        table.sort(p61.items, function(p71, p72)
            return v_u_6.categories[p71].index < v_u_6.categories[p72].index
        end)
    end
    p61.back_button.instance.Visible = v65 ~= nil
    local v73 = p64 or 1
    if p63 then
        for v74, v75 in p61.items do
            if v75 == p63 then
                local v76 = (v74 - 1) / 6
                v73 = math.floor(v76) + 1
                break
            end
        end
    end
    p61.page = 0
    p61:render_selection_page(v73, p63)
end
function v17.set_minimized(p77, p78)
    if p77.minized ~= p78 then
        p77.minimized = p78
        p77.selector.Content.Visible = not p78
        p77.selector.PageButtons.Visible = not p78
        p77.selector.Background.Visible = not p78
        p77.selector.Header.Visible = not p78
        local v79 = p77.back_button.instance
        local v80 = not p78
        if v80 then
            v80 = p77.category ~= nil
        end
        v79.Visible = v80
        local v81 = p77.selector.Hide
        local v82
        if p78 then
            v82 = UDim2.new(0.5, 0, 1, -15)
        else
            v82 = UDim2.new(0.5, 0, 0, 30)
        end
        v81.Position = v82
        p77.selector.Hide.Face.Icon.Rotation = p78 and 90 or -90
    end
end
function v17.get_canvas(p83)
    return p83.canvas
end
function v17.refresh_selection_group(p84)
    v_u_11:RemoveSelectionGroup("PlayerProfileStickers")
    if p84.selector.Visible then
        local v85 = {}
        for v86, _ in p84.canvas.stickers do
            local v87 = v86.Controls.Move
            table.insert(v85, v87)
        end
        for _, v88 in p84.sticker_selection_group do
            table.insert(v85, v88)
        end
        v_u_11:AddSelectionTuple("PlayerProfileStickers", unpack(v85))
    end
end
function v17.is_carousel_selected(p89)
    return p89.carousel_selected
end
function v17.select_carousel(p_u_90)
    if v_u_4.is_using_gamepad() then
        p_u_90.selection_maid:DoCleaning()
        p_u_90.carousel_selected = true
        p_u_90.selector.Hide.Selectable = false
        p_u_90.selector.Background.Selectable = false
        local v_u_91 = v_u_8.narrow_selection_parent(p_u_90.selector)
        p_u_90:_select_first_item()
        p_u_90.selection_maid:GiveTask(function()
            p_u_90.carousel_selected = false
            v_u_91()
            p_u_90.selector.Hide.Selectable = true
            p_u_90.selector.Background.Selectable = true
            v_u_8.get_watch_from_parent(p_u_90.selector.Background):select_object(p_u_90.selector.Background)
        end)
    end
end
function v17.update_available_stickers(p92)
    local v93 = v_u_5.get("player_profile") or {}
    local v94 = (v_u_5.get("inventory") or {}).stickers or {}
    local v95 = {}
    local v96 = {
        ["all"] = {}
    }
    for v97, v98 in v94 do
        local v99 = v98.kind
        local v100 = v_u_7.stickers[v99]
        if v100 then
            v95[v99] = v95[v99] or {}
            local v101 = v95[v99]
            table.insert(v101, v97)
            for _, v102 in v100.tags do
                if v_u_6.categories[v102] then
                    v96[v102] = v96[v102] or {}
                    v96[v102][v99] = v95[v99]
                end
            end
            v96.all[v99] = v95[v99]
        end
    end
    p92.available_uniques_by_tag = v96
    for _, v103 in v93.pages or {} do
        for _, v104 in v103.stickers or {} do
            local v105 = v104.kind
            local v106
            if v105 then
                v106 = v_u_7.stickers[v105]
            else
                v106 = v105
            end
            if v106 then
                if v106.unlimited then
                    if v95[v105] == nil or #v95[v105] == 0 then
                        p92.canvas:remove_by_unique(v104.unique)
                    end
                else
                    local v107 = v94[v104.unique]
                    if v107 then
                        v107 = p92.available_uniques_by_tag.all[v105]
                    end
                    if v107 then
                        local v108 = table.find(v107, v104.unique)
                        if v108 then
                            table.remove(v107, v108)
                            p92:_refresh_sticker_count(v105)
                        end
                    else
                        p92.canvas:remove_by_unique(v104.unique)
                    end
                end
            end
        end
    end
end
function v17.is_visible(p109)
    return p109.selector.Visible
end
function v17.show(p110)
    p110:render_category(p110.category)
    p110.selector.Visible = true
    p110.canvas:set_enabled(true)
    p110:set_minimized(false)
    p110:refresh_selection_group()
end
function v17.hide(p111)
    p111.selector.Visible = false
    p111.canvas:set_enabled(false)
    p111:refresh_selection_group()
end
function v17.start(p_u_112, p113)
    p_u_112.instance.Visible = true
    p_u_112.selector = p_u_112.instance.StickerSelector
    p_u_112.content = p_u_112.selector.Content
    p_u_112.template = p_u_112.content.Template
    p_u_112.template.Parent = nil
    p_u_112.category = nil
    p_u_112.page = 1
    p_u_112.selection_maid = v_u_2.new()
    p_u_112.sticker_selection_group = p113.selection_group or {}
    local v114 = p_u_112.sticker_selection_group
    local v115 = p_u_112.selector.Background
    table.insert(v114, v115)
    local v116 = p_u_112.sticker_selection_group
    local v117 = p_u_112.selector.Hide
    table.insert(v116, v117)
    p_u_112.selector.Background.InputBegan:Connect(function(p118)
        if p118.UserInputType == Enum.UserInputType.Gamepad1 and p118.KeyCode == Enum.KeyCode.ButtonA then
            p_u_112:select_carousel()
        end
    end)
    v_u_4.get_gamepad_changed():Connect(function()
        p_u_112.selection_maid:DoCleaning()
    end)
    p_u_112.canvas = p_u_112.UIManager.wrap(p_u_112.instance.Canvas, "StickerCanvas"):start(p113)
    p_u_112.canvas:get_removed_signal():Connect(function(p119, p120)
        p_u_112:_sticker_removed(p119, p120)
        v_u_9.log_sticker_edited({
            ["unique"] = p119,
            ["kind"] = p120
        }, p_u_112.canvas.page, "removed")
    end)
    p_u_112.canvas:get_applied_signal():Connect(function(p121, p122)
        v_u_9.log_sticker_edited(p121, p122, "edited")
    end)
    local v_u_123 = nil
    local v_u_124 = TweenInfo.new(0.15)
    p_u_112.canvas:get_active_signal():Connect(function(p125)
        p_u_112.selection_maid:DoCleaning()
        if v_u_123 then
            v_u_123:Cancel()
        end
        if p125 then
            v_u_123 = v_u_14:Create(p_u_112.selector.UIScale, v_u_124, {
                ["Scale"] = 0
            })
        else
            v_u_123 = v_u_14:Create(p_u_112.selector.UIScale, v_u_124, {
                ["Scale"] = 1
            })
        end
        v_u_123:Play()
        p_u_112:refresh_selection_group()
    end)
    p_u_112.canvas:set_enabled(false)
    p_u_112.hide_button = p_u_112.UIManager.wrap(p_u_112.selector.Hide, "IconButton"):start({
        ["mouse_button1_click"] = function()
            p_u_112:set_minimized(not p_u_112.minimized)
        end
    })
    p_u_112.back_button = p_u_112.UIManager.wrap(p_u_112.selector.Back, "CustomButton"):start({
        ["mouse_button1_click"] = function()
            p_u_112:render_category(nil)
            p_u_112:_select_first_item()
        end,
        ["hover_render"] = function()
            p_u_112.selector.Back.Icon.Rotation = -3
        end,
        ["up_render"] = function()
            p_u_112.selector.Back.Icon.Rotation = 0
        end
    })
    p_u_112.left_button = p_u_112.UIManager.wrap(p_u_112.selector.PageButtons.Left, "IconButton"):start({
        ["mouse_button1_click"] = function()
            p_u_112:render_selection_page(p_u_112.page - 1)
        end
    })
    p_u_112.right_button = p_u_112.UIManager.wrap(p_u_112.selector.PageButtons.Right, "IconButton"):start({
        ["mouse_button1_click"] = function()
            p_u_112:render_selection_page(p_u_112.page + 1)
        end
    })
    local v_u_126 = 0
    v_u_5.register_callback_plus_existing("inventory", function(p127, p128)
        if p127 == v_u_15 and p128 then
            local v129 = p128.stickers or {}
            local v130 = v_u_10.Dictionary.count(v129)
            if v_u_126 ~= v130 then
                v_u_126 = v130
                p_u_112:update_available_stickers()
                p_u_112:render_category(p_u_112.category, nil, p_u_112.page)
            end
        else
            return
        end
    end)
    return p_u_112
end
return v17