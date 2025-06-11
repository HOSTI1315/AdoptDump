--// ReplicatedStorage.SharedPackages._Index.upliftgames_ui-absolute-visibility@0.1.0.ui-absolute-visibility.CascadeTree (ModuleScript)

local v_u_1 = require(script.Queue)
local v_u_2 = {}
local v_u_3 = {}
local v_u_4 = {}
function v_u_2.add(p5)
    v_u_2.remove(p5)
    local v6 = p5
    while true do
        if not p5.Parent then
            p5 = nil
            break
        end
        p5 = p5.Parent
        if v_u_3[p5] then
            break
        end
    end
    if p5 then
        if not v_u_4[p5] then
            v_u_4[p5] = {}
        end
        local v7 = v_u_4[p5]
        table.insert(v7, v6)
    end
    v_u_3[v6] = {
        ["instance"] = v6,
        ["ancestor"] = p5
    }
end
function v_u_2.refresh(p8)
    return v_u_2.add(p8)
end
function v_u_2.remove(p9)
    local v10 = v_u_3[p9]
    if v10 then
        local v11 = v10.ancestor
        for _, v12 in v_u_4[p9] or {} do
            local v13 = v_u_3[v12]
            if v13 then
                v13.ancestor = v11
            end
        end
    end
    v_u_3[p9] = nil
    v_u_4[p9] = nil
end
function v_u_2.contains(p14)
    return v_u_3[p14] ~= nil
end
function v_u_2.getDescendants(p15)
    local v16 = v_u_1.new({ p15 })
    local v17 = {}
    while v16:GetLength() > 0 do
        local v18 = v16:PopFront()
        local v19 = v_u_3[v18]
        local v20 = v_u_4[v18]
        if v19 and v20 then
            for _, v21 in v20 do
                table.insert(v17, v21)
                v16:PushBack(v21)
            end
        end
    end
    return v17
end
function v_u_2.getAncestors(p22)
    local v23 = {}
    while p22 do
        p22 = v_u_3[p22]
        if p22 then
            p22 = p22.ancestor
        end
        if p22 then
            table.insert(v23, p22)
        end
    end
    return v23
end
function v_u_2.getNearestAncestor(p24)
    local v25 = v_u_3[p24]
    if v25 then
        v25 = v25.ancestor
    end
    return v25
end
function v_u_2.getSortedDescendants(p26)
    local v27 = {}
    local v28 = {}
    for _, v29 in p26 do
        local v30 = #v_u_2.getDescendants(v29)
        if not v27[v30] then
            v27[v30] = {}
            table.insert(v28, v30)
        end
        local v31 = v27[v30]
        table.insert(v31, v29)
    end
    table.sort(v28)
    local v32 = {}
    for v33 = #v28, 1, -1 do
        for _, v34 in v27[v28[v33]] do
            table.insert(v32, v34)
        end
    end
    return v32
end
return v_u_2