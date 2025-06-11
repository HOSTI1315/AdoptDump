--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.CFrameSetter (ModuleScript)

return {
    ["optimization_run_only_for"] = "visible",
    ["optimization_prioritize"] = "near",
    ["step"] = function(p1, _)
        if p1.is_in_workspace then
            if p1.is_changing_interiors then
                return
            elseif p1.client_has_control then
                local v2 = p1.modifier_values_from_performances.cframe
                local v3 = p1.base.root
                if v2 then
                    v3.CFrame = v2
                    v3.Anchored = true
                elseif v3.Anchored == true and not p1.base.humanoid.Sit then
                    v3.Anchored = false
                end
            else
                if not p1.base.humanoid.Sit and p1.base.root.Anchored then
                    p1.base.root.Anchored = false
                end
                return
            end
        else
            return
        end
    end
}