--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler.forks.SchedulerHostConfig.mock (ModuleScript)

local v_u_1 = {}
local v_u_2 = 0
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = -1
local v_u_6 = nil
local v_u_7 = -1
local v_u_8 = false
local v_u_9 = false
local v_u_10 = false
local v_u_11 = false
local v_u_12 = require(script.Parent.Parent.Parent:WaitForChild("shared")).console
local v_u_13 = require(script.Parent.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev.disabledLog
function v_u_1.requestHostCallback(p14)
    v_u_3 = p14
end
function v_u_1.cancelHostCallback()
    v_u_3 = nil
end
function v_u_1.requestHostTimeout(p15, p16)
    v_u_4 = p15
    v_u_5 = v_u_2 + p16
end
function v_u_1.cancelHostTimeout()
    v_u_4 = nil
    v_u_5 = -1
end
function v_u_1.shouldYieldToHost()
    local v17 = v_u_6
    if (v_u_7 == -1 or (v17 == nil or v_u_7 > #v17)) and not (v_u_11 and v_u_10) then
        return false
    end
    v_u_8 = true
    return true
end
function v_u_1.getCurrentTime()
    return v_u_2
end
function v_u_1.forceFrameRate() end
function v_u_1.reset()
    if v_u_9 then
        error("Cannot reset while already flushing work.")
    end
    v_u_2 = 0
    v_u_3 = nil
    v_u_4 = nil
    v_u_5 = -1
    v_u_6 = nil
    v_u_7 = -1
    v_u_8 = false
    v_u_9 = false
    v_u_10 = false
end
function v_u_1.unstable_flushNumberOfYields(p18)
    if v_u_9 then
        error("Already flushing work.")
    end
    if v_u_3 ~= nil then
        local v_u_19 = v_u_3
        v_u_7 = p18
        v_u_9 = true
        local v21, v22 = pcall(function()
            repeat
                local v20 = v_u_19(true, v_u_2)
            until not v20 or v_u_8
            if not v20 then
                v_u_3 = nil
            end
        end)
        v_u_7 = -1
        v_u_8 = false
        v_u_9 = false
        if not v21 then
            error(v22)
        end
    end
end
function v_u_1.unstable_flushUntilNextPaint()
    if v_u_9 then
        error("Already flushing work.")
    end
    if v_u_3 ~= nil then
        local v_u_23 = v_u_3
        v_u_11 = true
        v_u_10 = false
        v_u_9 = true
        local v25, v26 = pcall(function()
            repeat
                local v24 = v_u_23(true, v_u_2)
            until not v24 or v_u_8
            if not v24 then
                v_u_3 = nil
            end
        end)
        v_u_11 = false
        v_u_8 = false
        v_u_9 = false
        if not v25 then
            error(v26)
        end
    end
end
function v_u_1.unstable_flushExpired()
    if v_u_9 then
        error("Already flushing work.")
    end
    if v_u_3 ~= nil then
        v_u_9 = true
        local v27, v28 = pcall(function()
            if not v_u_3(false, v_u_2) then
                v_u_3 = nil
            end
        end)
        v_u_9 = false
        if not v27 then
            error(v28)
        end
    end
end
function v_u_1.unstable_flushAllWithoutAsserting()
    if v_u_9 then
        error("Already flushing work.")
    end
    if v_u_3 == nil then
        return false
    end
    local v_u_29 = v_u_3
    v_u_9 = true
    local v31, v32 = pcall(function()
        repeat
            local v30 = v_u_29(true, v_u_2)
        until not v30
        if not v30 then
            v_u_3 = nil
        end
    end)
    v_u_9 = false
    if not v31 then
        error(v32)
    end
    return true
end
function v_u_1.unstable_clearYields()
    if v_u_6 == nil then
        return {}
    end
    local v33 = v_u_6
    v_u_6 = nil
    return v33
end
function v_u_1.unstable_flushAll()
    if v_u_6 ~= nil then
        error("Log is not empty. Assert on the log of yielded values before flushing additional work.")
    end
    v_u_1.unstable_flushAllWithoutAsserting()
    if v_u_6 ~= nil then
        error("While flushing work, something yielded a value. Use an assertion helper to assert on the log of yielded values, e.g. expect(Scheduler).toFlushAndYield([...])")
    end
end
function v_u_1.unstable_yieldValue(p34)
    if v_u_12.log == v_u_13 then
        return
    elseif v_u_6 == nil then
        v_u_6 = { p34 }
    else
        local v35 = v_u_6
        table.insert(v35, p34)
    end
end
function v_u_1.unstable_advanceTime(p36)
    if v_u_12.log ~= v_u_13 then
        v_u_2 = v_u_2 + p36
        if v_u_4 ~= nil and v_u_5 <= v_u_2 then
            v_u_4(v_u_2)
            v_u_5 = -1
            v_u_4 = nil
        end
    end
end
function v_u_1.requestPaint()
    v_u_10 = true
end
return v_u_1