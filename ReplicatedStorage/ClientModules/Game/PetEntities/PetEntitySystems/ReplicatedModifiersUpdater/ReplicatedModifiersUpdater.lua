--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.ReplicatedModifiersUpdater (ModuleScript)

return {
    ["step"] = function(p1)
        if p1.client_has_control or p1.is_npc_pet then
            p1.buffered_replicated_modifiers_update = nil
        elseif p1.buffered_replicated_modifiers_update then
            p1.modifier_values_from_performances = p1.buffered_replicated_modifiers_update
            p1.buffered_replicated_modifiers_update = nil
        end
    end
}