--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.createElement (ModuleScript)

local v_u_1 = require(script.Parent.Core)
local v_u_2 = require(script.Parent.GlobalConfig)
return function(p3, p4, p5)
    if p3 == nil then
        error("Expected elementType as an argument to createElement!", 2)
    end
    local v6 = p4 or {}
    if p5 then
        if v6[v_u_1.Children] ~= nil then
            warn("props[Children] was defined but was overridden by third parameter to createElement!")
        end
        v6[v_u_1.Children] = p5
    end
    local v7 = {
        ["type"] = v_u_1.Element,
        ["component"] = p3,
        ["props"] = v6
    }
    if v_u_2.getValue("elementTracing") then
        v7.source = ("\n%s\n"):format(debug.traceback())
    end
    return v7
end