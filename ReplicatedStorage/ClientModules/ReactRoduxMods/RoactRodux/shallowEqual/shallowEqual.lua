--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactRodux.shallowEqual (ModuleScript)

return function(p1, p2)
    if p1 == nil then
        return p2 == nil
    end
    if p2 == nil then
        return p1 == nil
    end
    for v3, v4 in pairs(p1) do
        if v4 ~= p2[v3] then
            return false
        end
    end
    for v5, v6 in pairs(p2) do
        if v6 ~= p1[v5] then
            return false
        end
    end
    return true
end