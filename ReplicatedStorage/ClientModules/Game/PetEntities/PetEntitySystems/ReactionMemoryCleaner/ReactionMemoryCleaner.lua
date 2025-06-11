--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.ReactionMemoryCleaner (ModuleScript)

return {
    ["step"] = function(p1)
        local v2 = p1.short_term_reaction_memory
        for v3, v4 in v2 do
            if v4.should_cleanup() then
                v2[v3] = nil
            end
        end
    end
}