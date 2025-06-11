--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactFiberHostConfig.WithNoPersistence (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("invariant"))
local function v2(...)
    v_u_1(false, "The current renderer does not support persistence. This error is likely caused by a bug in React. Please file an issue.")
end
return {
    ["supportsPersistence"] = false,
    ["cloneInstance"] = v2,
    ["cloneFundamentalInstance"] = v2,
    ["createContainerChildSet"] = v2,
    ["appendChildToContainerChildSet"] = v2,
    ["finalizeContainerChildren"] = v2,
    ["replaceContainerChildren"] = v2,
    ["cloneHiddenInstance"] = v2,
    ["cloneHiddenTextInstance"] = v2
}