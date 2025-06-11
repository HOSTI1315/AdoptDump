--// ReplicatedStorage.ClientModules.Game.FurniturePlacer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("FurnitureSerializerHelper")
v1("FurnitureDB")
local v_u_3 = v1("Raycast")
local v_u_4 = game:GetService("Players")
local v5 = v1("package:t")
local v_u_6 = v1("package:Sift")
local v_u_7 = v1("HouseDB")
local v_u_8 = v1("ClientData")
local v_u_9 = {}
local v_u_13 = {
    ["ignore_transparent"] = false,
    ["ignore_non_cancollide"] = false,
    ["ignore_function"] = function(p10, _, p11)
        local v12 = p10.CFrame:VectorToObjectSpace(p11)
        return p10.Parent.Name == "PlacementTops" and v12.Y <= 0.9
    end
}
local function v_u_19(p14, p15, p16)
    local v17 = p14:Dot(p15)
    local v18 = p14:Cross(p15)
    if v17 < -0.99999 then
        return CFrame.fromAxisAngle(p16, 3.141592653589793)
    else
        return CFrame.new(0, 0, 0, v18.x, v18.y, v18.z, 1 + v17)
    end
end
local function v_u_35(p20, p21)
    local v22 = -p21
    local v23 = v22.y
    local v24 = v22.x + v22.z
    local v25 = math.abs(v24)
    local v26 = Vector3.new(v23, v25, 0)
    local v27 = CFrame.fromMatrix(Vector3.new(), v26:Cross(v22), v26, v22)
    local v28 = p20.CFrame * CFrame.new(-v22 * p20.Size / 2) * v27
    local v29 = v27.XVector:Dot(p20.Size)
    local v30 = math.abs(v29)
    local v31 = v27.YVector:Dot(p20.Size)
    local v32 = math.abs(v31)
    local v33 = v27.ZVector:Dot(p20.Size)
    local v34 = math.abs(v33)
    return v28, Vector3.new(v30, v32, v34)
end
local v_u_36 = v5.strictInterface({
    ["part"] = v5.optional(v5.instanceIsA("BasePart")),
    ["normal"] = v5.optional(v5.Vector3),
    ["furniture_origin"] = v5.instanceIsA("BasePart"),
    ["plane_origin"] = v5.Vector3,
    ["plane_normal"] = v5.Vector3,
    ["allow_placement_below"] = v5.boolean,
    ["ray_start"] = v5.Vector3,
    ["ray_finish"] = v5.Vector3
})
local function v_u_50(p37)
    local v38 = v_u_36
    assert(v38(p37))
    local v39 = p37.part
    local v40 = p37.normal
    local v41 = p37.ray_finish
    local v42 = p37.plane_origin
    local v43 = p37.plane_normal
    local v44 = p37.ray_start
    local v45 = p37.ray_finish
    local v46 = (v44 - v42):Dot(v43) > 0
    local v47 = (v45 - v42):Dot(v43) > 0
    local v48 = false
    if v46 == v47 then
        if not (v46 or v47) then
            if (v45 - v44):Dot(v43) > 0 then
                v48 = true
            elseif not p37.allow_placement_below then
                v39 = nil
            end
        end
    else
        v48 = true
    end
    if v48 then
        local v49 = v45 - v44
        v41 = v44 + v49 * ((v42 - v44):Dot(v43) / v49:Dot(v43))
        v39 = p37.furniture_origin
    else
        v43 = v40
    end
    return v39, v43, v41
end
local function v_u_62(p51, p52)
    local v53 = p51:WaitForChild("Walls")
    local v54 = p51:WaitForChild("Floors")
    local v55 = p51:FindFirstAncestor("HouseInteriors"):WaitForChild("furniture")
    local v56 = {}
    for _, v57 in ipairs(v53:GetDescendants()) do
        if v57:IsA("BasePart") and v57.CanCollide then
            table.insert(v56, v57)
        end
    end
    for _, v58 in ipairs(v54:GetDescendants()) do
        if v58:IsA("BasePart") and v58.CanCollide then
            table.insert(v56, v58)
        end
    end
    for _, v59 in ipairs(v55:GetChildren()) do
        if not p52:IsDescendantOf(v59) then
            local v60 = v59:FindFirstChild("PlacementTops", true)
            for _, v61 in ipairs(v60 and v60:GetChildren() or {}) do
                table.insert(v56, v61)
            end
        end
    end
    return v56
