--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Object.is (ModuleScript)

return function(p1, p2)
    if p1 == p2 then
        return p1 ~= 0 and true or 1 / p1 == 1 / p2
    end
    local v3
    if p1 == p1 then
        v3 = false
    else
        v3 = p2 ~= p2
    end
    return v3
end