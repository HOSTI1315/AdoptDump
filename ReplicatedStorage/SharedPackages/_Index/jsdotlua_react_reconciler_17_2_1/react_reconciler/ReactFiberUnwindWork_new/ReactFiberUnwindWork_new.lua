--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberUnwindWork.new (ModuleScript)

require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v_u_1 = require(script.Parent:WaitForChild("ReactMutableSource.new")).resetWorkInProgressVersions
local v_u_2 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_3 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_4 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local v5 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_6 = v5.enableSuspenseServerRenderer
local v_u_7 = v5.enableProfilerTimer
local v8 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local v_u_9 = v8.popHostContainer
local v_u_10 = v8.popHostContext
local v_u_11 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new")).popSuspenseContext
local v_u_12 = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new")).resetHydrationState
local v13 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local v_u_14 = v13.isContextProvider
local v_u_15 = v13.popContext
local v_u_16 = v13.popTopLevelContextObject
local v_u_17 = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).popProvider
local v_u_18 = nil
local function v_u_19(...)
    if not v_u_18 then
        v_u_18 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new")).popRenderLanes
    end
    return v_u_18(...)
end
local v_u_20 = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).transferActualDuration
local v_u_21 = require(script.Parent.Parent:WaitForChild("shared")).invariant
function unwindInterruptedWork(p22)
    if p22.tag == v_u_2.ClassComponent then
        local v23 = p22.type
        local v24
        if typeof(v23) == "table" then
            v24 = p22.type.childContextTypes
        else
            v24 = nil
        end
        if v24 ~= nil then
            v_u_15(p22)
        end
    elseif p22.tag == v_u_2.HostRoot then
        v_u_9(p22)
        v_u_16(p22)
        v_u_1()
        return
    elseif p22.tag == v_u_2.HostComponent then
        v_u_10(p22)
        return
    elseif p22.tag == v_u_2.HostPortal then
        v_u_9(p22)
        return
    elseif p22.tag == v_u_2.SuspenseComponent then
        v_u_11(p22)
        return
    elseif p22.tag == v_u_2.SuspenseListComponent then
        v_u_11(p22)
        return
    elseif p22.tag == v_u_2.ContextProvider then
        v_u_17(p22)
        return
    elseif p22.tag == v_u_2.OffscreenComponent or p22.tag == v_u_2.LegacyHiddenComponent then
        v_u_19(p22)
    end
end
return {
    ["unwindWork"] = function(p25, _)
        if p25.tag == v_u_2.ClassComponent then
            if v_u_14(p25.type) then
                v_u_15(p25)
            end
            local v26 = p25.flags
            local v27 = v_u_3.ShouldCapture
            if bit32.band(v26, v27) == 0 then
                return nil
            end
            local v28 = v_u_3.ShouldCapture
            local v29 = bit32.bnot(v28)
            local v30 = bit32.band(v26, v29)
            local v31 = v_u_3.DidCapture
            p25.flags = bit32.bor(v30, v31)
            if v_u_7 then
                local v32 = p25.mode
                local v33 = v_u_4.ProfileMode
                if bit32.band(v32, v33) ~= v_u_4.NoMode then
                    v_u_20(p25)
                end
            end
            return p25
        end
        if p25.tag == v_u_2.HostRoot then
            v_u_9(p25)
            v_u_16(p25)
            v_u_1()
            local v34 = p25.flags
            local v35 = v_u_21
            local v36 = v_u_3.DidCapture
            v35(bit32.band(v34, v36) == v_u_3.NoFlags, "The root failed to unmount after an error. This is likely a bug in React. Please file an issue.")
            local v37 = v_u_3.ShouldCapture
            local v38 = bit32.bnot(v37)
            local v39 = bit32.band(v34, v38)
            local v40 = v_u_3.DidCapture
            p25.flags = bit32.bor(v39, v40)
            return p25
        end
        if p25.tag == v_u_2.HostComponent then
            v_u_10(p25)
            return nil
        end
        if p25.tag ~= v_u_2.SuspenseComponent then
            if p25.tag == v_u_2.SuspenseListComponent then
                v_u_11(p25)
                return nil
            end
            if p25.tag == v_u_2.HostPortal then
                v_u_9(p25)
                return nil
            end
            if p25.tag == v_u_2.ContextProvider then
                v_u_17(p25)
                return nil
            end
            if p25.tag ~= v_u_2.OffscreenComponent and p25.tag ~= v_u_2.LegacyHiddenComponent then
                return nil
            end
            v_u_19(p25)
            return nil
        end
        v_u_11(p25)
        if v_u_6 then
            local v41 = p25.memoizedState
            if v41 ~= nil and v41.dehydrated ~= nil then
                v_u_21(p25.alternate ~= nil, "Threw in newly mounted dehydrated component. This is likely a bug in React. Please file an issue.")
                v_u_12()
            end
        end
        local v42 = p25.flags
        local v43 = v_u_3.ShouldCapture
        if bit32.band(v42, v43) == 0 then
            return nil
        end
        local v44 = v_u_3.ShouldCapture
        local v45 = bit32.bnot(v44)
        local v46 = bit32.band(v42, v45)
        local v47 = v_u_3.DidCapture
        p25.flags = bit32.bor(v46, v47)
        if v_u_7 then
            local v48 = p25.mode
            local v49 = v_u_4.ProfileMode
            if bit32.band(v48, v49) ~= v_u_4.NoMode then
                v_u_20(p25)
            end
        end
        return p25
    end,
    ["unwindInterruptedWork"] = unwindInterruptedWork
}