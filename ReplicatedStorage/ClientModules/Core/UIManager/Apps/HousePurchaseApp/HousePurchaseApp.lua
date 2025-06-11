--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HousePurchaseApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RobuxProductDynamicCost")
local v_u_3 = v1("DeveloperProductDB")
local v_u_4 = v1("ColorThemeManager")
local v_u_5 = v1("FormatHelper")
local v_u_6 = v1("LiveOpsTime")
local v_u_7 = v1("XboxSupport")
local v_u_8 = v1("GamepassDB")
local v_u_9 = v1("PlatformM")
local v_u_10 = v1("HouseDB")
local v11 = v1("Class")
local v_u_12 = v1("new:TextUtil")
local v_u_13 = v1("package:Promise")
local v_u_14 = game:GetService("GuiService")
local v15 = v11("HousePurchaseApp", v1("UIBaseApp"))
local v16 = game:GetService("Players")
local v_u_17 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v16.LocalPlayer)
local v_u_18 = utf8.char(57346)
local v_u_19 = Random.new()
function v15._render_house_buttons(p_u_20)
    for _, v21 in p_u_20.house_buttons do
        v21:Destroy()
    end
    p_u_20.house_buttons = {}
    for _, v22 in p_u_20.takedown_promises do
        v22:cancel()
    end
    p_u_20.takedown_promises = {}
    for _, v_u_23 in v_u_10 do
        if not (v_u_23.takedown_timestamp and v_u_6.has_happened(v_u_23.takedown_timestamp)) and (v_u_23.is_for_sale or v_u_23.gamepass) then
            local v_u_24 = p_u_20.button_template:Clone()
            local v_u_25 = v_u_24.BottomCover.CostBreakdown
            local v_u_26 = v_u_25.Size.Y.Offset
            v_u_24.Name = v_u_23.kind
            v_u_24.LayoutOrder = v_u_23.order
            v_u_24.Icon.Image = v_u_23.image
            v_u_24.BottomCover.TitleLabel.Text = v_u_23.name
            v_u_24.AddonFrame.Visible = v_u_23.addons and true or false
            v_u_24.LastChanceSign.Visible = v_u_23.takedown_timestamp ~= nil and true or v_u_23.is_last_chance
            v_u_24.TakedownTimer.Visible = v_u_23.takedown_timestamp ~= nil
            if v_u_23.takedown_timestamp then
                local v27 = p_u_20.takedown_promises
                local v32 = v_u_13.race({ v_u_6.delay_until(v_u_23.takedown_timestamp), v_u_13.new(function(_, _, p28)
                        while not p28() do
                            local v29 = v_u_6.get_time_until(v_u_23.takedown_timestamp)
                            local v30 = v_u_5.get_time_breakdown(v29)
                            local v31 = v_u_24.TakedownTimer.TextLabel
                            if v30.days > 0 then
                                v31.Text = ("%s %s"):format(v30.days, v30.days > 1 and "DAYS" or "DAY")
                            else
                                v31.Text = ("%02d:%02d:%02d"):format(v30.hours, v30.minutes, v30.seconds)
                            end
                            task.wait(1)
                        end
                    end) })
                table.insert(v27, v32:andThen(function()
                    p_u_20.selected_house_kind = nil
                    p_u_20:_render_house_buttons()
                    p_u_20:_refresh_search_results(nil)
                end))
            end
            local function v42()
                local v33 = nil
                local v34
                if v_u_23.gamepass then
                    local v35 = v_u_8[v_u_23.gamepass] or v_u_3[v_u_23.gamepass]
                    v34 = ("%*%*"):format(v_u_18, v35.cost)
                    if v35.original_cost then
                        v33 = ("%*%*"):format(v_u_18, v35.original_cost)
                    end
                else
                    v34 = ("$%*"):format(v_u_23.cost)
                    if v_u_23.original_cost then
                        v33 = ("$%*"):format(v_u_23.original_cost)
                    end
                end
                v_u_25.Content.TextLabel.RichText = true
                local v36, v_u_37
                if v33 then
                    v36 = ("<font transparency=\"0.3\"><s>%s</s></font>\n%s"):format(v33, v34)
                    v_u_37 = v_u_26 * 2
                else
                    v_u_37 = v_u_26
                    v36 = v34
                end
                v_u_12.on_text_bounds_multi({
                    ["cost"] = {
                        ["Instance"] = v_u_25.Content.TextLabel,
                        ["Text"] = v34
                    },
                    ["original_cost"] = v33 and {
                        ["Instance"] = v_u_25.Content.TextLabel,
                        ["Text"] = v33
                    } or v33
                }, function(p38)
                    local v39 = p38.cost.X
                    local v40 = p38.original_cost and p38.original_cost.X or 0
                    local v41 = math.max(v39, v40)
                    v_u_25.Size = UDim2.new(0, v41 + 8, 0, v_u_37)
                end)
                v_u_25.Content.TextLabel.Text = v36
            end
            v42()
            if v_u_23.gamepass then
                v_u_2.prices_changed:Connect(v42)
            end
            v_u_24.Activated:Connect(function()
                p_u_20:_select_house(v_u_23.kind)
            end)
            v_u_24.Parent = p_u_20.content
            local v43 = p_u_20.house_buttons
            table.insert(v43, v_u_24)
        end
    end
