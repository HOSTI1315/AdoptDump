--// ReplicatedStorage.ClientModules.Game.PetEntities.StateConflictsHelper (ModuleScript)

return {
    ["can_reaction_coexist_with_state"] = function(p1, p2)
        if not p2 then
            return true
        end
        if p1.exclusive_state == p2 then
            return true
        end
        if p1.allowed_exclusive_states then
            for _, v3 in ipairs(p1.allowed_exclusive_states) do
                if v3 == p2 then
                    return true
                end
            end
        end
        return false
    end
}