end
local function v_u_70(p63, p64)
    local v65 = p63:FindFirstAncestor("HouseInteriors"):WaitForChild("furniture")
    local v66 = {}
    for _, v67 in ipairs(v65:GetChildren()) do
        if not p64:IsDescendantOf(v67) then
            local v68 = v67:FindFirstChild("SnapSurfaces", true)
            for _, v69 in v68 and v68:GetChildren() or {} do
                table.insert(v66, v69)
            end
        end
    end
    return v66
end
local function v_u_86(p71, p72, p73, p74, p75)
    local v76 = p74 or Vector3.new(0, 0, 0)
    if not p75 then
        p75 = {
            ["X"] = true,
            ["Y"] = true,
            ["Z"] = true
        }
    end
    local v77 = p73:PointToObjectSpace(p71)
    local v78 = {
        ["X"] = v77.X,
        ["Y"] = v77.Y,
        ["Z"] = v77.Z
    }
    for v79, v80 in pairs(p75) do
        if v80 then
            local v81 = (v77[v79] + v76[v79]) / p72
            v78[v79] = math.round(v81) * p72 - v76[v79]
        end
    end
    local v82 = v78.X
    local v83 = v78.Y
    local v84 = v78.Z
    local v85 = Vector3.new(v82, v83, v84)
    return p73:PointToWorldSpace(v85), v85
end
local function v_u_98(p87, p88, p89, p90, p91)
    local v92 = p90.CFrame.Rotation
    local v93 = p88 == 1 and p90.Size.X % 2 == 1 and 0.5 or 0
    local v94 = p88 == 1 and p90.Size.Y % 2 == 1 and 0.5 or 0
    local v95 = p88 == 1 and p90.Size.Z % 2 == 1 and 0.5 or 0
    local v96 = v92 * Vector3.new(v93, v94, v95)
    local v97, _ = v_u_86(p87, p88, p89 + Vector3.new(0, 0.5, 0), v96, p91)
    return v97, p89:PointToObjectSpace(v97)
end
local function v_u_108(_, p99, p100, p101)
    local v102 = p99:FindFirstChild("SnapSurfaces")
    if not v102 then
        return p100, false
    end
    if p101.Parent.Name ~= "SnapSurfaces" then
        return p100, false
    end
    local v103 = 2
    local v104 = nil
    for _, v105 in v102:GetChildren() do
        if v105.Name == p101.Name then
            local v106 = v105.CFrame.ZVector:Dot(p101.CFrame.ZVector)
            if v106 < v103 then
                v104 = v105
                v103 = v106
            end
        end
    end
    if not v104 then
        return p100, false
    end
    local v107 = v104.CFrame:ToObjectSpace(p100)
    return p101.CFrame * CFrame.new(0, 0, p101.Size.Z / 2 + v104.Size.Z / 2) * CFrame.fromEulerAnglesYXZ(0, 3.141592653589793, 0) * v107, true
end
local function v_u_137(p109, p110, p111, p_u_112)
    local v113 = {}
    local v114 = p109:WaitForChild("Walls")
    local v115 = p109:WaitForChild("Floors")
    if p_u_112:IsDescendantOf(v115) or p_u_112.Parent.Name == "PlacementTops" then
        v113 = v_u_6.List.filter(v114:GetDescendants(), function(p116)
            local v117 = p116:IsA("BasePart")
            if v117 then
                v117 = p116.CanCollide
            end
            return v117
        end)
    elseif p_u_112:IsDescendantOf(v114) then
        v113 = v_u_6.List.filter(v_u_6.List.concat(v114:GetDescendants(), v115:GetDescendants()), function(p118)
            local v119 = p118 ~= p_u_112 and p118:IsA("BasePart")
            if v119 then
                v119 = p118.CanCollide
            end
            return v119
        end)
    end
    local v120 = p110:WaitForChild("PlacementBlock").Size
    local v121 = false
    for _ = 1, 4 do
        local v122 = p111 * CFrame.new(0, v120.Y + 0.1, 0)
        local v123 = {
            v122 * (v120 * Vector3.new(0.5, 0, 0.5)),
            v122 * (v120 * Vector3.new(0.5, 0, -0.5)),
            v122 * (v120 * Vector3.new(-0.5, 0, -0.5)),
            v122 * (v120 * Vector3.new(-0.5, 0, 0.5))
        }
        local v124 = false
        for _, v125 in ipairs(v123) do
            local v126 = Ray.new(v122.Position, v125 - v122.Position)
            local v127, v128, v129, _ = v_u_3.FindPartOnRay(v126, nil, v113, {
                ["ignore_non_cancollide"] = false,
                ["ignore_transparent"] = false
            })
            if v127 then
                local v130 = v128 - v125
                if v130:Dot(v130) > 0.025 then
                    local v131 = v129.X
                    local v132 = math.abs(v131) > 0.1 and (v130.X or 0) or 0
                    local v133 = v129.Y
                    local v134 = math.abs(v133) > 0.1 and (v130.Y or 0) or 0
                    local v135 = v129.Z
                    local v136 = math.abs(v135) > 0.1 and v130.Z or 0
                    p111 = p111 + Vector3.new(v132, v134, v136)
                    v124 = true
                    v121 = true
                    break
                end
            end
        end
        if not v124 then
            break
        end
    end
    return p111, v121
