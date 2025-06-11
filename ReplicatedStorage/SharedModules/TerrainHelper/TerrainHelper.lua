--// ReplicatedStorage.SharedModules.TerrainHelper (ModuleScript)

local v_u_1 = workspace.Terrain
local v_u_2 = {
    ["WaterColor"] = true,
    ["WaterReflectance"] = true,
    ["WaterTransparency"] = true,
    ["WaterWaveSize"] = true,
    ["WaterWaveSpeed"] = true
}
local v_u_3 = game:GetService("HttpService")
local v_u_4 = game:GetService("CollectionService")
local v5 = game:GetService("RunService")
local v_u_6
if workspace.StreamingEnabled then
    v_u_6 = v5:IsServer()
else
    v_u_6 = v5:IsClient()
end
local v_u_7 = v5:IsClient()
local v_u_25 = {
    ["block"] = function(p_u_8, p9)
        v_u_1:FillBlock(p_u_8.CFrame, p_u_8.Size, p9)
        return function()
            v_u_1:FillBlock(p_u_8.CFrame, p_u_8.Size, Enum.Material.Air)
        end
    end,
    ["ball"] = function(p_u_10, p11)
        local v12 = p_u_10.Size.X
        local v13 = p_u_10.Size.Y
        local v14 = p_u_10.Size.Z
        local v_u_15 = math.min(v12, v13, v14) / 2
        v_u_1:FillBall(p_u_10.Position, v_u_15, p11)
        return function()
            v_u_1:FillBall(p_u_10.Position, v_u_15, Enum.Material.Air)
        end
    end,
    ["cylinder"] = function(p16, p17)
        local v_u_18 = p16.Size.X
        local v19 = p16.Size.Y
        local v20 = p16.Size.Z
        local v_u_21 = math.min(v19, v20) / 2
        local v_u_22 = p16.CFrame * CFrame.fromEulerAnglesXYZ(0, 0, 1.5707963267948966)
        v_u_1:FillCylinder(v_u_22, v_u_18, v_u_21, p17)
        return function()
            v_u_1:FillCylinder(v_u_22, v_u_18, v_u_21, Enum.Material.Air)
        end
    end,
    ["wedge"] = function(p_u_23, p24)
        v_u_1:FillWedge(p_u_23.CFrame, p_u_23.Size, p24)
        return function()
            v_u_1:FillWedge(p_u_23.CFrame, p_u_23.Size, Enum.Material.Air)
        end
    end
}
local v_u_100 = {
    ["clear"] = function()
        v_u_1:Clear()
    end,
    ["save"] = function(p26)
        local v27 = p26:ExpandToGrid(4)
        local v28, v29 = v_u_1:ReadVoxels(v27, 4)
        v28.Size = nil
        v29.Size = nil
        return {
            ["region"] = v27,
            ["materials"] = v28,
            ["occupancies"] = v29
        }
    end,
    ["load"] = function(p30)
        if not v_u_6 then
            return function() end
        end
        local v_u_31 = p30.region
        v_u_1:WriteVoxels(v_u_31, 4, p30.materials, p30.occupancies)
        return function()
            v_u_1:FillRegion(v_u_31, 4, Enum.Material.Air)
        end
    end,
    ["serialize"] = function(p32)
        local v33 = p32.region.CFrame.Position - p32.region.Size / 2
        local v34 = p32.region.CFrame.Position + p32.region.Size / 2
        local v35 = {
            ["region"] = {
                ["min"] = { v33.X, v33.Y, v33.Z },
                ["max"] = { v34.X, v34.Y, v34.Z }
            },
            ["materials"] = {},
            ["occupancies"] = p32.occupancies
        }
        for v36, v37 in pairs(p32.materials) do
            v35.materials[v36] = {}
            for v38, v39 in pairs(v37) do
                v35.materials[v36][v38] = {}
                for v40, v41 in pairs(v39) do
                    v35.materials[v36][v38][v40] = v41.Name
                end
            end
        end
        return v_u_3:JSONEncode(v35)
    end,
    ["deserialize"] = function(p42)
        local v43 = v_u_3:JSONDecode(p42)
        local v44 = Region3.new
        local v45 = v43.region.min
        local v46 = unpack
        local v47 = Vector3.new(v46(v45))
        local v48 = v43.region.max
        local v49 = unpack
        local v50 = v44(v47, (Vector3.new(v49(v48))))
        local v51 = {}
        for v52, v53 in pairs(v43.materials) do
            v51[v52] = {}
            for v54, v55 in pairs(v53) do
                v51[v52][v54] = {}
                for v56, v57 in pairs(v55) do
                    v51[v52][v54][v56] = Enum.Material[v57]
                end
            end
        end
        return {
            ["region"] = v50,
            ["materials"] = v51,
            ["occupancies"] = v43.occupancies
        }
    end,
    ["write_to_string_values"] = function(p58)
        local v59 = #p58 / 131071
        local v60 = {}
        for v61 = 1, math.ceil(v59) do
            local v62 = Instance.new("StringValue")
            v62.Value = p58:sub(1 + (v61 - 1) * 131071, v61 * 131071)
            v62.Name = v61
            v60[v61] = v62
        end
        return v60
    end,
    ["serialize_from_string_values"] = function(p63)
        table.sort(p63, function(p64, p65)
            local v66 = p64.Name
            local v67 = tonumber(v66)
            local v68 = p65.Name
            return v67 < tonumber(v68)
        end)
        local v69 = ""
        for _, v70 in ipairs(p63) do
            v69 = v69 .. v70.Value
        end
        return v69
    end,
    ["get_terrain_properties"] = function()
        local v71 = {}
        for v72, _ in pairs(v_u_2) do
            v71[v72] = v_u_1[v72]
        end
        return v71
    end,
    ["set_terrain_properties"] = function(p73)
        for v74, v75 in pairs(p73) do
            v_u_1[v74] = v75
        end
    end,
    ["load_by_parts"] = function(p76, p77)
        local v_u_78 = v_u_100.get_terrain_properties()
        v_u_100.set_terrain_properties(p77 or {})
        local v_u_79 = {}
        for v80, v81 in pairs(p76) do
            if v_u_7 then
                v80.Transparency = 1
                v80.CanCollide = false
            end
            if v_u_6 then
                local v82
                if v80.ClassName == "Part" then
                    v82 = v80.Shape == Enum.PartType.Block and "block" or (v80.Shape == Enum.PartType.Cylinder and "cylinder" or (v80.Shape == Enum.PartType.Ball and "ball" or nil))
                else
                    v82 = v80.ClassName == "WedgePart" and "wedge" or nil
                end
                local v83 = v_u_25[v82]
                if v83 then
                    table.insert(v_u_79, v83(v80, v81))
                end
            end
        end
        return function()
            for _, v84 in pairs(v_u_79) do
                v84()
            end
            v_u_100.set_terrain_properties(v_u_78)
        end
    end,
    ["load_by_tagged_parts"] = function(p85, p86)
        local v87 = {}
        for _, v88 in ipairs(v_u_4:GetTagged("TerrainWater")) do
            if v88:IsDescendantOf(p85) then
                v87[v88] = Enum.Material.Water
            end
        end
        return v_u_100.load_by_parts(v87, p86)
    end,
    ["add_housing_terrain_water"] = function(p89, p90)
        local v91 = p89:FindFirstChild("SpecialParts")
        local v92 = v91:FindFirstChild("FurnitureOrigin")
        if v92 then
            v92 = v92.CFrame
        end
        local v_u_93 = {}
        for _, v94 in pairs(v91:GetChildren()) do
            if v94.Name == "PoolWater" then
                if v_u_7 then
                    v94.Transparency = 1
                    v94.CanCollide = false
                end
                if v_u_6 then
                    local v95 = v94.Size + Vector3.new(12, 0, 12)
                    local v96
                    if v92 and p90 then
                        v96 = p90 * v92:ToObjectSpace(v94.CFrame)
                    else
                        v96 = v94.CFrame
                    end
                    workspace.Terrain:FillBlock(v96, v95, Enum.Material.Water)
                    table.insert(v_u_93, {
                        ["cframe"] = v96,
                        ["size"] = v95
                    })
                end
            elseif v94.Name == "HouseWater" then
                if v_u_7 then
                    v94.Transparency = 1
                    v94.CanCollide = false
                end
                if v_u_6 then
                    local v97
                    if v92 and p90 then
                        v97 = p90 * v92:ToObjectSpace(v94.CFrame)
                    else
                        v97 = v94.CFrame
                    end
                    workspace.Terrain:FillBlock(v97, v94.Size, Enum.Material.Water)
                    local v98 = {
                        ["cframe"] = v97,
                        ["size"] = v94.Size
                    }
                    table.insert(v_u_93, v98)
                end
            end
        end
        return function()
            if v_u_6 then
                for _, v99 in v_u_93 do
                    workspace.Terrain:FillBlock(v99.cframe, v99.size, Enum.Material.Air)
                end
            end
        end
    end
}
return v_u_100