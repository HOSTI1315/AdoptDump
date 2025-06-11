--// ReplicatedStorage.SharedModules.Game.MinigameHelper (ModuleScript)

return {
    ["generate_spawn_point_offsets"] = function(p1)
        local v2 = p1.player_count / p1.max_players_per_column
        local v3 = math.ceil(v2)
        local v4 = p1.player_count / v3
        local v5 = math.ceil(v4)
        local v6 = (v3 - 1) * (p1.spawn_spacing / 2)
        local v7 = {}
        for v8 = 1, v3 do
            local v9 = v6 - (v8 - 1) * p1.spawn_spacing
            local v10 = p1.player_count - (v8 - 1) * v5
            local v11 = math.min(v10, v5)
            local v12 = (v11 - 1) * (p1.spawn_spacing / 2)
            for v13 = 1, v11 do
                local v14 = CFrame.new(-v12 + (v13 - 1) * p1.spawn_spacing, 0, v9)
                table.insert(v7, v14)
            end
        end
        return v7
    end
}