end
local v_u_138 = v5.strictInterface({
    ["house"] = v5.instanceIsA("Model"),
    ["furniture"] = v5.instanceIsA("Model"),
    ["target_placement_surface"] = v5.instanceIsA("BasePart"),
    ["interval"] = v5.number,
    ["rotation"] = v5.CFrame,
    ["try_align"] = v5.optional(v5.boolean),
    ["is_first_placement"] = v5.optional(v5.boolean),
    ["normal"] = v5.Vector3,
    ["position"] = v5.Vector3
})
local function v_u_160(p139)
    local v140 = v_u_138
    assert(v140(p139))
    local v141 = p139.furniture:WaitForChild("PlacementBlock")
    local v142 = p139.house:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin").CFrame
    local v143 = v141.CFrame
    local v144, v145 = v_u_108(p139.house, p139.furniture, v143, p139.target_placement_surface)
    if v145 then
        return v142:ToObjectSpace(v144)
    end
    local v146 = v_u_86(p139.normal, 1, p139.target_placement_surface.CFrame.Rotation)
    local v147 = v_u_98
    local v148 = p139.position
    local v149 = p139.interval
    local v150 = {}
    local v151 = p139.normal.X
    v150.X = math.abs(v151) < 0.1
    local v152 = p139.normal.Y
    v150.Y = math.abs(v152) < 0.1
    local v153 = p139.normal.Z
    v150.Z = math.abs(v153) < 0.1
    local v154, _ = v147(v148, v149, v142, v141, v150)
    local v155 = v_u_8.get("house_interior")
    if v155 then
        v155 = v_u_7[v155.building_type]
    end
    local v156 = v_u_9.get_placement_cframe
    local v157 = {
        ["furniture"] = p139.furniture,
        ["translate_into_ground"] = true,
        ["is_first_placement"] = p139.is_first_placement and true or false,
        ["normal"] = v146,
        ["position"] = v154,
        ["rotation"] = p139.rotation
    }
    local v158
    if p139.try_align then
        v158 = p139.target_placement_surface or nil
    else
        v158 = nil
    end
    v157.align_part = v158
    if v155 then
        v155 = v155.align_spawned_furniture_to_world_space
    end
    v157.align_spawned_furniture_to_world_space = v155
    local v159 = v156(v157)
    return v142:ToObjectSpace((v_u_137(p139.house, p139.furniture, v159, p139.target_placement_surface)))
end
local v_u_161 = v5.strictInterface({
    ["scale_center"] = v5.CFrame,
    ["furniture_models"] = v5.array(v5.instanceIsA("Model"))
})
local function v_u_183(p162)
    local v163 = v_u_161
    assert(v163(p162))
    local v_u_164 = {}
    local v_u_165 = {}
    local v_u_166 = {}
    local v_u_167 = {}
    for _, v168 in p162.furniture_models do
        for _, v169 in v168:GetDescendants() do
            if v169:IsA("BasePart") then
                v_u_164[v169] = {
                    ["size"] = v169.Size,
                    ["offset"] = p162.scale_center:ToObjectSpace(v169.CFrame)
                }
            elseif v169:IsA("Attachment") then
                v_u_165[v169] = {
                    ["cframe"] = v169.CFrame
                }
            elseif v169:IsA("SpecialMesh") and v169.MeshType == Enum.MeshType.FileMesh then
                v_u_166[v169] = {
                    ["scale"] = v169.Scale
                }
            elseif v169:IsA("Weld") or v169:IsA("Motor6D") then
                v_u_167[v169] = {
                    ["C0"] = v169.C0,
                    ["C1"] = v169.C1
                }
            end
        end
    end
    return function(p170, p171)
        local v172 = typeof(p170) == "CFrame"
        assert(v172, "The new center must be a CFrame.")
        local v173 = typeof(p171) == "number"
        assert(v173, "Scale argument must be a number.")
        local v174 = p171 > 0
        assert(v174, "Scale must be a positive number.")
        for v175, v176 in v_u_164 do
            v175.Size = v176.size * p171
            v175.CFrame = p170 * (CFrame.new(v176.offset.Position * p171) * v176.offset.Rotation)
        end
        for v177, v178 in v_u_165 do
            v177.CFrame = CFrame.new(v178.cframe.Position * p171) * v178.cframe.Rotation
        end
        for v179, v180 in v_u_166 do
            v179.Scale = v180.scale * p171
        end
        for v181, v182 in v_u_167 do
            v181.C0 = CFrame.new(v182.C0.Position * p171) * v182.C0.Rotation
            v181.C1 = CFrame.new(v182.C1.Position * p171) * v182.C1.Rotation
        end
    end
