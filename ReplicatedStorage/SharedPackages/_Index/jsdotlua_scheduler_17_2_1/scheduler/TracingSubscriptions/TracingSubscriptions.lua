--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler.TracingSubscriptions (ModuleScript)

local v1 = {}
local v_u_2 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local v3 = require(script.Parent:WaitForChild("Tracing"))
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulerTracing
local v_u_5 = v3.__subscriberRef
local v_u_6 = {}
function v1.unstable_subscribe(p7)
    if v_u_4 then
        v_u_6[p7] = true
        if #v_u_2.keys(v_u_6) == 1 then
            v_u_5.current = {
                ["onInteractionScheduledWorkCompleted"] = onInteractionScheduledWorkCompleted,
                ["onInteractionTraced"] = onInteractionTraced,
                ["onWorkCanceled"] = onWorkCanceled,
                ["onWorkScheduled"] = onWorkScheduled,
                ["onWorkStarted"] = onWorkStarted,
                ["onWorkStopped"] = onWorkStopped
            }
        end
    end
end
function v1.unstable_unsubscribe(p8)
    if v_u_4 then
        v_u_6[p8] = nil
        if #v_u_2.keys(v_u_6) == 0 then
            v_u_5.current = nil
        end
    end
end
function onInteractionTraced(p9)
    local v10 = false
    local v11 = nil
    for v12, _ in v_u_6 do
        local v13, v14 = pcall(v12.onInteractionTraced, p9)
        if not (v13 or v10) then
            v11 = v14
            v10 = true
        end
    end
    if v10 then
        error(v11)
    end
end
function onInteractionScheduledWorkCompleted(p15)
    local v16 = false
    local v17 = nil
    for v18, _ in v_u_6 do
        local v19, v20 = pcall(v18.onInteractionScheduledWorkCompleted, p15)
        if not (v19 or v16) then
            v17 = v20
            v16 = true
        end
    end
    if v16 then
        error(v17)
    end
end
function onWorkScheduled(p21, p22)
    local v23 = false
    local v24 = nil
    for v25, _ in v_u_6 do
        local v26, v27 = pcall(v25.onWorkScheduled, p21, p22)
        if not (v26 or v23) then
            v24 = v27
            v23 = true
        end
    end
    if v23 then
        error(v24)
    end
end
function onWorkStarted(p28, p29)
    local v30 = false
    local v31 = nil
    for v32, _ in v_u_6 do
        local v33, v34 = pcall(v32.onWorkStarted, p28, p29)
        if not (v33 or v30) then
            v31 = v34
            v30 = true
        end
    end
    if v30 then
        error(v31)
    end
end
function onWorkStopped(p35, p36)
    local v37 = false
    local v38 = nil
    for v39, _ in v_u_6 do
        local v40, v41 = pcall(v39.onWorkStopped, p35, p36)
        if not (v40 or v37) then
            v38 = v41
            v37 = true
        end
    end
    if v37 then
        error(v38)
    end
end
function onWorkCanceled(p42, p43)
    local v44 = false
    local v45 = nil
    for v46, _ in v_u_6 do
        local v47, v48 = pcall(v46.onWorkCanceled, p42, p43)
        if not (v47 or v44) then
            v45 = v48
            v44 = true
        end
    end
    if v44 then
        error(v45)
    end
end
return v1