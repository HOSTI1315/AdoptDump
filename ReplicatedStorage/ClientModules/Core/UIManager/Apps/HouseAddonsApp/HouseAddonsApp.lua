--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HouseAddonsApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("HouseExteriorCache")
local v_u_3 = v_u_1("DeveloperProductDB")
local v_u_4 = v_u_1("HouseRenderHelper")
local v_u_5 = v_u_1("RouterClient")
local v_u_6 = v_u_1("XboxSupport")
local v_u_7 = v_u_1("GamepassDB")
local v_u_8 = v_u_1("HouseDB")
local v9 = v_u_1("Class")
local v_u_10 = v_u_1("Maid")
local v_u_11 = v_u_1("ClientData")
local v_u_12 = v_u_1("new:TextUtil")
local v_u_13 = v_u_1("package:Promise")
local v_u_14 = v_u_1("package:Sift")
local v_u_15 = utf8.char(57346)
local v16 = v9("HouseAddonsApp", v_u_1("UIBaseApp"))
function v16._zoom(p17, p18)
    local v19 = p17.viewer_3d:get_default_distance()
    local v20 = p17.viewer_3d
    local v21 = p17.viewer_3d:get_target_distance() + v19 * p18
    local v22 = v19 * 0.25
    local v23 = v19 * 1.25
    v20:set_target_distance((math.clamp(v21, v22, v23)))
end
function v16._get_displayed_addons(p24)
    local v25 = {}
    local v26 = p24.configuration
    if v26 then
        v26 = v_u_8[p24.configuration.house_kind]
    end
    if v26 and v26.addons then
        for v27, _ in v26.addons do
            v25[v27] = false
        end
        for _, v28 in p24.content:GetChildren() do
            if v28:IsA("ImageButton") then
                local v29 = v28.ViewportFrame.Checkbox.Checkmark
                v25[v28.Name] = v29.Visible
            end
        end
    end
    return v25
end
function v16._get_changed_addons(p30)
    local v31 = {}
    local v32 = p30:_get_displayed_addons()
    local v33 = p30.configuration
    if v33 then
        v33 = v_u_8[p30.configuration.house_kind]
    end
    if v33 then
        local v34 = v33.addons or {}
        for v35, v36 in v32 do
            if v34[v35] and (p30.configuration.addons[v35] and true or false) ~= v36 then
                v31[v35] = v36
            end
        end
    end
    return v31
end
function v16._get_cost_delta(p37)
    local v38 = 0
    local v39 = p37.configuration
    if v39 then
        v39 = v_u_8[p37.configuration.house_kind]
    end
    local v_u_40 = p37.configuration
    if v_u_40 then
        v_u_40 = p37.configuration.house_id
    end
    local v41 = v_u_11.get("house_manager")
    local v42
    if v_u_40 and v41 then
        v42 = v_u_14.List.findWhere(v_u_11.get("house_manager"), function(p43)
            return p43.house_id == v_u_40
        end) or nil
    else
        v42 = nil
    end
    local v44
    if v42 then
        v44 = v41[v42]
    else
        v44 = nil
    end
    if v39 then
        local v45 = v39.addons or {}
        local v46 = p37:_get_changed_addons()
        if not v_u_40 then
            v38 = v38 + (v39.cost or 0)
        end
        for v47, v48 in v46 do
            local v49 = v45[v47]
            if v49 then
                if v48 then
                    v38 = v38 + v49.cost
                else
                    local v50
                    if v44 then
                        v50 = v44.addons_from_trade
                    else
                        v50 = v44
                    end
                    local v51
                    if v50 then
                        v51 = v50[v47]
                    else
                        v51 = false
                    end
                    v38 = v38 - (v51 and 0 or v49.sell_price)
                end
            end
        end
    end
    return v38
end
function v16._is_selling_addon(p52)
    local v53 = p52:_get_displayed_addons()
    local v54 = p52.configuration
    if v54 then
        v54 = v_u_8[p52.configuration.house_kind]
    end
    if v54 then
        local v55 = v54.addons or {}
        for v56, v57 in v53 do
            if v55[v56] and (p52.configuration.addons[v56] == true and v57 == false) then
                return true
            end
        end
    end
    return false
