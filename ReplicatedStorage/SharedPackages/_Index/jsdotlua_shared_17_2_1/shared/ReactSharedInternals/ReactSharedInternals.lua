--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactSharedInternals (ModuleScript)

local _ = require(script.Parent.Parent:WaitForChild("luau-polyfill")).console
local v1 = require(script:WaitForChild("ReactCurrentDispatcher"))
local v2 = require(script:WaitForChild("ReactCurrentBatchConfig"))
local v3 = require(script:WaitForChild("ReactCurrentOwner"))
local v4 = require(script:WaitForChild("ReactDebugCurrentFrame"))
local v5 = {
    ["ReactCurrentDispatcher"] = v1,
    ["ReactCurrentBatchConfig"] = v2,
    ["ReactCurrentOwner"] = v3,
    ["IsSomeRendererActing"] = require(script:WaitForChild("IsSomeRendererActing"))
}
if not _G.__DEV__ then
    v4 = {
        ["setExtraStackFrame"] = function(_) end
    }
end
v5.ReactDebugCurrentFrame = v4
return v5