end
function v15._refresh_search_results(p_u_44, p45)
    local v46 = nil
    for _, v47 in p_u_44.house_buttons do
        local v48 = v_u_10[v47.Name]
        local v49
        if p45 then
            local v50 = v_u_17:Translate(workspace, v48.name)
            local v51 = p45:lower()
            v49 = string.find(v50:lower(), v51, 1, true) and true or false
        else
            v49 = true
        end
        v47.Visible = v49
        if v49 and (not v46 or v47.LayoutOrder < v46.LayoutOrder) then
            v46 = v47
        end
    end
    v_u_9.run({
        ["default"] = function()
            local v52 = p_u_44.content.UIGridLayout
            p_u_44.content.Parent.CanvasSize = UDim2.new(0, 0, 0, v52.AbsoluteContentSize.Y + 85)
        end,
        ["phone"] = function()
            local v53 = p_u_44.content.UIListLayout
            p_u_44.content.Parent.CanvasSize = UDim2.new(0, v53.AbsoluteContentSize.X, 0, 0)
        end
    })
    p_u_44.content.Parent.CanvasPosition = Vector2.new(0, 0)
    p_u_44:_select_house(v46 and v46.Name or nil)
end
function v15._select_house(p54, p55)
    if p54.selected_house_kind == p55 then
        if p54.UIManager.is_visible(p54.ClassName) then
            p54.watch:select_object(p54.next_button.instance)
        end
        return
    else
        p54.selected_house_kind = p55
        local v56 = "green"
        local v57 = v_u_4.get_theme_color() == v56 and "purple" or v56
        for _, v58 in p54.house_buttons do
            local v59 = v_u_4.lookup("saturated")
            if v58.Name == p55 then
                v59 = v_u_4.lookup_specific_color(v57, "saturated")
            end
            v58.BottomCover.BackgroundColor3 = v59
            v58.BottomCover.Cover.BackgroundColor3 = v59
            v58.BottomCover.Cover.Cover.BackgroundColor3 = v59
            v58.Background.Edge.UIStroke.Color = v59
            v58.AddonFrame.Corner.ImageColor3 = v59
            local v60 = v58.BottomCover.CostBreakdown
            v60.Background.BackgroundColor3 = v59
            for _, v61 in v60.Background:GetChildren() do
                if v61.Name == "Cover" then
                    v61.BackgroundColor3 = v59
                end
            end
        end
        p54.next_button.instance.Face.TextLabel.Text = "Next"
        if p54.selected_house_kind then
            p54.next_button:set_state("normal")
        else
            p54.next_button:set_state("disabled")
        end
    end
