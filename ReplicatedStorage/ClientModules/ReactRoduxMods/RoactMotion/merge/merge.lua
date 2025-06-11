--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactMotion.merge (ModuleScript)

return function(...)
    local v1 = {}
    for v2 = 1, select("#", ...) do
        for v3, v4 in pairs(select(v2, ...)) do
            v1[v3] = v4
        end
    end
    return v1
end