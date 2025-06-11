--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberThrow.new (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local v_u_2 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v3 = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactCapturedValue"))
local v4 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
local v5 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
local v_u_6 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v7 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_8 = v7.ClassComponent
local v_u_9 = v7.HostRoot
local v_u_10 = v7.SuspenseComponent
local v_u_11 = v7.IncompleteClassComponent
local v12 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_13 = v12.DidCapture
local v_u_14 = v12.Incomplete
local v_u_15 = v12.NoFlags
local v_u_16 = v12.ShouldCapture
local v_u_17 = v12.LifecycleEffectMask
local v_u_18 = v12.ForceUpdateForLegacySuspense
local v_u_19 = require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new")).shouldCaptureSuspense
local v20 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local v_u_21 = v20.NoMode
local v_u_22 = v20.BlockingMode
local v_u_23 = v20.DebugTracingMode
local v24 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_25 = v24.enableDebugTracing
local v_u_26 = v24.enableSchedulingProfiler
local v_u_27 = require(script.Parent:WaitForChild("ReactCapturedValue")).createCapturedValue
local v_u_28 = v4.enqueueCapturedUpdate
local v_u_29 = v4.createUpdate
local v_u_30 = v4.CaptureUpdate
local v_u_31 = v4.ForceUpdate
local v_u_32 = v4.enqueueUpdate
local v_u_33 = require(script.Parent["ReactFiberHotReloading.new"]).markFailedErrorBoundaryForHotReloading
local v_u_34 = v5.hasSuspenseContext
local v_u_35 = v5.InvisibleParentSuspenseContext
local v_u_36 = v5.suspenseStackCursor
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = nil
local function v_u_41(...)
    if not v_u_38 then
        v_u_37 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
        v_u_38 = v_u_37.markLegacyErrorBoundaryAsFailed
    end
    return v_u_38(...)
end
local function v_u_42(...)
    if v_u_37 == nil then
        v_u_37 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    v_u_40 = v_u_37.pingSuspendedRoot
    return v_u_40(...)
end
local function v_u_43(...)
    if v_u_37 == nil then
        v_u_37 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    v_u_39 = v_u_37.isAlreadyFailedLegacyErrorBoundary
    return v_u_39(...)
end
local v_u_44 = require(script.Parent:WaitForChild("ReactFiberErrorLogger")).logCapturedError
local v_u_45 = require(script.Parent:WaitForChild("DebugTracing")).logComponentSuspended
local v_u_46 = require(script.Parent:WaitForChild("SchedulingProfiler")).markComponentSuspended
local v_u_47 = v3.SyncLane
local v_u_48 = v3.NoTimestamp
local v_u_49 = v3.includesSomeLane
local v_u_50 = v3.mergeLanes
local v_u_51 = v3.pickArbitraryLane
function createRootErrorUpdate(p_u_52, p_u_53, p54, p_u_55)
    local v56 = v_u_29(v_u_48, p54)
    v56.tag = v_u_30
    v56.payload = {
        ["element"] = v_u_1.None
    }
    local v_u_57 = p_u_53.value
    function v56.callback()
        if p_u_55 ~= nil then
            p_u_55(v_u_57)
        end
        v_u_44(p_u_52, p_u_53)
    end
    return v56
end
function createClassErrorUpdate(p_u_58, p_u_59, p60)
    local v61 = v_u_29(v_u_48, p60)
    v61.tag = v_u_30
    local v_u_62 = p_u_58.type.getDerivedStateFromError
    if typeof(v_u_62) == "function" then
        local v_u_63 = p_u_59.value
        function v61.payload()
            v_u_44(p_u_58, p_u_59)
            return v_u_62(v_u_63)
        end
    end
    local v_u_64 = p_u_58.stateNode
    if v_u_64 ~= nil then
        local v65 = v_u_64.componentDidCatch
        if typeof(v65) == "function" then
            function v61.callback()
                if _G.__DEV__ then
                    v_u_33(p_u_58)
                end
                local v66 = v_u_62
                if typeof(v66) ~= "function" then
                    v_u_41(v_u_64)
                    v_u_44(p_u_58, p_u_59)
                end
                v_u_64:componentDidCatch(p_u_59.value, {
                    ["componentStack"] = p_u_59.stack or ""
                })
                if _G.__DEV__ then
                    local v67 = v_u_62
                    if typeof(v67) ~= "function" and not v_u_49(p_u_58.lanes, v_u_47) then
                        v_u_2.error("%s: Error boundaries should implement getDerivedStateFromError(). In that method, return a state update to display an error message or fallback UI.", v_u_6(p_u_58.type) or "Unknown")
                    end
                end
            end
            return v61
        end
    end
    if _G.__DEV__ then
        function v61.callback()
            v_u_33(p_u_58)
        end
    end
    return v61
end
local function v_u_74(p_u_68, p_u_69, p_u_70)
    local v71 = p_u_68.pingCache
    local v72
    if v71 == nil then
        v72 = {}
        p_u_68.pingCache = {
            [p_u_69] = v72
        }
        local _ = p_u_68.pingCache
    else
        v72 = v71[p_u_69]
        if v72 == nil then
            v72 = {}
            v71[p_u_69] = v72
        end
    end
    if not v72[p_u_70] then
        v72[p_u_70] = true
        local function v73()
            return v_u_42(p_u_68, p_u_69, p_u_70)
        end
        p_u_69:andThen(v73, v73)
    end
end
function throwException()
    -- failed to decompile
end
return {
    ["throwException"] = throwException,
    ["createRootErrorUpdate"] = createRootErrorUpdate,
    ["createClassErrorUpdate"] = createClassErrorUpdate
}