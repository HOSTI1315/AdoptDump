--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler.Tracing (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Set
local v2 = {}
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulerTracing
local v_u_4 = 0
local v_u_5 = 0
local v_u_6, v_u_7
if v_u_3 then
    v_u_6 = {
        ["current"] = v_u_1.new()
    }
    v_u_7 = {
        ["current"] = nil
    }
else
    v_u_6 = nil
    v_u_7 = nil
end
v2.__interactionsRef = v_u_6
v2.__subscriberRef = v_u_7
function v2.unstable_clear(p8)
    if not v_u_3 then
        return p8()
    end
    local v9 = v_u_6.current
    v_u_6.current = v_u_1.new()
    local v10, v11 = pcall(p8)
    v_u_6.current = v9
    if not v10 then
        error(v11)
    end
    return v11
end
function v2.unstable_getCurrent()
    if v_u_3 then
        return v_u_6.current
    else
        return nil
    end
end
function v2.unstable_getThreadID()
    v_u_5 = v_u_5 + 1
    return v_u_5
end
function v2.unstable_trace(p12, p13, p_u_14, p15)
    local v_u_16 = p15 == nil and 0 or p15
    if not v_u_3 then
        return p_u_14()
    end
    local v_u_17 = {
        ["__count"] = 1,
        ["id"] = v_u_4,
        ["name"] = p12,
        ["timestamp"] = p13
    }
    v_u_4 = v_u_4 + 1
    local v18 = v_u_6.current
    local v_u_19 = v_u_1.new(v18)
    v_u_19:add(v_u_17)
    v_u_6.current = v_u_19
    local v_u_20 = v_u_7.current
    local v_u_21 = nil
    local v22, v23 = pcall(function()
        if v_u_20 ~= nil then
            v_u_20.onInteractionTraced(v_u_17)
        end
    end)
    local v24, v25 = pcall(function()
        if v_u_20 ~= nil then
            v_u_20.onWorkStarted(v_u_19, v_u_16)
        end
    end)
    local v26, v27 = pcall(function()
        v_u_21 = p_u_14()
    end)
    v_u_6.current = v18
    local v28, v29 = pcall(function()
        if v_u_20 ~= nil then
            v_u_20.onWorkStopped(v_u_19, v_u_16)
        end
    end)
    v_u_17.__count = v_u_17.__count - 1
    if v_u_20 ~= nil and v_u_17.__count == 0 then
        v_u_20.onInteractionScheduledWorkCompleted(v_u_17)
    end
    if not v28 then
        error(v29)
    end
    if not v26 then
        error(v27)
    end
    if not v24 then
        error(v25)
    end
    if not v22 then
        error(v23)
    end
    return v_u_21
end
function v2.unstable_wrap(p_u_30, p31)
    local v_u_32 = p31 == nil and 0 or p31
    if not v_u_3 then
        return p_u_30
    end
    local v_u_33 = v_u_6.current
    local v_u_34 = v_u_7.current
    if v_u_34 ~= nil then
        v_u_34.onWorkScheduled(v_u_33, v_u_32)
    end
    for _, v35 in v_u_33 do
        v35.__count = v35.__count + 1
    end
    local v_u_36 = false
    local function v40()
        v_u_34 = v_u_7.current
        local v37, v38 = pcall(function()
            if v_u_34 ~= nil then
                v_u_34.onWorkCanceled(v_u_33, v_u_32)
            end
        end)
        for _, v39 in v_u_33 do
            v39.__count = v39.__count - 1
            if v_u_34 ~= nil and v39.__count == 0 then
                v_u_34.onInteractionScheduledWorkCompleted(v39)
            end
        end
        if not v37 then
            error(v38)
        end
    end
    local v41 = {}
    local v51 = {
        ["__call"] = function(_, ...)
            local v_u_42 = v_u_6.current
            v_u_6.current = v_u_33
            v_u_34 = v_u_7.current
            local v48, v49 = pcall(function(...)
                local v_u_43 = nil
                local v44, v45 = pcall(function()
                    if v_u_34 ~= nil then
                        v_u_34.onWorkStarted(v_u_33, v_u_32)
                    end
                end)
                local v46, v47 = pcall(function(...)
                    v_u_43 = p_u_30(...)
                end, ...)
                v_u_6.current = v_u_42
                if v_u_34 ~= nil then
                    v_u_34.onWorkStopped(v_u_33, v_u_32)
                end
                if not v46 then
                    error(v47)
                end
                if not v44 then
                    error(v45)
                end
                return v_u_43
            end, ...)
            if not v_u_36 then
                v_u_36 = true
                for _, v50 in v_u_33 do
                    v50.__count = v50.__count - 1
                    if v_u_34 ~= nil and v50.__count == 0 then
                        v_u_34.onInteractionScheduledWorkCompleted(v50)
                    end
                end
            end
            if not v48 then
                error(v49)
            end
            return v49
        end
    }
    setmetatable(v41, v51)
    v41.cancel = v40
    return v41
end
return v2