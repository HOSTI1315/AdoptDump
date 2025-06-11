--// ReplicatedStorage.SharedModules.StringUtil (ModuleScript)

return {
    ["add_commas_to_number"] = function(p1)
        local v2 = tostring(p1)
        return #v2 % 3 == 0 and v2:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2) or v2:reverse():gsub("(%d%d%d)", "%1,"):reverse()
    end,
    ["distance_between"] = function(p3, p4)
        local v5 = {}
        local v6 = string.len(p3)
        local v7 = string.len(p4)
        if v6 == 0 then
            return v7
        end
        if v7 == 0 then
            return v6
        end
        if p3 == p4 then
            return 0
        end
        for v8 = 0, v6 do
            v5[v8] = {}
            v5[v8][0] = v8
        end
        for v9 = 0, v7 do
            v5[0][v9] = v9
        end
        for v10 = 1, v6 do
            for v11 = 1, v7 do
                local v12 = p3:byte(v10) == p4:byte(v11) and 0 or 1
                local v13 = v5[v10]
                local v14 = v5[v10 - 1][v11] + 1
                local v15 = v5[v10][v11 - 1] + 1
                local v16 = v5[v10 - 1][v11 - 1] + v12
                v13[v11] = math.min(v14, v15, v16)
            end
        end
        return v5[v6][v7]
    end
}