end
function v16._refresh_total_house_price(p58)
    local v_u_59 = p58.main_section.HouseViewport.CostBreakdown
    local v60 = p58.configuration
    if v60 then
        v60 = v_u_8[p58.configuration.house_kind]
    end
    local v_u_61 = p58.configuration.house_id and true or false
    if v60 then
        local v62 = p58:_get_cost_delta()
        local v63 = p58:_get_changed_addons()
        local v_u_64 = ""
        local v_u_65 = 0
        local v_u_66
        if v_u_61 or not v60.gamepass then
            v_u_66 = ("$%*"):format((math.abs(v62)))
            if v62 > 0 then
                v_u_64 = "COST:"
            elseif v62 < 0 then
                v_u_64 = "EARN:"
            end
        else
            v_u_66 = ("%*%*"):format(v_u_15, (v_u_7[v60.gamepass] or v_u_3[v60.gamepass]).cost)
            v_u_65 = -5
            v_u_64 = "COST:"
        end
        v_u_12.on_text_bounds_multi({
            ["action"] = {
                ["Instance"] = v_u_59.Action.Content.TextLabel
            },
            ["price"] = {
                ["Instance"] = v_u_59.Content.TextLabel
            }
        }, function(p67)
            v_u_59.Size = UDim2.new(0, p67.price.X + 10 + v_u_65, 0, v_u_59.Size.Y.Offset)
            v_u_59.Content.TextLabel.Text = v_u_66
            v_u_59.Action.Size = UDim2.new(0, p67.action.X + 10, 0, v_u_59.Action.Size.Y.Offset)
            v_u_59.Action.Content.TextLabel.Text = v_u_64
            local v68 = v_u_59.Action
            local v69
            if v_u_64 == "" then
                v69 = false
            else
                v69 = v_u_61
            end
            v68.Visible = v69
        end)
        if v_u_61 then
            if next(v63) then
                p58.confirm_button:set_state("normal")
            else
                p58.confirm_button:set_state("disabled")
            end
        else
            p58.confirm_button:set_state("normal")
        end
    else
        p58.confirm_button:set_state("disabled")
    end
    v_u_59.Visible = v60 and true or false
end
function v16._refresh_house_model(p_u_70, p_u_71)
    p_u_70.viewer_3d:set_model(nil)
    p_u_70.house_refresh_promise:cancel()
    local v_u_72 = p_u_70.configuration
    if v_u_72 then
        v_u_72 = v_u_8[p_u_70.configuration.house_kind]
    end
    if v_u_72 then
        p_u_70.house_refresh_promise = v_u_2.request(v_u_72):andThen(function(p73)
            local v74 = p_u_70.viewer_3d:get_distance()
            p73:PivotTo(CFrame.identity)
            p73.Plot.Transparency = 1
            v_u_4.color_house_exterior(p73, p_u_70.configuration.color)
            if v_u_72.addons then
                v_u_4.apply_addons_to_exterior(p73, v_u_72, p_u_70:_get_displayed_addons())
            end
            if p_u_71 then
                p_u_70.viewer_3d:reset_rotation(-0.3490658503988659, 3.141592653589793)
                v74 = nil
            end
            p_u_70.viewer_3d:set_model(p73)
            if v74 then
                p_u_70.viewer_3d:set_distance(v74)
            end
            v_u_4.add_dome_to_exterior(p_u_70.viewer_3d:get_model())
            p73:Destroy()
        end)
    end
