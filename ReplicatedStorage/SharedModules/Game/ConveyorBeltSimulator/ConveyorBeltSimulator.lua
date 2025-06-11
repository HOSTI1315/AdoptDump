--// ReplicatedStorage.SharedModules.Game.ConveyorBeltSimulator (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("Class")
local v_u_2 = game:GetService("HttpService")
local v3 = v1("Conveyor")
function v3.__init(p4, p5, p6)
    p4.length = p5
    p4.speed = p6
    local v7 = p4.length
    local v8 = math.floor(v7) == p4.length
    assert(v8, "Length must be an integer.")
    p4.objects = {}
    p4.booted_object = nil
end
function v3.is_full(p9)
    return #p9.objects >= p9.length - 1
end
function v3.boot_object(p_u_10)
    local v11 = p_u_10.objects[1]
    p_u_10:remove_object(v11)
    p_u_10.booted_object = v11
    task.defer(function()
        p_u_10.booted_object = nil
    end)
end
function v3.can_add_object(p12)
    return #p12.objects == 0 and true or p12.objects[#p12.objects].position >= 1
end
function v3.add_object(p_u_13, p14)
    if not p_u_13:can_add_object() then
        return false
    end
    local v15 = table.clone(p14)
    v15.position = 0
    v15.position_scalar = 0
    v15.guid = v_u_2:GenerateGUID()
    local v16 = p_u_13.objects
    table.insert(v16, v15)
    p_u_13.added_object = v15
    task.defer(function()
        p_u_13.added_object = nil
    end)
    return true
end
function v3.remove_object(p17, p18)
    table.remove(p17.objects, table.find(p17.objects, p18))
end
function v3.get_object_at_position(p19, p20)
    for _, v21 in ipairs(p19.objects) do
        local v22 = v21.position + 0.5
        if p20 <= v22 and v22 < p20 + 1 then
            return v21
        end
    end
    return nil
end
function v3.get_object_with_guid(p23, p24)
    for _, v25 in ipairs(p23.objects) do
        if v25.guid == p24 then
            return v25
        end
    end
end
function v3.get_state(p26)
    local v27 = {
        ["length"] = p26.length,
        ["speed"] = p26.speed,
        ["objects"] = {},
        ["booted_object"] = p26.booted_object,
        ["added_object"] = p26.added_object
    }
    for _, v28 in ipairs(p26.objects) do
        local v29 = v27.objects
        local v30 = table.clone
        table.insert(v29, v30(v28))
    end
    return v27
end
function v3.set_state(p31, p32)
    p31.length = p32.length
    p31.speed = p32.speed
    p31.objects = {}
    for _, v33 in ipairs(p32.objects) do
        local v34 = p31.objects
        local v35 = table.clone
        table.insert(v34, v35(v33))
    end
    p31.booted_object = p32.booted_object
    p31.added_object = p32.added_object
end
function v3.update(p36, p37)
    for v38, v39 in ipairs(p36.objects) do
        local v40 = p36.length - 1
        local v41 = p36.objects[v38 - 1]
        if v41 then
            v40 = v41.position - 1
        end
        local v42 = p36.speed * p37
        local v43 = v39.position + v42
        v39.position = math.min(v43, v40)
        v39.position_scalar = v39.position / p36.length
    end
end
return v3