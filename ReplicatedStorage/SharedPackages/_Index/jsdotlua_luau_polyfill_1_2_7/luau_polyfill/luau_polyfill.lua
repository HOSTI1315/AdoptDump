--// ReplicatedStorage.SharedPackages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill (ModuleScript)

local v1 = require(script.Parent:WaitForChild("boolean"))
local v2 = require(script.Parent:WaitForChild("collections"))
local v3 = require(script.Parent:WaitForChild("console"))
local v4 = require(script.Parent:WaitForChild("math"))
local v5 = require(script.Parent:WaitForChild("number"))
local v6 = require(script.Parent:WaitForChild("string"))
local v7 = require(script.Parent:WaitForChild("symbol-luau"))
local v8 = require(script.Parent:WaitForChild("timers"))
require(script.Parent:WaitForChild("es7-types"))
local v9 = require(script:WaitForChild("AssertionError"))
local v10 = require(script:WaitForChild("Error"))
require(script:WaitForChild("Promise"))
local v11 = require(script:WaitForChild("extends"))
local v12 = require(script.Parent:WaitForChild("instance-of"))
local v13 = {
    ["Array"] = v2.Array,
    ["AssertionError"] = v9,
    ["Boolean"] = v1,
    ["console"] = v3,
    ["Error"] = v10,
    ["extends"] = v11,
    ["instanceof"] = v12,
    ["Math"] = v4,
    ["Number"] = v5,
    ["Object"] = v2.Object,
    ["Map"] = v2.Map,
    ["coerceToMap"] = v2.coerceToMap,
    ["coerceToTable"] = v2.coerceToTable,
    ["Set"] = v2.Set,
    ["WeakMap"] = v2.WeakMap,
    ["String"] = v6,
    ["Symbol"] = v7,
    ["setTimeout"] = v8.setTimeout,
    ["clearTimeout"] = v8.clearTimeout,
    ["setInterval"] = v8.setInterval,
    ["clearInterval"] = v8.clearInterval,
    ["util"] = {
        ["inspect"] = v2.inspect
    }
}
return v13