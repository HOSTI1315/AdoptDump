--// ReplicatedStorage.ClientModules.Game.CostDiscountHelper (ModuleScript)

return {
    ["calculate_discount_percent_text"] = function(p1, p2)
        local v3 = 1 - p2 / p1
        local v4 = string.format
        local v5 = v3 * 100
        return v4("%d", (math.round(v5)))
    end
}