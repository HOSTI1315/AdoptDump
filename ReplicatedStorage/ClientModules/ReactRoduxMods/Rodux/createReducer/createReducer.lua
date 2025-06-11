--// ReplicatedStorage.ClientModules.ReactRoduxMods.Rodux.createReducer (ModuleScript)

return function(p_u_1, p_u_2)
    return function(p3, p4)
        if p3 == nil then
            return p_u_1
        else
            local v5 = p_u_2[p4.type]
            if v5 then
                return v5(p3, p4)
            else
                return p3
            end
        end
    end
end