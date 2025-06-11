--// ReplicatedStorage.SharedPackages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau.Registry.global (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("Symbol"))
local v_u_2 = {}
return {
    ["getOrInit"] = function(p3)
        if v_u_2[p3] == nil then
            v_u_2[p3] = v_u_1.new(p3)
        end
        return v_u_2[p3]
    end,
    ["__clear"] = function()
        v_u_2 = {}
    end
}