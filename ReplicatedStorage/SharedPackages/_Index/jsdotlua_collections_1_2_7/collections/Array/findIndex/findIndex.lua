--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.findIndex (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2)
    for v3 = 1, #p1 do
        if p2(p1[v3], v3, p1) then
            return v3
        end
    end
    return -1
end