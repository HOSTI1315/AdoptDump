--// ReplicatedStorage.SharedModules.PlatformUIM (ModuleScript)

local v_u_7 = {
    ["platform"] = {
        ["phone"] = "phone",
        ["tablet"] = "tablet",
        ["console"] = "console",
        ["desktop"] = "desktop"
    },
    ["move_children"] = function(p1, p2)
        for _, v3 in pairs(p1:GetChildren()) do
            v3.Parent = p2
        end
    end,
    ["copy_children"] = function(p4, p5)
        for _, v6 in pairs(p4:GetChildren()) do
            v6:clone().Parent = p5
        end
    end
}
local v_u_8 = {
    "PlatformTransform",
    "phone",
    "tablet",
    "desktop",
    "console"
}
function v_u_7.copy_ui_related_children()
    -- failed to decompile
end
function v_u_7.delete_children(p9)
    for _, v10 in pairs(p9:GetChildren()) do
        v10:Destroy()
    end
end
function v_u_7.invert_layout_order(p11)
    local v12 = 0
    for _, v13 in pairs(p11:GetChildren()) do
        if v13:IsA("GuiObject") then
            if v12 < v13.LayoutOrder then
                v12 = v13.LayoutOrder or v12
            end
        end
    end
    for _, v14 in pairs(p11:GetChildren()) do
        if v14:IsA("GuiObject") then
            v14.LayoutOrder = v12 - v14.LayoutOrder
        end
    end
end
function v_u_7.create_if_nil(p15)
    if p15.Parent:FindFirstChild(p15.Name) ~= nil then
        return nil
    end
    local v16 = Instance.new(p15.ClassName)
    for v17, v18 in pairs(p15) do
        if v17 ~= "ClassName" and v17 ~= "Parent" then
            v16[v17] = v18
        end
    end
    v16.Parent = p15.Parent
    return v16
end
function v_u_7.swap(p19, p20)
    p20.Parent = p19.Parent
    p19:Destroy()
end
function v_u_7.delete_instanced_named()
    -- failed to decompile
end
function v_u_7.recursive_scale_offset(p21, p22)
    for _, v23 in pairs(p21:GetChildren()) do
        v_u_7.recursive_scale_offset(v23, p22)
    end
    if p21:IsA("GuiObject") then
        p21.Position = UDim2.new(p21.Position.X.Scale, p21.Position.X.Offset * p22, p21.Position.Y.Scale, p21.Position.Y.Offset * p22)
        p21.Size = UDim2.new(p21.Size.X.Scale, p21.Size.X.Offset * p22, p21.Size.Y.Scale, p21.Size.Y.Offset * p22)
    end
    if p21:IsA("TextLabel") or (p21:IsA("TextBox") or p21:IsA("TextButton")) then
        local v24 = p21.TextSize * p22
        p21.TextSize = math.floor(v24)
    end
end
return v_u_7