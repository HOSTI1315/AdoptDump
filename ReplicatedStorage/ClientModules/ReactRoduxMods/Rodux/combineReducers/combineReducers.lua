--// ReplicatedStorage.ClientModules.ReactRoduxMods.Rodux.combineReducers (ModuleScript)

return function(p_u_1)
    return function(p2, p3)
        local v4 = p2 == nil and {} or p2
        local v5 = {}
        for v6, v7 in pairs(p_u_1) do
            v5[v6] = v7(v4[v6], p3)
        end
        return v5
    end
end