--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.find (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2)
    for v3 = 1, #p1 do
        local v4 = p1[v3]
        if p2(v4, v3, p1) then
            return v4
        end
    end
    return nil
end