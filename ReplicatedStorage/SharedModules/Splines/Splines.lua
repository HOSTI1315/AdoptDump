--// ReplicatedStorage.SharedModules.Splines (ModuleScript)

return {
    ["getPoints"] = function(p1, p2)
        local v3 = {}
        local v4 = p2 or 0.01
        for v5 = 1, #p1 - 1 do
            local v6 = p1[v5]
            local v7
            if p1[v5 - 1] then
                v7 = p1[v5 - 1] or v6
            else
                v7 = v6
            end
            local v8
            if p1[v5 + 1] then
                v8 = p1[v5 + 1] or v6
            else
                v8 = v6
            end
            local v9
            if p1[v5 + 2] then
                v9 = p1[v5 + 2] or v8
            else
                v9 = v8
            end
            local v10 = 0.5 * (v8 - v7)
            local v11 = v7 - 2.5 * v6 + 2 * v8 - 0.5 * v9
            local v12 = 1.5 * (v6 - v8) + 0.5 * (v9 - v7)
            for v13 = 0, 1, v4 do
                local v14 = v6 + v13 * (v10 + v13 * (v11 + v13 * v12))
                table.insert(v3, v14)
            end
        end
        return v3
    end
}