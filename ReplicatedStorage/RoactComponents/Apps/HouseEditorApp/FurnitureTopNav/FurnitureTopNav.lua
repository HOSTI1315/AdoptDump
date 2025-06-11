--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.FurnitureTopNav (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("new:ActionHelper")
local v_u_3 = v_u_1("ClientStore")
local v_u_4 = v_u_1("FurnishDB")
local v_u_5 = v_u_1("FurnitureEditorTelemetry")
local v_u_6 = v_u_1("FurnitureModelTracker")
local v_u_7 = v_u_1("FurnitureMultiSelect")
local v_u_8 = v_u_1("FurnitureXRay")
local v_u_9 = v_u_1("HouseClient")
local v_u_10 = v_u_1("HouseDB")
local v_u_11 = v_u_1("HouseEditorHelper")
local v_u_12 = v_u_1("InteractionsEngine")
local v_u_13 = v_u_1("PlatformM")
local v_u_14 = v_u_1("Roact")
local v_u_15 = v_u_1("RouterClient")
local v_u_16 = v_u_1("UI")
local v_u_17 = v_u_1("UIManager")
local v_u_18 = require(script.Parent.VerticalDottedLine)
local v_u_19 = v_u_1("package:Promise")
local v_u_20 = v_u_13.get_platform()
local v_u_21 = Color3.fromRGB(126, 0, 255)
local v_u_22 = Color3.fromRGB(0, 151, 255)
local v_u_23 = Color3.fromRGB(34, 181, 115)
local v_u_24 = Color3.fromRGB(247, 44, 44)
local v_u_25 = Color3.fromRGB(68, 69, 71)
local v_u_26 = game:GetService("Players")
local v_u_27 = game:GetService("UserInputService")
local v28 = v_u_14.PureComponent:extend("FurnitureTopNav")
function v28.getDerivedStateFromProps(p29, p30)
    if not p29.last_drawer_content then
        local v31 = p30.selected_categories
        v31.Stuff = nil
        v31.Walls = nil
        v31.Floors = nil
        return {
            ["selected_categories"] = v31
        }
    end
end
function v28.init(p_u_32)
    local v_u_33 = v_u_17.apps.FurnitureSelectorApp
    local v_u_34 = {
        ["Stuff"] = v_u_4.stuff,
        ["Walls"] = v_u_4.walls,
        ["Floors"] = v_u_4.floors
    }
    local function v_u_35()
        v_u_8.set_enabled(false)
        v_u_7.cancel()
        v_u_33:set_flag("handle_mode", "Default")
        v_u_33:deselect_all()
        p_u_32.set_interactions_enabled(true)
        p_u_32:setState({
            ["submenu_button_id"] = v_u_14.None,
            ["selected_categories"] = {},
            ["page"] = 1
        })
        task.spawn(p_u_32.props.set_drawer, nil)
    end
    local function v_u_39()
        for v36, v37 in v_u_34 do
            if p_u_32.is_category_selected(v36) then
                local v38 = p_u_32.props.page_history[#p_u_32.props.page_history]
                if v38 and p_u_32.props.last_drawer_source == v36 then
                    p_u_32.props.set_drawer(v38)
                else
                    p_u_32.props.set_drawer(v37, true)
                end
            end
        end
        p_u_32.props.set_drawer(nil)
    end
    p_u_32.state = {
        ["submenu_button_id"] = nil,
        ["selected_categories"] = {},
        ["page"] = 1
    }
    function p_u_32.increment_edit_mode_page()
        p_u_32:setState({
            ["submenu_button_id"] = v_u_14.None,
            ["page"] = p_u_32.state.page % 2 + 1
        })
    end
    function p_u_32.is_category_selected(p40)
        return p_u_32.state.selected_categories[p40]
    end
    function p_u_32.set_categories_selected(p41)
        local v42 = p_u_32.state.selected_categories
        for v43, v44 in p41 do
            v42[v43] = v44
        end
        p_u_32:setState({
            ["selected_categories"] = v42
        })
        task.spawn(v_u_39)
    end
    function p_u_32.toggle_category_selected(p45)
        p_u_32.set_categories_selected({
            [p45] = not p_u_32.is_category_selected(p45)
        })
    end
    function p_u_32.is_submenu_open(p46)
        return p_u_32.state.submenu_button_id == p46
    end
    function p_u_32.set_submenu_open(p47)
        p_u_32:setState({
            ["submenu_button_id"] = p47
        })
    end
    function p_u_32.toggle_submenu_open(p48)
        local v49 = p_u_32.set_submenu_open
        if p_u_32.is_submenu_open(p48) then
            p48 = v_u_14.None or p48
        end
        v49(p48)
    end
    function p_u_32.close_submenu()
        local v50 = p_u_32.state.submenu_button_id
        if p_u_32.is_category_selected(v50) then
            p_u_32.toggle_category_selected(v50)
        end
        p_u_32:setState({
            ["submenu_button_id"] = v_u_14.None
        })
    end
    function p_u_32.are_interactions_enabled()
        return not v_u_12:disable_handle_exists("FurnitureEditor")
    end
    function p_u_32.set_interactions_enabled(p51)
        if p51 then
            v_u_12:enable("FurnitureEditor")
        else
            v_u_12:disable("FurnitureEditor")
        end
    end
    function p_u_32.toggle_interactions()
        p_u_32.set_interactions_enabled(not p_u_32.are_interactions_enabled())
    end
    function p_u_32.enter_edit_mode()
        if v_u_3.store:getState().house_editor_state ~= "Disabled" then
            v_u_3.store:dispatch({
                ["type"] = "set_house_edit_mode",
                ["value"] = "Edit"
            })
            v_u_2.cancel_mutually_exclusive_promises({ "house_editor" })
            v_u_35()
            local v52 = v_u_26.LocalPlayer.PlayerGui.HouseEditorApp:WaitForChild("base_frame"):WaitForChild("furniture_top_nav"):WaitForChild("Stuff")
            p_u_32.props.xbox_support_watch:select_object(v52)
        end
    end
    function p_u_32.exit_edit_mode()
        if v_u_3.store:getState().house_editor_state ~= "Disabled" then
            v_u_3.store:dispatch({
                ["type"] = "set_house_edit_mode",
                ["value"] = "Main"
            })
            v_u_35()
            local v53 = v_u_26.LocalPlayer.PlayerGui.HouseEditorApp:WaitForChild("base_frame"):WaitForChild("furniture_top_nav"):WaitForChild("Edit")
            p_u_32.props.xbox_support_watch:select_object(v53)
            v_u_17.set_app_visibility("AmbianceApp", false)
        end
    end
    v_u_17.apps.HouseEditorWrapperApp.enter_edit_mode = p_u_32.enter_edit_mode
    v_u_17.apps.HouseEditorWrapperApp.exit_edit_mode = p_u_32.exit_edit_mode
    local v_u_54 = {
        [Enum.UserInputType.MouseButton1] = true,
        [Enum.UserInputType.Touch] = true
    }
    p_u_32.ignore_click_rects = {}
    function p_u_32.create_rect_from_frame(p55)
        return Rect.new(p55.AbsolutePosition, p55.AbsolutePosition + p55.AbsoluteSize)
    end
    p_u_32.click_out_of_submenu_listener = v_u_27.InputBegan:Connect(function(p56, _)
        if v_u_54[p56.UserInputType] then
            local v57 = Vector2.new(p56.Position.X, p56.Position.Y)
            for _, v58 in p_u_32.ignore_click_rects do
                local v59 = v57 - v58.Min
                if v59.X >= 0 and (v59.Y >= 0 and (v59.X <= v58.Width and v59.Y <= v58.Height)) then
                    return
                end
            end
            p_u_32.close_submenu()
        end
    end)
    p_u_32.exit_housing = v_u_1("InteriorsM").on_location_changed:Connect(function()
        v_u_35()
    end)
    p_u_32.history_changed = v_u_17.apps.FurnitureSelectorApp.history.changed:Connect(function()
        p_u_32:setState({})
    end)
    p_u_32.console_press_b_button = p_u_32.props.signal_close:Connect(function()
        if p_u_32.state.submenu_button_id then
            p_u_32.close_submenu()
        end
    end)
    p_u_32.enter_edit_mode_connection = v_u_11.get_enter_edit_signal():Connect(function()
        p_u_32.enter_edit_mode()
    end)
    p_u_32.exit_edit_mode_connection = v_u_11.get_exit_edit_signal():Connect(function()
        p_u_32.exit_edit_mode()
    end)
    v_u_17.app_visibilities_changed:Connect(function(p60)
        if p60 == "AmbianceApp" then
            p_u_32:setState({})
        end
    end)
end
function v28.willUnmount(p61)
    p61.click_out_of_submenu_listener:Disconnect()
    p61.click_out_of_submenu_listener = nil
    p61.exit_housing:Disconnect()
    p61.exit_housing = nil
    p61.console_press_b_button:Disconnect()
    p61.console_press_b_button = nil
    p61.enter_edit_mode_connection:Disconnect()
    p61.enter_edit_mode_connection = nil
    p61.exit_edit_mode_connection:Disconnect()
    p61.exit_edit_mode_connection = nil
end
function v28.create_button_entries(p_u_62)
    local v_u_63 = v_u_17.apps.FurnitureSelectorApp
    local v_u_64 = v_u_9.get_current_house_owner()
    local v65 = not v_u_64 or v_u_64 == game.Players.LocalPlayer
    local v66 = p_u_62.state.page
    local v67 = p_u_62.props.door_locked
    local v68 = v_u_20 == v_u_13.platform.phone
    local v69 = v_u_20 == v_u_13.platform.tablet
    local v70 = v_u_13.is_using_gamepad()
    local v71 = v68 or v69
    local v72 = {}
    local v73 = {
        ["id"] = "Edit",
        ["width"] = v68 and 94 or 150,
        ["color"] = v_u_21,
        ["callback"] = function()
            p_u_62.enter_edit_mode()
        end,
        ["children"] = {
            ["button_text"] = v_u_14.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Text"] = v68 and "Edit" or "Edit House",
                ["TextScaled"] = true,
                ["TextColor3"] = Color3.new(1, 1, 1),
                ["Font"] = Enum.Font.SourceSansBold
            })
        }
    }
    v72.edit = v73
    local v74 = {
        ["id"] = "Saves",
        ["width"] = v68 and 120 or 140,
        ["color"] = v_u_21,
        ["callback"] = function()
            v_u_17.set_app_visibility("HouseChooserApp", true)
        end
    }
    local v75 = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Text"] = v68 and "Homes" or "My Homes",
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    v74.children = v75
    v72.saves = v74
    v72.lock = {
        ["id"] = "Lock",
        ["width"] = 94,
        ["color"] = v_u_22,
        ["callback"] = function()
            if v_u_3.store:getState().house_interior.listed_for_trade then
                if v_u_17.apps.DialogApp:dialog({
                    ["text"] = "You can\'t lock your door while your house is listed for trade.",
                    ["right"] = "Unlist for Trade",
                    ["left"] = "Cancel"
                }) == "Cancel" then
                    return
                end
                if not v_u_15.get("HousingAPI/UnlistHouse"):InvokeServer() then
                    return
                end
            end
            if not p_u_62.lock_db then
                p_u_62.lock_db = true
                v_u_9.lock_door()
                task.wait(0.5)
                p_u_62.lock_db = nil
            end
        end,
        ["children"] = {
            ["button_text"] = v_u_14.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Text"] = v67 and "Unlock" or "Lock",
                ["TextScaled"] = true,
                ["TextColor3"] = Color3.new(1, 1, 1),
                ["Font"] = Enum.Font.SourceSansBold
            })
        }
    }
    v72.send_trade_request = {
        ["id"] = "SendTradeRequest",
        ["width"] = 300,
        ["color"] = v_u_23,
        ["callback"] = function()
            if p_u_62.sending_trade_request then
                return
            end
            p_u_62.sending_trade_request = true
            local v76 = v_u_3.store:getState()
            local v77 = v76.house_interior
            local v78 = v_u_10[v77.building_type] or {}
            local v79 = v77.unique
            local v80 = nil
            for _, v81 in v76.house_exteriors do
                if v81.house_id == v77.house_id and v81.player == v77.player then
                    v80 = v81
                    break
                end
            end
            local v82 = {
                ["category"] = "houses",
                ["kind"] = v77.building_type,
                ["properties"] = {
                    ["active_addons"] = v77.active_addons,
                    ["furniture_quantity"] = v77.furniture_quantity,
                    ["color"] = { v80.color.R, v80.color.G, v80.color.B }
                }
            }
            local v83 = v_u_17.apps.DialogApp:dialog({
                ["dialog_type"] = "ItemPreviewDialog",
                ["item"] = v82,
                ["text"] = ("Send a trade request for %s\'s %s?"):format(v_u_64.Name, v78.name),
                ["right"] = "Trade",
                ["left"] = "Cancel"
            })
            p_u_62.sending_trade_request = false
            if v83 == "Trade" then
                local v84 = v_u_3.store:getState().house_interior
                if not v84 or v84.unique ~= v79 then
                    v_u_17.apps.DialogApp:dialog({
                        ["text"] = "You can\'t send a trade request because you left the house.",
                        ["button"] = "Okay"
                    })
                    return
                end
                if not v84.listed_for_trade then
                    v_u_17.apps.DialogApp:dialog({
                        ["text"] = "The house is no longer for trade.",
                        ["button"] = "Okay"
                    })
                    return
                end
                v_u_15.get("TradeAPI/SendTradeRequest"):FireServer(v_u_64, "house_trade")
            end
        end,
        ["children"] = {
            ["trade_image"] = v_u_14.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.new(0, 10, 0.5, -2),
                ["Size"] = UDim2.fromOffset(28, 28),
                ["Image"] = "rbxassetid://16798742362"
            }),
            ["button_text"] = v_u_14.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.new(1, -10, 0.5, -2),
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Text"] = "Send Home Trade Request",
                ["TextScaled"] = true,
                ["TextColor3"] = Color3.new(1, 1, 1),
                ["Font"] = Enum.Font.SourceSansBold
            })
        }
    }
    v72.unlist_for_trade = {
        ["id"] = "UnlistForTrade",
        ["width"] = 300,
        ["color"] = v_u_24,
        ["callback"] = function()
            v_u_15.get("HousingAPI/UnlistHouse"):InvokeServer()
        end,
        ["children"] = {
            ["button_text"] = v_u_14.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Text"] = "Unlist for Trade",
                ["TextScaled"] = true,
                ["TextColor3"] = Color3.new(1, 1, 1),
                ["Font"] = Enum.Font.SourceSansBold
            })
        }
    }
    local v85 = {
        ["id"] = "Stuff",
        ["width"] = 90
    }
    local v86
    if p_u_62.is_category_selected("Stuff") then
        v86 = v_u_21
    else
        v86 = v_u_22
    end
    v85.color = v86
    function v85.callback()
        p_u_62.set_categories_selected({
            ["Stuff"] = true,
            ["Walls"] = false,
            ["Floors"] = false
        })
    end
    v85.children = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Text"] = "Stuff",
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    v72.stuff = v85
    local v87 = {
        ["id"] = "Walls",
        ["width"] = 90
    }
    local v88
    if p_u_62.is_category_selected("Walls") then
        v88 = v_u_21
    else
        v88 = v_u_22
    end
    v87.color = v88
    function v87.callback()
        p_u_62.set_categories_selected({
            ["Stuff"] = false,
            ["Walls"] = true,
            ["Floors"] = false
        })
    end
    v87.children = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Text"] = "Walls",
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    v72.walls = v87
    local v89 = {
        ["id"] = "Floors",
        ["width"] = 90
    }
    local v90
    if p_u_62.is_category_selected("Floors") then
        v90 = v_u_21
    else
        v90 = v_u_22
    end
    v89.color = v90
    function v89.callback()
        p_u_62.set_categories_selected({
            ["Stuff"] = false,
            ["Walls"] = false,
            ["Floors"] = true
        })
    end
    v89.children = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Text"] = "Floors",
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    v72.floors = v89
    local v91 = {
        ["id"] = "GridSize",
        ["width"] = 70
    }
    local v92
    if p_u_62.is_category_selected("GridSize") then
        v92 = v_u_21
    else
        v92 = v_u_22
    end
    v91.color = v92
    function v91.callback(_)
        v_u_63:increment_placement_grid_size(-1)
        p_u_62:setState({})
    end
    v91.children = {
        ["button_icon"] = v_u_14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -1),
            ["Size"] = UDim2.fromOffset(28, 28),
            ["Image"] = "rbxassetid://12185372842"
        }),
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -1),
            ["Size"] = UDim2.new(0.5, -2, 1, 0),
            ["Text"] = ({
                ["small"] = "\226\133\146",
                ["medium"] = "\194\189",
                ["large"] = "1"
            })[v_u_63:get_placement_grid_size()] or nil,
            ["TextSize"] = 30,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    v72.grid = v91
    local v93 = {
        ["id"] = "AmbianceSetter",
        ["width"] = 40
    }
    local v94
    if v_u_17.is_visible("AmbianceApp") then
        v94 = v_u_21
    else
        v94 = v_u_22
    end
    v93.color = v94
    function v93.callback()
        local v95 = v_u_17.is_visible("AmbianceApp")
        v_u_17.set_app_visibility("AmbianceApp", not v95)
    end
    v93.children = {
        ["button_icon"] = v_u_14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -1),
            ["Size"] = UDim2.fromOffset(23, 23),
            ["Image"] = "rbxassetid://82278242238485"
        })
    }
    v72.ambiance_setter = v93
    local v96 = {
        ["id"] = "MultiSelect",
        ["width"] = 40,
        ["disabled"] = v70
    }
    local v97
    if v70 then
        v97 = v_u_25
    elseif v_u_7.is_enabled() then
        v97 = v_u_21
    else
        v97 = v_u_22
    end
    v96.color = v97
    function v96.callback()
        if not p_u_62.multi_select_debounce then
            p_u_62.multi_select_debounce = true
            v_u_63:deselect_all()
            v_u_7.begin(v_u_22):andThen(function(p98)
                local v99 = v_u_3.store:getState().house_interior
                for _, v100 in p98 do
                    local v101 = v100:GetAttribute("furniture_unique")
                    v_u_63:select_furniture(v100, v99.furniture[v101])
                end
            end):finally(function()
                v_u_19.delay(0.1):andThen(function()
                    p_u_62.multi_select_debounce = false
                end)
                p_u_62:setState({})
            end)
            p_u_62:setState({})
        end
    end
    v96.children = {
        ["button_icon"] = v_u_14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -1),
            ["Size"] = UDim2.fromOffset(29, 29),
            ["Image"] = "rbxassetid://12185373162"
        })
    }
    v72.multi_select = v96
    local v102 = {
        ["id"] = "BuildMode",
        ["width"] = 40,
        ["disabled"] = v70
    }
    local v103
    if v70 then
        v103 = v_u_25
    elseif p_u_62.is_category_selected("BuildMode") then
        v103 = v_u_21
    else
        v103 = v_u_22
    end
    v102.color = v103
    function v102.callback(p104)
        p_u_62.toggle_submenu_open(p104.id)
        p_u_62.toggle_category_selected(p104.id)
    end
    local v105 = {}
    local v106 = v_u_14.createElement
    local v107 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.new(0.5, 0, 0.5, -1)
    }
    local v108 = v_u_63:get_flag("handle_mode")
    v107.Size = ({
        ["Default"] = UDim2.fromOffset(27, 27),
        ["MoveHandles"] = UDim2.fromOffset(28, 27),
        ["RotateHandles"] = UDim2.fromOffset(26, 29)
    })[v108] or nil
    v107.Image = ({
        ["Default"] = "rbxassetid://12185372600",
        ["MoveHandles"] = "rbxassetid://12185372207",
        ["RotateHandles"] = "rbxassetid://12185372318"
    })[v_u_63:get_flag("handle_mode")] or nil
    v105.button_icon = v106("ImageLabel", v107)
    v102.children = v105
    local v109 = {
        ["width"] = 210
    }
    local v110 = {}
    local v111 = {
        ["id"] = "Default",
        ["text"] = "Dragger"
    }
    local v112
    if v_u_63:get_flag("handle_mode") == "Default" then
        v112 = v_u_21
    else
        v112 = v_u_22
    end
    v111.color = v112
    function v111.callback()
        v_u_63:set_flag("handle_mode", "Default")
        p_u_62:setState({})
    end
    v111.children = {
        ["button_icon"] = v_u_14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0, 5, 0.5, -1),
            ["Size"] = UDim2.fromOffset(27, 27),
            ["Image"] = "rbxassetid://12185372600"
        }),
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0, 39, 0.5, -2),
            ["Size"] = UDim2.new(1, -42, 0.8, 0),
            ["Text"] = "Default Dragger",
            ["TextSize"] = 26,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    local v113 = {
        ["id"] = "MoveHandles"
    }
    local v114
    if v_u_63:get_flag("handle_mode") == "MoveHandles" then
        v114 = v_u_21
    else
        v114 = v_u_22
    end
    v113.color = v114
    function v113.callback()
        v_u_63:set_flag("handle_mode", "MoveHandles")
        p_u_62:setState({})
    end
    v113.children = {
        ["button_icon"] = v_u_14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0, 5, 0.5, -1),
            ["Size"] = UDim2.fromOffset(28, 27),
            ["Image"] = "rbxassetid://12185372207"
        }),
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0, 39, 0.5, -2),
            ["Size"] = UDim2.new(1, -42, 0.8, 0),
            ["Text"] = "Advanced Move",
            ["TextSize"] = 26,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    local v115 = {
        ["id"] = "RotateHandles"
    }
    local v116
    if v_u_63:get_flag("handle_mode") == "RotateHandles" then
        v116 = v_u_21
    else
        v116 = v_u_22
    end
    v115.color = v116
    function v115.callback()
        v_u_63:set_flag("handle_mode", "RotateHandles")
        p_u_62:setState({})
    end
    v115.children = {
        ["button_icon"] = v_u_14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0, 5, 0.5, -1),
            ["Size"] = UDim2.fromOffset(26, 29),
            ["Image"] = "rbxassetid://12185372318"
        }),
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0, 39, 0.5, -2),
            ["Size"] = UDim2.new(1, -42, 0.8, 0),
            ["Text"] = "Advanced Rotate",
            ["TextSize"] = 26,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    __set_list(v110, 1, {v111, v113, v115})
    v109.buttons = v110
    v102.submenu = v109
    v72.build_mode = v102
    local v117 = {
        ["id"] = "Undo",
        ["width"] = 40,
        ["disabled"] = not v_u_63.history:has_commits()
    }
    local v118
    if v_u_63.history:has_commits() then
        v118 = v_u_22
    else
        v118 = v_u_25
    end
    v117.color = v118
    v117.hidden = not v_u_63.history:is_active()
    function v117.callback()
        local v119 = v_u_63.history:is_active() and v_u_63.history:has_commits()
        if v119 then
            v119 = not v_u_63.history:is_processing()
        end
        if v119 then
            v_u_63:deselect_all()
            v_u_63.history:undo()
        end
    end
    v117.children = {
        ["button_icon"] = v_u_14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -1),
            ["Size"] = UDim2.fromOffset(28, 28),
            ["Image"] = "rbxassetid://14064516436"
        })
    }
    v72.undo = v117
    local v120 = {
        ["id"] = "AdditionalOptions",
        ["width"] = 40,
        ["render_dropdown_triangle"] = true
    }
    local v121
    if p_u_62.is_category_selected("AdditionalOptions") then
        v121 = v_u_21
    else
        v121 = v_u_22
    end
    v120.color = v121
    function v120.callback(p122)
        p_u_62.toggle_submenu_open(p122.id)
        p_u_62.toggle_category_selected(p122.id)
    end
    v120.children = {
        ["button_icon"] = v_u_14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -1),
            ["Size"] = UDim2.fromOffset(20, 19),
            ["Image"] = "rbxassetid://12188296975"
        })
    }
    local v123 = {
        ["width"] = 220
    }
    local v124 = {}
    local v125 = {
        ["id"] = "XRay"
    }
    local v126
    if v_u_8.is_enabled() then
        v126 = v_u_21
    else
        v126 = v_u_22
    end
    v125.color = v126
    function v125.callback()
        v_u_8.toggle_enabled()
        p_u_62:setState({})
    end
    v125.children = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["Text"] = v_u_8.is_enabled() and "Disable X-Ray" or "Enable X-Ray",
            ["TextSize"] = 26,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    local v127 = {
        ["id"] = "Interactions",
        ["hidden"] = v71
    }
    local v128
    if p_u_62.are_interactions_enabled() then
        v128 = v_u_21
    else
        v128 = v_u_22
    end
    v127.color = v128
    function v127.callback()
        p_u_62.toggle_interactions()
        p_u_62:setState({})
    end
    v127.children = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["Text"] = p_u_62.are_interactions_enabled() and "Hide Action Buttons" or "Show Action Buttons",
            ["TextSize"] = 26,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
    __set_list(v124, 1, {v125, v127, {
    ["id"] = "ResetRotation",
    ["height"] = 60,
    ["color"] = v_u_22,
    ["callback"] = function()
        v_u_63:reset_selected_furniture_rotation(false)
    end,
    ["children"] = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["Text"] = "Reset Furniture Rotation",
            ["TextWrapped"] = true,
            ["TextSize"] = 26,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
}, {
    ["id"] = "BuyCloneOfSingleSelected",
    ["color"] = v_u_22,
    ["hidden"] = not v_u_63:get_selection_as_buy_requests(),
    ["callback"] = function()
        local v129 = v_u_1("FurnitureDB")
        local v130 = v_u_1("new:FurnitureEntryHelper")
        local v131 = v_u_63:get_selection_as_buy_requests()
        if v131 then
            local v132 = 0
            for _, v133 in v131 do
                local v134 = v129[v133.kind]
                v132 = v132 + v130.get_cost(v134)
            end
            if v_u_11.pre_buy_auto(v132) then
                local v135 = #v131 ~= 1 and "multiple" or "the selected " .. v129[v131[1].kind].name
                local v136, v_u_137 = v_u_17.apps.DialogApp:queue_with_override({
                    ["text"] = ("Do you want to clone %s for $%d?"):format(v135, v132),
                    ["left"] = "No",
                    ["right"] = "Yes"
                })
                local v138 = v_u_19.fromEvent(v_u_63.selected_furnitures_changed):andThen(function()
                    v_u_137("No")
                end)
                if v136:expect() == "Yes" then
                    v_u_11.buy_furniture(true, v131)
                end
                v138:cancel()
            end
        end
    end,
    ["children"] = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["Text"] = "Clone Selected",
            ["TextWrapped"] = true,
            ["TextSize"] = 26,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
}, {
    ["id"] = "SellAllFurniture",
    ["color"] = v_u_22,
    ["hidden"] = not v65,
    ["callback"] = function()
        local v139 = v_u_3.store:getState().house_interior or {}
        v_u_63:deselect_all()
        local v140 = {}
        for v141, v142 in v139.furniture or {} do
            local v143 = v_u_6.get_furniture_by_unique(v141)
            if v143 then
                v140[v143] = v142
            end
        end
        v_u_63:select_furnitures(v140)
        local v144 = v_u_63:get_selected_furnitures()
        v_u_63:deselect_all()
        v_u_63:sell_furniture(v144, {
            ["custom_sell_msg"] = "Sell all the furniture in your house for %s?",
            ["custom_fail_msg"] = "You don\'t have permission to sell all the furniture in this house.",
            ["is_sell_all"] = true,
            ["accept_delay"] = 3,
            ["force_waypoint"] = true,
            ["before_sell_callback"] = function()
                local v_u_145 = v_u_63.history:get_top_commit()
                if v_u_145 and v_u_63.history.is_coop_active then
                    v_u_19.fromEvent(v_u_63.history.changed, function()
                        return not v_u_63.history.is_coop_active
                    end):timeout(5):andThen(function()
                        v_u_63.history:insert_commit(v_u_145)
                    end):catch(function()
                        warn("Timed out: unable to restore undo action from sell all")
                    end)
                end
            end
        })
    end,
    ["children"] = {
        ["button_text"] = v_u_14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["Text"] = "Sell All Furniture",
            ["TextWrapped"] = true,
            ["TextSize"] = 26,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.SourceSansBold
        })
    }
}})
    v123.buttons = v124
    v120.submenu = v123
    v72.additional_options = v120
    v72.dotted_lines = {
        ["id"] = "DottedLine",
        ["width"] = 2,
        ["is_dotted_line"] = true,
        ["color"] = v_u_22,
        ["callback"] = nil
    }
    v72.page_toggle = {
        ["id"] = "Toggle",
        ["width"] = 40,
        ["color"] = ({ v_u_22, v_u_21 })[v66] or nil,
        ["callback"] = function()
            p_u_62.increment_edit_mode_page()
        end,
        ["children"] = {
            ["button_icon"] = v_u_14.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, -1),
                ["Size"] = UDim2.fromOffset(28, 28),
                ["Image"] = "rbxassetid://12185373349"
            })
        }
    }
    v72.stop_edit = {
        ["id"] = "Back",
        ["no_log"] = true,
        ["width"] = v68 and 94 or 170,
        ["color"] = Color3.fromRGB(255, 75, 75),
        ["callback"] = function()
            p_u_62.exit_edit_mode()
            v_u_17.apps.HouseEditorWrapperApp.exit_editor_clicked:Fire()
        end,
        ["children"] = {
            ["button_text"] = v_u_14.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, -2),
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Text"] = v68 and "Done" or "Stop Editing",
                ["TextScaled"] = true,
                ["TextColor3"] = Color3.new(1, 1, 1),
                ["Font"] = Enum.Font.SourceSansBold
            })
        }
    }
    return v72
