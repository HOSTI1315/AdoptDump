--// ReplicatedStorage.new.modules.PurchaseContext (ModuleScript)

local v_u_1 = {}
local v_u_2 = {}
function v_u_1.push(p3)
    if not v_u_2[p3] then
        v_u_2[p3] = {}
    end
    local v4 = v_u_2[p3]
    table.insert(v4, {})
end
function v_u_1.pop(p5)
    if v_u_2[p5] then
        table.remove(v_u_2[p5])
    end
end
function v_u_1.add(p6, p7, p8)
    local v9 = v_u_2[p6]
    if v9 then
        v9 = v_u_2[p6][1]
    end
    if not v9 then
        v_u_1.push(p6)
        v9 = v_u_2[p6][1]
    end
    v9[p7] = p8
end
function v_u_1.add_all(p10, p11)
    local v12 = v_u_2[p10]
    if v12 then
        v12 = v_u_2[p10][1]
    end
    if not v12 then
        v_u_1.push(p10)
        v12 = v_u_2[p10][1]
    end
    for v13, v14 in p11 do
        v12[v13] = v14
    end
end
function v_u_1.get(p15, p16)
    local v17 = v_u_2[p15]
    if v17 then
        v17 = v_u_2[p15][1]
    end
    if v17 then
        return v17[p16]
    else
        return nil
    end
end
function v_u_1.get_all(p18)
    local v19 = v_u_2[p18]
    if v19 then
        v19 = v_u_2[p18][1]
    end
    return not v19 and {} or table.clone(v19)
end
return v_u_1