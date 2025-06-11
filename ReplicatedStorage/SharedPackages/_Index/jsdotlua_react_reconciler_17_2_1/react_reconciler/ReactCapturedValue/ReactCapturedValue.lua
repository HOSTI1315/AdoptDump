--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactCapturedValue (ModuleScript)

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v_u_1 = require(script.Parent:WaitForChild("ReactFiberComponentStack")).getStackByFiberInDevAndProd
return {
    ["createCapturedValue"] = function(p2, p3)
        return {
            ["value"] = p2,
            ["source"] = p3,
            ["stack"] = v_u_1(p3)
        }
    end
}