--// ReplicatedStorage.SharedPackages._Index.jsdotlua_timers@1.2.7.timers (ModuleScript)

local v1 = require(script.Parent:WaitForChild("collections")).Object
local v2 = require(script:WaitForChild("makeTimerImpl"))
local v3 = require(script:WaitForChild("makeIntervalImpl"))
return v1.assign({}, v2(task.delay), v3(task.delay))