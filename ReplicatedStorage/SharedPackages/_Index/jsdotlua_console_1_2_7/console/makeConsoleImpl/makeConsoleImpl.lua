--// ReplicatedStorage.SharedPackages._Index.jsdotlua_console@1.2.7.console.makeConsoleImpl (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("collections")).inspect
return function()
    local v2 = {}
    local v_u_3 = 0
    function v2.log(p4, ...)
        local v5
        if typeof(p4) == "string" then
            v5 = string.format(p4, ...)
        else
            v5 = v_u_1(p4)
        end
        print(string.rep("  ", v_u_3) .. v5)
    end
    function v2.debug(p6, ...)
        local v7
        if typeof(p6) == "string" then
            v7 = string.format(p6, ...)
        else
            v7 = v_u_1(p6)
        end
        print(string.rep("  ", v_u_3) .. v7)
    end
    function v2.info(p8, ...)
        local v9
        if typeof(p8) == "string" then
            v9 = string.format(p8, ...)
        else
            v9 = v_u_1(p8)
        end
        print(string.rep("  ", v_u_3) .. v9)
    end
    function v2.warn(p10, ...)
        local v11
        if typeof(p10) == "string" then
            v11 = string.format(p10, ...)
        else
            v11 = v_u_1(p10)
        end
        warn(string.rep("  ", v_u_3) .. v11)
    end
    function v2.error(p12, ...)
        local v13
        if typeof(p12) == "string" then
            v13 = string.format(p12, ...)
        else
            v13 = v_u_1(p12)
        end
        warn(string.rep("  ", v_u_3) .. v13)
    end
    function v2.group(p14, ...)
        local v15
        if typeof(p14) == "string" then
            v15 = string.format(p14, ...)
        else
            v15 = v_u_1(p14)
        end
        print(string.rep("  ", v_u_3) .. v15)
        v_u_3 = v_u_3 + 1
    end
    function v2.groupCollapsed(p16, ...)
        local v17
        if typeof(p16) == "string" then
            v17 = string.format(p16, ...)
        else
            v17 = v_u_1(p16)
        end
        print(string.rep("  ", v_u_3) .. v17)
        v_u_3 = v_u_3 + 1
    end
    function v2.groupEnd()
        if v_u_3 > 0 then
            v_u_3 = v_u_3 - 1
        end
    end
    return v2
end