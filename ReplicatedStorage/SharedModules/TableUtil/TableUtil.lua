--// ReplicatedStorage.SharedModules.TableUtil (ModuleScript)

local v_u_75 = {
    ["get_key_by_member"] = function(p1, p2, p3)
        for v4, v5 in pairs(p1) do
            if v5[p3] == p2 then
                return v5, v4
            end
        end
    end,
    ["get_key_by_value"] = function(p6, p7)
        for v8, v9 in pairs(p6) do
            if v9 == p7 then
                return v8
            end
        end
    end,
    ["is_member"] = function(p10, p11)
        for _, v12 in pairs(p10) do
            if v12 == p11 then
                return true
            end
        end
        return false
    end,
    ["get_from_path"] = function(p13, p14)
        for _, v15 in pairs(p14) do
            p13 = p13[v15]
            if p13 == nil then
                break
            end
        end
        return p13
    end,
    ["get_first_occurrence_index"] = function(p16, p17)
        for v18, v19 in pairs(p16) do
            if v19 == p17 then
                return v18
            end
        end
    end,
    ["append_elements_to_table"] = function(p20, p21)
        for v22, v23 in pairs(p21) do
            if type(v22) == "number" then
                table.insert(p20, v23)
            else
                p20[v22] = v23
            end
        end
        return p20
    end,
    ["combine"] = function(...)
        local v24 = {}
        for _, v25 in pairs({ ... }) do
            if typeof(v25) == "table" then
                for v26, v27 in pairs(v25) do
                    if v24[v26] and typeof(v26) == "number" then
                        table.insert(v24, v27)
                    else
                        v24[v26] = v27
                    end
                end
            else
                table.insert(v24, v25)
            end
        end
        return v24
    end,
    ["dictionary_to_array"] = function(p28)
        local v29 = {}
        for _, v30 in pairs(p28) do
            table.insert(v29, v30)
        end
        return v29
    end,
    ["count"] = function(p31)
        local v32 = 0
        for _, _ in pairs(p31) do
            v32 = v32 + 1
        end
        return v32
    end,
    ["tostring"] = function(p33)
        local v_u_34 = ""
        local v_u_35 = {}
        local function v_u_40(p36, p37)
            if v_u_35[tostring(p36)] then
                v_u_34 = v_u_34 .. (p37 .. "*" .. tostring(p36)) .. "\n"
                return
            else
                v_u_35[tostring(p36)] = true
                if type(p36) == "table" then
                    for v38, v39 in pairs(p36) do
                        if type(v39) == "table" then
                            v_u_34 = v_u_34 .. (p37 .. "[" .. v38 .. "] => " .. tostring(p36) .. " {") .. "\n"
                            v_u_40(v39, p37 .. string.rep(" ", string.len(v38) + 8))
                            v_u_34 = v_u_34 .. (p37 .. string.rep(" ", string.len(v38) + 6) .. "}") .. v_u_34
                        elseif type(v39) == "string" then
                            v_u_34 = v_u_34 .. (p37 .. "[" .. v38 .. "] => \"" .. v39 .. "\"") .. "\n"
                        else
                            v_u_34 = v_u_34 .. (p37 .. "[" .. v38 .. "] => " .. tostring(v39)) .. "\n"
                        end
                    end
                else
                    v_u_34 = v_u_34 .. (p37 .. tostring(p36)) .. "\n"
                end
            end
        end
        if type(p33) == "table" then
            v_u_34 = v_u_34 .. (tostring(p33) .. " {") .. "\n"
            v_u_40(p33, "  ")
            v_u_34 = v_u_34 .. "}\n"
        else
            v_u_40(p33, "  ")
        end
        v_u_34 = v_u_34 .. "\n"
        return v_u_34
    end,
    ["merge"] = function(...)
        local v41 = {}
        for v42 = 1, select("#", ...) do
            for v43, v44 in pairs(select(v42, ...)) do
                v41[v43] = v44
            end
        end
        return v41
    end,
    ["shuffle"] = function(p45, p46)
        if #p45 == 0 then
            return p45
        end
        local v47 = p46 or Random.new()
        for v48 = #p45, 1, -1 do
            local v49 = v47:NextInteger(1, #p45)
            local v50 = p45[v49]
            local v51 = p45[v48]
            p45[v48] = v50
            p45[v49] = v51
        end
        return p45
    end,
    ["shallow_copy"] = function(p52)
        if typeof(p52) ~= "table" then
            return p52
        end
        local v53 = {}
        for v54, v55 in pairs(p52) do
            v53[v54] = v55
        end
        return v53
    end,
    ["shallow_equal"] = function(p56, p57)
        if typeof(p56) ~= "table" or typeof(p57) ~= "table" then
            return p56 == p57
        end
        if p56 == p57 then
            return true
        end
        for v58, v59 in pairs(p56) do
            if v59 ~= p57[v58] then
                return false
            end
        end
        for v60, v61 in pairs(p57) do
            if v61 ~= p56[v60] then
                return false
            end
        end
        return true
    end,
    ["deep_copy"] = function(p62)
        if type(p62) ~= "table" then
            return p62
        end
        local v63 = {}
        for v64, v65 in pairs(p62) do
            v63[v_u_75.deep_copy(v64)] = v_u_75.deep_copy(v65)
        end
        local v66 = v_u_75.deep_copy
        local v67 = getmetatable(p62)
        return setmetatable(v63, v66(v67))
    end,
    ["reverse"] = function(p68)
        local v69 = #p68
        local v70 = 1
        while v70 < v69 do
            local v71 = p68[v69]
            local v72 = p68[v70]
            p68[v70] = v71
            p68[v69] = v72
            v70 = v70 + 1
            v69 = v69 - 1
        end
    end,
    ["get_dictionary_length"] = function(p73)
        local v74 = 0
        for _, _ in pairs(p73) do
            v74 = v74 + 1
        end
        return v74
    end
}
return v_u_75