end
function v28.get_buttons_visible(p146, p147, p148)
    local v149 = {}
    local v150 = p146:create_button_entries()
    local v151 = v_u_9.get_current_house_owner()
    local v152 = not v151 or v151 == game.Players.LocalPlayer
    local v153 = v_u_13.is_using_gamepad()
    if not p146.props.listed_for_trade then
        if p147 == "Main" then
            local v154 = v150.edit
            table.insert(v149, v154)
            if v152 then
                local v155 = v150.saves
                table.insert(v149, v155)
                local v156 = v150.lock
                table.insert(v149, v156)
                return v149
            end
        elseif p147 == "Edit" then
            if p148 == 1 then
                local v157 = v150.stuff
                table.insert(v149, v157)
                if v152 then
                    local v158 = v150.walls
                    table.insert(v149, v158)
                    local v159 = v150.floors
                    table.insert(v149, v159)
                end
            elseif p148 == 2 then
                local v160 = v150.undo
                table.insert(v149, v160)
                if v152 then
                    local v161 = v150.ambiance_setter
                    table.insert(v149, v161)
                end
                if not v153 then
                    local v162 = v150.multi_select
                    table.insert(v149, v162)
                    local v163 = v150.build_mode
                    table.insert(v149, v163)
                end
                local v164 = v150.additional_options
                table.insert(v149, v164)
            end
            local v165 = v150.dotted_lines
            table.insert(v149, v165)
            local v166 = v150.page_toggle
            table.insert(v149, v166)
            local v167 = v150.stop_edit
            table.insert(v149, v167)
        end
        return v149
    end
    if not v152 then
        local v168 = v150.send_trade_request
        table.insert(v149, v168)
        return v149
    end
    local v169 = v150.unlist_for_trade
    table.insert(v149, v169)
    local v170 = v150.lock
    table.insert(v149, v170)
    return v149
