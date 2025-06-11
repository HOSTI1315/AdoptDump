--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger (ModuleScript)

local v_u_1 = require(script.Player.ClientPlayerPerformanceSingleton)
local v_u_2 = require(script.Player.ServerPlayerPerformanceSingleton)
return {
    ["clientPlayerLogger"] = function()
        return v_u_1
    end,
    ["serverPlayerLogger"] = function()
        return v_u_2
    end
}