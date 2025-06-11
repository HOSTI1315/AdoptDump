--// ReplicatedStorage.SharedPackages._Index.jsdotlua_instance-of@1.2.7.instance-of.instanceof (ModuleScript)

local v_u_1 = _G.__DEV__
return function(p_u_2, p_u_3)
    if v_u_1 then
        local v4 = typeof(p_u_3) == "table"
        assert(v4, "Received a non-table as the second argument for instanceof")
    end
    if typeof(p_u_2) ~= "table" then
        return false
    end
    local v6, v7 = pcall(function()
        local v5
        if p_u_3.new == nil then
            v5 = false
        else
            v5 = p_u_2.new == p_u_3.new
        end
        return v5
    end)
    if v6 and v7 then
        return true
    end
    local v8 = {
        [p_u_2] = true
    }
    while p_u_2 do
        local v9 = p_u_2
        if typeof(v9) ~= "table" then
            break
        end
        local v10 = p_u_2
        p_u_2 = getmetatable(v10)
        local v11 = p_u_2
        if typeof(v11) == "table" then
            p_u_2 = p_u_2.__index
            if p_u_2 == p_u_3 then
                return true
            end
        end
        local v12 = p_u_2
        if typeof(v12) == "table" then
            if v8[p_u_2] then
                return false
            end
            v8[p_u_2] = true
        end
    end
    return false
end