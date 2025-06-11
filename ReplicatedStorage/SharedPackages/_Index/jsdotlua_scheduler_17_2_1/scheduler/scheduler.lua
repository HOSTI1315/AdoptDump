--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler (ModuleScript)

local v1 = require(script:WaitForChild("Scheduler"))(nil)
local v2 = require(script:WaitForChild("Tracing"))
local v3 = require(script:WaitForChild("TracingSubscriptions"))
if _G.__ROACT_17_MOCK_SCHEDULER__ then
    return require(script:WaitForChild("unstable_mock"))
end
local v4 = {
    ["unstable_ImmediatePriority"] = v1.unstable_ImmediatePriority,
    ["unstable_UserBlockingPriority"] = v1.unstable_UserBlockingPriority,
    ["unstable_NormalPriority"] = v1.unstable_NormalPriority,
    ["unstable_IdlePriority"] = v1.unstable_IdlePriority,
    ["unstable_LowPriority"] = v1.unstable_LowPriority,
    ["unstable_runWithPriority"] = v1.unstable_runWithPriority,
    ["unstable_next"] = v1.unstable_next,
    ["unstable_scheduleCallback"] = v1.unstable_scheduleCallback,
    ["unstable_cancelCallback"] = v1.unstable_cancelCallback,
    ["unstable_wrapCallback"] = v1.unstable_wrapCallback,
    ["unstable_getCurrentPriorityLevel"] = v1.unstable_getCurrentPriorityLevel,
    ["unstable_shouldYield"] = v1.unstable_shouldYield,
    ["unstable_requestPaint"] = v1.unstable_requestPaint,
    ["unstable_continueExecution"] = v1.unstable_continueExecution,
    ["unstable_pauseExecution"] = v1.unstable_pauseExecution,
    ["unstable_getFirstCallbackNode"] = v1.unstable_getFirstCallbackNode,
    ["unstable_now"] = v1.unstable_now,
    ["unstable_forceFrameRate"] = v1.unstable_forceFrameRate
}
local v_u_5 = "unstable_flushAllWithoutAsserting"
function v4.unstable_flushAllWithoutAsserting()
    error(v_u_5 .. " is only available in tests, not in production")
end
local v_u_6 = "unstable_flushAll"
function v4.unstable_flushAll()
    error(v_u_6 .. " is only available in tests, not in production")
end
local v_u_7 = "unstable_flushNumberOfYields"
function v4.unstable_flushNumberOfYields()
    error(v_u_7 .. " is only available in tests, not in production")
end
local v_u_8 = "unstable_clearYields"
function v4.unstable_clearYields()
    error(v_u_8 .. " is only available in tests, not in production")
end
local v_u_9 = "unstable_clearYields"
function v4.unstable_flushUntilNextPaint()
    error(v_u_9 .. " is only available in tests, not in production")
end
local v_u_10 = "unstable_advanceTime"
function v4.unstable_advanceTime()
    error(v_u_10 .. " is only available in tests, not in production")
end
local v_u_11 = "unstable_flushExpired"
function v4.unstable_flushExpired()
    error(v_u_11 .. " is only available in tests, not in production")
end
local v_u_12 = "unstable_yieldValue"
function v4.unstable_yieldValue()
    error(v_u_12 .. " is only available in tests, not in production")
end
local v13 = {}
local v_u_14 = "unstable_wrap"
function v13.unstable_wrap()
    error(v_u_14 .. " is only available in tests, not in production")
end
v13.__interactionsRef = {}
v13.__subscriberRef = {}
v4.tracing = v13
for v15, v16 in v2 do
    v4.tracing[v15] = v16
end
for v17, v18 in v3 do
    v4.tracing[v17] = v18
end
return v4