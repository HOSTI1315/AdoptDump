--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.InputDisplayApp.InputIcons (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("InputIconsDB")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = {}
local v_u_4 = {}
local v_u_5 = {}
local v_u_6 = {
    ["mouse"] = true,
    ["mouse_left"] = true,
    ["mouse_middle"] = true,
    ["mouse_right"] = true
}
local function v_u_11(p7, p8)
    local v9 = nil
    local v10 = p7.Value
    if p8 then
        v9 = v_u_2:GetStringForKeyCode(p7)
    elseif v10 >= 8 and v10 <= 255 then
        v9 = string.char(v10):upper()
    end
    if v9 and v9 ~= "" then
        return v9 == " " and "Space" or v9
    else
        return string.gsub(p7.Name, "(%u)", " %1")
    end
end
function v_u_3.get_icon_by_name(p12, p13)
    local v14 = p13 or {}
    local v15 = v_u_5[p12] or v_u_4[p12] and p12
    assert(v15, "Invalid icon name requested.")
    local v16 = v14.theme or "dark"
    local v17 = v14.forced_key_type
    local v18 = v14.scale or 1
    local v19 = v16 == "light"
    local v20 = v14.remap == nil and true or v14.remap
    local v21 = nil
    local v22 = ""
    local v23 = v_u_1.sprite_dimensions.keyboard_mouse[v15]
    local v24
    if v23 then
        v24 = v_u_1.images.keyboard_mouse[v16]
        if not v_u_6[v15] then
            v22 = v14.display_text or ""
            v21 = v15
        end
    else
        local v25 = v_u_4[v15].Value
        local v26
        if v25 >= 160 and v25 <= 255 then
            v26 = false
        else
            v26 = v25 < 1000
        end
        if v26 then
            local v27 = v_u_4[v15]
            v21 = v17 or (v_u_1.key_types.by_enum[v27] or "key")
            v23 = v_u_1.sprite_dimensions.keyboard_mouse[v21]
            v24 = v_u_1.images.keyboard_mouse[v16]
            v22 = v14.display_text or v_u_11(v27, v20)
        else
            v23 = v_u_1.sprite_dimensions.xbox_controller[v16][v15]
            v24 = v_u_1.images.xbox_controller
        end
    end
    assert(v24 and v23, ("No input icon could be found for %s"):format(v15))
    local v28 = Instance.new("ImageLabel")
    v28.BackgroundTransparency = 1
    v28.Image = v24
    v28.ImageRectOffset = Vector2.new(v23.x_pos, v23.y_pos)
    v28.ImageRectSize = Vector2.new(v23.x_size, v23.y_size)
    v28.Size = UDim2.new(0, v23.x_size * v18, 0, v23.y_size * v18)
    v28.Name = v15 .. "_" .. v16
    if v21 then
        local v29 = v_u_1.key_types.text_dimensions[v21]
        local v30 = Instance.new("TextLabel")
        v30.AnchorPoint = v29.anchor
        v30.Size = UDim2.new(v29.x_size, 0, v29.y_size, 0)
        v30.Position = UDim2.new(v29.x_pos, 0, v29.y_pos, 0)
        v30.BackgroundTransparency = 1
        v30.TextColor3 = v19 and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
        v30.Font = Enum.Font.SourceSansBold
        v30.Text = v22
        v30.TextScaled = true
        v30.Parent = v28
    end
    return v28
end
function v_u_3.get_icon_by_keycode(p31, p32)
    local v33 = string.gsub(p31.Name, "(%u)", "_%1"):lower():sub(2, -1)
    local v34 = v33 ~= ""
    assert(v34, "Could not find a valid name for the provided keycode.")
    return v_u_3.get_icon_by_name(v33, p32)
end
function v_u_3.init()
    for _, v35 in pairs(Enum.KeyCode:GetEnumItems()) do
        local v36 = string.gsub(v35.Name, "(%u)", "_%1"):lower():sub(2, -1)
        local v37 = v_u_11(v35)
        v_u_4[v36] = v35
        v_u_5[v37] = v36
    end
end
return v_u_3