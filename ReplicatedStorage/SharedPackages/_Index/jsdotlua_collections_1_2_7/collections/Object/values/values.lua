--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Object.values (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1)
    if p1 == nil then
        error("cannot extract values from a nil value")
    end
    local v2 = typeof(p1)
    local v3 = nil
    if v2 ~= "table" then
        if v2 == "string" then
            local v4 = p1:len()
            v3 = table.create(v4)
            for v5 = 1, v4 do
                v3[v5] = p1:sub(v5, v5)
            end
        end
        return v3
    end
    local v6 = {}
    for _, v7 in pairs(p1) do
        table.insert(v6, v7)
    end
    return v6
end