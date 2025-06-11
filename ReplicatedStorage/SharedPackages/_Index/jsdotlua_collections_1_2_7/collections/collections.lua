--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections (ModuleScript)

local v1 = require(script:WaitForChild("Array"))
local v2 = require(script:WaitForChild("Map"))
local v3 = require(script:WaitForChild("Object"))
local v4 = require(script:WaitForChild("Set"))
local v5 = require(script:WaitForChild("WeakMap"))
local v6 = require(script:WaitForChild("inspect"))
require(script.Parent:WaitForChild("es7-types"))
return {
    ["Array"] = v1,
    ["Object"] = v3,
    ["Map"] = v2.Map,
    ["coerceToMap"] = v2.coerceToMap,
    ["coerceToTable"] = v2.coerceToTable,
    ["Set"] = v4,
    ["WeakMap"] = v5,
    ["inspect"] = v6
}