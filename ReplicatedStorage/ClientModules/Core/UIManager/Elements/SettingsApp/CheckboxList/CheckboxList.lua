--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.CheckboxList (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Signal")
local v_u_4 = v1("XboxSupport")
local v5 = v1("package:t")
local v_u_6 = v1("package:Sift")
local v_u_7 = v1("package:Promise")
local v_u_8 = game:GetService("GuiService")
local v_u_9 = game:GetService("UserInputService")
local v10 = v2("CheckboxList", v1("UIBaseElement"))
local v_u_11 = game:GetService("ReplicatedStorage").Resources.UI_Resources.Templates.Settings
local v_u_12 = v5.strictInterface({
    ["width"] = v5.optional(v5.UDim),
    ["checkbox_list"] = v5.table,
    ["max_rows_visible"] = v5.integer,
    ["min_rows_visible"] = v5.integer
})
function v10.console_activated(p_u_13)
    local v_u_14 = v_u_8.SelectedObject
    local v_u_15 = v_u_4.get_watch_from_parent(p_u_13.instance)
    local v_u_16 = v_u_4.narrow_selection_parent(p_u_13.instance)
    v_u_15:disable_button_actions()
    v_u_15:select_object(p_u_13.checkboxes[1].box)
    p_u_13.instance.CanvasPosition = Vector2.new(0, 0)
    for _, v17 in pairs(p_u_13.checkboxes) do
        v17.box.Selectable = true
    end
    v_u_7.race({ v_u_7.fromEvent(v_u_9.InputBegan, function(p18)
            return p18.KeyCode == Enum.KeyCode.ButtonB
        end), v_u_7.fromEvent(v_u_8:GetPropertyChangedSignal("SelectedObject"), function()
            local v19 = v_u_8.SelectedObject
            if v19 then
                v19 = not v_u_8.SelectedObject:IsDescendantOf(p_u_13.instance)
            end
            return v19 and true or false
        end) }):andThen(function()
        v_u_16()
        v_u_15:enable_button_actions()
        v_u_15:select_object(v_u_14)
        for _, v20 in pairs(p_u_13.checkboxes) do
            v20.box.Selectable = false
        end
    end)
end
function v10.get(p21)
    local v22 = {}
    for v23, v24 in pairs(p21.checkboxes) do
        v22[v23] = v24:get()
    end
    return v22
end
function v10.set(p25, p26)
    for v27, v28 in pairs(p26) do
        if p25.checkboxes[v27] then
            p25.checkboxes[v27]:set(v28)
        end
    end
end
function v10.start(p_u_29, p30)
    local v31 = v_u_12(p30)
    assert(v31, "Options failed to validate.")
    p_u_29.options = v_u_6.Dictionary.copyDeep(p30)
    p_u_29.changed = v_u_3.new()
    p_u_29.checkboxes = {}
    local v32 = 0
    for v_u_33, v34 in ipairs(p_u_29.options.checkbox_list) do
        local v35
        if v_u_33 % 2 == 0 then
            v35 = v_u_33 - 1 or v_u_33
        else
            v35 = v_u_33
        end
        local v36 = p_u_29.instance:FindFirstChild("Row" .. v35)
        if not v36 then
            v36 = Instance.new("Frame")
            v36.Size = UDim2.new(1, -14, 0, 30)
            v36.LayoutOrder = v35
            v36.Name = "Row" .. v35
            v36.BackgroundTransparency = 1
            v36.Parent = p_u_29.instance
            local v37 = Instance.new("UIListLayout")
            v37.FillDirection = Enum.FillDirection.Horizontal
            v37.SortOrder = Enum.SortOrder.LayoutOrder
            v37.Padding = UDim.new(0, 4)
            v37.Parent = v36
            v32 = v32 + 1
        end
        local v38 = v_u_11:FindFirstChild("CheckboxTemplate"):Clone()
        v38.LayoutOrder = v_u_33
        v38.Parent = v36
        p_u_29.checkboxes[v_u_33] = p_u_29.UIManager.wrap(v38, "Checkbox"):start(v34)
        p_u_29.checkboxes[v_u_33].changed:Connect(function(...)
            p_u_29.changed:Fire(p_u_29.checkboxes[v_u_33])
        end)
    end
    local v39 = p_u_29.options.width or UDim.new(1, 0)
    local v40 = p_u_29.options.min_rows_visible
    local v41 = p_u_29.options.max_rows_visible
    local v42 = math.clamp(v32, v40, v41)
    p_u_29.instance.UIListLayout.Padding = UDim.new(0, -4)
    p_u_29.instance.Size = UDim2.new(v39.Scale, v39.Offset, 0, v42 * 30 + (v42 - 1) * -4)
    p_u_29.instance.CanvasSize = UDim2.new(0, 0, 0, v32 * 30 + (v32 - 1) * -4)
    return p_u_29
end
return v10