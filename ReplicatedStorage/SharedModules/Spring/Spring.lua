--// ReplicatedStorage.SharedModules.Spring (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = math.exp
local v_u_3 = math.sin
local v_u_4 = math.cos
local v_u_5 = math.sqrt
function v_u_1.new(p6, p7, p8)
    local v9 = type(p6) == "number"
    assert(v9)
    local v10 = type(p7) == "number"
    assert(v10)
    local v11 = p6 * p7 >= 0
    assert(v11, "Spring does not converge")
    local v12 = {
        ["d"] = p6,
        ["f"] = p7,
        ["g"] = p8,
        ["p"] = p8,
        ["v"] = p8 * 0
    }
    local v13 = v_u_1
    return setmetatable(v12, v13)
end
function v_u_1.reset(p14, p15)
    p14.p = p15
    p14.v = p15 * 0
end
function v_u_1.set_goal(p16, p17)
    p16.g = p17
end
function v_u_1.set_frequency(p18, p19)
    p18.f = p19
end
function v_u_1.set_damping_ratio(p20, p21)
    p20.d = p21
end
function v_u_1.set_velocity(p22, p23)
    p22.v = p23
end
function v_u_1.set_position(p24, p25)
    p24.p = p25
end
function v_u_1.add_velocity(p26, p27)
    p26.v = p26.v + p27
end
function v_u_1.get_goal(p28)
    return p28.g
end
function v_u_1.get_position(p29)
    return p29.p
end
function v_u_1.get_velocity(p30)
    return p30.v
end
function v_u_1.update(p31, p32)
    local v33 = p31.d
    local v34 = p31.f * 2 * 3.141592653589793
    local v35 = p31.g
    local v36 = p31.p
    local v37 = p31.v
    local v38 = v36 - v35
    local v39 = v_u_2(-v33 * v34 * p32)
    local v40, v41
    if v33 == 1 then
        v40 = (v38 * (1 + v34 * p32) + v37 * p32) * v39 + v35
        v41 = (v37 * (1 - v34 * p32) - v38 * (v34 * v34 * p32)) * v39
    elseif v33 < 1 then
        local v42 = v_u_5(1 - v33 * v33)
        local v43 = v_u_4(v34 * v42 * p32)
        local v44 = v_u_3(v34 * v42 * p32)
        local v45
        if v42 > 0.0001 then
            v45 = v44 / v42
        else
            local v46 = p32 * v34
            v45 = v46 + (v46 * v46 * (v42 * v42) * (v42 * v42) / 20 - v42 * v42) * (v46 * v46 * v46) / 6
        end
        local v47
        if v34 * v42 > 0.0001 then
            v47 = v44 / (v34 * v42)
        else
            local v48 = v34 * v42
            v47 = p32 + (p32 * p32 * (v48 * v48) * (v48 * v48) / 20 - v48 * v48) * (p32 * p32 * p32) / 6
        end
        v40 = (v38 * (v43 + v33 * v45) + v37 * v47) * v39 + v35
        v41 = (v37 * (v43 - v45 * v33) - v38 * (v45 * v34)) * v39
    else
        local v49 = v_u_5(v33 * v33 - 1)
        local v50 = -v34 * (v33 - v49)
        local v51 = -v34 * (v33 + v49)
        local v52 = (v37 - v38 * v50) / (2 * v34 * v49)
        local v53 = (v38 - v52) * v_u_2(v50 * p32)
        local v54 = v52 * v_u_2(v51 * p32)
        v40 = v53 + v54 + v35
        v41 = v53 * v50 + v54 * v51
    end
    p31.p = v40
    p31.v = v41
    return v40
end
return v_u_1