end
function v15.reset(p62)
    p62.search_bar:reset_search()
    p62:_refresh_search_results(nil)
end
function v15.show(p63)
    p63.container.Visible = true
end
function v15.hide(p64)
    p64.container.Visible = false
end
function v15.start(p_u_65)
    p_u_65.takedown_promises = {}
    p_u_65.selected_house_kind = nil
    p_u_65.container = p_u_65.instance.Container
    p_u_65.body = p_u_65.container.Body
    p_u_65.buttons = p_u_65.body.Buttons
    p_u_65.content = p_u_65.body.ScrollComplex.ScrollingFrame.Content
    p_u_65.button_template = p_u_65.content.HouseButton
    p_u_65.button_template.Parent = nil
    p_u_65.search_bar = p_u_65.UIManager.wrap(p_u_65.container.Header.InsetSpace.Search.TextBox, "GenericSearchBar"):start(function(p66)
        p_u_65:_refresh_search_results(p66)
    end)
    local v69 = {
        ["state"] = "normal",
        ["mouse_button1_click"] = function()
            if p_u_65.selected_house_kind then
                local v67 = v_u_10[p_u_65.selected_house_kind]
                local v68 = Color3.fromHSV(v_u_19:NextNumber(), 0.65, 1)
                if v67 and v67.default_color then
                    v68 = v67.default_color
                end
                p_u_65.UIManager.set_app_visibility(p_u_65.ClassName, false)
                p_u_65.UIManager.apps.HouseAddonsApp:display({
                    ["house_kind"] = p_u_65.selected_house_kind,
                    ["source_app_name"] = p_u_65.ClassName,
                    ["color"] = v68,
                    ["addons"] = {}
                })
            end
        end
    }
    p_u_65.next_button = p_u_65.UIManager.wrap(p_u_65.buttons.Next, "DepthButton"):start(v69)
    p_u_65.cancel_button = p_u_65.UIManager.wrap(p_u_65.buttons.Cancel, "DepthButton"):start({
        ["state"] = "cancel",
        ["mouse_button1_click"] = function()
            p_u_65.UIManager.set_app_visibility(p_u_65.ClassName, false)
            p_u_65.UIManager.set_app_visibility("HouseChooserApp", true)
        end
    })
    p_u_65.house_buttons = {}
    p_u_65:_render_house_buttons()
    p_u_65:_refresh_search_results(nil)
    p_u_65.watch = v_u_7.quick_watch({
        ["selection_parent"] = p_u_65.container,
        ["default_selection"] = p_u_65.next_button.instance,
        ["app_name"] = p_u_65.ClassName,
        ["close_override"] = function()
            p_u_65.UIManager.set_app_visibility(p_u_65.ClassName, false)
            p_u_65.UIManager.set_app_visibility("HouseChooserApp", true)
            return false
        end
    })
    local v_u_70 = p_u_65.content.Parent
    local v_u_71 = v_u_70.AbsolutePosition.Y + v_u_70.AbsoluteWindowSize.Y - 71
    p_u_65.content.SelectionChanged:Connect(function()
        if v_u_9.is_using_gamepad() then
            local v72 = v_u_14.SelectedObject
            if v72 and v72.Parent == p_u_65.content then
                local v73 = v72.AbsolutePosition.Y + v72.AbsoluteSize.Y
                if v_u_71 < v73 then
                    v_u_70.CanvasPosition = v_u_70.CanvasPosition + Vector2.new(0, v73 - v_u_71)
                end
            end
        else
            return
        end
    end)
    v_u_4.get_theme_changed_signal():Connect(function()
        p_u_65:_refresh_search_results(p_u_65.search_bar:get_search_param())
    end)
end
return v15