--// ReplicatedStorage.SharedModules.Table (ModuleScript)

local v10 = {
    ["Append"] = function(p1, p2)
        for _, v3 in pairs(p2) do
            p1[#p1 + 1] = v3
        end
        return p1
    end,
    ["Count"] = function(p4)
        local v5 = 0
        for _, _ in pairs(p4) do
            v5 = v5 + 1
        end
        return v5
    end,
    ["Copy"] = function(p6)
        local v7 = {}
        for v8, v9 in pairs(p6) do
            v7[v8] = v9
        end
        return v7
    end
}
local function v_u_17(p11)
    if type(p11) ~= "table" then
        return p11
    end
    local v12 = {}
    for v13, v14 in pairs(p11) do
        v12[v_u_17(v13)] = v_u_17(v14)
    end
    local v15 = v_u_17
    local v16 = getmetatable(p11)
    return setmetatable(v12, v15(v16))
end
v10.DeepCopy = v_u_17
local function v_u_23(p18, p19)
    for v20, v21 in pairs(p19) do
        local v22 = p18[v20]
        if type(v22) == "table" and type(v21) == "table" then
            p18[v20] = v_u_23(p18[v20], v21)
        else
            p18[v20] = v21
        end
    end
    return p18
end
v10.DeepOverwrite = v_u_23
function v10.GetIndex(p24, p25)
    for v26, v27 in pairs(p24) do
        if p25 == v27 then
            return v26
        end
    end
    return nil
end
local function v_u_37(p28, p29, p30)
    local v31 = p30 or tostring(p28)
    local v32 = p29 or 0
    for v33, v34 in pairs(p28) do
        local v35 = "\n" .. string.rep("  ", v32) .. tostring(v33) .. ": "
        if type(v34) == "table" then
            local v36 = v31 .. v35
            v31 = v_u_37(v34, v33 + 1, v36)
        else
            v31 = v31 .. v35 .. tostring(v34)
        end
    end
    return v31
end
v10.Stringify = v_u_37
function v10.Contains(p38, p39)
    for _, v40 in pairs(p38) do
        if v40 == p39 then
            return true
        end
    end
    return false
end
function v10.Overwrite(p41, p42)
    for v43, v44 in pairs(p42) do
        p41[v43] = v44
    end
    return p41
end
function v10.ErrorOnBadIndex(p45)
    return setmetatable(p45, {
        ["__index"] = function(_, p46)
            error(("Bad index \'%s\'"):format((tostring(p46))))
        end
    })
end
return v10