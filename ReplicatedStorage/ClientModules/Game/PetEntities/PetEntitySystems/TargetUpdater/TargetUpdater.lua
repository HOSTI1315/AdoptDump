--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.TargetUpdater (ModuleScript)

local _ = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
return {
    ["optimization_run_only_for"] = "owned",
    ["step"] = function(p1, _)
        if p1.client_has_control then
            p1.goal_state.target = p1.modifier_values_from_performances.movement_target
        end
    end
}