end
function v16._refresh_addons_list(p_u_75, p_u_76)
    p_u_75.addon_buttons_maid:DoCleaning()
    p_u_75.house_addons_refresh_promise:cancel()
    local v77 = nil
    local v_u_78 = p_u_75.configuration
    if v_u_78 then
        v_u_78 = v_u_8[p_u_75.configuration.house_kind]
    end
    if v_u_78.gamepass then
        v77 = v_u_7[v_u_78.gamepass] or v_u_3[v_u_78.gamepass]
    end
    if p_u_75.configuration and (v_u_78 and v_u_78.addons) then
        local v_u_79 = p_u_75.configuration.house_id and true or false
        if v77 then
            v77 = not v_u_79
        end
        local v_u_80 = not v77
        p_u_75.main_section.Size = p_u_75.main_section_addon_size
        p_u_75.main_section.HouseViewport.Size = p_u_75.viewport_addon_size
        p_u_75.main_section.DisclaimerLabel.Visible = true
        p_u_75.scroll_complex.Visible = true
        p_u_75.house_addons_refresh_promise = v_u_2.request(v_u_78):andThen(function(p81)
            for v82, v83 in v_u_78.addons do
                local v84 = v_u_79
                if v84 then
                    v84 = p_u_75.configuration.addons[v82]
                end
                local v_u_85 = p_u_75.addon_button_template:Clone()
                v_u_85.Name = v82
                v_u_85.LayoutOrder = v83.order
                v_u_85.Bottom.TextLabel.Text = v83.name
                v_u_85.ViewportFrame.Corner.Price.Text = ("$%*"):format(v83.cost)
                v_u_85.Parent = p_u_75.content
                v_u_85.ViewportFrame.Corner.Owned.Visible = v84
                v_u_85.ViewportFrame.Corner.Price.Visible = not v84
                if not v84 then
                    local v86 = {
                        ["Instance"] = v_u_85.ViewportFrame.Corner.Price
                    }
                    v_u_12.on_text_bounds(v86, function(p87)
                        v_u_85.ViewportFrame.Corner.Size = UDim2.new(0, 14 + p87.X, 0, 16)
                    end)
                end
                local v88 = v_u_85.ViewportFrame.Checkbox
                local v_u_89 = v88.Checkmark
                local v_u_90 = v_u_85.Activated:Connect(function()
                    if v_u_80 then
                        v_u_89.Visible = not v_u_89.Visible
                        p_u_75:_refresh_total_house_price()
                        p_u_75:_refresh_house_model(false)
                    end
                end)
                if v_u_80 then
                    if p_u_76 then
                        v_u_89.Visible = p_u_76[v82] and true or false
                    else
                        v_u_89.Visible = p_u_75.configuration.addons[v82] and true or false
                    end
                else
                    v88.Visible = false
                    v_u_89.Visible = false
                end
                local v_u_91 = p_u_75.UIManager.wrap(v_u_85.ViewportFrame, "ModelViewer3D"):start({
                    ["target_x_rotation"] = -0.3490658503988659,
                    ["field_of_view"] = 1,
                    ["can_input"] = false
                })
                local v92 = p81:Clone()
                v92:PivotTo(CFrame.identity)
                v92.Plot.Transparency = 1
                v_u_4.color_house_exterior(v92, p_u_75.configuration.color)
                v_u_4.apply_addons_to_exterior(v92, v_u_78, {
                    [v82] = true
                })
                v_u_91:reset_rotation(-0.3490658503988659, 3.141592653589793)
                v_u_91:set_model(v92)
                v_u_4.add_dome_to_exterior(v_u_91:get_model())
                v92:Destroy()
                p_u_75.addon_buttons_maid:GiveTask(function()
                    v_u_90:Disconnect()
                    v_u_91:destroy()
                    v_u_85:Destroy()
                end)
            end
            p81:Destroy()
        end):andThen(function()
            local v93 = p_u_75.content.UIListLayout
            p_u_75.content.Parent.CanvasSize = UDim2.new(0, 0, 0, v93.AbsoluteContentSize.Y + 35)
            p_u_75.content.Parent.CanvasPosition = Vector2.new(0, 0)
        end)
    else
        p_u_75.main_section.Size = UDim2.new(1, 0, 1, -44)
        p_u_75.main_section.HouseViewport.Size = UDim2.new(1, 0, 1, 0)
        p_u_75.main_section.DisclaimerLabel.Visible = false
        p_u_75.scroll_complex.Visible = false
    end
end
function v16._prompt_buy_new_house(p94)
    local v95 = p94.configuration
    if v95 then
        v95 = v_u_8[p94.configuration.house_kind]
    end
    if v95 then
        local v96 = v95.cost or 0
        local v97 = v95.addons or {}
        local v98 = {}
        for v99, v100 in p94:_get_displayed_addons() do
            local v101 = v97[v99]
            if v101 and v100 then
                v96 = v96 + v101.cost
                table.insert(v98, v99)
            end
        end
        if v_u_1("ShopM").pre_buy(v96, {
            ["prompt_not_enough_money"] = true,
            ["prompt_confirmation"] = true
        }) then
            p94.UIManager.set_app_visibility(p94.ClassName, false)
            v_u_5.get("HousingAPI/BuyHouseWithAddons"):InvokeServer(v95.kind, v98, p94.color_picker:get_color())
        end
    end
