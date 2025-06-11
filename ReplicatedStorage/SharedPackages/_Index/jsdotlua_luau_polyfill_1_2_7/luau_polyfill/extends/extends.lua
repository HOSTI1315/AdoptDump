--// ReplicatedStorage.SharedPackages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill.extends (ModuleScript)

return function(p_u_1, p_u_2, p_u_3)
    local v_u_4 = {}
    v_u_4.__index = v_u_4
    function v_u_4.__tostring(p5)
        local v6 = p_u_1
        return getmetatable(v6).__tostring(p5)
    end
    local v7 = {}
    function v_u_4.new(...)
        local v8 = {}
        p_u_3(v8, ...)
        local v9 = v_u_4
        return setmetatable(v8, v9)
    end
    local v10 = getmetatable(p_u_1)
    if typeof(v10) == "table" and getmetatable(p_u_1).__call then
        function v7.__call(_, ...)
            return v_u_4.new(...)
        end
    end
    v7.__index = p_u_1
    function v7.__tostring(p11)
        if p11 == v_u_4 then
            local v12 = p_u_2
            return tostring(v12)
        else
            local v13 = p_u_1
            return getmetatable(v13).__tostring(p11)
        end
    end
    setmetatable(v_u_4, v7)
    return v_u_4
end