--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.EyesProviderPerformance (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("AdoptMeEnums/PetEntities/PerformanceExitType")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p2)
        return {
            ["eyes_id"] = p2.eyes_id,
            ["eye_color"] = p2.eye_color,
            ["priority"] = p2.priority,
            ["duration"] = p2.duration,
            ["effects"] = p2.effects,
            ["start_time"] = os.clock()
        }
    end,
    ["step"] = function(_, p3)
        if p3.duration and os.clock() - p3.start_time > p3.duration then
            return v_u_1.Complete
        end
    end,
    ["calculate_modifiers"] = function(_, p4)
        return {
            ["eyes_id"] = p4.eyes_id,
            ["eye_color"] = p4.eye_color,
            ["effects"] = p4.effects
        }, {
            ["eyes_id"] = p4.priority,
            ["eye_color"] = p4.priority,
            ["effects"] = p4.priority
        }
    end
}