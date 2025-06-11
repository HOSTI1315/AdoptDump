--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactMotion.stepSpring (ModuleScript)

return function(p1, p2, p3, p4, p5, p6, p7)
    local v8 = p2 - p4
    local v9 = p3 + (-p5 * v8 + -p6 * p3) * p1
    local v10 = p2 + p3 * p1
    if math.abs(v9) < p7 then
        local v11 = p4 - v10
        if math.abs(v11) < p7 then
            return p4, 0
        end
    end
    return v10, v9
end