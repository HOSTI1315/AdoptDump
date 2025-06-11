--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HouseChooserApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("HouseExteriorCache")
local v_u_3 = v_u_1("HouseRenderHelper")
local v_u_4 = v_u_1("RouterClient")
local v_u_5 = v_u_1("XboxSupport")
local v_u_6 = v_u_1("ClientData")
local v_u_7 = v_u_1("HouseDB")
local v8 = v_u_1("Class")
local v_u_9 = v_u_1("package:Promise")
local v10 = v8("HouseChooserApp", v_u_1("UIBaseApp"))
function v10._get_active_addons(_, p11)
    local v12 = {}
    local v13 = v_u_7[p11.building_type]
    if v13 then
        for v14, _ in v13.addons or {} do
            v12[v14] = false
        end
        for v15, v16 in p11.active_addons or {} do
            v12[v15] = v16 and true or false
        end
    end
    return v12
end
function v10._refresh_house_model(p_u_17, p_u_18)
    p_u_17.viewer_3d:set_model(nil)
    p_u_17.house_refresh_promise:cancel()
    local v_u_19 = p_u_17:get_selected_house()
    local v_u_20
    if v_u_19 then
        v_u_20 = v_u_7[v_u_19.building_type]
    else
        v_u_20 = v_u_19
    end
    if v_u_20 then
        p_u_17.house_refresh_promise = v_u_2.request(v_u_20):andThen(function(p21)
            local v22 = p_u_17.viewer_3d:get_distance()
            p21:PivotTo(CFrame.identity)
            p21.Plot.Transparency = 1
            v_u_3.color_house_exterior(p21, p_u_17.color_picker:get_color())
            if v_u_20.addons then
                v_u_3.apply_addons_to_exterior(p21, v_u_20, p_u_17:_get_active_addons(v_u_19))
            end
            if p_u_18 then
                p_u_17.viewer_3d:reset_rotation(-0.3490658503988659, 3.141592653589793)
                v22 = nil
            end
            p_u_17.viewer_3d:set_model(p21)
            if v22 then
                p_u_17.viewer_3d:set_distance(v22)
            end
            v_u_3.add_dome_to_exterior(p_u_17.viewer_3d:get_model())
            p21:Destroy()
        end)
    end
end
function v10._refresh_owned_houses(p_u_23)
    for _, v24 in p_u_23.house_buttons do
        v24.instance:Destroy()
    end
    p_u_23.house_buttons = {}
    local v25 = nil
    for v26, v_u_27 in v_u_6.get("house_manager") or {} do
        local v28 = p_u_23.house_button_template:Clone()
        v28.Name = v_u_27.house_id
        v28.Face.TextLabel.Text = v_u_27.name
        v28.LayoutOrder = 9999 - v26
        v28.Parent = p_u_23.content
        p_u_23.house_buttons[v_u_27.house_id] = p_u_23.UIManager.wrap(v28, "DepthButton"):start({
            ["state"] = "normal",
            ["mouse_button1_down"] = function()
                if not p_u_23.sell_in_progress then
                    p_u_23:select_house(v_u_27.house_id)
                end
            end
        })
        if v_u_27.active then
            v25 = v_u_27
        end
    end
    local v29 = p_u_23.content.UIListLayout
    p_u_23.content.Parent.CanvasSize = UDim2.new(0, 0, 0, v29.AbsoluteContentSize.Y + 35)
    if v25 then
        p_u_23.selected_house_id = nil
        p_u_23:select_house(v25.house_id)
    end
end
function v10._get_house_by_id(_, p30)
    for _, v31 in v_u_6.get("house_manager") or {} do
        if v31.house_id == p30 then
            return v31
        end
    end
    return nil
