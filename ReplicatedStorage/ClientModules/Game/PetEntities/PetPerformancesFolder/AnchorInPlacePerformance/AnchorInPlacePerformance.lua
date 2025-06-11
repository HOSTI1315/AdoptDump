--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.AnchorInPlacePerformance (ModuleScript)

return {
    ["name"] = script.Name,
    ["init_performance"] = function(p1, p2)
        return {
            ["root_cf"] = (p2 or {}).custom_cframe or p1.base.root.CFrame
        }
    end,
    ["calculate_modifiers"] = function(_, p3)
        return {
            ["cframe"] = p3.root_cf,
            ["shouldnt_pathfind"] = true
        }, {}
    end
}