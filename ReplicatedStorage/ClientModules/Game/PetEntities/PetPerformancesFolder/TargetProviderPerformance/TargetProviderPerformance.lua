--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.TargetProviderPerformance (ModuleScript)

return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p1)
        return {
            ["movement_target"] = p1.movement_target,
            ["rotation_target"] = p1.rotation_target,
            ["head_target"] = p1.head_target,
            ["dont_allow_sit_states"] = p1.dont_allow_sit_states,
            ["dont_allow_mount_states"] = p1.dont_allow_mount_states,
            ["priority"] = p1.priority
        }
    end,
    ["step"] = function() end,
    ["calculate_modifiers"] = function(_, p2)
        return {
            ["rotation_target"] = p2.rotation_target,
            ["movement_target"] = p2.movement_target,
            ["head_target"] = p2.head_target,
            ["dont_allow_sit_states"] = p2.dont_allow_sit_states,
            ["dont_allow_mount_states"] = p2.dont_allow_mount_states
        }, {
            ["rotation_target"] = p2.priority,
            ["movement_target"] = p2.priority,
            ["head_target"] = p2.priority,
            ["dont_allow_sit_states"] = p2.priority,
            ["dont_allow_mount_states"] = p2.priority
        }
    end
}