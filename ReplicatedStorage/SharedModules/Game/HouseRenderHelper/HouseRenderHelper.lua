--// ReplicatedStorage.SharedModules.Game.HouseRenderHelper (ModuleScript)

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Utilities")
local v_u_3 = {}
local v_u_4 = {
    [Enum.NormalId.Front] = Vector3.new(1, 1, -1),
    [Enum.NormalId.Back] = Vector3.new(-1, 1, 1),
    [Enum.NormalId.Left] = Vector3.new(-1, 1, -1),
    [Enum.NormalId.Right] = Vector3.new(1, 1, 1),
    [Enum.NormalId.Top] = Vector3.new(1, 1, 1),
    [Enum.NormalId.Bottom] = Vector3.new(-1, -1, 1)
}
local v_u_5 = {
    [Enum.NormalId.Front] = 0,
    [Enum.NormalId.Right] = 1,
    [Enum.NormalId.Back] = 2,
    [Enum.NormalId.Left] = 3
}
local function v_u_21(p6, p7, p8)
    local v9 = p6.Parent
    local v10 = p6.Face
    local v11 = v9.CFrame * (v9.Size / 2 * v_u_4[v10])
    local v12 = p6.Face
    local v13 = p6.Parent
    local v14 = nil
    local v15 = nil
    if v12 == Enum.NormalId.Front or (v12 == Enum.NormalId.Back or (v12 == Enum.NormalId.Left or v12 == Enum.NormalId.Right)) then
        local v16 = v13.Orientation.Y % 360
        local v17 = v_u_2.RoundToNearestMultiple(v16, 90)
        local v18 = (v_u_5[v12] - v17 / 90) % 4
        if v18 == 0 then
            v14 = -v11.X
            v15 = -v11.Y
        elseif v18 == 1 then
            v14 = -v11.Z
            v15 = -v11.Y
        elseif v18 == 2 then
            v14 = v11.X
            v15 = -v11.Y
        else
            v14 = v11.Z
            v15 = -v11.Y
        end
        if v13:IsA("TriangleMeshPart") then
            if v12 == Enum.NormalId.Back or v12 == Enum.NormalId.Front then
                v14 = v14 + v13.Size.X / 2
                v15 = v15 + v13.Size.Y / 2
            elseif v12 == Enum.NormalId.Left or v12 == Enum.NormalId.Right then
                v14 = v14 + v13.Size.Z / 2
                v15 = v15 + v13.Size.Y / 2
            end
        end
    elseif v12 == Enum.NormalId.Top then
        local v19 = v13.Orientation.Y % 360
        local v20 = v_u_2.RoundToNearestMultiple(v19, 90)
        if v20 == 0 or v20 == 360 then
            v14 = -v11.X
            v15 = -v11.Z
        elseif v20 == 90 then
            v14 = v11.Z
            v15 = -v11.X
        elseif v20 == 180 then
            v14 = v11.X
            v15 = v11.Z
        else
            v14 = -v11.Z
            v15 = v11.X
        end
    elseif v12 == Enum.NormalId.Bottom then
        v14 = v11.X
        v15 = -v11.Z
    end
    return v14 % p7, v15 % p8
end
function v_u_3.get_floors(p22)
    local v23 = {}
    for _, v24 in pairs(p22.Floors:GetDescendants()) do
        if v24:IsA("Part") then
            table.insert(v23, v24)
        end
    end
    for _, v25 in pairs(p22.Floors:GetDescendants()) do
        if v25:IsA("UnionOperation") then
            table.insert(v23, v25)
        end
    end
    return v23
end
function v_u_3.get_intersecting_floors(p26, p27)
    local v28 = {}
    for _, v29 in p26 do
        local v30 = { v_u_2.get_corners(v29) }
        if v_u_2.point_in_points(p27, v30) then
            local v31 = nil
            for _, v32 in v29:GetChildren() do
                if v32:IsA("Texture") and v32.Face == Enum.NormalId.Top then
                    v31 = v32
                end
            end
            if v31 then
                local v33 = {
                    ["floor"] = v29,
                    ["room_id"] = v31.Name
                }
                table.insert(v28, v33)
            end
        end
    end
    return v28
