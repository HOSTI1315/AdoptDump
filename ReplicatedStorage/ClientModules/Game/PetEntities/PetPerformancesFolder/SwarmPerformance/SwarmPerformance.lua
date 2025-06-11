--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.SwarmPerformance (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Spring")
local v_u_2 = {
    ["name"] = script.Name
}
local function v_u_13(p3, p4)
    local v5 = p4.bee_swarm
    local v6 = p4.bee_swarm.per_bee_elevation_offsets[p3]
    local v7 = Vector3.new(0, v6, 0)
    local v8 = v5.center_target:get_position(p3) + v5.center_offset + v7
    local v9 = tick() - v5.rotation_start_time
    local v10 = p4.this_bee_rotation_offset + v5.base_rotation + v9 * v5.radians_per_second
    local v11 = math.cos(v10)
    local v12 = math.sin(v10)
    return v8 + Vector3.new(v11, 0, v12) * (v5.radius + p4.bee_swarm.per_bee_radial_offset[p3])
end
function v_u_2.validate(p14, _)
    return not p14.active_performances[v_u_2.name]
end
function v_u_2.init_performance(p15, p16)
    return {
        ["bee_swarm"] = p16.bee_swarm,
        ["this_bee_rotation_offset"] = p16.this_bee_rotation_offset,
        ["rotation_spring"] = v_u_1.new(2, 4, p15.base.root.CFrame.LookVector)
    }
end
function v_u_2.step(p17, p18, p19)
    local v20 = (v_u_13(p17, p18) - p17.base.root.Position).Unit
    p18.rotation_spring:set_goal(v20)
    p18.rotation_spring:update(p19)
end
local function v_u_30(p21, p22, p23)
    local v24 = v_u_13(p21, p22) - p21.base.root.Position
    local v25 = v24.Magnitude
    local v26 = p23 * p22.bee_swarm.fly_speed
    local v27 = math.clamp(v25, 0, v26)
    local v28 = v24.Unit * v27
    local v29 = CFrame.new(Vector3.new(), p22.rotation_spring:get_position())
    return CFrame.new(p21.base.root.Position + v28) * v29
end
function v_u_2.calculate_modifiers(p31, p32, p33)
    local v34 = {
        ["cframe"] = v_u_30(p31, p32, p33),
        ["shouldnt_avoid_obstacles_by"] = {
            ["jumping"] = true,
            ["pathfinding"] = true,
            ["teleporting"] = true
        },
        ["shouldnt_pathfind"] = true
    }
    return v34, {}
end
return v_u_2