end
function v16._prompt_modify_house(p102)
    local v103 = p102.configuration
    if v103 then
        v103 = p102.configuration.house_id
    end
    local v104 = p102.configuration
    if v104 then
        v104 = v_u_8[p102.configuration.house_kind]
    end
    if v103 and v104 then
        local v105 = p102:_get_displayed_addons()
        if (not p102:_is_selling_addon() and "Okay" or p102.UIManager.apps.DialogApp:dialog({
            ["text"] = "Furniture inside the Expansion will be sold with it. Continue?",
            ["right"] = "Okay",
            ["left"] = "Cancel"
        })) == "Okay" then
            local v106 = v_u_5.get("HousingAPI/GetModifyHouseAddonsValue"):InvokeServer(v103, v105)
            local v107 = "Update " .. v104.name
            local v108
            if v106 >= 0 then
                v108 = v107 .. " for $%d?"
            else
                v108 = v107 .. " and earn $%d back?"
            end
            if v_u_1("ShopM").pre_buy(v106, {
                ["purchase_confirmation_message"] = v108:format((math.abs(v106))),
                ["pay_button_text"] = v106 < 0 and "Sell" or "Buy",
                ["prompt_not_enough_money"] = true,
                ["prompt_confirmation"] = true
            }) then
                p102.UIManager.set_app_visibility(p102.ClassName, false)
                v_u_5.get("HousingAPI/ModifyHouseAddons"):InvokeServer(v103, v105)
            end
        end
    end
end
function v16.get_configuration(p109)
    local v110 = table.clone(p109.configuration)
    v110.addons = table.clone(p109.configuration.addons)
    return v110
end
function v16.display(p111, p112)
    p111.UIManager.set_app_visibility(p111.ClassName, true)
    p111.configuration = table.clone(p112)
    p111.configuration.addons = table.clone(p111.configuration.addons)
    local v113 = v_u_8[p111.configuration.house_kind]
    local v114
    if v113.gamepass then
        v114 = v_u_7[v113.gamepass] or v_u_3[v113.gamepass]
    else
        v114 = nil
    end
    p111.color_picker:set_color(p111.configuration.color)
    if v114 then
        p111.color_picker.instance.Visible = false
    else
        p111.color_picker.instance.Visible = not p111.configuration.house_id
    end
    p111:_refresh_addons_list(nil)
    p111:_refresh_house_model(true)
    p111:_refresh_total_house_price()
    if p111.configuration.house_id then
        p111.confirm_button.instance.Face.TextLabel.Text = "Confirm"
        p111.preview_button.instance.Visible = false
    else
        if v114 then
            p111.confirm_button.instance.Face.TextLabel.Text = "Unlock"
        else
            p111.confirm_button.instance.Face.TextLabel.Text = "Build"
        end
        p111.preview_button.instance.Visible = true
    end
    v_u_5.get("HousingAPI/SetRecentlyViewedHouseTemplate"):FireServer(p111.configuration.house_kind)
end
function v16.show(p115)
    p115.configuration = nil
    p115.container.Visible = true
end
function v16.hide(p116)
    p116.viewer_3d:set_model(nil)
    p116.addon_buttons_maid:DoCleaning()
    p116.container.Visible = false
