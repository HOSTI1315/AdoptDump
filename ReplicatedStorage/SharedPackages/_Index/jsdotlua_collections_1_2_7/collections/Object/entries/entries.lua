--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Object.entries (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1)
    local v2 = p1 ~= nil
    assert(v2, "cannot get entries from a nil value")
    local v3 = typeof(p1)
    local v4 = {}
    if v3 == "table" then
        for v5, v6 in pairs(p1) do
            table.insert(v4, { v5, v6 })
        end
        return v4
    else
        if v3 == "string" then
            for v7 = 1, string.len(p1) do
                v4[v7] = { tostring(v7), (string.sub(p1, v7, v7)) }
            end
        end
        return v4
    end
end