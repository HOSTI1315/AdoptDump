--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Backpack.BackpackFilter (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SoundPlayer")
local v_u_3 = v1("PetProgressionDB")
local v_u_4 = v1("XboxSupport")
local v_u_5 = v1("InventoryDB")
local v_u_6 = v1("PlatformM")
local v_u_7 = v1("RarityDB")
local v_u_8 = v1("Signal")
local v9 = v1("Class")
local v10 = v1("package:Sift")
local v_u_11 = v1("package:Promise")
local v_u_12 = game:GetService("Players")
local v_u_13 = game:GetService("GuiService")
local v_u_14 = game:GetService("UserInputService")
local v_u_15 = {
    ["sort_type"] = 1,
    ["effects"] = v10.List.create(6, true),
    ["rarities"] = v10.List.create(5, true),
    ["ages"] = v10.List.create(14, true)
}
local v_u_16 = {
    ["favorites"] = { "SortType_default", "Effect", "Rarity" },
    ["pets"] = { "SortType_pets", "Effect", "Rarity" },
    ["default"] = { "SortType_default", "Rarity" }
}
local v_u_17 = {
    ["pets"] = {
        "Default",
        "Alphabetical",
        "Rarity",
        "Age",
        "Favorites"
    },
    ["default"] = {
        "Default",
        "Alphabetical",
        "Rarity",
        "Favorites"
    }
}
local v18 = v9("BackpackFilter", v1("UIBaseElement"))
local function v_u_46(p_u_19)
    local v_u_20 = {}
    for _, v_u_21 in p_u_19:GetChildren() do
        if v_u_21:IsA("ImageButton") then
            local function v22()
                v_u_21.Box.Checkmark.Visible = not v_u_21.Box.Checkmark.Visible
            end
            v_u_21.Activated:Connect(v22)
            v_u_21.Box.Activated:Connect(v22)
            local v23 = Instance.new("UITextSizeConstraint")
            v23.MaxTextSize = 10
            v23.MinTextSize = 1
            v23.Parent = v_u_21.TextLabel
            v_u_21.TextLabel.TextScaled = true
            table.insert(v_u_20, v_u_21)
        end
    end
    table.sort(v_u_20, function(p24, p25)
        return p24.LayoutOrder < p25.LayoutOrder
    end)
    local v_u_45 = {
        ["get_transformed"] = function(p26)
            local v27 = {}
            for v28, v29 in v_u_20 do
                v27[v29.Name] = p26[v28]
            end
            return v27
        end,
        ["get"] = function()
            local v30 = {}
            for v31, v32 in v_u_20 do
                v30[v31] = v32.Box.Checkmark.Visible
            end
            return v30
        end,
        ["set"] = function(p33)
            for v34, v35 in v_u_20 do
                v35.Box.Checkmark.Visible = p33[v34]
            end
        end,
        ["set_all"] = function(p36)
            for _, v37 in v_u_20 do
                v37.Box.Checkmark.Visible = p36
            end
        end,
        ["on_console_activate"] = function()
            if v_u_6.is_using_gamepad() then
                local v_u_38 = v_u_13.SelectedObject
                local v_u_39 = v_u_4.get_watch_from_parent(p_u_19)
                local v_u_40 = v_u_4.narrow_selection_parent(p_u_19)
                v_u_39:disable_button_actions()
                for _, v41 in pairs(v_u_20) do
                    v41.Selectable = true
                end
                v_u_39:select_object(v_u_20[1])
                v_u_11.race({ v_u_11.fromEvent(v_u_14.InputBegan, function(p42)
                        return p42.KeyCode == Enum.KeyCode.ButtonB
                    end), v_u_11.fromEvent(v_u_13:GetPropertyChangedSignal("SelectedObject"), function()
                        local v43 = v_u_13.SelectedObject
                        if v43 then
                            v43 = not v_u_13.SelectedObject:IsDescendantOf(p_u_19)
                        end
                        return v43 and true or false
                    end) }):andThen(function()
                    v_u_40()
                    v_u_39:enable_button_actions()
                    v_u_39:select_object(v_u_38)
                    for _, v44 in pairs(v_u_20) do
                        v44.Selectable = false
                    end
                end)
            end
        end
    }
    p_u_19.Parent.Parent.Activated:Connect(function()
        v_u_45.on_console_activate()
    end)
    return v_u_45
end
function v18._init_sort_type(p_u_47)
    local v48 = p_u_47.scroll_content.SortType
    local v_u_49 = {}
    for v50, v51 in v_u_17 do
        local v52 = v48:Clone()
        v52.Name = "SortType_" .. v50
        v52.Parent = p_u_47.scroll_content
        local v_u_53 = p_u_47.UIManager.wrap(v52.Container.Dropdown, "Dropdown"):start({
            ["default"] = 1,
            ["choices"] = v51,
            ["should_localize_choices"] = true
        })
        v52.Activated:Connect(function()
            v_u_53:console_activated()
        end)
        v_u_49[v50] = v_u_53
    end
    v48:Destroy()
    return {
        ["get_transformed"] = function(p54)
            return (v_u_49[p_u_47:_get_filter_category()] or v_u_49.default).options.choices[p54]:lower()
        end,
        ["get_value"] = function()
            return (v_u_49[p_u_47:_get_filter_category()] or v_u_49.default):get()
        end,
        ["set_value"] = function(p55)
            (v_u_49[p_u_47:_get_filter_category()] or v_u_49.default):set(p55)
        end
    }
end
function v18._init_inputs(p56)
    local v57 = v_u_46(p56.scroll_content.Age.Container.Content)
    local v58 = v_u_46(p56.scroll_content.Effect.Container.Content)
    local v59 = v_u_46(p56.scroll_content.Rarity.Container.Content)
    v57.set_all(true)
    v58.set_all(true)
    v59.set_all(true)
    local v60 = {
        ["ages"] = {
            ["get_transformed"] = v57.get_transformed,
            ["get_value"] = v57.get,
            ["set_value"] = v57.set
        },
        ["effects"] = {
            ["get_transformed"] = v58.get_transformed,
            ["get_value"] = v58.get,
            ["set_value"] = v58.set
        },
        ["rarities"] = {
            ["get_transformed"] = v59.get_transformed,
            ["get_value"] = v59.get,
            ["set_value"] = v59.set
        },
        ["sort_type"] = p56:_init_sort_type()
    }
    return v60
end
function v18._get_values(p61)
    local v62 = {}
    for v63, v64 in p61.filter_inputs do
        v62[v63] = v64.get_value()
    end
    return v62
end
function v18._set_values(p65, p66)
    for v67, v68 in p66 do
        p65.filter_inputs[v67].set_value(v68)
    end
end
function v18._get_transformed_cached_value(p69, p70)
    local v71 = p69.cached_values[p70]
    return p69.filter_inputs[p70].get_transformed(v71)
end
function v18._get_filter_category(p72)
    return not p72.BackpackApp.categories and "default" or p72.BackpackApp.categories:get_category()
end
function v18._set_available_filters(p73, p74)
    local v75 = v_u_16[p74] or v_u_16.default
    local v76 = v_u_17[p74] or v_u_17.default
    local v77 = v_u_17[p73.prev_category] or v_u_17.default
    local v78 = {}
    for _, v79 in v75 do
        v78[v79] = true
    end
    local v80 = v77[p73.cached_values.sort_type]
    local v81 = nil
    for v82, v83 in v76 do
        if v83 == v80 then
            v81 = v82
            break
        end
    end
    if v81 then
        p73.cached_values.sort_type = v81
    else
        p73.cached_values.sort_type = v_u_15.sort_type
    end
    local v84 = nil
    for _, v85 in p73.scroll_content:GetChildren() do
        if v85:IsA("ImageButton") then
            v85.Visible = v78[v85.Name] and true or false
            if v85.Visible and (not v84 or v85.LayoutOrder < v84.LayoutOrder) then
                v84 = v85
            end
        end
    end
    if v_u_6.is_using_gamepad() and (p73.instance.Visible and (v84 and (v84.Visible and v84:IsDescendantOf(v_u_12.LocalPlayer.PlayerGui)))) then
        p73.BackpackApp.watch:select_object(v84)
    end
    p73.scroll_content.Parent.CanvasSize = UDim2.fromOffset(0, p73.scroll_content.UIListLayout.AbsoluteContentSize.Y + 35)
    p73.prev_category = p74
end
function v18._is_filter_modified(p86)
    if v_u_15.sort_type ~= p86.cached_values.sort_type then
        return true
    end
    for _, v87 in { "ages", "effects", "rarities" } do
        local v88 = p86.cached_values[v87]
        for v89, v90 in v_u_15[v87] do
            if v88[v89] ~= v90 then
                return true
            end
        end
    end
    return false
end
function v18._get_is_filtered_out_callback(p91)
    local v_u_92 = p91:_get_transformed_cached_value("ages")
    local v_u_93 = p91:_get_transformed_cached_value("effects")
    local v_u_94 = p91:_get_transformed_cached_value("rarities")
    return function(p95)
        local v96 = v_u_5[p95.category][p95.kind]
        if v_u_94 and not v_u_94[v_u_7[v96.rarity].key] then
            return true
        end
        if v96.category == "pets" then
            local v97
            if v96.is_egg then
                v97 = "Egg"
            elseif p95.properties.age >= 6 then
                v97 = "Friendship"
            elseif p95.properties.neon then
                v97 = v_u_3.neon_age_names[p95.properties.age]
            else
                v97 = v_u_3.age_names[p95.properties.age]
            end
            local v98 = p95.properties.neon and "neon" or (p95.properties.mega_neon and "mega_neon" or "regular")
            if v_u_93 then
                if not v_u_93[v98] then
                    return true
                end
                if not (p95.properties.flyable or p95.properties.rideable or v_u_93.no_potion) then
                    return true
                end
                if p95.properties.flyable and not v_u_93.flyable then
                    return true
                end
                if p95.properties.rideable and not v_u_93.rideable then
                    return true
                end
            end
            if v_u_92 and not v_u_92[v97] then
                return true
            end
        end
        return false
    end
end
function v18._update_cached_values(p99)
    p99.cached_values = p99:_get_values()
    p99.filter_callback = p99:_get_is_filtered_out_callback()
end
function v18.get_sort_type(p100)
    return p100:_get_transformed_cached_value("sort_type")
end
function v18.is_filtered_out(p101, p102)
    return p101.filter_callback(p102)
end
function v18.get_visible(p103)
    return p103.instance.Visible
end
function v18.set_visible(p104, p105)
    if v_u_6.is_using_gamepad() then
        if p105 then
            p104.denarrow = v_u_4.narrow_selection_parent(p104.instance)
        elseif p104.denarrow then
            p104.denarrow()
            p104.denarrow = nil
            p104.BackpackApp.watch:select_object(p104.filter_button.instance)
        end
    end
    p104.BackpackApp.sink.Visible = p105
    p104.instance.Visible = p105
    if p105 then
        p104:_set_available_filters(p104:_get_filter_category())
        p104:_set_values(p104.cached_values)
    end
    p104.filter_button:set_state(p104:_is_filter_modified() and "selected" or "normal")
    p104.visibility_changed:Fire(p105)
end
function v18.reset(p106)
    p106:_set_values(v_u_15)
    p106:_update_cached_values()
    p106.filter_button:set_state(p106:_is_filter_modified() and "selected" or "normal")
end
function v18.start(p_u_107, p108, p109)
    p_u_107.BackpackApp = p108
    p_u_107.content = p_u_107.instance.Content
    p_u_107.bottom = p_u_107.content.Bottom
    p_u_107.scroll_content = p_u_107.content.ScrollComplex.ScrollingFrame.Content
    p_u_107.visibility_changed = v_u_8.new()
    p_u_107.filter_inputs = p_u_107:_init_inputs()
    p_u_107:_update_cached_values()
    local v110 = {
        ["state"] = "normal",
        ["mouse_button1_click"] = function()
            p_u_107:set_visible(true)
        end,
        ["mouse_button1_down"] = function()
            v_u_2.FX:play("BambooButton")
        end
    }
    p_u_107.filter_button = p_u_107.UIManager.wrap(p109, "DepthButton"):start(v110)
    local v111 = {
        ["state"] = "normal",
        ["mouse_button1_click"] = function()
            p_u_107:_update_cached_values()
            p_u_107:set_visible(false)
            p_u_107.BackpackApp:refresh_rendered_items()
        end,
        ["mouse_button1_down"] = function()
            v_u_2.FX:play("BambooButton")
        end
    }
    p_u_107.UIManager.wrap(p_u_107.bottom.Confirm, "DepthButton"):start(v111)
    local v112 = {
        ["state"] = "cancel",
        ["mouse_button1_click"] = function()
            p_u_107:set_visible(false)
        end,
        ["mouse_button1_down"] = function()
            v_u_2.FX:play("BambooButton")
        end
    }
    p_u_107.UIManager.wrap(p_u_107.bottom.Cancel, "DepthButton"):start(v112)
    p_u_107.prev_category = p_u_107:_get_filter_category()
    p_u_107.BackpackApp.category_changed:Connect(function()
        p_u_107:_set_available_filters(p_u_107:_get_filter_category())
        p_u_107.filter_button:set_state(p_u_107:_is_filter_modified() and "selected" or "normal")
    end)
    return p_u_107
end
return v18