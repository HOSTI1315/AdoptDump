--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler.SchedulerMinHeap (ModuleScript)

local v1 = {}
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = nil
function v1.push(p5, p6)
    local v7 = #p5 + 1
    p5[v7] = p6
    v_u_3(p5, p6, v7)
end
function v1.peek(p8)
    return p8[1]
end
function v1.pop(p9)
    local v10 = p9[1]
    if v10 == nil then
        return nil
    end
    local v11 = p9[#p9]
    p9[#p9] = nil
    if v11 ~= v10 then
        p9[1] = v11
        v_u_4(p9, v11, 1)
    end
    return v10
end
v_u_3 = function(p12, p13, p14)
    while true do
        local v15 = p14 / 2
        local v16 = math.floor(v15)
        local v17 = p12[v16]
        if v17 == nil or v_u_2(v17, p13) <= 0 then
            break
        end
        p12[v16] = p13
        p12[p14] = v17
        p14 = v16
    end
end
v_u_4 = function(p18, p19, p20)
    local v21 = #p18
    while p20 < v21 do
        local v22 = p20 * 2
        local v23 = p18[v22]
        local v24 = v22 + 1
        local v25 = p18[v24]
        if v23 == nil or v_u_2(v23, p19) >= 0 then
            if v25 == nil or v_u_2(v25, p19) >= 0 then
                return
            end
            p18[p20] = v25
            p18[v24] = p19
        elseif v25 == nil or v_u_2(v25, v23) >= 0 then
            p18[p20] = v23
            p18[v22] = p19
            v24 = v22
        else
            p18[p20] = v25
            p18[v24] = p19
        end
        p20 = v24
    end
end
v_u_2 = function(p26, p27)
    local v28 = p26.sortIndex - p27.sortIndex
    if v28 == 0 then
        return p26.id - p27.id
    else
        return v28
    end
end
return v1