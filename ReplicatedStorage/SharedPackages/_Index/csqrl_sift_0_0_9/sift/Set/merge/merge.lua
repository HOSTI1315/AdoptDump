--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Set.merge (ModuleScript)

return function(...)
    local v1 = {}
    for v2 = 1, select("#", ...) do
        local v3 = select(v2, ...)
        if type(v3) == "table" then
            for v4, _ in pairs(v3) do
                v1[v4] = true
            end
        end
    end
    return v1
end