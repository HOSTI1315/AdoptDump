--// ReplicatedStorage.SharedPackages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau (ModuleScript)

local v_u_1 = require(script:WaitForChild("Symbol"))
local v2 = require(script:WaitForChild("Registry.global"))
local v4 = setmetatable({}, {
    ["__call"] = function(_, p3)
        return v_u_1.new(p3)
    end
})
v4.for_ = v2.getOrInit
return v4