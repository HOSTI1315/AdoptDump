--// ReplicatedStorage.new.modules.AABBHelper (ModuleScript)

local v_u_23 = {
    ["get_corners"] = function(p1, p2)
        local v3 = {}
        for v4 = 0, 7 do
            local v5 = v4 + 1
            local v6 = v4 / 4
            local v7 = math.floor(v6) % 2 * 2 - 1
            local v8 = v4 / 2
            local v9 = math.floor(v8) % 2 * 2 - 1
            local v10 = 2 * (v4 % 2) - 1
            v3[v5] = p1 * (p2 * Vector3.new(v7, v9, v10))
        end
        return v3
    end,
    ["get_max_min"] = function(p11, p12)
        local v13 = {}
        for _, v14 in p12 do
            for _, v15 in v_u_23.get_corners(v14.CFrame, v14.Size / 2) do
                table.insert(v13, p11:PointToObjectSpace(v15))
            end
        end
        local v16 = v13[1]
        local v17 = v13[1]
        for v18 = 2, #v13 do
            v16 = v16:Max(v13[v18])
            v17 = v17:Min(v13[v18])
        end
        return v16, v17
    end,
    ["get_bounding_box"] = function(p19, p20)
        local v21, v22 = v_u_23.get_max_min(p19, p20)
        return p19 * CFrame.new((v21 + v22) / 2), v21 - v22
    end
}
return v_u_23