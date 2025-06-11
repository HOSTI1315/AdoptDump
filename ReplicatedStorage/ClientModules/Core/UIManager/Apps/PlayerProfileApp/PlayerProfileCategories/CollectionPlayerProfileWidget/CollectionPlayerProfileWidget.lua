--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfileCategories.CollectionPlayerProfileWidget (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v3 = v1("Class")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("InventoryDB")
local v_u_6 = v1("SharedConstants")
local v_u_7 = v1("package:Promise")
local v_u_8 = game:GetService("GuiService")
local v_u_9 = game:GetService("ContextActionService")
local v10 = v3("CollectionPlayerProfileWidget", v1("BasePlayerProfileWidget"))
v10.DEFAULT_TITLE = "Have"
function v10._calculate_items_per_page(p11)
    if v_u_4.get_platform() ~= "phone" then
        local _ = v_u_4.get_platform() == "tablet"
    end
    local v12 = p11.expanded and 20 or 8
    p11.minimized_item_count = p11.expanded and 7 or 3
    p11.items_per_page = v12
    local v13 = v_u_6.player_profiles.max_collection_items / p11.items_per_page
    p11.max_pages = math.ceil(v13)
end
function v10._render_direction_button_visibility(p14)
    local v15 = false
    local v16 = false
    if p14.collection_page == 1 then
        v15 = true
    elseif p14.collection_page == p14.max_pages then
        v16 = true
    end
    local v17 = p14:get_item_count()
    local v18 = p14.collection_page * p14.items_per_page
    if v17 < p14.minimized_item_count then
        v16 = true
        v15 = true
    elseif v17 < v18 or not p14.editing and v17 <= v18 then
        v16 = true
    end
    if v16 then
        p14.right_button:disable()
    else
        p14.right_button:enable()
    end
    if v15 then
        p14.left_button:disable()
    else
        p14.left_button:enable()
    end
    p14.right_button.instance.Face.GroupTransparency = v16 and 0.5 or 0
    p14.left_button.instance.Face.GroupTransparency = v15 and 0.5 or 0
    p14.right_button.instance.Shadow.Visible = not v16
    p14.left_button.instance.Shadow.Visible = not v15
end
function v10.get_item_count(p19)
    local v20 = p19:get_save_data()
    return v20 and (#v20.items and #v20.items) or 0
end
function v10.pick_new_item(p21, p22)
    local v_u_23 = {}
    for _, v24 in p21.save_data.items do
        v_u_23[v24.unique] = true
    end
    local v28 = {
        ["allow_callback"] = function(p25)
            local v26 = v_u_5[p25.category]
            if v26 then
                v26 = v_u_5[p25.category][p25.kind]
            end
            local v27 = v26 and not v26.temporary
            if v27 then
                v27 = not v_u_23[p25.unique]
            end
            return v27
        end
    }
    local v29 = p21.UIManager.apps.BackpackApp:pick_item(v28)
    if v29 then
        local v30 = {}
        for v31, _ in v_u_6.player_profiles.valid_pet_properties do
            v30[v31] = v29.properties[v31] == true and true or nil
        end
        local v32 = {
            ["kind"] = v29.kind,
            ["category"] = v29.category,
            ["unique"] = v29.unique,
            ["properties"] = v30
        }
        local v33 = p21.save_data.items
        if #v33 < v_u_6.player_profiles.max_collection_items then
            if p22 then
                table.remove(v33, p22)
                table.insert(v33, p22, v32)
            else
                table.insert(v33, v32)
                p22 = #v33
            end
            p21:render()
            if v_u_4.is_using_gamepad() then
                local v34 = p21.item_instances[p22]
                p21.player_profile_app:set_gamepad_selection(v34 or p21.left_button.instance)
            end
        end
        return v32
    end
end
function v10.remove_item(p35, p36)
    local v37 = p35.save_data.items
    if table.remove(v37, p36) then
        while p35.collection_page > 1 and p35:get_item_count() < (p35.collection_page - 1) * p35.items_per_page do
            local v38 = p35.collection_page - 1
            p35.collection_page = math.max(1, v38)
        end
        p35:render()
        if v_u_4.is_using_gamepad() then
            local v39 = p35.item_instances[p36]
            if not v39.Selectable then
                v39 = v39.AddButton
            end
            p35.player_profile_app:set_gamepad_selection(v39 or p35.left_button.instance)
        end
    end
end
function v10.set_profile_editing(p40, p41)
    if p40.verified_container then
        p40.verified_container.Visible = not p41
    end
end
function v10.render(p_u_42)
    p_u_42.render_maid:DoCleaning()
    p_u_42.item_instances = {}
    p_u_42.first_item_instance_on_page = nil
    for _, v43 in p_u_42.content:GetChildren() do
        if v43:IsA("ImageButton") then
            v43:Destroy()
        end
    end
    local v44 = p_u_42:get_save_data().items
    if p_u_42.expanded then
        p_u_42.instance.Body.Background.Image = "rbxassetid://16198758646"
    else
        p_u_42.instance.Body.Background.Image = "rbxassetid://16198758730"
    end
    local v45 = #v44 + 1
    local v46 = p_u_42.minimized_item_count
    local v47 = p_u_42:get_item_count()
    if p_u_42.items_per_page ~= p_u_42.minimized_item_count and (p_u_42.editing and p_u_42.minimized_item_count <= v47 or not p_u_42.editing and p_u_42.minimized_item_count < v47) then
        v46 = p_u_42.items_per_page
    end
    if not p_u_42.editing then
        while p_u_42.collection_page > 1 and p_u_42:get_item_count() <= (p_u_42.collection_page - 1) * p_u_42.items_per_page do
            local v48 = p_u_42.collection_page - 1
            p_u_42.collection_page = math.max(1, v48)
        end
    end
    local v49 = (p_u_42.collection_page - 1) * p_u_42.items_per_page
    local v50 = v49 + 1
    local v51 = v_u_6.player_profiles.max_collection_items
    local v52 = v49 + v46
    local v53 = math.min(v51, v52)
    if not p_u_42.editing then
        local v54 = v45 - 1
        v53 = math.min(v54, v53)
    end
    local v55 = v53 - v50
    local v56 = math.max(0, v55) + 1
    if p_u_42.editing then
        v56 = v56 + 1
    end
    local v57 = v56 <= p_u_42.minimized_item_count
    if v57 then
        p_u_42.grid_layout.FillDirectionMaxCells = p_u_42.minimized_item_count
        p_u_42.grid_layout.CellSize = UDim2.fromOffset(64, 64)
    else
        local v58 = p_u_42.minimized_item_count
        local v59 = v56 - (p_u_42.editing and 1 or 0)
        local v60 = math.max(v58, v59) / 2
        local v61 = math.ceil(v60)
        if p_u_42.editing then
            local v62 = p_u_42.grid_layout
            local v63 = p_u_42.expanded and 7 or 3
            v62.FillDirectionMaxCells = math.max(v61, v63)
        else
            p_u_42.grid_layout.FillDirectionMaxCells = v61
        end
        p_u_42.grid_layout.CellSize = UDim2.fromOffset(42, 42)
    end
    for v_u_64 = v50, v53 do
        if not p_u_42.editing and v45 <= v_u_64 then
            break
        end
        local v65 = v44[v_u_64]
        local v66 = p_u_42.item_template:Clone()
        v66.LayoutOrder = v_u_64
        v66.ZIndex = -v_u_64
        if p_u_42.editing and v_u_64 == v45 then
            v66.Selectable = false
            v66.AddButton.Visible = true
            p_u_42.UIManager.wrap(v66.AddButton, "IconButton"):start({
                ["mouse_button1_click"] = function()
                    p_u_42:pick_new_item()
                end
            })
        else
            v66.AddButton:Destroy()
        end
        if p_u_42.editing and v_u_64 < v45 then
            p_u_42.UIManager.wrap(v66.DeleteButton, "IconButton"):start({
                ["mouse_button1_click"] = function()
                    p_u_42:remove_item(v_u_64)
                end
            })
            p_u_42.UIManager.wrap(v66, "CustomButton"):start({
                ["mouse_button1_click"] = function()
                    p_u_42:pick_new_item(v_u_64)
                end
            })
            v66.AutoButtonColor = true
        else
            v66.Selectable = false
            v66.AutoButtonColor = false
            v66.DeleteButton:Destroy()
        end
        local v67 = v65 and v_u_5[v65.category]
        if v67 then
            v67 = v_u_5[v65.category][v65.kind]
        end
        if v67 then
            p_u_42.UIManager.wrap(v66.Properties, "TagDisplay"):start({
                ["fixed_property_size"] = v57 and 13 or 9,
                ["properties"] = v65.properties,
                ["kind"] = v65.kind
            })
            p_u_42.render_maid:GiveTask(p_u_42.UIManager.wrap(v66.Icon, "ItemImage"):start({
                ["entry"] = v67,
                ["use_instance"] = true,
                ["size"] = "icon"
            }))
            if not p_u_42.editing then
                v66.Selectable = true
                p_u_42.player_profile_app.tooltip:hook_on_hover({
                    ["frame"] = v66,
                    ["type"] = "item_entry",
                    ["item_entry"] = v67,
                    ["show_pet_origin"] = false
                })
            end
        end
        p_u_42.item_instances[v_u_64] = v66
        v66.Parent = p_u_42.content
    end
    p_u_42.first_item_instance_on_page = p_u_42.item_instances[v50]
    if p_u_42.editing then
        v_u_9:BindAction("CollectionDelete", function(_, p68)
            if p68 == Enum.UserInputState.Begin then
                if v_u_8.SelectedObject ~= nil and v_u_8.SelectedObject.Parent == p_u_42.content then
                    p_u_42:remove_item(v_u_8.SelectedObject.LayoutOrder)
                end
            else
                return
            end
        end, false, Enum.KeyCode.ButtonX)
        p_u_42.connection_maid:GiveTask(function()
            v_u_9:UnbindAction("CollectionDelete")
        end)
    else
        p_u_42.connection_maid:DoCleaning()
    end
    p_u_42:_render_direction_button_visibility()
end
function v10.on_shrink(p69)
    p69:_calculate_items_per_page()
    p69.collection_page = 1
    p69:render()
end
function v10.on_expand(p70)
    p70:_calculate_items_per_page()
    p70.collection_page = 1
    p70:render()
end
function v10.get_save_data(p71)
    p71.save_data.title = p71.title:to_save()
    return p71.save_data
end
function v10.get_temp_data(p72)
    return {
        ["page"] = p72.collection_page
    }
end
function v10.select(p73)
    local v74 = (p73:get_save_data() or {}).items or {}
    if p73.items_per_page < #v74 then
        if p73.left_button.disabled then
            return p73.first_item_instance_on_page or p73.right_button.instance
        else
            return p73.left_button.instance
        end
    else
        return p73.first_item_instance_on_page
    end
end
function v10.start(p_u_75, p76, p77)
    p_u_75.render_maid = v_u_2.new()
    p_u_75.connection_maid = v_u_2.new()
    p_u_75.filter_promise = v_u_7.resolve()
    if p_u_75.ClassName == "CollectionPlayerProfileWidget" then
        p_u_75.verified_container = p_u_75.instance.VerifiedContainer
        local v_u_78 = p_u_75.verified_container.Tooltip
        local v79 = v_u_4.get_platform() == "phone" and true or v_u_4.get_platform() == "tablet"
        p_u_75.UIManager.wrap(p_u_75.verified_container, "CustomButton"):start({
            ["hover_render"] = not v79 and function()
                v_u_78.Visible = true
            end or nil,
            ["up_render"] = not v79 and function()
                v_u_78.Visible = false
            end or nil,
            ["mouse_button1_down"] = v79 and function()
                v_u_78.Visible = not v_u_78.Visible
            end or nil
        })
        p_u_75.player_profile_app:mark_priority_ui(p_u_75.verified_container)
    end
    local v80 = p76 or {}
    p_u_75.save_data = {
        ["items"] = v80.items or {},
        ["title"] = v80.title
    }
    p_u_75.content = p_u_75.instance.Body.Content
    p_u_75.grid_layout = p_u_75.content.UIGridLayout
    p_u_75.item_template = p_u_75.content.ItemTemplate
    p_u_75.item_template.AddButton.Visible = false
    p_u_75.item_template.Parent = nil
    p_u_75.left_button = p_u_75.UIManager.wrap(p_u_75.instance.Body.Left, "IconButton"):start({
        ["mouse_button1_click"] = function()
            local v81 = p_u_75
            local v82 = p_u_75.collection_page - 1
            v81.collection_page = math.max(1, v82)
            p_u_75:render()
        end
    })
    p_u_75.right_button = p_u_75.UIManager.wrap(p_u_75.instance.Body.Right, "IconButton"):start({
        ["mouse_button1_click"] = function()
            local v83 = p_u_75
            local v84 = p_u_75.max_pages
            local v85 = p_u_75.collection_page + 1
            v83.collection_page = math.min(v84, v85)
            p_u_75:render()
        end
    })
    p_u_75.collection_page = p77 and p77.page or 1
    p_u_75:_calculate_items_per_page()
    p_u_75.title = p_u_75.UIManager.wrap(p_u_75.instance.Title, "WidgetText"):start(p_u_75, {
        ["default_text"] = p_u_75.DEFAULT_TITLE,
        ["editable"] = true
    })
    p_u_75.title:set(p_u_75.save_data.title)
end
function v10.destroy(p86)
    p86.render_maid:DoCleaning()
    p86.connection_maid:DoCleaning()
    p86.instance:Destroy()
end
return v10