--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.indexOf (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3)
    local v4 = p3 or 1
    local v5 = #p1
    if v4 < 1 then
        local v6 = v5 - math.abs(v4)
        v4 = math.max(v6, 1)
    end
    for v7 = v4, v5 do
        if p1[v7] == p2 then
            return v7
        end
    end
    return -1
end