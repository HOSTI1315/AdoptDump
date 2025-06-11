--// ReplicatedStorage.SharedModules.Nearest.NearestObj (ModuleScript)

return {
    ["new"] = function(p1, p2)
        local v3 = {
            ["instance"] = p1
        }
        for v4, v5 in pairs(p2 or {}) do
            v3[v4] = v5
        end
        return v3
    end
}