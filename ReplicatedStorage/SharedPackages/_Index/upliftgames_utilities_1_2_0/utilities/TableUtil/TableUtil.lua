--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.TableUtil (ModuleScript)

local v_u_5 = {
    ["deep_copy_table"] = function(p1)
        if type(p1) ~= "table" then
            return p1
        end
        local v2 = {}
        for v3, v4 in next, p1 do
            v2[v_u_5.deep_copy_table(v3)] = v_u_5.deep_copy_table(v4)
        end
        return v2
    end
}
v_u_5.deep_copy = v_u_5.deep_copy_table
function v_u_5.are_tables_equal(p6, p7)
    if p6 == p7 then
        return true
    end
    local v8 = {}
    for v9, v10 in pairs(p6) do
        local v11 = type(v10)
        local v12 = p7[v9]
        if v11 ~= type(v12) then
            return false
        end
        if type(v10) == "table" then
            if not v_u_5.are_tables_equal(v10, p7[v9]) then
                return false
            end
        elseif v10 ~= p7[v9] then
            return false
        end
        v8[v9] = true
    end
    for v13, _ in pairs(p7) do
        if v8[v13] ~= true then
            return false
        end
    end
    return true
end
function v_u_5.isTableEmpty()
    -- failed to decompile
end
function v_u_5.hasMetaTable(p14, p15)
    local v16 = p15 or true
    local v17 = getmetatable(p14)
    local v18
    if v17 == nil then
        v18 = false
    else
        v18 = typeof(v17) ~= "table" and true or not v_u_5.isTableEmpty(v17)
    end
    if v18 then
        return true
    end
    if not v16 then
        return false
    end
    for _, v19 in pairs(p14) do
        if typeof(v19) == "table" and v_u_5.hasMetaTable(v19, v16) then
            return true
        end
    end
    return false
end
function v_u_5.copy(p20)
    local v21 = {}
    for v22, v23 in pairs(p20) do
        v21[v22] = v23
    end
    return v21
end
v_u_5.deepCopy = v_u_5.deep_copy_table
v_u_5.areTablesEqual = v_u_5.are_tables_equal
return v_u_5