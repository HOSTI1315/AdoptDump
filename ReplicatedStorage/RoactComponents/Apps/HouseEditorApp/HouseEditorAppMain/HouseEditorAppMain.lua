--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.HouseEditorAppMain (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("CriticalSection")
local v_u_4 = v1("FurnishDB")
local v_u_5 = v1("PlatformM")
local v_u_6 = v1("Roact")
local v7 = v1("RoactRodux")
local v_u_8 = v1("Signal")
local v_u_9 = v1("TableUtil")
local v_u_10 = v1("UI")
local v_u_11 = v1("UIManager")
local v_u_12 = v1("XboxSupport")
local v_u_13 = v1("Music")
local v_u_14 = v1("SoundDB")
local v_u_15 = require(script.Parent.ConfirmTexturePreview)
local v_u_16 = require(script.Parent.Drawer)
local v_u_17 = require(script.Parent.FurnitureTopNav)
local v_u_18 = require(script.Parent.PlacementGrid)
local v_u_19 = v1("package:Sift")
local function v_u_24(p20)
    local v_u_21 = v_u_2.get("house_interior").building_type
    return v_u_19.List.filter(p20 or {}, function(p22)
        local v23 = p22.permitted_houses
        return not v23 and true or v_u_19.List.includes(v23, v_u_21)
    end)
end
local v25 = v_u_6.PureComponent:extend("HouseEditorAppMain")
function v25.init(p_u_26)
    p_u_26.signal_open = v_u_8.new()
    p_u_26.signal_close = v_u_8.new()
    local v_u_27 = v_u_3.new()
    local function v_u_31()
        local v28 = 9999999
        local v29 = nil
        for _, v30 in game.Players.LocalPlayer.PlayerGui.HouseEditorApp:WaitForChild("base_frame"):WaitForChild("non_top_nav_contents"):WaitForChild("sliding_tween"):WaitForChild("drawer"):WaitForChild("item_slider"):WaitForChild("container"):WaitForChild("item_slider_contents"):GetChildren() do
            if v30:IsA("GuiObject") and v30.LayoutOrder < v28 then
                v28 = v30.LayoutOrder
                v29 = v30
            end
        end
        return v29
    end
    p_u_26.xbox_support_watch = v_u_12.watch({
        ["selection_parent"] = function()
            return p_u_26.selection_parent
        end,
        ["signal_open"] = p_u_26.signal_open,
        ["signal_close"] = p_u_26.signal_close,
        ["setup_button_actions"] = function()
            game:GetService("ContextActionService"):BindAction("HouseEditorClose", function(_, p32)
                if p32 == Enum.UserInputState.Begin then
                    game:GetService("ContextActionService"):UnbindAction("HouseEditorClose")
                    p_u_26.signal_close:Fire()
                    p_u_26:setState({
                        ["console_selection_active"] = false
                    })
                end
            end, false, Enum.KeyCode.ButtonB)
        end,
        ["teardown_button_actions"] = function()
            game:GetService("ContextActionService"):UnbindAction("HouseEditorClose")
        end
    })
    local function v_u_35()
        local v33 = p_u_26.selection_parent.furniture_top_nav
        local v34 = v33:FindFirstChild("Edit") or v33:FindFirstChild("Stuff") or (v33:FindFirstChild("SendTradeRequest") or v33:FindFirstChild("UnlistForTrade"))
        p_u_26.signal_open:Fire(v34)
        p_u_26:setState({
            ["console_selection_active"] = true
        })
    end
    game:GetService("ContextActionService"):BindAction("SelectHouseEditorUpperMenu", function(_, p36)
        if not v_u_11.apps.HouseEditorWrapperApp.visible then
            return Enum.ContextActionResult.Pass
        end
        if p36 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass
        end
        v_u_35()
        return Enum.ContextActionResult.Sink
    end, false, Enum.KeyCode.DPadUp)
    game:GetService("ContextActionService"):BindAction("SelectHouseEditorLowerMenu", function(_, p37)
        if not v_u_11.apps.HouseEditorWrapperApp.visible then
            return Enum.ContextActionResult.Pass
        end
        if not p_u_26.state.drawer_visible then
            return Enum.ContextActionResult.Pass
        end
        if p37 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass
        end
        local v38 = v_u_31()
        if v38 then
            p_u_26.signal_open:Fire(v38)
            p_u_26:setState({
                ["console_selection_active"] = true
            })
        end
        return Enum.ContextActionResult.Sink
    end, false, Enum.KeyCode.DPadDown)
    function p_u_26.xbox_deselect()
        p_u_26.signal_close:Fire()
        p_u_26:setState({
            ["console_selection_active"] = false
        })
    end
    v_u_5.get_gamepad_changed():Connect(function(p39)
        if p39 then
            p_u_26:setState({})
        else
            p_u_26:setState({
                ["console_selection_active"] = false
            })
        end
    end)
    local v_u_40 = {
        [v_u_4.stuff] = "Stuff",
        [v_u_4.walls] = "Walls",
        [v_u_4.floors] = "Floors"
    }
    function p_u_26.set_drawer(p41, p42)
        v_u_27:wait()
        local v43 = p41 and {
            ["name"] = p41.name,
            ["is_sorted"] = p41.is_sorted,
            ["contents"] = v_u_24(p41.contents)
        } or p41
        local v44 = v_u_2.get("tutorial_data")
        v44.drawer_version = (v44.drawer_version or 0) + 1
        if p_u_26.state.last_content == v43 then
            v_u_27:signal()
        else
            local v45 = p_u_26
            local v46 = {
                ["last_content"] = v43 or v_u_6.None
            }
            local v47
            if v43 then
                v47 = v_u_40[p41]
            else
                v47 = v43
            end
            v46.last_drawer_source = v47
            v45:setState(v46)
            if p_u_26.state.drawer_visible then
                p_u_26:setState({
                    ["drawer_position"] = "HIDE"
                })
                wait(0.4)
                p_u_26:setState({
                    ["drawer_visible"] = false
                })
            end
            for _, v48 in p41 and p41.contents or {} do
                if v48.get_contents then
                    local v49 = v48.get_contents(p_u_26.props.house_interior.building_type)
                    v48.contents = v49
                    v48.hidden = #v49 <= 0
                end
            end
            p_u_26:setState({
                ["drawer_content"] = v43 or v_u_6.None
            })
            if v43 then
                local v50 = p_u_26.state.page_history or {}
                local v51 = nil
                for v52, v53 in pairs(v50) do
                    if v53.name == v43.name then
                        v51 = #v50 - v52
                    end
                end
                local v54 = p42 and {} or v_u_9.deep_copy(v50)
                if v51 then
                    for _ = 1, v51 do
                        table.remove(v54, #v54)
                    end
                else
                    table.insert(v54, v43)
                end
                p_u_26:setState({
                    ["page_history"] = v54
                })
            elseif p42 then
                p_u_26:setState({
                    ["page_history"] = {}
                })
            end
            if v43 then
                p_u_26:setState({
                    ["drawer_position"] = "SHOW",
                    ["drawer_visible"] = true
                })
                v_u_11.apps.HouseEditorWrapperApp.drawer_open = true
                v_u_11.refresh_all_apps()
                wait(0.4)
                local v55 = v_u_31()
                if v55 then
                    p_u_26.xbox_support_watch:select_object(v55)
                end
            else
                v_u_11.apps.HouseEditorWrapperApp.drawer_open = false
                v_u_11.refresh_all_apps()
            end
            v_u_27:signal()
        end
    end
    v_u_11.apps.HouseEditorWrapperApp.set_drawer = p_u_26.set_drawer
end
function v25.didUpdate(p56, p57)
    if p57.editor_state ~= p56.props.editor_state then
        if (p56.props.editor_state or "Edit") == "Edit" then
            v_u_11.apps.FurnitureSelectorApp.plane_lock_component:set_active(true)
            v_u_13.play(5, v_u_14.HouseBuildingTheme)
        else
            v_u_11.apps.FurnitureSelectorApp.plane_lock_component:set_active(false)
            v_u_13.stop(5, v_u_14.HouseBuildingTheme)
        end
        if p56.props.editor_state == "Disabled" then
            v_u_11.apps.FurnitureSelectorApp:deselect_all()
            v_u_11.apps.HouseEditorWrapperApp.editor_open = false
            v_u_11.apps.HouseEditorWrapperApp.drawer_open = false
            v_u_11.refresh_all_apps()
        elseif p56.props.editor_state == "ViewingListedHouse" then
            v_u_11.apps.FurnitureSelectorApp:deselect_all()
            v_u_11.apps.HouseEditorWrapperApp.editor_open = true
            v_u_11.apps.HouseEditorWrapperApp.drawer_open = false
            v_u_11.refresh_all_apps()
        else
            v_u_11.apps.HouseEditorWrapperApp.editor_open = true
            v_u_11.refresh_all_apps()
        end
    end
    if v_u_5.is_using_gamepad() then
        local v58 = p56.props.editor_state
        local v59
        if v58 == "Disabled" then
            v59 = false
        else
            v59 = v58 ~= nil
        end
        if not v59 then
            p56.signal_close:Fire()
            if p56.state.console_selection_active then
                p56:setState({
                    ["console_selection_active"] = false
                })
            end
        end
    end
end
function v25.getDerivedStateFromProps(p60)
    local v61 = {}
    if p60.editor_state == "Disabled" or p60.editor_state == "ViewingListedHouse" then
        v61.last_content = v_u_6.None
        v61.page_history = {}
        v61.drawer_position = "HIDE"
        v61.drawer_visible = false
        v_u_11.apps.FurnitureSelectorApp:deselect_all()
    end
    return v61
end
function v25.render(p_u_62)
    local v63 = p_u_62.props
    local v64 = v63.editor_state
    local v65 = v63.door_locked
    local v66 = v63.texture_preview
    local v67 = v63.hide_confirmation_menu
    local v68 = p_u_62.state.console_selection_active
    local v69
    if v63.house_interior then
        v69 = v63.house_interior.listed_for_trade
    else
        v69 = false
    end
    local v70
    if v64 == "Disabled" or v64 == "ViewingListedHouse" then
        v70 = false
    else
        v70 = v64 ~= nil
    end
    local v71 = v70 or v64 == "ViewingListedHouse"
    local v72 = p_u_62.state.xbox_selection_active
    v_u_11.drawer_content = p_u_62.state.drawer_content
    v_u_11.apps.HouseEditorWrapperApp:mark_topbar_visible(v71)
    local v73 = v_u_6.createElement
    local v74 = "ScreenGui"
    local v75 = {
        ["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
        ["DisplayOrder"] = 2,
        ["IgnoreGuiInset"] = true
    }
    local v76 = {}
    local v77 = v_u_6.createElement
    local v78 = "Frame"
    local v80 = {
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BackgroundTransparency"] = 1,
        [v_u_6.Ref] = function(p79)
            p_u_62.selection_parent = p79
        end
    }
    local v81 = {
        ["furniture_top_nav"] = v_u_6.createElement(v_u_17, {
            ["visible"] = v71,
            ["set_drawer"] = p_u_62.set_drawer,
            ["editor_state"] = v64,
            ["page_history"] = p_u_62.state.page_history,
            ["last_drawer_content"] = p_u_62.state.last_content,
            ["last_drawer_source"] = p_u_62.state.last_drawer_source,
            ["door_locked"] = v65,
            ["console_selection_active"] = v68,
            ["is_using_gamepad"] = v_u_5.is_using_gamepad(),
            ["xbox_selection_active"] = v72,
            ["listed_for_trade"] = v69,
            ["xbox_support_watch"] = p_u_62.xbox_support_watch,
            ["signal_close"] = p_u_62.signal_close
        })
    }
    local v82 = v_u_6.createElement
    local v83 = "Frame"
    local v84 = {
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BackgroundTransparency"] = 1,
        ["Visible"] = v70
    }
    local v85 = {}
    local v86 = v_u_6.createElement
    local v87 = v_u_10.SlidingTween
    local v88 = {
        ["position"] = p_u_62.state.drawer_position == "SHOW" and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 0, 0, 180)
    }
    local v89
    if p_u_62.state.drawer_visible == true then
        v89 = v66 == nil and true or v67 == true
    else
        v89 = false
    end
    v88.visible = v89
    v85.sliding_tween = v86(v87, v88, {
        ["drawer"] = v_u_6.createElement(v_u_16, {
            ["set_drawer"] = p_u_62.set_drawer,
            ["drawer_content"] = p_u_62.state.drawer_content,
            ["page_history"] = p_u_62.state.page_history,
            ["console_selection_active"] = p_u_62.state.console_selection_active,
            ["xbox_deselect"] = p_u_62.xbox_deselect,
            ["signal_close"] = p_u_62.signal_close
        })
    })
    v81.non_top_nav_contents = v82(v83, v84, v85)
    local v90 = v_u_6.createElement
    local v91 = v_u_10.SlidingTween
    local v92 = {
        ["position"] = p_u_62.state.drawer_position == "SHOW" and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 0, 0, 180)
    }
    local v93
    if p_u_62.state.drawer_visible == true then
        v93 = v66 == nil and true or v67 == true
    else
        v93 = false
    end
    v92.visible = v93
    v81.sliding_tween = v90(v91, v92)
    v81.placement_grid = v_u_6.createElement(v_u_18, {
        ["zindex"] = 0,
        ["editor_state"] = v64,
        ["force_refresh"] = function()
            p_u_62:setState({})
        end
    })
    v81.confirm_texture_preview = v_u_6.createElement(v_u_15, {
        ["texture_preview"] = v66,
        ["hide_confirmation_menu"] = v67,
        ["xbox_support_watch"] = p_u_62.xbox_support_watch
    })
    v76.base_frame = v77(v78, v80, v81)
    return v73(v74, v75, v76)
end
return v7.connect(function(p94)
    local v95 = p94:getState()
    return {
        ["house_interior"] = v95.house_interior,
        ["editor_state"] = v95.house_editor_state,
        ["editor_visible"] = not v95.house_editor_hidden,
        ["texture_preview"] = v95.texture_preview,
        ["hide_confirmation_menu"] = v95.hide_confirmation_menu,
        ["door_locked"] = v95.door_locked
    }
end)(v25)