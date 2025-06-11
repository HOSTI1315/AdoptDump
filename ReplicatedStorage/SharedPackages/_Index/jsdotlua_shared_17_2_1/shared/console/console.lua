--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.console (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).console
local v2 = require(script.Parent:WaitForChild("consoleWithStackDev"))
if not _G.__DEV__ then
    return v1
end
local v3 = {
    ["warn"] = v2.warn,
    ["error"] = v2.error
}
return setmetatable(v3, {
    ["__index"] = v1
})