end
function v10._sell_house(p32, p33)
    local v34 = p32:_get_house_by_id(p33)
    if v34 then
        local v35 = v_u_7[v34.building_type]
        local v36
        if v35.gamepass == nil then
            v36 = not v35.was_robux_house
        else
            v36 = false
        end
        if v36 then
            p32.sell_in_progress = true
            local v37 = v_u_4.get("HousingAPI/GetWholeHouseValue"):InvokeServer(p33)
            if v37 then
                if p32.UIManager.apps.DialogApp:dialog({
                    ["text"] = string.format("Sell \"%s\" for $%d?", v34.name, v37),
                    ["left"] = "Cancel",
                    ["right"] = "Sell",
                    ["accept_delay"] = 3
                }) == "Sell" then
                    v_u_4.get("HousingAPI/SellHouse"):InvokeServer(p33)
                end
            else
                p32.UIManager.apps.DialogApp:dialog({
                    ["text"] = "You can\'t sell your only house! Otherwise where would you live?",
                    ["button"] = "Okay"
                })
            end
            p32.sell_in_progress = false
        end
    end
end
function v10.get_selected_house(p38)
    return p38:_get_house_by_id(p38.selected_house_id)
end
function v10.select_house(p39, p40)
    if p39.selected_house_id ~= p40 then
        local v41 = p39.house_buttons[p39.selected_house_id]
        if v41 then
            v41:set_state("normal")
        end
        local v42 = p39.house_buttons[p40]
        if v42 then
            v42:set_state("selected")
        end
        p39.selected_house_id = p40
        local v43 = p39:get_selected_house()
        p39:set_no_edit_message_visible(v43.listed_for_trade)
        local v44
        if v43 then
            v44 = v_u_7[v43.building_type]
        else
            v44 = v43
        end
        local v45
        if v44 then
            if v44.gamepass == nil then
                v45 = not v44.was_robux_house
            else
                v45 = false
            end
        else
            v45 = v44
        end
        p39.house_name_label.Text = v43 and (v43.name or "") or ""
        p39.house_type_label.Text = v44 and (v44.name or "") or ""
        if v44 and v44.addons then
            p39.house_viewport.Size = p39.house_viewport_addon_size
            p39.addon_button.instance.Visible = true
        else
            p39.house_viewport.Size = UDim2.new(1, 0, 1, 0)
            p39.addon_button.instance.Visible = false
        end
        p39.sell_button.instance.Visible = v45
        p39.sell_gamepass_text.Visible = not v45
        p39.color_picker:set_color(v43 and v43.color or Color3.new(1, 1, 1))
        p39:_refresh_house_model(false)
    end
end
function v10.show(p_u_46)
    p_u_46:_refresh_house_model(true)
    p_u_46.container.Visible = true
    v_u_1("CoreUIInsetHelper").run_once_if_intersecting(p_u_46.close_button.instance, function(p47)
        p_u_46.close_button.instance.Position = p_u_46.close_button.instance.Position + UDim2.fromOffset(-p47 - 4, 0)
    end)
end
function v10.hide(p48)
    p48.container.Visible = false
end
function v10.set_no_edit_message_visible(p49, p50)
    p49.body.RightFrame.Top.Visible = not p50
    p49.body.RightFrame.Bottom.Visible = not p50
    p49.body.RightFrame.NoEditMessage.Visible = p50
