--// ReplicatedStorage.SharedModules.UIGradientHelper (ModuleScript)

local v1 = {}
local function v_u_7(p2, p3, p4)
    local v5 = {}
    for _ = 1, p3 do
        local v6 = table.remove(p2, p4 and 1 or nil)
        if not v6 then
            break
        end
        if p4 then
            table.insert(v5, v6)
        else
            table.insert(v5, 1, v6)
        end
    end
    return v5
end
local function v_u_14(p8, p9)
    if p8 == 0 then
        return p9.Keypoints[1].Value
    end
    if p8 == 1 then
        return p9.Keypoints[#p9.Keypoints].Value
    end
    for v10 = 1, #p9.Keypoints - 1 do
        local v11 = p9.Keypoints[v10]
        local v12 = p9.Keypoints[v10 + 1]
        if v11.Time <= p8 and p8 < v12.Time then
            local v13 = (p8 - v11.Time) / (v12.Time - v11.Time)
            return Color3.new((v12.Value.R - v11.Value.R) * v13 + v11.Value.R, (v12.Value.G - v11.Value.G) * v13 + v11.Value.G, (v12.Value.B - v11.Value.B) * v13 + v11.Value.B)
        end
    end
    return p9.Keypoints[#p9.Keypoints].Value
end
function v1.from_keypoints(p15)
    if #p15 <= 20 then
        return {
            {
                ["from"] = 0,
                ["to"] = 1,
                ["sequence"] = ColorSequence.new(p15)
            }
        }
    end
    local v16 = table.clone(p15)
    local v17 = v_u_7(v16, 20, true)
    local v18 = v_u_7(v16, 20, false)
    local v19 = {}
    while true do
        local v20 = v_u_7(v16, 18, true)
        if #v20 <= 0 then
            break
        end
        table.insert(v19, v20)
    end
    table.insert(v19, 1, v17)
    table.insert(v19, v18)
    for v21 = 2, #v19 - 1 do
        local v22 = v19[v21]
        local v23 = v19[v21 - 1]
        local v24 = v19[v21 + 1]
        local v25 = v23[#v23]
        table.insert(v22, 1, v25)
        local v26 = v24[1]
        table.insert(v22, v26)
    end
    if #v18 < 20 then
        local v27 = v19[#v19 - 1]
        local v28 = v27[#v27]
        table.insert(v18, 1, v28)
    end
    local v29 = {}
    for _, v30 in v19 do
        local v31 = v30[1].Time
        local v32 = v30[#v30].Time
        local v33 = {}
        for v34, v35 in v30 do
            v33[v34] = ColorSequenceKeypoint.new((v35.Time - v31) / (v32 - v31), v35.Value)
        end
        local v36 = {
            ["from"] = v31,
            ["to"] = v32,
            ["sequence"] = ColorSequence.new(v33)
        }
        table.insert(v29, v36)
    end
    return v29
end
function v1.from_single_color(p37)
    return {
        {
            ["from"] = 0,
            ["to"] = 1,
            ["sequence"] = ColorSequence.new(p37)
        }
    }
end
function v1.evaluate(p38, p39)
    local v40 = nil
    for _, v41 in p39 do
        if p38 <= v41.to then
            v40 = v41
            break
        end
    end
    return v_u_14((p38 - v40.from) / (v40.to - v40.from), v40.sequence)
end
function v1.create_rounded_gradient(p42, p43)
    local v44 = Instance.new("Frame")
    v44.BorderSizePixel = 0
    v44.BackgroundTransparency = 1
    local v45 = Instance.new("UIGradient")
    v45.Color = p42
    local v46 = Instance.new("Frame")
    v46.ClipsDescendants = true
    v46.Size = UDim2.new(0.5, 0, 0.5, 0)
    v46.Position = UDim2.new(0, 0, 0, 0)
    v46.BackgroundTransparency = 1
    v46.Parent = v44
    local v47 = Instance.new("Frame")
    v47.BackgroundColor3 = Color3.new(1, 1, 1)
    v47.BorderSizePixel = 0
    v47.Size = UDim2.new(2, 0, 2, 0)
    v47.Position = UDim2.new(0, 0, 0, 0)
    v47.AnchorPoint = Vector2.new(0, 0)
    v47.Parent = v46
    local v48 = Instance.new("UICorner")
    v48.CornerRadius = p43.top_left
    v48.Parent = v47
    v45:Clone().Parent = v47
    local v49 = Instance.new("Frame")
    v49.ClipsDescendants = true
    v49.Size = UDim2.new(0.5, 0, 0.5, 0)
    v49.Position = UDim2.new(0.5, 0, 0, 0)
    v49.BackgroundTransparency = 1
    v49.Parent = v44
    local v50 = Instance.new("Frame")
    v50.BackgroundColor3 = Color3.new(1, 1, 1)
    v50.BorderSizePixel = 0
    v50.Size = UDim2.new(2, 0, 2, 0)
    v50.Position = UDim2.new(1, 0, 0, 0)
    v50.AnchorPoint = Vector2.new(1, 0)
    v50.Parent = v49
    local v51 = Instance.new("UICorner")
    v51.CornerRadius = p43.top_right
    v51.Parent = v50
    v45:Clone().Parent = v50
    local v52 = Instance.new("Frame")
    v52.ClipsDescendants = true
    v52.Size = UDim2.new(0.5, 0, 0.5, 0)
    v52.Position = UDim2.new(0, 0, 0.5, 0)
    v52.BackgroundTransparency = 1
    v52.Parent = v44
    local v53 = Instance.new("Frame")
    v53.BackgroundColor3 = Color3.new(1, 1, 1)
    v53.BorderSizePixel = 0
    v53.Size = UDim2.new(2, 0, 2, 0)
    v53.Position = UDim2.new(0, 0, 1, 0)
    v53.AnchorPoint = Vector2.new(0, 1)
    v53.Parent = v52
    local v54 = Instance.new("UICorner")
    v54.CornerRadius = p43.bottom_left
    v54.Parent = v53
    v45:Clone().Parent = v53
    local v55 = Instance.new("Frame")
    v55.ClipsDescendants = true
    v55.Size = UDim2.new(0.5, 0, 0.5, 0)
    v55.Position = UDim2.new(0.5, 0, 0.5, 0)
    v55.BackgroundTransparency = 1
    v55.Parent = v44
    local v56 = Instance.new("Frame")
    v56.BackgroundColor3 = Color3.new(1, 1, 1)
    v56.BorderSizePixel = 0
    v56.Size = UDim2.new(2, 0, 2, 0)
    v56.Position = UDim2.new(1, 0, 1, 0)
    v56.AnchorPoint = Vector2.new(1, 1)
    v56.Parent = v55
    local v57 = Instance.new("UICorner")
    v57.CornerRadius = p43.bottom_right
    v57.Parent = v56
    v45.Parent = v56
    return v44
end
return v1