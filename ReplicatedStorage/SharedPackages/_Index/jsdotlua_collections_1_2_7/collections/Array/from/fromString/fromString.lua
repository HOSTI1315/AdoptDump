--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.from.fromString (ModuleScript)

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3)
    local v4 = #p1
    local v5 = table.create(v4)
    if p2 then
        for v6 = 1, v4 do
            if p3 == nil then
                v5[v6] = p2(string.sub(p1, v6, v6), v6)
            else
                v5[v6] = p2(p3, string.sub(p1, v6, v6), v6)
            end
        end
        return v5
    else
        for v7 = 1, v4 do
            v5[v7] = string.sub(p1, v7, v7)
        end
        return v5
    end
end