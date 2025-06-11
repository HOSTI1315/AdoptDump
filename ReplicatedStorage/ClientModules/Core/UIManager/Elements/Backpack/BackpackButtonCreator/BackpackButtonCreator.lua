--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Backpack.BackpackButtonCreator (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("PlatformM")
local v_u_4 = v_u_1("ClientData")
local v_u_5 = v_u_1("ClientToolManager")
local v_u_6 = v_u_1("ColorThemeManager")
local v_u_7 = v_u_1("new:TextUtil")
local v_u_8 = v_u_1("BackpackLockTracker")
local v_u_9 = v_u_1("BackpackFavoriteTracker")
local v_u_10 = v_u_1("InventoryDB")
local v_u_11 = v_u_1("package:Promise")
local v_u_12 = v_u_3.get_platform()
Vector2.new((1 / 0), (1 / 0))
local v13 = v2("BackpackButtonCreator", v_u_1("UIBaseElement"))
function v13._get_state(p_u_14, p15)
    if not p_u_14.cell_states[p15.Parent.Name] then
        local v_u_16 = {
            ["ticket"] = 0,
            ["is_holding"] = nil,
            ["canvas_position"] = Vector2.new(0, 0)
        }
        v_u_16.scroll_connection = p_u_14.scroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
            if v_u_16.is_holding ~= nil then
                local v17 = (v_u_16.canvas_position - p_u_14.scroll.CanvasPosition).Y
                if math.abs(v17) > 10 then
                    v_u_16.ticket = v_u_16.ticket + 1
                    v_u_16.is_holding = nil
                end
            end
        end)
        p_u_14.cell_states[p15.Parent.Name] = v_u_16
    end
    return p_u_14.cell_states[p15.Parent.Name]
end
function v13._watch_cell_input(p_u_18, p19, p_u_20)
    local v_u_21 = p_u_18:_get_state(p19)
    p19.MouseButton1Down:Connect(function()
        v_u_21.ticket = v_u_21.ticket + 1
        v_u_21.is_holding = false
        v_u_21.canvas_position = p_u_18.scroll.CanvasPosition
        local v22 = v_u_21.ticket
        v_u_11.delay(0.25):await()
        if v22 == v_u_21.ticket then
            v_u_21.is_holding = true
            p_u_20.on_hold()
        end
    end)
    p19.MouseButton1Up:Connect(function()
        if v_u_21.is_holding ~= nil then
            v_u_21.ticket = v_u_21.ticket + 1
            if v_u_21.is_holding == false then
                p_u_20.on_click()
            end
            v_u_21.is_holding = nil
        end
    end)
    local function v23()
        if v_u_21.is_holding ~= nil then
            v_u_21.ticket = v_u_21.ticket + 1
            v_u_21.is_holding = nil
        end
    end
    p19.SelectionLost:Connect(v23)
    p19.MouseLeave:Connect(v23)
end
function v13.clear_unused_states(p24, p25)
    for v26, v27 in pairs(p24.cell_states) do
        local v28 = false
        for _, v29 in pairs(p25) do
            if v29:get_index_by_name(v26) then
                v28 = true
                break
            end
        end
        if not v28 then
            v27.scroll_connection:Disconnect()
            v27.scroll_connection = nil
            p24.cell_states[v26] = nil
        end
    end
