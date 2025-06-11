--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberTransition (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentBatchConfig
return {
    ["NoTransition"] = 0,
    ["requestCurrentTransition"] = function()
        return v_u_1.transition
    end
}