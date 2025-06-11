--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler.unstable_mock (ModuleScript)

local v1 = require(script.Parent:WaitForChild("Tracing"))
local v2 = require(script.Parent:WaitForChild("TracingSubscriptions"))
local v3 = require(script.Parent:WaitForChild("Scheduler"))
local v4 = require(script.Parent:WaitForChild("forks"):WaitForChild("SchedulerHostConfig.mock"))
local v5 = v3(v4)
local v6 = {
    ["tracing"] = {}
}
for v7, v8 in v5 do
    v6[v7] = v8
end
for v9, v10 in v1 do
    v6.tracing[v9] = v10
end
for v11, v12 in v2 do
    v6.tracing[v11] = v12
end
v6.unstable_flushAllWithoutAsserting = v4.unstable_flushAllWithoutAsserting
v6.unstable_flushNumberOfYields = v4.unstable_flushNumberOfYields
v6.unstable_flushExpired = v4.unstable_flushExpired
v6.unstable_clearYields = v4.unstable_clearYields
v6.unstable_flushUntilNextPaint = v4.unstable_flushUntilNextPaint
v6.unstable_flushAll = v4.unstable_flushAll
v6.unstable_yieldValue = v4.unstable_yieldValue
v6.unstable_advanceTime = v4.unstable_advanceTime
v6.unstable_Profiling = v5.unstable_Profiling
return v6