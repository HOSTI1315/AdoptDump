--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.isArray (ModuleScript)

return function(p1)
    if typeof(p1) ~= "table" then
        return false
    end
    if next(p1) == nil then
        return true
    end
    if #p1 == 0 then
        return false
    end
    local v2 = 0
    local v3 = 0
    for v4 in pairs(p1) do
        if typeof(v4) ~= "number" then
            return false
        end
        if v4 % 1 ~= 0 or v4 < 1 then
            return false
        end
        v2 = v2 + 1
        v3 = v3 + v4
    end
    return v3 == v2 * (v2 + 1) / 2
end