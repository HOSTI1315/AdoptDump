--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.splice (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3, ...)
    if #p1 < p2 then
        for v4 = 1, select("#", ...) do
            local v5 = select(v4, ...)
            table.insert(p1, v5)
        end
        return {}
    end
    local v6 = #p1
    if p2 < 1 then
        local v7 = v6 - math.abs(p2)
        p2 = math.max(v7, 1)
    end
    local v8 = {}
    local v9 = p3 or v6
    if v9 > 0 then
        local v10 = v9 - 1
        local v11 = p2 + math.max(0, v10)
        for _ = p2, math.min(v6, v11) do
            local v12 = table.remove(p1, p2)
            table.insert(v8, v12)
        end
    end
    for v13 = select("#", ...), 1, -1 do
        local v14 = select(v13, ...)
        table.insert(p1, p2, v14)
    end
    return v8
end