--// ReplicatedStorage.new.modules.Performance.ChunkedLookup (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
    local v3 = {
        ["_chunk_size"] = p2.chunk_size,
        ["_chunks"] = {},
        ["_item_positions"] = {},
        ["_item_radiuses"] = {}
    }
    local v4 = v_u_1
    return setmetatable(v3, v4)
end
function v_u_1.remove_item(p5, p6)
    local v7 = p5._item_positions[p6]
    local v8 = p5._item_radiuses[p6]
    if v7 then
        local v9 = v8 ~= nil
        assert(v9, "analysis hint")
        local v10 = v7.X - v8
        local v11 = math.floor(v10)
        local v12 = v7.X + v8
        for v13 = v11, math.ceil(v12) do
            local v14 = v7.Y - v8
            local v15 = math.floor(v14)
            local v16 = v7.Y + v8
            for v17 = v15, math.ceil(v16) do
                local v18 = v7.Z - v8
                local v19 = math.floor(v18)
                local v20 = v7.Z + v8
                for v21 = v19, math.ceil(v20) do
                    local v22 = Vector3.new(v13, v17, v21)
                    local v23 = p5._chunks[v22]
                    if v23 then
                        v23[p6] = nil
                        if next(v23) == nil then
                            p5._chunks[v22] = nil
                        end
                    end
                end
            end
        end
    end
end
function v_u_1.place_item(p24, p25, p26, p27)
    if p24._item_positions[p25] then
        p24:remove_item(p25)
    end
    local v28 = p26 / p24._chunk_size
    local v29 = p27 / p24._chunk_size
    local v30 = v28.X - v29
    local v31 = math.floor(v30)
    local v32 = v28.X + v29
    for v33 = v31, math.ceil(v32) do
        local v34 = v28.Y - v29
        local v35 = math.floor(v34)
        local v36 = v28.Y + v29
        for v37 = v35, math.ceil(v36) do
            local v38 = v28.Z - v29
            local v39 = math.floor(v38)
            local v40 = v28.Z + v29
            for v41 = v39, math.ceil(v40) do
                local v42 = Vector3.new(v33, v37, v41)
                if not p24._chunks[v42] then
                    p24._chunks[v42] = {}
                end
                p24._chunks[v42][p25] = true
            end
        end
    end
    p24._item_positions[p25] = v28
    p24._item_radiuses[p25] = v29
end
function v_u_1.get_items_at_position(p43, p44, p45)
    local v46 = p44 / p43._chunk_size
    local v47 = (p45 or 0) / p43._chunk_size
    local v48 = v46.X - v47
    local v49 = math.floor(v48)
    local v50 = v46.X + v47
    local v51 = {}
    for v52 = v49, math.ceil(v50) do
        local v53 = v46.Y - v47
        local v54 = math.floor(v53)
        local v55 = v46.Y + v47
        for v56 = v54, math.ceil(v55) do
            local v57 = v46.Z - v47
            local v58 = math.floor(v57)
            local v59 = v46.Z + v47
            for v60 = v58, math.ceil(v59) do
                local v61 = Vector3.new(v52, v56, v60)
                v51[v61] = p43._chunks[v61]
            end
        end
    end
    return v51
end
function v_u_1.get_items_at_position_flattened(p62, p63, p64)
    local v65 = {}
    for _, v66 in p62:get_items_at_position(p63, p64) do
        for v67, _ in v66 do
            v65[v67] = true
        end
    end
    return v65
end
return v_u_1