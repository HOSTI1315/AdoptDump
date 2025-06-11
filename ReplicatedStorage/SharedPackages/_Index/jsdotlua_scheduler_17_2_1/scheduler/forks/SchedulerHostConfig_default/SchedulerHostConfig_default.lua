--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler.forks.SchedulerHostConfig.default (ModuleScript)

local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = v1.Object
local v3 = require(script.Parent.Parent.Parent:WaitForChild("shared"))
local v_u_4 = v3.console
local v_u_5 = v3.errorToString
local v_u_6 = v3.describeError
local v_u_7 = v1.setTimeout
local v_u_8 = v1.clearTimeout
local v_u_9 = false
local v_u_10 = nil
local v_u_11 = v_u_2.None
local v_u_12 = 15
local v_u_13 = 0
local function v14()
    return v_u_13 <= os.clock() * 1000
end
local function v17(p15)
    if p15 < 0 or p15 > 125 then
        v_u_4.warn("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported")
        return
    elseif p15 > 0 then
        local v16 = 1000 / p15
        v_u_12 = math.floor(v16)
    else
        v_u_12 = 5
    end
end
local function v_u_22()
    if v_u_10 == nil then
        v_u_9 = false
    else
        local v_u_18 = os.clock() * 1000
        v_u_13 = v_u_18 + v_u_12
        local function v19()
            if v_u_10(true, v_u_18) then
                task.delay(0, v_u_22)
            else
                v_u_9 = false
                v_u_10 = nil
            end
            return nil
        end
        local v20, v21
        if _G.__YOLO__ then
            if v_u_10(true, v_u_18) then
                task.delay(0, v_u_22)
                v20 = true
                v21 = nil
            else
                v_u_9 = false
                v_u_10 = nil
                v20 = true
                v21 = nil
            end
        else
            v20, v21 = xpcall(v19, v_u_6)
        end
        if not v20 then
            task.delay(0, v_u_22)
            error(v_u_5(v21))
            return
        end
    end
end
local v_u_23 = v_u_22
local v_u_27 = coroutine.create(function()
    while true do
        local v24 = coroutine.wrap(v_u_23)
        local v25, v26 = pcall(v24)
        coroutine.yield(v25, v26)
    end
end)
v_u_22 = function()
    local _, v28, v29 = coroutine.resume(v_u_27)
    if not v28 then
        error(v29)
    end
end
return {
    ["requestHostCallback"] = function(p30)
        v_u_10 = p30
        if not v_u_9 then
            v_u_9 = true
            task.delay(0, v_u_22)
        end
    end,
    ["cancelHostCallback"] = function()
        v_u_10 = nil
    end,
    ["requestHostTimeout"] = function(p_u_31, p32)
        v_u_11 = v_u_7(function()
            p_u_31(os.clock() * 1000)
        end, p32)
    end,
    ["cancelHostTimeout"] = function()
        v_u_8(v_u_11)
        v_u_11 = v_u_2.None
    end,
    ["shouldYieldToHost"] = v14,
    ["requestPaint"] = function() end,
    ["getCurrentTime"] = function()
        return os.clock() * 1000
    end,
    ["forceFrameRate"] = v17
}