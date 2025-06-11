--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.Spring (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3)
    assert(p2, "Missing argument #1: targetValue")
    local v4 = p3 or {}
    local v5 = {
        ["_targetValue"] = p2,
        ["_frequency"] = v4.frequency or 4,
        ["_dampingRatio"] = v4.dampingRatio or 1
    }
    local v6 = v_u_1
    return setmetatable(v5, v6)
end
function v_u_1.step(p7, p8, p9)
    local v10 = p7._dampingRatio
    local v11 = p7._frequency * 2 * 3.141592653589793
    local v12 = p7._targetValue
    local v13 = p8.value
    local v14 = p8.velocity or 0
    local v15 = v13 - v12
    local v16 = -v10 * v11 * p9
    local v17 = math.exp(v16)
    local v18, v19
    if v10 == 1 then
        v18 = (v15 * (1 + v11 * p9) + v14 * p9) * v17 + v12
        v19 = (v14 * (1 - v11 * p9) - v15 * (v11 * v11 * p9)) * v17
    elseif v10 < 1 then
        local v20 = 1 - v10 * v10
        local v21 = math.sqrt(v20)
        local v22 = v11 * v21 * p9
        local v23 = math.cos(v22)
        local v24 = v11 * v21 * p9
        local v25 = math.sin(v24)
        local v26
        if v21 > 0.0001 then
            v26 = v25 / v21
        else
            local v27 = p9 * v11
            v26 = v27 + (v27 * v27 * (v21 * v21) * (v21 * v21) / 20 - v21 * v21) * (v27 * v27 * v27) / 6
        end
        local v28
        if v11 * v21 > 0.0001 then
            v28 = v25 / (v11 * v21)
        else
            local v29 = v11 * v21
            v28 = p9 + (p9 * p9 * (v29 * v29) * (v29 * v29) / 20 - v29 * v29) * (p9 * p9 * p9) / 6
        end
        v18 = (v15 * (v23 + v10 * v26) + v14 * v28) * v17 + v12
        v19 = (v14 * (v23 - v26 * v10) - v15 * (v26 * v11)) * v17
    else
        local v30 = v10 * v10 - 1
        local v31 = math.sqrt(v30)
        local v32 = -v11 * (v10 - v31)
        local v33 = -v11 * (v10 + v31)
        local v34 = (v14 - v15 * v32) / (2 * v11 * v31)
        local v35 = v15 - v34
        local v36 = v32 * p9
        local v37 = v35 * math.exp(v36)
        local v38 = v33 * p9
        local v39 = v34 * math.exp(v38)
        v18 = v37 + v39 + v12
        v19 = v37 * v32 + v39 * v33
    end
    local v40
    if math.abs(v19) < 0.001 then
        local v41 = v18 - v12
        v40 = math.abs(v41) < 0.001
    else
        v40 = false
    end
    local v42 = {
        ["complete"] = v40
    }
    if v40 then
        v18 = v12 or v18
    end
    v42.value = v18
    v42.velocity = v19
    return v42
end
return v_u_1