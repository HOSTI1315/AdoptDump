--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.PenguinStumblePerformance (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ModifierPriority")
return {
    ["name"] = script.Name,
    ["validate"] = function(_, _)
        return true
    end,
    ["init_performance"] = function(_, p2)
        return {
            ["start_time"] = os.clock(),
            ["direction"] = p2.direction
        }
    end,
    ["step"] = function(_, _) end,
    ["calculate_modifiers"] = function(_, p3)
        return {
            ["stumble_time"] = os.clock() - p3.start_time,
            ["stumble_direction"] = p3.direction,
            ["shouldnt_pathfind"] = true
        }, {
            ["stumble_time"] = v_u_1.Highest,
            ["stumble_direction"] = v_u_1.Highest,
            ["shouldnt_pathfind"] = v_u_1.Highest
        }
    end
}