end
local v_u_184 = v5.strictInterface({
    ["house"] = v5.instanceIsA("Model"),
    ["furniture"] = v5.instanceIsA("Model"),
    ["cframe"] = v5.CFrame,
    ["is_offset"] = v5.boolean
})
function v_u_9.place(p185)
    local v186 = v_u_184
    assert(v186(p185))
    local v187 = p185.furniture:WaitForChild("PlacementBlock")
    local v188 = p185.house:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin")
    local v189 = p185.cframe
    if p185.is_offset then
        v189 = v188.CFrame * p185.cframe
    end
    p185.furniture.PrimaryPart = v187
    p185.furniture:PivotTo(v189)
end
local v_u_190 = v5.strictInterface({
    ["furniture"] = v5.instanceIsA("Model"),
    ["translate_into_ground"] = v5.boolean,
    ["is_first_placement"] = v5.boolean,
    ["normal"] = v5.Vector3,
    ["position"] = v5.Vector3,
    ["rotation"] = v5.CFrame,
    ["align_part"] = v5.optional(v5.instanceIsA("BasePart")),
    ["align_spawned_furniture_to_world_space"] = v5.optional(v5.boolean)
})
function v_u_9.get_placement_cframe(p191)
    local v192 = v_u_190
    assert(v192(p191))
    local v193 = p191.furniture:WaitForChild("PlacementBlock")
    local v194 = p191.furniture:GetAttribute("FirstPlacementRotation")
    if v194 then
        v194 = math.rad(v194)
    end
    local v195 = CFrame.new(0, p191.translate_into_ground and -v193.Size.Y / 2 or 0, 0)
    local v196 = (v_u_19(p191.rotation.YVector, p191.normal, p191.rotation.XVector) * p191.rotation).Rotation
    if p191.align_part then
        local v197 = p191.align_part.CFrame:VectorToObjectSpace(p191.normal)
        local v198 = v_u_35
        local v199 = p191.align_part
        local v200 = v197.X
        local v201 = math.round(v200)
        local v202 = v197.Y
        local v203 = math.round(v202)
        local v204 = v197.Z
        local v205 = math.round(v204)
        local v206 = v198(v199, (Vector3.new(v201, v203, v205)))
        if p191.align_spawned_furniture_to_world_space then
            local v207, v208, v209 = (v206 * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0)).Rotation:ToEulerAnglesYXZ()
            local v210 = math.deg(v208) / 90 + 0.5
            local v211 = math.floor(v210) * 90
            local v212 = math.rad(v211)
            if p191.is_first_placement then
                v212 = v194 or v212
            end
            v196 = CFrame.fromEulerAnglesYXZ(v207, v212, v209)
        else
            local v213 = (v206 * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0)).Rotation
            local v214, v215, v216 = v213:ToObjectSpace(v196):ToEulerAnglesYXZ()
            local v217 = math.deg(v215) / 90 + 0.5
            local v218 = math.floor(v217) * 90
            local v219 = math.rad(v218)
            if p191.is_first_placement then
                v219 = v194 or v219
            end
            v196 = (v213 * CFrame.fromEulerAnglesYXZ(v214, v219, v216)).Rotation
        end
    end
    return CFrame.new(p191.position) * v196 * v195
