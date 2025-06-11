--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactProfilerTimer.new (ModuleScript)

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_2 = v1.enableProfilerTimer
local v_u_3 = v1.enableProfilerCommitHooks
local v_u_4 = require(script.Parent:WaitForChild("ReactWorkTags")).Profiler
local v_u_5 = require(script.Parent.Parent:WaitForChild("scheduler")).unstable_now
local v_u_6 = 0
local v_u_7 = -1
local v_u_8 = -1
local v_u_9 = -1
function getCommitTime()
    return v_u_6
end
function recordCommitTime()
    if v_u_2 then
        v_u_6 = v_u_5()
    end
end
function startProfilerTimer(p10)
    if v_u_2 then
        v_u_8 = v_u_5()
        if p10.actualStartTime ~= nil and p10.actualStartTime < 0 then
            p10.actualStartTime = v_u_5()
        end
    end
end
function stopProfilerTimerIfRunning(_)
    if v_u_2 then
        v_u_8 = -1
    end
end
function stopProfilerTimerIfRunningAndRecordDelta(p11, p12)
    if v_u_2 then
        if v_u_8 >= 0 then
            local v13 = v_u_5() - v_u_8
            p11.actualDuration = p11.actualDuration + v13
            if p12 then
                p11.selfBaseDuration = v13
            end
            v_u_8 = -1
        end
    end
end
function recordLayoutEffectDuration(p14)
    if v_u_2 and v_u_3 then
        if v_u_7 >= 0 then
            local v15 = v_u_5() - v_u_7
            v_u_7 = -1
            local v16 = p14.return_
            while v16 ~= nil do
                if v16.tag == v_u_4 then
                    local v17 = v16.stateNode
                    v17.effectDuration = v17.effectDuration + v15
                    return
                end
                v16 = v16.return_
            end
        end
    end
end
function recordPassiveEffectDuration(p18)
    if not (v_u_2 and v_u_3) then
        return
    end
    if v_u_9 >= 0 then
        local v19 = v_u_5() - v_u_9
        v_u_9 = -1
        local v20 = p18.return_
        while v20 ~= nil do
            if v20.tag == v_u_4 then
                local v21 = v20.stateNode
                if v21 ~= nil then
                    v21.passiveEffectDuration = v21.passiveEffectDuration + v19
                    return
                end
                break
            end
            v20 = v20.return_
        end
    end
end
function startLayoutEffectTimer()
    if v_u_2 and v_u_3 then
        v_u_7 = v_u_5()
    end
end
function startPassiveEffectTimer()
    if v_u_2 and v_u_3 then
        v_u_9 = v_u_5()
    end
end
function transferActualDuration(p22)
    local v23 = p22.child
    while v23 do
        p22.actualDuration = p22.actualDuration + v23.actualDuration
        v23 = v23.sibling
    end
end
return {
    ["getCommitTime"] = getCommitTime,
    ["recordCommitTime"] = recordCommitTime,
    ["recordLayoutEffectDuration"] = recordLayoutEffectDuration,
    ["recordPassiveEffectDuration"] = recordPassiveEffectDuration,
    ["startLayoutEffectTimer"] = startLayoutEffectTimer,
    ["startPassiveEffectTimer"] = startPassiveEffectTimer,
    ["startProfilerTimer"] = startProfilerTimer,
    ["stopProfilerTimerIfRunning"] = stopProfilerTimerIfRunning,
    ["stopProfilerTimerIfRunningAndRecordDelta"] = stopProfilerTimerIfRunningAndRecordDelta,
    ["transferActualDuration"] = transferActualDuration
}