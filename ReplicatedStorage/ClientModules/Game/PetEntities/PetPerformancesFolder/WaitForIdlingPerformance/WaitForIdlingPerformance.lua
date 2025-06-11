--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.WaitForIdlingPerformance (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("AdoptMeEnums/PetEntities/PerformanceExitType")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p2)
        return {
            ["duration"] = p2.duration,
            ["last_moving_at"] = os.clock()
        }
    end,
    ["step"] = function(p3, p4, _)
        if p3.move_state.is_moving then
            p4.last_moving_at = os.clock()
        elseif os.clock() - p4.last_moving_at > p4.duration then
            return v_u_1.Complete
        end
    end,
    ["calculate_modifiers"] = function(_, _)
        return {}, {}
    end
}