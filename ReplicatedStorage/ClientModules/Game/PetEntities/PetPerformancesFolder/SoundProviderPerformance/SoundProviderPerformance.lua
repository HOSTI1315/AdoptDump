--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.SoundProviderPerformance (ModuleScript)

local _ = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p1)
        return {
            ["looping_sounds"] = p1.looping_sounds,
            ["priority"] = p1.priority
        }
    end,
    ["calculate_modifiers"] = function(_, p2)
        return {
            ["looping_sounds"] = p2.looping_sounds
        }, {
            ["looping_sounds"] = p2.priority
        }
    end
}