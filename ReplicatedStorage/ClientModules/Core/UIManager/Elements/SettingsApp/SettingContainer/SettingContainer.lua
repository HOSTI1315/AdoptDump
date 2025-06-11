--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.SettingContainer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlatformM")
local v3 = v1("Class")
local v_u_4 = v1("Signal")
local v_u_5 = v1("new:TextUtil")
local v6 = v1("package:t")
local v_u_7 = v1("package:Sift")
local v_u_8 = game:GetService("ReplicatedStorage").Resources.UI_Resources.Templates.Settings
local v9 = v3("SettingContainer", v1("UIBaseElement"))
local v_u_10 = v6.strictInterface({
    ["name"] = v6.optional(v6.string),
    ["description"] = v6.optional(v6.string)
})
function v9._get_height(p11)
    local v12 = (-1 / 0)
    local v13 = (1 / 0)
    for _, v14 in pairs(p11.container:GetChildren()) do
        if v14:IsA("GuiObject") and v14.Visible then
            local v15 = v14.AbsolutePosition.Y
            local v16 = v15 + v14.AbsoluteSize.Y
            v12 = math.max(v12, v16)
            v13 = math.min(v13, v15)
        end
    end
    local v17 = (v12 - v13 + 20 - 45) / 18
    return math.ceil(v17) * 18 + 45
end
function v9._resize(p18)
    p18.template.Size = UDim2.new(0, 299, 0, p18:_get_height())
end
function v9.get(p19)
    return p19.element:get()
end
function v9.set(p20, p21)
    p20.element:set(p21)
end
function v9.set_visible(p22, p23)
    p22.template.Visible = p23
end
function v9.is_visible(p24)
    return p24.template.Visible
end
function v9.start(p_u_25, p26, p27)
    p_u_25.setting_entry = v_u_7.Dictionary.copyDeep(p26)
    p_u_25.container_options = p_u_25.setting_entry.container_options
    p_u_25.element_options = p_u_25.setting_entry.element_options
    local v28 = v_u_10(p_u_25.container_options)
    assert(v28, "Options failed validation.")
    p_u_25.template = v_u_8:FindFirstChild(p_u_25.setting_entry.type .. "Template"):Clone()
    p_u_25.template.Name = p_u_25.setting_entry.id
    p_u_25.template.Parent = p_u_25.instance
    p_u_25.container = p_u_25.template.Container
    local v_u_29 = p_u_25.container:FindFirstChild(p_u_25.setting_entry.type)
    local v_u_30 = p_u_25.container.Title
    v_u_30.Text = p_u_25.container_options.name or ""
    v_u_30.TextWrapped = true
    local v_u_31 = p_u_25.container.Description
    v_u_31.Text = p_u_25.container_options.description or ""
    v_u_31.Visible = p_u_25.container_options.description and true or false
    v_u_5.on_text_bounds({
        ["FontFace"] = v_u_31.FontFace,
        ["FontSize"] = v_u_31.TextSize,
        ["Text"] = v_u_31.Text,
        ["ContainerWidth"] = v_u_31.AbsoluteSize.X
    }, function(p32)
        local v33 = v_u_31
        local v34 = UDim2.new
        local v35 = p32.X
        local v36 = math.ceil(v35)
        local v37 = p32.Y
        v33.Size = v34(0, v36, 0, (math.ceil(v37)))
        p_u_25:_resize()
    end)
    v_u_5.on_text_bounds({
        ["FontFace"] = v_u_30.FontFace,
        ["FontSize"] = v_u_30.TextSize,
        ["Text"] = v_u_30.Text,
        ["ContainerWidth"] = v_u_30.AbsoluteSize.X
    }, function(p38)
        local v39 = v_u_30
        local v40 = UDim2.new
        local v41 = p38.X
        local v42 = math.ceil(v41)
        local v43 = p38.Y
        v39.Size = v40(0, v42, 0, math.ceil(v43) + 6)
        if not p_u_25.container:FindFirstChildWhichIsA("UIListLayout") then
            local v44 = v_u_31
            local v45 = UDim2.new
            local v46 = p38.Y + 10
            local v47 = v_u_29.AbsoluteSize.Y + 4
            v44.Position = v45(0, 0, 0, (math.max(v46, v47)))
        end
        p_u_25:_resize()
    end)
    if not p_u_25.container:FindFirstChildWhichIsA("UIListLayout") then
        v_u_31.AnchorPoint = Vector2.new(0, 0)
    end
    p_u_25.setting_changed = v_u_4.new()
    p_u_25.element = p_u_25.UIManager.wrap(v_u_29, p_u_25.setting_entry.type):start(p_u_25.element_options)
    p_u_25:_resize()
    p_u_25.element:set(p27)
    p_u_25.element.changed:Connect(function(...)
        p_u_25.setting_changed:Fire(...)
    end)
    p_u_25.template.Active = true
    p_u_25.template.Activated:Connect(function(p48)
        if v_u_2.is_using_gamepad() then
            if p48.KeyCode == Enum.KeyCode.ButtonA then
                p_u_25.element:console_activated()
            end
        end
    end)
    return p_u_25
end
return v9