end
local v220 = v5.strictInterface
local v221 = {
    ["house"] = v5.instanceIsA("Model"),
    ["furniture"] = v5.instanceIsA("Model"),
    ["placement_surfaces"] = v5.optional(v5.array(v5.instanceIsA("BasePart"))),
    ["ignore_furniture_models"] = v5.optional(v5.array(v5.Instance)),
    ["interval"] = v5.number,
    ["rotation"] = v5.CFrame,
    ["try_align"] = v5.optional(v5.boolean),
    ["is_first_placement"] = v5.optional(v5.boolean),
    ["mouse_x"] = v5.optional(v5.number),
    ["mouse_y"] = v5.optional(v5.number),
    ["plane_lock"] = v5.optional(v5.strictInterface({
        ["origin"] = v5.Vector3,
        ["normal"] = v5.Vector3,
        ["allow_placement_below"] = v5.boolean
    }))
}
local v_u_222 = v220(v221)
function v_u_9.calculate_placement_from_mouse(p223)
    local v224 = v_u_222
    assert(v224(p223))
    local v225 = p223.house:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin")
    local v226 = p223.placement_surfaces or v_u_62(p223.house, p223.furniture)
    local v_u_227 = p223.ignore_furniture_models or {}
    local v228
    if p223.furniture:FindFirstChild("SnapSurfaces") then
        v228 = v_u_6.List.filter(v_u_70(p223.house, p223.furniture), function(p229)
            for _, v230 in v_u_227 do
                if p229:IsDescendantOf(v230) then
                    return false
                end
            end
            return true
        end)
    else
        v228 = nil
    end
    local v233 = v_u_6.List.filter(v226, function(p231)
        for _, v232 in v_u_227 do
            if p231:IsDescendantOf(v232) then
                return false
            end
        end
        return true
    end)
    local v234 = v_u_4.LocalPlayer:GetMouse()
    local v235 = p223.mouse_x or v234.X
    local v236 = p223.mouse_y or v234.Y
    local v237 = workspace.CurrentCamera:ScreenPointToRay(v235, v236)
    local v238 = Ray.new(v237.Origin, v237.Direction * 1000)
    local v239, v240, v241
    if v228 then
        v239, v240, v241 = v_u_3.FindPartOnRay(v238, nil, v228, v_u_13)
    else
        v239 = nil
        v241 = nil
        v240 = nil
    end
    if not v239 then
        v239, v240, v241 = v_u_3.FindPartOnRay(v238, nil, v233, v_u_13)
    end
    if p223.plane_lock then
        v239, v241, v240 = v_u_50({
            ["part"] = v239,
            ["normal"] = v241,
            ["furniture_origin"] = v225,
            ["plane_origin"] = p223.plane_lock.origin,
            ["plane_normal"] = p223.plane_lock.normal,
            ["allow_placement_below"] = p223.plane_lock.allow_placement_below,
            ["ray_start"] = v237.Origin,
            ["ray_finish"] = v240
        })
    end
    if v239 then
        local v242 = p223.furniture:FindFirstChild("PlacementBlock")
        local v243 = v242.CFrame
        local v244 = v242.Size.Y / 2
        local v245 = v243 * Vector3.new(0, v244, 0)
        local v246 = v_u_160
        local v247 = {
            ["house"] = p223.house,
            ["furniture"] = p223.furniture,
            ["target_placement_surface"] = v239,
            ["interval"] = p223.interval,
            ["rotation"] = p223.rotation,
            ["is_first_placement"] = p223.is_first_placement
        }
        local v248 = not p223.is_first_placement and p223.try_align
        if v248 then
            if p223.rotation.YVector:Dot(v241) < 0.984807753012208 then
                v248 = true
            else
                local v249 = v241:Dot(v245 - v240)
                v248 = math.abs(v249) > 0.1
            end
        end
        v247.try_align = v248
        v247.normal = v241
        v247.position = v240
        return v246(v247)
    end
