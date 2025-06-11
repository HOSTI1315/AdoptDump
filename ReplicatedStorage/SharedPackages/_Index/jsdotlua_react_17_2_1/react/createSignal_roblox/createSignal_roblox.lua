--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.createSignal.roblox (ModuleScript)

return function()
    local v_u_1 = {}
    local v_u_2 = {}
    local v_u_3 = false
    return function(p_u_4)
        local v5 = typeof(p_u_4) == "function"
        assert(v5, "Can only subscribe to signals with a function.")
        local v_u_6 = {
            ["callback"] = p_u_4,
            ["disconnected"] = false
        }
        if v_u_3 and not v_u_1[p_u_4] then
            v_u_2[p_u_4] = v_u_6
        end
        v_u_1[p_u_4] = v_u_6
        return function()
            local v7 = not v_u_6.disconnected
            assert(v7, "Listeners can only be disconnected once.")
            v_u_6.disconnected = true
            v_u_1[p_u_4] = nil
            v_u_2[p_u_4] = nil
        end
    end, function(...)
        v_u_3 = true
        for v8, v9 in v_u_1 do
            if not (v9.disconnected or v_u_2[v8]) then
                v8(...)
            end
        end
        v_u_3 = false
        table.clear(v_u_2)
    end
end