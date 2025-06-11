--// ReplicatedStorage.new.modules.Utf8Tools (ModuleScript)

local v_u_7 = {
    ["is_valid"] = function(p1)
        return utf8.len(p1) ~= nil
    end,
    ["sanitize_and_check_length"] = function(p2, p3)
        local v4
        if p3.limit_bytes then
            v4 = p3.limit_bytes
        elseif p3.limit_average_bytes_per_grapheme then
            v4 = p3.limit_graphemes * p3.limit_average_bytes_per_grapheme
        else
            v4 = p3.limit_graphemes * 50
        end
        local v5 = v_u_7.replace_invalid_codepoints(p2, p3.invalid_codepoint_replacement)
        local v6 = v_u_7.length_graphemes(v5)
        if v6 then
            if p3.limit_graphemes < v6 then
                return false, v5, "TooManyCharacters"
            elseif v4 < #v5 then
                return false, v5, "TooManyBytes"
            else
                return true, v5, nil
            end
        else
            return false, "[invalid utf8]", "InvalidUtf8"
        end
    end
}
local function v_u_13(p8, p9)
    local v10, v11 = p8:find(utf8.charpattern, p9)
    if not (v10 and v11) then
        return nil
    end
    local v12 = string.sub(p8, v10, v11)
    while utf8.len(v12) == nil do
        v11 = v11 - 1
        if v11 < v10 then
            return nil
        end
        v12 = string.sub(p8, v10, v11)
    end
    return v10, v11
end
function v_u_7.replace_invalid_codepoints(p14, p15)
    debug.profilebegin("Utf8Tools.replace_invalid_codepoints")
    local v16 = 1
    local v17 = {}
    local v18 = p15 or ""
    while v16 <= #p14 do
        local v19, v20 = v_u_13(p14, v16)
        if not (v19 and v20) then
            local v21 = string.rep
            local v22 = #p14 - v16 + 1
            table.insert(v17, v21(v18, v22))
            break
        end
        local v23 = string.rep
        local v24 = v19 - v16
        table.insert(v17, v23(v18, v24))
        local v25 = string.sub(p14, v19, v20)
        table.insert(v17, v25)
        v16 = v20 + 1
    end
    debug.profileend()
    return table.concat(v17)
end
function v_u_7.substring_codepoints(p26, p27, p28)
    if not v_u_7.is_valid(p26) then
        return nil
    end
    debug.profilebegin("Utf8Tools.substring_codepoints")
    local v29 = 1
    local v30 = {}
    for _, v31 in utf8.codes(p26) do
        if p27 <= v29 and v29 <= p28 then
            local v32 = utf8.char
            table.insert(v30, v32(v31))
        end
        v29 = v29 + 1
    end
    debug.profileend()
    return table.concat(v30)
end
function v_u_7.substring_graphemes(p33, p34, p35)
    if not v_u_7.is_valid(p33) then
        return nil
    end
    debug.profilebegin("Utf8Tools.substring_graphemes")
    local v36 = {}
    for v37, v38 in utf8.graphemes(p33, p34, p35) do
        local v39 = string.sub(p33, v37, v38)
        table.insert(v36, v39)
    end
    debug.profileend()
    return table.concat(v36)
end
v_u_7.length_codepoints = utf8.len
function v_u_7.length_graphemes(p40)
    if not v_u_7.is_valid(p40) then
        return nil
    end
    local v41 = 0
    for _, _ in utf8.graphemes(p40) do
        v41 = v41 + 1
    end
    return v41
end
return v_u_7