--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.SchedulerWithReactIntegration.new (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = require(script.Parent.Parent:WaitForChild("scheduler"))
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.decoupleUpdatePriorityFromScheduler
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_5 = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v6 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v_u_7 = v6.SyncLanePriority
local v_u_8 = v6.getCurrentUpdateLanePriority
local v_u_9 = v6.setCurrentUpdateLanePriority
local v_u_10 = v2.unstable_runWithPriority
local v_u_11 = v2.unstable_scheduleCallback
local v_u_12 = v2.unstable_cancelCallback
local v13 = v2.unstable_shouldYield
local v14 = v2.unstable_requestPaint
local v_u_15 = v2.unstable_now
local v_u_16 = v2.unstable_getCurrentPriorityLevel
local v_u_17 = v2.unstable_ImmediatePriority
local v_u_18 = v2.unstable_UserBlockingPriority
local v_u_19 = v2.unstable_NormalPriority
local v_u_20 = v2.unstable_LowPriority
local v_u_21 = v2.unstable_IdlePriority
local v22 = require(script.Parent:WaitForChild("ReactFiberSchedulerPriorities.roblox"))
local v_u_23 = v22.ImmediatePriority
local v_u_24 = v22.UserBlockingPriority
local v_u_25 = v22.NormalPriority
local v_u_26 = v22.LowPriority
local v_u_27 = v22.IdlePriority
local v_u_28 = v22.NoPriority
local v_u_29 = nil
local v_u_30 = {}
local v31 = v14 == nil and function() end or v14
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = false
local v_u_35 = v_u_15()
function reactPriorityToSchedulerPriority(p36)
    if p36 == v_u_23 then
        return v_u_17
    end
    if p36 == v_u_24 then
        return v_u_18
    end
    if p36 == v_u_25 then
        return v_u_19
    end
    if p36 == v_u_26 then
        return v_u_20
    end
    if p36 == v_u_27 then
        return v_u_21
    end
    v_u_4(false, "Unknown priority level.")
    return nil
end
local function v_u_39(p37, p38)
    return v_u_10(reactPriorityToSchedulerPriority(p37), p38)
end
local function v42(p40)
    if v_u_32 == nil then
        v_u_32 = { p40 }
        v_u_33 = v_u_11(v_u_17, v_u_29)
    else
        local v41 = v_u_32
        table.insert(v41, p40)
    end
    return v_u_30
end
local function v_u_44()
    if v_u_33 ~= nil then
        local v43 = v_u_33
        v_u_33 = nil
        v_u_12(v43)
    end
    return v_u_29()
end
local function _()
    if v_u_34 or v_u_32 == nil then
        return false
    end
    v_u_34 = true
    local v_u_45 = 1
    if v_u_3 then
        local v46 = v_u_8()
        local v47 = nil
        local v48
        if _G.__YOLO__ then
            v48 = true
            local v_u_49 = v_u_32
            v_u_9(v_u_7)
            local v50 = v_u_23
            v_u_10(reactPriorityToSchedulerPriority(v50), function()
                for v51, v53 in v_u_49 do
                    v_u_45 = v51
                    repeat
                        local v53 = v53(true)
                    until v53 == nil
                    v_u_45 = v_u_45 + 1
                end
            end)
            v_u_32 = nil
        else
            local v_u_54 = v_u_32
            v_u_9(v_u_7)
            v48, v47 = xpcall(v_u_39, v_u_5, v_u_23, function()
                for v55, v57 in v_u_54 do
                    v_u_45 = v55
                    repeat
                        local v57 = v57(true)
                    until v57 == nil
                end
            end)
            v_u_32 = nil
        end
        v_u_9(v46)
        v_u_34 = false
        if not v48 then
            if v_u_32 ~= nil then
                v_u_32 = v_u_1.slice(v_u_32, v_u_45 + 1)
            end
            v_u_11(v_u_17, v_u_44)
            error(v47)
        end
    else
        local v58 = nil
        local v59
        if _G.__YOLO__ then
            v59 = true
            local v_u_60 = v_u_32
            local v61 = v_u_23
            v_u_10(reactPriorityToSchedulerPriority(v61), function()
                for v62, v64 in v_u_60 do
                    v_u_45 = v62
                    repeat
                        local v64 = v64(true)
                    until v64 == nil
                end
            end)
            v_u_32 = nil
        else
            local v_u_65 = v_u_32
            v59, v58 = xpcall(v_u_39, v_u_5, v_u_23, function()
                for v66, v68 in v_u_65 do
                    v_u_45 = v66
                    repeat
                        local v68 = v68(true)
                    until v68 == nil
                end
            end)
            v_u_32 = nil
        end
        v_u_34 = false
        if not v59 then
            if v_u_32 ~= nil then
                v_u_32 = v_u_1.slice(v_u_32, v_u_45 + 1)
            end
            v_u_11(v_u_17, v_u_44)
            error(v58)
        end
    end
    return true
end
return {
    ["ImmediatePriority"] = v_u_23,
    ["UserBlockingPriority"] = v_u_24,
    ["NormalPriority"] = v_u_25,
    ["LowPriority"] = v_u_26,
    ["IdlePriority"] = v_u_27,
    ["NoPriority"] = v_u_28,
    ["getCurrentPriorityLevel"] = function()
        local v69 = v_u_16()
        if v69 == v_u_17 then
            return v_u_23
        end
        if v69 == v_u_18 then
            return v_u_24
        end
        if v69 == v_u_19 then
            return v_u_25
        end
        if v69 == v_u_20 then
            return v_u_26
        end
        if v69 == v_u_21 then
            return v_u_27
        end
        v_u_4(false, "Unknown priority level.")
        return v_u_28
    end,
    ["flushSyncCallbackQueue"] = v_u_44,
    ["runWithPriority"] = v_u_39,
    ["scheduleCallback"] = function(p70, p71, p72)
        return v_u_11(reactPriorityToSchedulerPriority(p70), p71, p72)
    end,
    ["scheduleSyncCallback"] = v42,
    ["cancelCallback"] = function(p73)
        if p73 ~= v_u_30 then
            v_u_12(p73)
        end
    end,
    ["now"] = function()
        return v_u_15() - v_u_35
    end,
    ["requestPaint"] = v31,
    ["shouldYield"] = v13
}