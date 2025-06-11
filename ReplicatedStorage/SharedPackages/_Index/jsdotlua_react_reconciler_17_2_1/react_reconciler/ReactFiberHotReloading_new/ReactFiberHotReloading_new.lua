--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHotReloading.new (ModuleScript)

require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_FORWARD_REF_TYPE
local v_u_2 = nil
return {
    ["resolveFunctionForHotReloading"] = function(p3)
        if _G.__DEV__ then
            return p3
        else
            return p3
        end
    end,
    ["resolveClassForHotReloading"] = function(p4)
        if _G.__DEV__ then
            return p4
        else
            return p4
        end
    end,
    ["resolveForwardRefForHotReloading"] = function(p5)
        if _G.__DEV__ then
            return p5
        else
            return p5
        end
    end,
    ["isCompatibleFamilyForHotReloading"] = function(_, _)
        warn("isCompatibleFamilyForHotReloading is stubbed (returns false)")
        return false
    end,
    ["markFailedErrorBoundaryForHotReloading"] = function(_)
        if not _G.__DEV__ then
        end
    end
}