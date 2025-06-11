--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.reverse (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1)
    local v2 = #p1
    local v3 = 1
    while v3 < v2 do
        local v4 = p1[v2]
        local v5 = p1[v3]
        p1[v3] = v4
        p1[v2] = v5
        v3 = v3 + 1
        v2 = v2 - 1
    end
    return p1
end