--// ReplicatedStorage.ClientModules.Game.CameraParticlesClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("CameraParticlesDB")
local v3 = v1("Signal")
local v4 = v1("package:t")
local v_u_5 = v1("package:Sift")
local v6 = {}
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = nil
local v_u_10 = v3.new()
local function v_u_16()
    local v11 = v_u_7[1]
    for _, v12 in ipairs(v_u_7) do
        if v12.priority > v11.priority then
            v11 = v12
        end
    end
    local v13 = v11 and v11.particle_kind or nil
    if v13 and v_u_9 then
        local v14 = v_u_9
        v_u_2[v14].deactivate(v_u_8[v14])
        v_u_2[v13].activate(v_u_8[v13])
    elseif v13 == nil and v_u_9 then
        local v15 = v_u_9
        v_u_2[v15].deactivate(v_u_8[v15])
    elseif v13 and v_u_9 == nil then
        v_u_2[v13].activate(v_u_8[v13])
    end
    if v_u_9 ~= v13 then
        v_u_10:fire(v13)
    end
    v_u_9 = v13
end
local function v_u_20(p17, p18)
    for _, v19 in ipairs(v_u_7) do
        if v19.priority == p18 then
            warn(("CameraParticles with key %s has the same priority as key %s."):format(p17, v19.key))
        end
    end
end
function v6.init()
    for v21, v22 in pairs(v_u_2) do
        v_u_8[v21] = v22.create_initial_state()
    end
end
local v_u_23 = v4.tuple(v4.string, v4.intersection(v4.integer, v4.numberPositive), v4.keyOf(v_u_2))
function v6.set_camera_particles(p_u_24, p25, p26)
    local v27 = v_u_23
    assert(v27(p_u_24, p25, p26))
    local v29 = v_u_5.List.findWhere(v_u_7, function(p28, _)
        return p28.key == p_u_24
    end)
    if v29 then
        table.remove(v_u_7, v29)
    end
    v_u_20(p_u_24, p25)
    local v30 = v_u_7
    table.insert(v30, {
        ["key"] = p_u_24,
        ["priority"] = p25,
        ["particle_kind"] = p26
    })
    v_u_16()
end
function v6.remove_camera_particles(p_u_31)
    local v33 = v_u_5.List.findWhere(v_u_7, function(p32, _)
        return p32.key == p_u_31
    end)
    if v33 then
        table.remove(v_u_7, v33)
    end
    v_u_16()
end
function v6.get_active_camera_particle_kind()
    local v34 = v_u_7[1]
    for _, v35 in ipairs(v_u_7) do
        if v35.priority > v34.priority then
            v34 = v35
        end
    end
    return v34 and v34.particle_kind or nil
end
function v6.get_changed_signal()
    return v_u_10
end
return v6