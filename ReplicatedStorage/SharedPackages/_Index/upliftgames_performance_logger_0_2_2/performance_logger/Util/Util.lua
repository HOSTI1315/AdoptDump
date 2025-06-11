--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Util (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Promise)
local v_u_7 = {
    ["try"] = function(p_u_2, p3, ...)
        return v_u_1.try(p3, ...):catch(function(p4)
            warn(string.format("[PerformanceLogger] %s failed:\n%s", p_u_2, (tostring(p4))))
        end)
    end,
    ["wrapInTry"] = function(p_u_5, p_u_6)
        return function(...)
            v_u_7.try(p_u_5, p_u_6, ...)
        end
    end
}
return v_u_7