end
function v16.start(p_u_117)
    p_u_117.house_refresh_promise = v_u_13.resolve()
    p_u_117.house_addons_refresh_promise = v_u_13.resolve()
    p_u_117.configuration = nil
    p_u_117.house_exterior_maid = v_u_10.new()
    p_u_117.processing = false
    p_u_117.container = p_u_117.instance.Container
    p_u_117.body = p_u_117.container.Body
    p_u_117.scroll_complex = p_u_117.body.ScrollComplex
    p_u_117.content = p_u_117.scroll_complex.ScrollingFrame.Content
    p_u_117.addon_button_template = p_u_117.content.AddonButton
    p_u_117.addon_button_template.Parent = nil
    p_u_117.addon_buttons_maid = v_u_10.new()
    p_u_117.main_section = p_u_117.body.MainSection
    p_u_117.buttons = p_u_117.body.Buttons
    p_u_117.main_section_addon_size = p_u_117.main_section.Size
    p_u_117.viewport_addon_size = p_u_117.main_section.HouseViewport.Size
    p_u_117.foreground = p_u_117.main_section.HouseViewport.Contents.Foreground
    p_u_117.viewport = p_u_117.main_section.HouseViewport.Contents.ViewportFrame
    p_u_117.viewer_3d = p_u_117.UIManager.wrap(p_u_117.viewport, "ModelViewer3D"):start({
        ["target_x_rotation"] = -0.3490658503988659,
        ["field_of_view"] = 1,
        ["can_input"] = true
    })
    p_u_117.foreground.ZoomIn.Activated:Connect(function()
        if p_u_117.configuration and not p_u_117.processing then
            p_u_117:_zoom(-0.1)
        end
    end)
    p_u_117.foreground.ZoomOut.Activated:Connect(function()
        if p_u_117.configuration and not p_u_117.processing then
            p_u_117:_zoom(0.1)
        end
    end)
    p_u_117.color_picker = p_u_117.UIManager.wrap(p_u_117.foreground.ColorPicker.Button, "HouseColorPicker"):start({
        ["initial_color"] = Color3.new(1, 1, 1),
        ["on_color_picked"] = function(p118)
            if p_u_117.configuration then
                p_u_117.configuration.color = p118
                p_u_117:_refresh_addons_list(p_u_117:_get_displayed_addons())
                p_u_117:_refresh_house_model(false)
                p_u_117:_refresh_total_house_price()
            end
        end
    })
    local v_u_119 = v_u_13.resolve()
    local v125 = {
        ["state"] = "selected",
        ["mouse_button1_click"] = function()
            if p_u_117.configuration and not p_u_117.processing then
                local v120 = v_u_1("InteriorsM")
                local v_u_121 = p_u_117:get_configuration()
                local v_u_122 = "preview_housing!" .. p_u_117.configuration.house_kind
                p_u_117.UIManager.set_app_visibility(p_u_117.ClassName, false)
                v120.enter_smooth(v_u_122, "MainDoor", {
                    ["studs_ahead_of_door"] = 6
                })
                v_u_119:cancel()
                v_u_119 = v_u_13.fromEvent(v120.on_location_changed, function(p123)
                    return p123.destination_id ~= v_u_122
                end):andThen(function(p124)
                    if p124.destination_id == "Neighborhood" then
                        p_u_117:display(v_u_121)
                    end
                end)
            end
        end
    }
    p_u_117.preview_button = p_u_117.UIManager.wrap(p_u_117.foreground.PreviewButton, "DepthButton"):start(v125)
    local v128 = {
        ["state"] = "normal",
        ["mouse_button1_click"] = function()
            if p_u_117.configuration and not p_u_117.processing then
                local v126 = v_u_8[p_u_117.configuration.house_kind]
                p_u_117.processing = true
                if p_u_117.configuration.house_id then
                    p_u_117:_prompt_modify_house()
                elseif v126.gamepass then
                    local v127 = p_u_117:get_configuration()
                    p_u_117.UIManager.set_app_visibility(p_u_117.ClassName, false)
                    if p_u_117.UIManager.apps.DialogApp:dialog({
                        ["product_id"] = v126.gamepass,
                        ["dialog_type"] = "RobuxProductDialog"
                    }) == "No Thanks" then
                        p_u_117:display(v127)
                    end
                else
                    p_u_117:_prompt_buy_new_house()
                end
                p_u_117.processing = false
            end
        end
    }
    p_u_117.confirm_button = p_u_117.UIManager.wrap(p_u_117.buttons.Confirm, "DepthButton"):start(v128)
    p_u_117.cancel_button = p_u_117.UIManager.wrap(p_u_117.buttons.Cancel, "DepthButton"):start({
        ["state"] = "cancel",
        ["mouse_button1_click"] = function()
            if p_u_117.configuration and not p_u_117.processing then
                p_u_117.UIManager.set_app_visibility(p_u_117.ClassName, false)
                p_u_117.UIManager.set_app_visibility(p_u_117.configuration.source_app_name, true)
            end
        end
    })
    v_u_6.quick_watch({
        ["selection_parent"] = p_u_117.container,
        ["default_selection"] = p_u_117.confirm_button.instance,
        ["app_name"] = p_u_117.ClassName,
        ["close_override"] = function()
            if not p_u_117.configuration or p_u_117.processing then
                return false
            end
            p_u_117.UIManager.set_app_visibility(p_u_117.configuration.source_app_name, true)
            return true
        end
    })
end
return v16