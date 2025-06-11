--// ReplicatedStorage.ClientModules.ReactRoduxMods.Rodux.thunkMiddleware (ModuleScript)

return function(p_u_1, p_u_2)
    return function(p3)
        if typeof(p3) == "function" then
            return p3(p_u_2)
        else
            return p_u_1(p3)
        end
    end
end