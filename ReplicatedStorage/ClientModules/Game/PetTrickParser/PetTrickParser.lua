--// ReplicatedStorage.ClientModules.Game.PetTrickParser (ModuleScript)

return {
    ["get_learnable_tricks"] = function(p1, p2, p3, p4)
        local v5 = p2 or 0
        local v6 = {}
        for v7, v8 in p1 do
            if (p4 or v7 <= p3) and v5 < v7 then
                local v9 = v8[1]
                table.insert(v6, v9)
            end
        end
        return v6
    end
}