end
function v28.render(p_u_171)
    p_u_171.ignore_click_rects = {}
    local v_u_172 = p_u_171.props.editor_state or "Edit"
    local v173 = p_u_171.props.console_selection_active
    local v174 = v_u_20 == v_u_13.platform.phone
    local v175 = {}
    local v176 = Vector2.new(0.5, 0)
    local v177 = UDim2.new(0.5, 0, 0, 14)
    if v_u_172 == "Main" then
        v175 = p_u_171:get_buttons_visible("Main", -1)
    elseif v_u_172 == "Edit" then
        local v178 = { p_u_171:get_buttons_visible("Edit", 1), p_u_171:get_buttons_visible("Edit", 2) }
        local v179 = 0
        for _, v180 in v178 do
            local v181 = 4
            for _, v182 in v180 do
                v181 = v181 + v182.width + 4
            end
            v179 = math.max(v179, v181)
        end
        if v174 then
            v179 = v179 * 0.8
        end
        v175 = v178[p_u_171.state.page]
        v176 = Vector2.new(1, 0)
        v177 = UDim2.new(0.5, v179 / 2, 0, 14)
    elseif v_u_172 == "ViewingListedHouse" then
        v175 = p_u_171:get_buttons_visible("ViewingListedHouse", -1)
    end
    local v183 = 4
    local v_u_184 = {}
    local v185 = {}
    for _, v_u_186 in v175 do
        if not v_u_186.hidden then
            if v_u_186.is_dotted_line then
                v_u_184[v_u_186.id] = v_u_18({
                    ["Position"] = UDim2.new(0, v183, 0, 4),
                    ["Size"] = UDim2.new(0, v_u_186.width, 0, 40),
                    ["Color"] = v_u_22,
                    ["NumberOfDots"] = 4,
                    ["Padding"] = 2
                })
            else
                local v_u_188 = (v_u_186.id == "Edit" or (v_u_186.id == "Walls" or v_u_186.id == "Stuff")) and function(p187)
                    v_u_11.set_tutorial_data(string.lower(v_u_186.id) .. "_button", p187)
                end or false
                v_u_184[v_u_186.id] = v_u_14.createElement(v_u_16.FlatButton, {
                    ["position"] = UDim2.new(0, v183, 0, 3),
                    ["size"] = UDim2.new(0, v_u_186.width, 0, 40),
                    ["color"] = v_u_186.color,
                    ["disabled"] = v_u_186.disabled,
                    ["render_dropdown_triangle"] = v_u_186.render_dropdown_triangle,
                    ["mouse_button1_click"] = function()
                        if v_u_172 == "Edit" and not v_u_186.no_log then
                            v_u_5.log_tool_toggled_changes(function()
                                v_u_186.callback(v_u_186)
                            end)
                            v_u_5.log_nav_bar_button_click(v_u_186.id)
                        else
                            v_u_186.callback(v_u_186)
                        end
                    end,
                    [v_u_14.Ref] = function(p189)
                        if v_u_188 then
                            v_u_188(p189)
                        end
                        if p189 and (v_u_186.id == p_u_171.state.submenu_button_id and v_u_186.submenu) then
                            local v190 = p_u_171.ignore_click_rects
                            local v191 = p_u_171.create_rect_from_frame
                            table.insert(v190, v191(p189))
                        end
                    end
                }, v_u_186.children)
            end
            v_u_186.horizontal_position = v183
            v183 = v183 + v_u_186.width + 4
            v185[v_u_186.id] = v_u_186
        end
    end
    if p_u_171.props.is_using_gamepad then
        v_u_184.xbox_symbol = v_u_14.createElement("ImageLabel", {
            ["Position"] = UDim2.new(0, -10, 1, -15),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["BackgroundTransparency"] = 1,
            ["Size"] = v173 and UDim2.new(0, 35, 0, 35) or UDim2.new(0, 58, 0, 58),
            ["ImageTransparency"] = v173 and 0 or 0.2,
            ["Image"] = v_u_13.get_custom_icon(v173 and Enum.KeyCode.ButtonB or Enum.KeyCode.DPadUp)
        })
    end
    local v192 = {
        ["phone"] = function()
            v_u_184.uiscale = v_u_14.createElement("UIScale", {
                ["Scale"] = 0.8
            })
        end
    }
    v_u_13.run(v192)
    local v193 = v185[p_u_171.state.submenu_button_id]
    local v194
    if v193 then
        v194 = v193.submenu
    else
        v194 = v193
    end
    if v194 then
        local v195 = 3
        local v196 = {}
        for _, v_u_197 in v194.buttons do
            if not v_u_197.hidden then
                local v198 = v_u_197.height or 40
                v196[v_u_197.id] = v_u_14.createElement(v_u_16.FlatButton, {
                    ["position"] = UDim2.new(0, 4, 0, v195),
                    ["size"] = UDim2.new(0, v194.width, 0, v198),
                    ["color"] = v_u_197.color,
                    ["mouse_button1_click"] = function()
                        if v_u_172 == "Edit" and not v_u_197.no_log then
                            v_u_5.log_tool_toggled_changes(function()
                                v_u_197.callback(v_u_197)
                            end)
                            v_u_5.log_nav_bar_button_click(v_u_197.id)
                        else
                            v_u_197.callback(v_u_197)
                        end
                    end
                }, v_u_197.children)
                v195 = v195 + v198 + 3
            end
        end
        v_u_184.submenu = v_u_14.createElement(v_u_16.RoundedBacking, {
            ["sink_input"] = true,
            ["anchor_point"] = Vector2.new(0.5, 0),
            ["position"] = UDim2.new(0, v193.horizontal_position + v193.width / 2, 0, 49),
            ["size"] = UDim2.new(0, v194.width + 8, 0, v195),
            [v_u_14.Ref] = function(p199)
                if p199 then
                    local v200 = p_u_171.ignore_click_rects
                    local v201 = p_u_171.create_rect_from_frame
                    table.insert(v200, v201(p199))
                end
            end
        }, v196)
    end
    v_u_17.apps.HouseEditorWrapperApp:set_topbar_width(v183)
    return v_u_14.createElement(v_u_16.RoundedBacking, {
        ["position"] = v177,
        ["size"] = UDim2.new(0, v183, 0, 46),
        ["anchor_point"] = v176,
        ["visible"] = p_u_171.props.visible
    }, v_u_184)
end
return v28