--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.from.fromMap (ModuleScript)

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3)
    if p2 then
        local v4 = {}
        for v5, v6 in p1 do
            if p3 == nil then
                v4[v5] = p2(v6, v5)
            else
                v4[v5] = p2(p3, v6, v5)
            end
        end
        return v4
    else
        local v7 = {}
        for v8, v9 in p1 do
            v7[v8] = v9
        end
        return v7
    end
end