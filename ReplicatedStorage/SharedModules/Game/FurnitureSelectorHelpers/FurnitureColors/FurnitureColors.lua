--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureColors (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("FurnitureDB")
local v_u_2 = game:GetService("RunService")
local v_u_76 = {
    ["get_colorable_parts"] = function(p3)
        local v4 = p3:FindFirstChild("PlacementTops")
        local v5 = {}
        for _, v6 in p3:GetDescendants() do
            if v6:IsA("BasePart") then
                if v6.Name ~= "PlacementBlock" and not (v4 and v6:IsDescendantOf(v4)) and (v6.Name ~= "NonColorable" and (v6.Transparency < 1 or v6.Name == "Colorable")) then
                    table.insert(v5, v6)
                end
            elseif v6:IsA("ParticleEmitter") and v6.Name == "Colorable" then
                table.insert(v5, v6)
            end
        end
        return v5
    end,
    ["mark_default_attributes"] = function(p7)
        local v8 = {
            ["primary"] = {},
            ["secondary"] = {}
        }
        for _, v9 in v_u_76.get_colorable_parts(p7) do
            local v10 = nil
            if v9:IsA("BasePart") then
                v10 = v9.Color:ToHex()
            elseif v9:IsA("ParticleEmitter") then
                v10 = v9.Color.Keypoints[1].Value:ToHex()
            end
            if v9.Name == "Colorable" then
                v8.primary[v10] = true
            else
                v8.secondary[v10] = true
            end
        end
        local v11 = {}
        for v12, v13 in v8 do
            local v14 = {}
            for v15, _ in v13 do
                table.insert(v14, v15)
            end
            table.sort(v14)
            v11[v12] = v14
        end
        local v16 = {}
        for _, v17 in v11.primary do
            table.insert(v16, v17)
        end
        for _, v18 in v11.secondary do
            table.insert(v16, v18)
        end
        p7:SetAttribute("NumberOfLegacyColors", #v11.primary)
        p7:SetAttribute("DefaultFurnitureColors", table.concat(v16, ","))
    end,
    ["get_default_colors"] = function(p19)
        local v20 = p19:GetAttribute("DefaultFurnitureColors")
        if not v20 then
            v_u_76.mark_default_attributes(p19)
            return v_u_76.get_default_colors(p19)
        end
        if v20 == "" then
            return {}
        end
        local v21 = {}
        for v22, v23 in v20:split(",") do
            v21[v22] = Color3.fromHex(v23)
        end
        return v21
    end,
    ["get_primary_default_colors"] = function(p24)
        local v25 = v_u_76.get_default_colors(p24)
        local v26 = {}
        for v27 = 1, p24:GetAttribute("NumberOfLegacyColors") or 0 do
            local v28 = v25[v27]
            table.insert(v26, v28)
        end
        return v26
    end,
    ["get_secondary_default_colors"] = function(p29)
        local v30 = v_u_76.get_default_colors(p29)
        local v31 = {}
        for v32 = (p29:GetAttribute("NumberOfLegacyColors") or 0) + 1, #v30 do
            local v33 = v30[v32]
            table.insert(v31, v33)
        end
        return v31
    end,
    ["get_default_colors_by_kind"] = function(p34)
        local v35 = v_u_1[p34]
        local v36 = v_u_2:IsServer()
        assert(v36, "This API can only be used on the server")
        local v37 = "No furniture entry exists for " .. p34
        assert(v35, v37)
        local v38 = v35.model_name
        if v38 then
            v38 = game.ServerStorage.Downloadable.Furniture:FindFirstChild(v35.model_name)
        end
        local v39 = "No model found for " .. p34
        assert(v38, v39)
        return v_u_76.get_default_colors(v38)
    end,
    ["get_primary_default_colors_by_kind"] = function(p40)
        local v41 = v_u_1[p40]
        local v42 = v_u_2:IsServer()
        assert(v42, "This API can only be used on the server")
        local v43 = "No furniture entry exists for " .. p40
        assert(v41, v43)
        local v44 = v41.model_name
        if v44 then
            v44 = game.ServerStorage.Downloadable.Furniture:FindFirstChild(v41.model_name)
        end
        local v45 = "No model found for " .. p40
        assert(v44, v45)
        return v_u_76.get_primary_default_colors(v44)
    end,
    ["get_secondary_default_colors_by_kind"] = function(p46)
        local v47 = v_u_1[p46]
        local v48 = v_u_2:IsServer()
        assert(v48, "This API can only be used on the server")
        local v49 = "No furniture entry exists for " .. p46
        assert(v47, v49)
        local v50 = v47.model_name
        if v50 then
            v50 = game.ServerStorage.Downloadable.Furniture:FindFirstChild(v47.model_name)
        end
        local v51 = "No model found for " .. p46
        assert(v50, v51)
        return v_u_76.get_secondary_default_colors(v50)
    end,
    ["for_colors_from_array"] = function(p52, p53)
        local v54 = v_u_76.get_default_colors(p52)
        local v55 = p52:GetAttribute("NumberOfLegacyColors") or 0
        local v56 = {}
        for v57, v58 in v54 do
            v56[(v57 <= v55 and "primary_" or "") .. v58:ToHex()] = p53[v57]
        end
        for _, v59 in v_u_76.get_colorable_parts(p52) do
            local v60 = nil
            if v59:IsA("BasePart") then
                v60 = v59.Color:ToHex()
            elseif v59:IsA("ParticleEmitter") then
                v60 = v59.Color.Keypoints[1].Value:ToHex()
            end
            local v61 = v56[(v59.Name == "Colorable" and "primary_" or "") .. v60]
            if v61 then
                v61(v59)
            end
        end
    end,
    ["for_color"] = function(p62, p63, p64)
        v_u_76.for_colors_from_array(p62, {
            [p63] = p64
        })
    end,
    ["recolor_from_array"] = function(p65, p66, p_u_67)
        local v_u_68 = v_u_76.get_default_colors(p65)
        local v69 = {}
        for v_u_70, v_u_71 in p66 do
            v69[v_u_70] = function(p72)
                if p_u_67 then
                    if p72:IsA("BasePart") then
                        p72.Color = v_u_71 or v_u_68[v_u_70]
                        return
                    end
                    if p72:IsA("ParticleEmitter") then
                        p72.Color = ColorSequence.new(v_u_71 or v_u_68[v_u_70])
                        return
                    end
                elseif v_u_71 then
                    if p72:IsA("BasePart") then
                        p72.Color = v_u_71
                        return
                    end
                    if p72:IsA("ParticleEmitter") then
                        p72.Color = ColorSequence.new(v_u_71)
                    end
                end
            end
        end
        v_u_76.for_colors_from_array(p65, v69)
    end,
    ["recolor"] = function(p73, p74, p75)
        return v_u_76.recolor_from_array(p73, {
            [p74] = p75
        }, false)
    end
}
return v_u_76