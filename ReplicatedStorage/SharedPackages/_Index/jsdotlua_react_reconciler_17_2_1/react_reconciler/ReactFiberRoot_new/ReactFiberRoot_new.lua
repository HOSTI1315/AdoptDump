--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberRoot.new (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = v1.Set
local v_u_3 = v1.Map
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v4 = require(script.Parent:WaitForChild("ReactRootTags"))
local v5 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local v_u_6 = v5.noTimeout
local v_u_7 = v5.supportsHydration
local v_u_8 = require(script.Parent:WaitForChild("ReactFiber.new")).createHostRootFiber
local v9 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v_u_10 = v9.NoLanes
local v_u_11 = v9.NoLanePriority
local v_u_12 = v9.NoTimestamp
local v_u_13 = v9.createLaneMap
local v14 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_15 = v14.enableSchedulerTracing
local v_u_16 = v14.enableSuspenseCallback
local v_u_17 = require(script.Parent.Parent:WaitForChild("scheduler")).tracing.unstable_getThreadID
local v_u_18 = require(script.Parent:WaitForChild("ReactUpdateQueue.new")).initializeUpdateQueue
local v_u_19 = v4.LegacyRoot
local v_u_20 = v4.BlockingRoot
local v_u_21 = v4.ConcurrentRoot
local v22 = {}
local function v_u_27(p23, p24, p25)
    local v26 = {
        ["tag"] = p24,
        ["containerInfo"] = p23,
        ["pendingChildren"] = nil,
        ["current"] = nil,
        ["pingCache"] = nil,
        ["finishedWork"] = nil,
        ["timeoutHandle"] = v_u_6,
        ["context"] = nil,
        ["pendingContext"] = nil,
        ["hydrate"] = p25,
        ["callbackNode"] = nil,
        ["callbackPriority"] = v_u_11,
        ["eventTimes"] = v_u_13(v_u_10),
        ["expirationTimes"] = v_u_13(v_u_12),
        ["pendingLanes"] = v_u_10,
        ["suspendedLanes"] = v_u_10,
        ["pingedLanes"] = v_u_10,
        ["expiredLanes"] = v_u_10,
        ["mutableReadLanes"] = v_u_10,
        ["finishedLanes"] = v_u_10,
        ["entangledLanes"] = v_u_10,
        ["entanglements"] = v_u_13(v_u_10)
    }
    if v_u_7 then
        v26.mutableSourceEagerHydrationData = nil
    end
    if v_u_15 then
        v26.interactionThreadID = v_u_17()
        v26.memoizedInteractions = v_u_2.new()
        v26.pendingInteractionMap = v_u_3.new()
    end
    if v_u_16 then
        v26.hydrationCallbacks = nil
    end
    if _G.__DEV__ then
        if p24 == v_u_20 then
            v26._debugRootType = "createBlockingRoot()"
            return v26
        end
        if p24 == v_u_21 then
            v26._debugRootType = "createRoot()"
            return v26
        end
        if p24 == v_u_19 then
            v26._debugRootType = "createLegacyRoot()"
        end
    end
    return v26
end
function v22.createFiberRoot(p28, p29, p30, p31)
    local v32 = v_u_27(p28, p29, p30)
    if v_u_16 then
        v32.hydrationCallbacks = p31
    end
    local v33 = v_u_8(p29)
    v32.current = v33
    v33.stateNode = v32
    v_u_18(v33)
    return v32
end
return v22