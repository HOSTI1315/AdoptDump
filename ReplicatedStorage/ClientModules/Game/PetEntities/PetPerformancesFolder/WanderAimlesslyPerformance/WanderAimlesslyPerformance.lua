--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.WanderAimlesslyPerformance (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("AdoptMeEnums/PetEntities/ObstacleType")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(p2)
        return {
            ["movement_speed"] = p2.movement_speed or 12,
            ["next_direction_update_time"] = tick(),
            ["direction_last_changed_time"] = tick(),
            ["direction_angle"] = 0,
            ["rotation_speed_radians"] = 0
        }
    end,
    ["step"] = function(p3, p4)
        local v5 = p3.obstacle_detection.obstacle_type
        local v6 = tick() > p4.next_direction_update_time
        if v5 == v_u_1.NotJumpable or v6 then
            local v7 = math.random(-180, 180)
            p4.direction_angle = math.rad(v7)
            p4.rotation_speed_radians = math.random(-200, 200) / 100
            p4.next_direction_update_time = tick() + math.random(5, 10)
            p4.direction_last_changed_time = tick()
        end
    end,
    ["calculate_modifiers"] = function(_, p8)
        local v9 = tick() - p8.direction_last_changed_time
        local v10 = p8.rotation_speed_radians * v9
        local v11 = p8.direction_angle + v10
        local v12 = math.cos(v11)
        local v13 = math.sin(v11)
        return {
            ["movement_vector"] = Vector3.new(v12, 0, v13).Unit * p8.movement_speed,
            ["shouldnt_pathfind"] = true
        }, {}
    end
}