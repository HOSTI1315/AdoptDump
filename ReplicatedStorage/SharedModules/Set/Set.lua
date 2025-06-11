--// ReplicatedStorage.SharedModules.Set (ModuleScript)

local v_u_1 = {}
v_u_1.mt = {
    ["__index"] = v_u_1
}
function v_u_1.new(p2)
    local v3 = {}
    local v4 = getmetatable(p2) == v_u_1.mt and true or nil
    if type(p2) == "table" then
        if v4 or #p2 <= 0 then
            for v5 in pairs(p2) do
                v3[v5] = true
            end
        else
            for _, v6 in ipairs(p2) do
                v3[v6] = true
            end
        end
    else
        v3 = p2 ~= nil and {
            [p2] = true
        } or v3
    end
    local v7 = v_u_1.mt
    return setmetatable(v3, v7)
end
function v_u_1.add(p8, p9)
    if p9 ~= nil then
        p8[p9] = true
    end
    return p8
end
function v_u_1.remove(p10, p11)
    if p11 ~= nil then
        p10[p11] = nil
    end
    return p10
end
function v_u_1.anelement()
    -- failed to decompile
end
function v_u_1.has(p12, p13)
    return p12[p13] ~= nil
end
function v_u_1.mt.__add(p14, p15)
    local v16 = v_u_1.new()
    local v17 = v_u_1.new(p14)
    local v18 = v_u_1.new(p15)
    for v19 in pairs(v17) do
        v16[v19] = true
    end
    for v20 in pairs(v18) do
        v16[v20] = true
    end
    return v16
end
function v_u_1.mt.__sub(p21, p22)
    local v23 = v_u_1.new()
    local v24 = v_u_1.new(p21)
    local v25 = v_u_1.new(p22)
    for v26 in pairs(v24) do
        v23[v26] = true
    end
    for v27 in pairs(v25) do
        v23[v27] = nil
    end
    return v23
end
function v_u_1.mt.__mul(p28, p29)
    local v30 = v_u_1.new()
    local v31 = v_u_1.new(p28)
    local v32 = v_u_1.new(p29)
    for v33 in pairs(v31) do
        v30[v33] = v32[v33]
    end
    return v30
end
function v_u_1.mt.__tostring(p34)
    local v35 = "{"
    local v36 = ""
    for v37 in pairs(p34) do
        v35 = v35 .. v36 .. tostring(v37)
        v36 = ", "
    end
    return v35 .. "}"
end
function v_u_1.len(p38)
    local v39 = 0
    for _ in pairs(p38) do
        v39 = v39 + 1
    end
    return v39
end
function v_u_1.tolist(p40)
    local v41 = {}
    for v42 in pairs(p40) do
        table.insert(v41, v42)
    end
    return v41
end
return v_u_1