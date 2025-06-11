--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.BeeSwarm (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("PetPerformanceName")
local v_u_3 = v1("PetEntityHelper")
local v4 = v1("Class")
local v5 = v1("package:t")
v1("Debug").create_log()
local v_u_6 = Random.new()
local v_u_7 = v5.array(v5.interface({
    ["center_target"] = v5.table,
    ["radius"] = v5.number,
    ["radians_per_second"] = v5.number,
    ["max_elevation_offset"] = v5.number,
    ["center_offset"] = v5.optional(v5.Vector3),
    ["weight"] = v5.optional(v5.numberPositive),
    ["max_radial_offset"] = v5.optional(v5.numberPositive)
}))
local v_u_8 = v5.interface({
    ["fly_speed"] = v5.optional(v5.number),
    ["only_randomize_initial_rotations"] = v5.optional(v5.boolean)
})
local v9 = v4("BeeSwarm")
function v9.__init(p10, p11, p12)
    local v13 = p12 or {}
    v_u_8(v13)
    p10.pet_entities = p11
    p10.base_rotation = nil
    p10.per_bee_elevation_offsets = {}
    p10.per_bee_radial_offset = {}
    p10.center_target = nil
    p10.center_offset = Vector3.new()
    p10.radius = 0
    p10.radians_per_second = 0
    p10.rotation_start_time = 0
    p10.fly_speed = v13.fly_speed or 50
    local v14
    if v13.only_randomize_initial_rotations == nil then
        v14 = false
    else
        v14 = v13.only_randomize_initial_rotations
    end
    p10.only_randomize_initial_rotations = v14
end
function v9.stage_swarm_performances(p15)
    for v16, v17 in ipairs(p15.pet_entities) do
        local v18 = 6.283185307179586 / #p15.pet_entities * v16
        local v19 = v_u_3.stage_performance
        local v20 = {
            ["name"] = v_u_2.Swarm,
            ["options"] = {
                ["this_bee_rotation_offset"] = v18,
                ["bee_swarm"] = p15
            }
        }
        v19(v17, v20)
    end
end
function v9.set_swarm_destination(p21, p22)
    if p22.center_target ~= p21.center_target then
        if p21.base_rotation == nil or not p21.only_randomize_initial_rotations then
            local v23 = v_u_6:NextInteger(0, 360)
            p21.base_rotation = math.rad(v23)
        else
            local v24 = tick() - p21.rotation_start_time
            p21.base_rotation = (p21.base_rotation + p21.radians_per_second * v24) % 6.283185307179586
        end
        p21.rotation_start_time = tick()
        p21.per_bee_elevation_offsets = {}
        for _, v25 in ipairs(p21.pet_entities) do
            p21.per_bee_elevation_offsets[v25] = v_u_6:NextNumber(-p22.max_elevation_offset, p22.max_elevation_offset)
        end
        p21.pet_bee_radial_offset = {}
        for _, v26 in ipairs(p21.pet_entities) do
            local v27 = p22.max_radial_offset or 0
            p21.per_bee_radial_offset[v26] = v_u_6:NextNumber(-v27, v27)
        end
    end
    p21.center_target = p22.center_target
    p21.center_offset = p22.center_offset or Vector3.new()
    p21.radius = p22.radius
    p21.radians_per_second = p22.radians_per_second
end
function v9.swarm_on_locations_randomly(p_u_28, p_u_29)
    local v30 = v_u_7
    assert(v30(p_u_29))
    p_u_28.latest_destination_list = p_u_29
    if #p_u_29 > 1 then
        local v_u_31 = 0
        local v_u_32 = {}
        for _, v33 in ipairs(p_u_29) do
            v_u_31 = v_u_31 + (v33.weight or 1)
            table.insert(v_u_32, {
                ["cutoff"] = v_u_31,
                ["destination"] = v33
            })
        end
        coroutine.wrap(function()
            while true do
                if p_u_28.destroyed or p_u_28.latest_destination_list ~= p_u_29 then
                    return
                end
                local v34 = v_u_6:NextNumber(0, v_u_31)
                for _, v35 in ipairs(v_u_32) do
                    if v34 < v35.cutoff then
                        p_u_28:set_swarm_destination(v35.destination)
                        break
                    end
                end
                wait(v_u_6:NextNumber(5, 8))
            end
        end)()
    else
        p_u_28:set_swarm_destination(p_u_29[1])
    end
end
function v9.get_current_destination_list(p36)
    return p36.latest_destination_list
end
function v9.destroy(p37)
    if not p37.destroyed then
        p37.destroyed = true
    end
end
return v9