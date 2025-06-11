--// ReplicatedStorage.SharedPackages._Index.jsdotlua_timers@1.2.7.timers.makeTimerImpl (ModuleScript)

local v_u_1 = newproxy(false)
return function(p_u_2)
    return {
        ["setTimeout"] = function(p_u_3, p4, ...)
            local v_u_5 = { ... }
            local v_u_6 = {
                [v_u_1] = 1
            }
            p_u_2((p4 == nil and 0 or p4) / 1000, function()
                if v_u_6[v_u_1] == 1 then
                    local v7 = v_u_5
                    p_u_3(unpack(v7))
                    v_u_6[v_u_1] = 2
                end
            end)
            return v_u_6
        end,
        ["clearTimeout"] = function(p8)
            if p8 ~= nil then
                if p8[v_u_1] == 1 then
                    p8[v_u_1] = 3
                end
            end
        end
    }
end