end
function v13.item(p_u_30, p_u_31)
    local v32 = v_u_4.get("pet_saved_worn_items")
    local v33 = v32 and (v32.wearing_lists or {}) or {}
    local v34 = v32 and v32.accessory_to_pet_map or {}
    local v35 = v_u_4.get("placed_furnitures")
    local v36 = Instance.new("Frame")
    v36.Name = p_u_31.unique
    v36.BackgroundTransparency = 1
    local v37 = p_u_30.templates.item:Clone()
    v37.AnchorPoint = Vector2.new(0.5, 0.5)
    v37.Position = UDim2.new(0.5, 0, 0.5, 0)
    v37.Size = UDim2.new(1, -4, 1, -4)
    v37.Name = "Button"
    v37.Parent = v36
    p_u_30.UIManager.wrap(v37, "ItemDataImage"):start({
        ["item_data"] = p_u_31.item_data,
        ["size"] = "icon"
    })
    p_u_30.UIManager.wrap(v37, "ItemDataTagDisplay"):start({
        ["item_data"] = p_u_31.item_data,
        ["wearing"] = v33[p_u_31.item_data.unique] ~= nil
    })
    p_u_30.BackpackApp.tooltip:hook_on_hover({
        ["frame"] = v37,
        ["type"] = "item_data",
        ["item_data"] = p_u_31.item_data
    })
    local v38 = v_u_5.is_equipped(p_u_31.item_data)
    local v39 = v_u_6.lookup("saturated")
    local v40
    if p_u_30.BackpackApp.picking_item and not p_u_30.BackpackApp.friendship_hidden_during_picking then
        v40 = (p_u_31.item_data.properties.friendship_level or 0) >= 1
    else
        v40 = false
    end
    if p_u_30.BackpackApp.tooltip:is_pinned() and p_u_30.BackpackApp.tooltip:is_watched_item(p_u_31.item_data) then
        p_u_30.UIManager.wrap(v37, "ItemBorderIndicator"):start({
            ["style"] = v38 and "pinned_equipped" or "pinned"
        })
    elseif v40 then
        p_u_30.UIManager.wrap(v37, "ItemBorderIndicator"):start({
            ["style"] = "friend"
        })
    elseif v38 then
        v39 = Color3.fromRGB(74, 198, 85)
        p_u_30.UIManager.wrap(v37, "ItemBorderIndicator"):start({
            ["style"] = "equipped"
        })
    elseif p_u_31.item_data.properties.placed_furniture_unique and v35[p_u_31.item_data.properties.placed_furniture_unique] then
        p_u_30.UIManager.wrap(v37, "ItemBorderIndicator"):start({
            ["style"] = "placeable_item_placed"
        })
    elseif v34[p_u_31.item_data.unique] then
        p_u_30.UIManager.wrap(v37, "ItemBorderIndicator"):start({
            ["style"] = "worn_by_pet"
        })
    end
    local v41
    if p_u_31.type == "item" then
        v41 = v_u_10[p_u_31.item_data.category][p_u_31.item_data.kind]
    else
        v41 = false
    end
    if v41 then
        v41 = v41.display_infinite_amount_in_backpack
    end
    if p_u_31.count > 1 or v41 then
        local v_u_42 = v37.StackCount
        local v43 = v_u_42.TextLabel
        if v41 then
            v43.Text = "\225\128\145"
        else
            v43.Text = p_u_31.count < 100 and ("x" .. p_u_31.count or "x99+") or "x99+"
        end
        v_u_7.on_text_bounds({
            ["Instance"] = v43,
            ["Text"] = v43.Text
        }, function(p44)
            v_u_42.Size = UDim2.new(0, p44.X + 14 + 4, 0, 14)
        end)
        v_u_42.ImageColor3 = v39
        v_u_42.Visible = true
    elseif v_u_8.is_locked(p_u_31.item_data) then
        v37.Locked.ImageColor3 = v39
        v37.Locked.Visible = true
    end
    p_u_30:_watch_cell_input(v37, {
        ["on_click"] = function()
            if not p_u_30.BackpackApp:try_pick_item(p_u_31.item_data) then
                local v45 = p_u_30.BackpackApp.tooltip
                local v46 = p_u_31.item_data
                local _ = p_u_31.item_data
                v45:pin(v46, {})
                p_u_30.BackpackApp:refresh_rendered_items()
            end
        end,
        ["on_hold"] = function()
            if v_u_12 == v_u_3.platform.phone or v_u_12 == v_u_3.platform.tablet then
                if p_u_30.BackpackApp.picking_item then
                    return
                end
            elseif p_u_30.BackpackApp:try_pick_item(p_u_31.item_data) then
                return
            end
            local v47 = p_u_30.BackpackApp:get_equip_override(p_u_31.item_data.category).callback
            if v47 then
                v47(p_u_31.item_data, true, false)
            end
        end
    })
    local v48 = v_u_9.is_favorite(p_u_31.item_data)
    v37.Favorited.Visible = v48
    return v36
end
function v13.add_more(p_u_49, p_u_50)
    local v_u_51 = p_u_50.promo_data
    local v52 = Instance.new("Frame")
    v52.Name = p_u_50.unique
    v52.BackgroundTransparency = 1
    local v53 = p_u_49.templates.add_more:Clone()
    v53.AnchorPoint = Vector2.new(0.5, 0.5)
    v53.Position = UDim2.new(0.5, 0, 0.5, 0)
    v53.Name = "Button"
    v53.Size = UDim2.new(1, -2, 1, -2)
    v53.LayoutOrder = -1
    v53.Parent = v52
    local v_u_54 = false
    local v56 = {
        ["shine"] = true,
        ["mouse_button1_click"] = function()
            if p_u_49.UIManager.apps.BackpackApp:are_promo_buttons_active() then
                if v_u_54 then
                    return
                else
                    v_u_54 = true
                    if p_u_49.UIManager.apps.DialogApp:dialog({
                        ["text"] = v_u_51.text,
                        ["left"] = "No",
                        ["right"] = "Yes"
                    }) == "No" then
                        v_u_54 = false
                        if v_u_3.is_using_gamepad() then
                            local v55 = p_u_49.scroll.Content:FindFirstChild(p_u_50.category)
                            if v55 then
                                v55 = v55:FindFirstChild("Row0")
                            end
                            if v55 then
                                v55 = v55:FindFirstChild(p_u_50.unique)
                            end
                            if v55 then
                                p_u_49.BackpackApp.watch:select_object(v55.Button)
                            end
                        end
                    else
                        p_u_49.UIManager.set_app_visibility(p_u_49.BackpackApp.ClassName, false)
                        v_u_1("InteriorsM").enter_smooth(v_u_51.interior, "MainDoor", v_u_51.extra_tele_data)
                        v_u_54 = true
                    end
                end
            else
                p_u_49.UIManager.apps.HintApp:hint({
                    ["text"] = "You can\'t do that right now!",
                    ["length"] = 3,
                    ["overridable"] = true,
                    ["yields"] = false
                })
                return
            end
        end
    }
    p_u_49.UIManager.wrap(v53, "DepthButton"):start(v56)
    p_u_49.BackpackApp.tooltip:hook_on_hover({
        ["frame"] = v53,
        ["type"] = "add_more",
        ["title"] = "Get More",
        ["sub_title"] = v_u_51.tooltip_description
    })
    return v52
end
function v13.start(p57, p58)
    p57.BackpackApp = p58
    p57.scroll = p57.instance.Parent
    p57.cell_states = {}
    p57.templates = {
        ["item"] = p57.instance.SelectedItem,
        ["add_more"] = p57.instance.AddMore
    }
    for _, v59 in pairs(p57.templates) do
        v59.Parent = nil
    end
    return p57
end
return v13