end
function v10.start(p_u_51)
    p_u_51.house_refresh_promise = v_u_9.resolve()
    p_u_51.container = p_u_51.instance.Container
    p_u_51.body = p_u_51.container.Body
    p_u_51.content = p_u_51.body.ScrollComplex.ScrollingFrame.Content
    p_u_51.house_info = p_u_51.body.RightFrame.Bottom
    p_u_51.house_name_label = p_u_51.body.RightFrame.Top.HouseName.Backing.TextFrame.TextBox
    p_u_51.house_type_label = p_u_51.body.RightFrame.Top.HouseName.Backing.BottomBacking.TextLabel
    p_u_51.house_buttons = {}
    p_u_51.house_button_template = p_u_51.content.HouseButton
    p_u_51.house_button_template.Parent = nil
    p_u_51.selected_house_id = nil
    p_u_51.body.RightFrame.Top.HouseName.Backing.TextFrame.TextBox.FocusLost:Connect(function()
        local v52 = p_u_51.body.RightFrame.Top.HouseName.Backing.TextFrame.TextBox.Text
        if p_u_51.selected_house_id and v52:gsub("%s", "") ~= "" then
            v_u_4.get("HousingAPI/RenameHouse"):FireServer(p_u_51.selected_house_id, v52)
        end
    end)
    p_u_51.house_viewport = p_u_51.house_info.Left.HouseViewport
    p_u_51.house_viewport_addon_size = p_u_51.house_viewport.Size
    p_u_51.viewer_3d = p_u_51.UIManager.wrap(p_u_51.house_viewport.ViewportFrame, "ModelViewer3D"):start({
        ["target_x_rotation"] = -0.3490658503988659,
        ["field_of_view"] = 1,
        ["can_input"] = true
    })
    p_u_51.color_picker = p_u_51.UIManager.wrap(p_u_51.house_info.Right.ColorPicker.Button, "HouseColorPicker"):start({
        ["initial_color"] = Color3.new(1, 1, 1),
        ["on_color_picked"] = function(p53)
            if p_u_51.selected_house_id then
                p_u_51:_refresh_house_model(false)
                v_u_4.get("HousingAPI/ColorHouse"):FireServer(p_u_51.selected_house_id, p53)
            end
        end
    })
    p_u_51.buy_button = p_u_51.UIManager.wrap(p_u_51.content.BuyButton, "DepthButton"):start({
        ["shine"] = true,
        ["state"] = "normal",
        ["mouse_button1_click"] = function()
            if not p_u_51.sell_in_progress then
                p_u_51.UIManager.set_app_visibility(p_u_51.ClassName, false)
                p_u_51.UIManager.set_app_visibility("HousePurchaseApp", true)
                p_u_51.UIManager.apps.HousePurchaseApp:reset()
            end
        end
    })
    p_u_51.close_button = p_u_51.UIManager.wrap(p_u_51.container.Header.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            if not p_u_51.sell_in_progress then
                p_u_51.UIManager.set_app_visibility(p_u_51.ClassName, false)
            end
        end
    })
    local v57 = {
        ["mouse_button1_click"] = function()
            if not p_u_51.sell_in_progress then
                local v54 = p_u_51:get_selected_house()
                local v55
                if v54 then
                    v55 = v_u_7[v54.building_type]
                else
                    v55 = v54
                end
                local v56
                if v54 then
                    v56 = p_u_51:_get_active_addons(v54)
                else
                    v56 = v54
                end
                if v54 and (v55 and v56) then
                    p_u_51.UIManager.set_app_visibility(p_u_51.ClassName, false)
                    p_u_51.UIManager.apps.HouseAddonsApp:display({
                        ["source_app_name"] = p_u_51.ClassName,
                        ["house_kind"] = v55.kind,
                        ["house_id"] = v54.house_id,
                        ["color"] = v54.color or Color3.new(1, 1, 1),
                        ["addons"] = v56
                    })
                end
            end
        end
    }
    p_u_51.addon_button = p_u_51.UIManager.wrap(p_u_51.house_info.Left.AddonButton, "DepthButton"):start(v57)
    local v58 = {
        ["mouse_button1_click"] = function()
            if not p_u_51.sell_in_progress then
                v_u_4.get("HousingAPI/SpawnHouse"):FireServer(p_u_51.selected_house_id)
            end
        end
    }
    p_u_51.go_button = p_u_51.UIManager.wrap(p_u_51.house_info.Right.GoButton, "DepthButton"):start(v58)
    p_u_51.sell_button = p_u_51.UIManager.wrap(p_u_51.house_info.Right.SellButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            if not p_u_51.sell_in_progress then
                p_u_51:_sell_house(p_u_51.selected_house_id)
            end
        end
    })
    p_u_51.sell_gamepass_text = p_u_51.house_info.Right.SellText
    local v59 = {
        ["mouse_button1_click"] = function()
            if not p_u_51.sell_in_progress then
                v_u_4.get("HousingAPI/UnlistHouse"):InvokeServer()
            end
        end
    }
    p_u_51.unlist_button = p_u_51.UIManager.wrap(p_u_51.body.RightFrame.NoEditMessage.UnlistButton, "DepthButton"):start(v59)
    v_u_6.register_callback_plus_existing("house_manager", function()
        p_u_51:_refresh_owned_houses()
    end)
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_51.container,
        ["default_selection"] = p_u_51.buy_button.instance,
        ["app_name"] = p_u_51.ClassName,
        ["exit_buttons"] = { p_u_51.container.Header.ExitButton }
    })
end
return v10