end
local v250 = v5.strictInterface
local v251 = {
    ["house"] = v5.instanceIsA("Model"),
    ["furniture"] = v5.instanceIsA("Model"),
    ["placement_surfaces"] = v5.optional(v5.array(v5.instanceIsA("BasePart"))),
    ["ignore_furniture_models"] = v5.optional(v5.array(v5.Instance)),
    ["interval"] = v5.number,
    ["rotation"] = v5.CFrame,
    ["ray_position"] = v5.Vector3,
    ["is_first_placement"] = v5.optional(v5.boolean),
    ["plane_lock"] = v5.optional(v5.strictInterface({
        ["origin"] = v5.Vector3,
        ["normal"] = v5.Vector3,
        ["allow_placement_below"] = v5.boolean
    }))
}
local v_u_252 = v250(v251)
function v_u_9.calculate_placement_on_floor(p253)
    local v254 = v_u_252
    assert(v254(p253))
    local v255 = p253.house:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin")
    local v256 = p253.placement_surfaces or v_u_62(p253.house, p253.furniture)
    local v_u_257 = p253.ignore_furniture_models or {}
    local v260 = v_u_6.List.filter(v256, function(p258)
        for _, v259 in v_u_257 do
            if p258:IsDescendantOf(v259) then
                return false
            end
        end
        return true
    end)
    local v261 = Ray.new(p253.ray_position, Vector3.new(0, -20, 0))
    local v262, v263, v264, _ = v_u_3.FindPartOnRay(v261, nil, v260, v_u_13)
    if p253.plane_lock then
        v262, v264, v263 = v_u_50({
            ["part"] = v262,
            ["normal"] = v264,
            ["furniture_origin"] = v255,
            ["plane_origin"] = p253.plane_lock.origin,
            ["plane_normal"] = p253.plane_lock.normal,
            ["allow_placement_below"] = p253.plane_lock.allow_placement_below,
            ["ray_start"] = v261.Origin,
            ["ray_finish"] = v263
        })
    end
    if v262 then
        return v_u_160({
            ["house"] = p253.house,
            ["furniture"] = p253.furniture,
            ["target_placement_surface"] = v262,
            ["interval"] = p253.interval,
            ["rotation"] = p253.rotation,
            ["is_first_placement"] = p253.is_first_placement,
            ["try_align"] = p253.is_first_placement,
            ["normal"] = v264,
            ["position"] = v263
        })
    end
end
local v_u_265 = v5.strictInterface({
    ["primary_furniture_model"] = v5.instanceIsA("Model"),
    ["other_furniture_models"] = v5.array(v5.instanceIsA("Model"))
})
function v_u_9.get_scale_furniture_callback(p266)
    local v267 = v_u_265
    assert(v267(p266))
    local v_u_268 = p266.primary_furniture_model.PlacementBlock
    local v_u_269 = v_u_183({
        ["scale_center"] = v_u_268.CFrame * CFrame.new(0, v_u_268.Size.Y / 2, 0),
        ["furniture_models"] = v_u_6.List.concat({ p266.primary_furniture_model }, p266.other_furniture_models)
    })
    return function(p270)
        return v_u_269(v_u_268.CFrame * CFrame.new(0, v_u_268.Size.Y / 2, 0), p270)
    end
end
local v_u_271 = v5.strictInterface({
    ["primary_furniture_pivot"] = v5.CFrame,
    ["primary_furniture_model"] = v5.instanceIsA("Model"),
    ["other_furniture_models"] = v5.array(v5.instanceIsA("Model")),
    ["post_cframe_set_callback"] = v5.optional(v5.callback)
})
function v_u_9.get_cframe_furniture_from_custom_pivot_callback(p_u_272)
    local v273 = v_u_271
    assert(v273(p_u_272))
    local v274 = { p_u_272.primary_furniture_model }
    local v_u_275 = {}
    for _, v276 in v_u_6.List.concat(p_u_272.other_furniture_models, v274) do
        v_u_275[v276] = p_u_272.primary_furniture_pivot:ToObjectSpace(v276.PlacementBlock.CFrame)
    end
    return function(p277)
        local v278 = workspace.HouseInteriors.blueprint:GetChildren()[1]:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin").CFrame
        for v279, v280 in v_u_275 do
            local v281 = p277 * v280
            local v282 = v_u_2.compress(v281)
            local v283 = v_u_2.decompress(v282)
            v279.PrimaryPart = v279.PlacementBlock
            v279:PivotTo(v278 * v283)
            if p_u_272.post_cframe_set_callback then
                p_u_272.post_cframe_set_callback(v279, v283)
            end
        end
    end
end
local v_u_284 = v5.strictInterface({
    ["primary_furniture_model"] = v5.instanceIsA("Model"),
    ["other_furniture_models"] = v5.array(v5.instanceIsA("Model")),
    ["post_cframe_set_callback"] = v5.optional(v5.callback)
})
function v_u_9.get_cframe_furniture_callback(p285)
    local v286 = v_u_284
    assert(v286(p285))
    local v287 = p285.primary_furniture_model.PlacementBlock
    return v_u_9.get_cframe_furniture_from_custom_pivot_callback({
        ["primary_furniture_pivot"] = v287.CFrame,
        ["primary_furniture_model"] = p285.primary_furniture_model,
        ["other_furniture_models"] = p285.other_furniture_models,
        ["post_cframe_set_callback"] = p285.post_cframe_set_callback
    })
end
return v_u_9