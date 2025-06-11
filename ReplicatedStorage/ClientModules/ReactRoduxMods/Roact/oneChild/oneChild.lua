--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.oneChild (ModuleScript)

return function(p1)
    if p1 then
        local v2, v3 = next(p1)
        if v3 then
            if next(p1, v2) then
                error("Expected at most child, had more than one child.", 2)
            end
            return v3
        end
    end
end