end
function v_u_3.get_nearest_floor(p34, p35, p36)
    local v37 = v_u_3.get_floors(p34)
    local v38 = {}
    for _, v39 in v_u_3.get_intersecting_floors(v37, p35) do
        if not p36 or p34.Walls:FindFirstChild(v39.room_id, true) then
            local v40 = p35.Y - v39.floor.Position.Y
            if v40 > 0 and v40 < 100 then
                v39.delta_y = v40
                table.insert(v38, v39)
            end
        end
    end
    table.sort(v38, function(p41, p42)
        return p41.delta_y < p42.delta_y
    end)
    return v38[1]
end
function v_u_3.get_textures_by_name(p43, p44)
    local v45 = {}
    for _, v46 in p43[p44]:GetDescendants() do
        if v46:IsA("Texture") then
            local v47 = v45[v46.Name] or {}
            table.insert(v47, v46)
            v45[v46.Name] = v47
        end
    end
    return v45
end
function v_u_3.change_textures(p48, p49)
    if next(p48) ~= nil then
        local v50 = p49 or {}
        for _, v51 in p48 do
            local v52 = v50.texture_id or ""
            local v53 = v50.studs_per_tile_u or 3
            local v54 = v50.studs_per_tile_v or 3
            local v55, v56 = v_u_21(v51, v53, v54)
            local v57 = v50.color3 or Color3.new(1, 1, 1)
            v51.Texture = v52
            v51.StudsPerTileU = v53
            v51.StudsPerTileV = v54
            v51.OffsetStudsU = v55
            v51.OffsetStudsV = v56
            v51.Color3 = v57
        end
    end
end
function v_u_3.apply_addons_to_interior(p58, p59, p60, p61)
    if p59.addons then
        for _, v62 in p58.Addons:GetChildren() do
            if p60[v62.Name] then
                local v63 = v62.Walls
                v63.Name = v62.Name
                v63.Parent = p58.Walls
                local v64 = v62.Floors
                v64.Name = v62.Name
                v64.Parent = p58.Floors
                if v62:FindFirstChild("Lighting") then
                    v62.Lighting.Parent = p58.Lighting
                end
                if v62:FindFirstChild("Doors") then
                    for _, v65 in v62.Doors:GetChildren() do
                        v65.Parent = p58.Doors
                    end
                end
            else
                v62:Destroy()
            end
        end
        for _, v66 in p58.Floors:GetDescendants() do
            if v66:IsA("BasePart") and (p59.addons[v66.Name] and p60[v66.Name]) then
                v66:Destroy()
            end
        end
        for _, v67 in p58.Walls:GetDescendants() do
            if v67:IsA("BasePart") and (p59.addons[v67.Name] and p60[v67.Name]) then
                v67:Destroy()
            end
        end
        for _, v68 in p58.Doors:GetChildren() do
            if p59.addons[v68.Name] and not p60[v68.Name] then
                v68:Destroy()
            end
        end
        if not p61 and p58:FindFirstChild("PreviewBarriers") then
            p58.PreviewBarriers:Destroy()
        end
    end
end
function v_u_3.color_house_exterior(p69, p70)
    if p69:FindFirstChild("Colorable") and p69.Colorable:IsA("Folder") then
        for _, v71 in pairs(p69.Colorable:GetChildren()) do
            if v71:IsA("Folder") then
                for _, v72 in pairs(v71:GetChildren()) do
                    if v72:IsA("BasePart") then
                        v72.Color = p70
                    end
                end
            else
                v71.Color = p70
            end
        end
    end
end
function v_u_3.add_dome_to_exterior(p73)
    local v74 = v_u_1.Resources.HousePreviewDome:Clone()
    v74:PivotTo(p73.Plot:GetPivot())
    v74.Parent = p73
end
function v_u_3.apply_addons_to_exterior(p75, p76, p77)
    for _, v78 in p75.AddonVisuals:GetChildren() do
        if not p77[v78.Name] then
            v78:Destroy()
        end
    end
    for _, v79 in p75.Colorable:GetChildren() do
        if v79.Name ~= "Main" and not p77[v79.Name] then
            v79:Destroy()
        end
    end
    local v80 = {}
    for _, v81 in p75.Doors:GetChildren() do
        if p76.addons[v81.Name] then
            if p77[v81.Name] then
                local v82 = v81.Name
                table.insert(v80, v82)
            else
                v81:Destroy()
            end
        end
    end
    return v80
end
return v_u_3