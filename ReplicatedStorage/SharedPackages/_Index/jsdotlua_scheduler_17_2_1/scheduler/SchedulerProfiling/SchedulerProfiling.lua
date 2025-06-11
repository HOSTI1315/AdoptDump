--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler.SchedulerProfiling (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
local v_u_2 = {}
require(script.Parent:WaitForChild("SchedulerPriorities"))
local v_u_3 = require(script.Parent:WaitForChild("SchedulerFeatureFlags")).enableProfiling
local v_u_4 = 0
local v_u_5 = 0
local v_u_6 = 0
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = 1
local function v_u_14(p10)
    if v_u_8 ~= nil then
        v_u_9 = v_u_9 + #p10
        if v_u_6 < v_u_9 + 1 then
            v_u_6 = v_u_6 * 2
            if v_u_6 > 524288 then
                v_u_1.error("Scheduler Profiling: Event log exceeded maximum size. Don\'t forget to call `stopLoggingProfilingEvents()`.")
                v_u_2.stopLoggingProfilingEvents()
                return
            end
            local v11 = {}
            local v12 = v_u_8
            table.insert(v11, v12)
            v_u_7 = v11
            v_u_8 = v11
        end
        local v13 = v_u_8
        table.insert(v13, p10)
    end
end
function v_u_2.startLoggingProfilingEvents()
    v_u_6 = 131072
    v_u_7 = {}
    v_u_8 = v_u_7
    v_u_9 = 1
end
function v_u_2.stopLoggingProfilingEvents()
    local v15 = v_u_7
    v_u_6 = 0
    v_u_7 = nil
    v_u_8 = nil
    v_u_9 = 1
    return v15
end
function v_u_2.markTaskStart(p16, p17)
    if v_u_3 and v_u_8 ~= nil then
        v_u_14({
            1,
            p17 * 1000,
            p16.id,
            p16.priorityLevel
        })
    end
end
function v_u_2.markTaskCompleted(p18, p19)
    if v_u_3 and v_u_8 ~= nil then
        v_u_14({ 2, p19 * 1000, p18.id })
    end
end
function v_u_2.markTaskCanceled(p20, p21)
    if v_u_3 and v_u_8 ~= nil then
        v_u_14({ 4, p21 * 1000, p20.id })
    end
end
function v_u_2.markTaskErrored(p22, p23)
    if v_u_3 and v_u_8 ~= nil then
        v_u_14({ 3, p23 * 1000, p22.id })
    end
end
function v_u_2.markTaskRun(p24, p25)
    if v_u_3 then
        v_u_4 = v_u_4 + 1
        if v_u_8 ~= nil then
            v_u_14({
                5,
                p25 * 1000,
                p24.id,
                v_u_4
            })
        end
    end
end
function v_u_2.markTaskYield(p26, p27)
    if v_u_3 and v_u_8 ~= nil then
        v_u_14({
            6,
            p27 * 1000,
            p26.id,
            v_u_4
        })
    end
end
function v_u_2.markSchedulerSuspended(p28)
    if v_u_3 then
        v_u_5 = v_u_5 + 1
        if v_u_8 ~= nil then
            v_u_14({ 7, p28 * 1000, v_u_5 })
        end
    end
end
function v_u_2.markSchedulerUnsuspended(p29)
    if v_u_3 and v_u_8 ~= nil then
        v_u_14({ 8, p29 * 1000, v_u_5 })
    end
end
return v_u_2