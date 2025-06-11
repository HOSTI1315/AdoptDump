--// ReplicatedStorage.SharedPackages._Index.jsdotlua_timers@1.2.7.timers.makeIntervalImpl (ModuleScript)

local v_u_1 = newproxy(false)
return function(p_u_2)
    return {
        ["setInterval"] = function(p_u_3, p4, ...)
            local v_u_5 = { ... }
            local v_u_6 = {
                [v_u_1] = 1
            }
            local v_u_7 = (p4 == nil and 0 or p4) / 1000
            local function v_u_9()
                p_u_2(v_u_7, function()
                    if v_u_6[v_u_1] == 1 then
                        local v8 = v_u_5
                        p_u_3(unpack(v8))
                        v_u_9()
                    end
                end)
            end
            v_u_9()
            return v_u_6
        end,
        ["clearInterval"] = function(p10)
            if p10 ~= nil then
                if p10[v_u_1] == 1 then
                    p10[v_u_1] = 3
                end
            end
        end
    }
end