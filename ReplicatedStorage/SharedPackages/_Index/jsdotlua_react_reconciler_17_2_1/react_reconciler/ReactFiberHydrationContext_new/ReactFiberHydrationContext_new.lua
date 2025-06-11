--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHydrationContext.new (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v3 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_4 = v3.HostComponent
local v_u_5 = v3.HostText
local v_u_6 = v3.HostRoot
local v_u_7 = v3.SuspenseComponent
local v8 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_9 = v8.Placement
local v_u_10 = v8.Hydrating
local v_u_11 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_12 = require(script.Parent:WaitForChild("ReactFiber.new")).createFiberFromDehydratedFragment
local v_u_13 = v2.supportsHydration
local v_u_14 = v2.getNextHydratableSibling
local v_u_15 = v2.getFirstHydratableChild
local v_u_16 = v2.canHydrateInstance
local v_u_17 = v2.canHydrateTextInstance
local v_u_18 = v2.canHydrateSuspenseInstance
local v_u_19 = v2.hydrateInstance
local v_u_20 = v2.hydrateTextInstance
local v_u_21 = v2.hydrateSuspenseInstance
local v_u_22 = v2.getNextHydratableInstanceAfterSuspenseInstance
local v_u_23 = v2.didNotMatchHydratedContainerTextInstance
local v_u_24 = v2.didNotMatchHydratedTextInstance
local v_u_25 = v2.shouldSetTextContent
local v_u_26 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSuspenseServerRenderer
local v_u_27 = require(script.Parent:WaitForChild("ReactFiberLane")).OffscreenLane
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = false
function warnIfHydrating()
    if _G.__DEV__ and v_u_30 then
        v_u_1.error("We should not be hydrating here. This is a bug in React. Please file a bug.")
    end
end
function enterHydrationState(p31)
    if not v_u_13 then
        return false
    end
    v_u_29 = v_u_15(p31.stateNode.containerInfo)
    v_u_28 = p31
    v_u_30 = true
    return true
end
function reenterHydrationStateFromDehydratedSuspenseInstance(p32, p33)
    if not v_u_13 then
        return false
    end
    v_u_29 = v_u_14(p33)
    popToNextHostParent(p32)
    v_u_30 = true
    return true
end
function deleteHydratableInstance(_, _)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: deleteHydratableInstance")
    error("FIXME (roblox): deleteHydratableInstance is unimplemented", 2)
end
function insertNonHydratedInstance(_, p34)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: insertNonHydratedInstance")
    error("FIXME (roblox): insertNonHydratedInstance is unimplemented", 2)
    local v35 = p34.flags
    local v36 = v_u_10
    local v37 = bit32.bnot(v36)
    local v38 = bit32.band(v35, v37)
    local v39 = v_u_9
    p34.flags = bit32.bor(v38, v39)
    local _ = _G.__DEV__
end
function tryHydrate(p40, p41)
    if p40.tag == v_u_4 then
        local v42 = v_u_16(p41, p40.type, p40.pendingProps)
        if v42 == nil then
            return false
        end
        p40.stateNode = v42
        return true
    end
    if p40.tag ~= v_u_5 then
        if p40.tag ~= v_u_7 then
            return false
        end
        if v_u_26 then
            local v43 = v_u_18(p41)
            if v43 ~= nil then
                p40.memoizedState = {
                    ["dehydrated"] = v43,
                    ["retryLane"] = v_u_27
                }
                local v44 = v_u_12(v43)
                v44.return_ = p40
                p40.child = v44
                return true
            end
        end
        return false
    end
    local v45 = v_u_17(p41, p40.pendingProps)
    if v45 == nil then
        return false
    end
    p40.stateNode = v45
    return true
end
function tryToClaimNextHydratableInstance(p46)
    if v_u_30 then
        local v47 = v_u_29
        if v47 then
            local v48
            if tryHydrate(p46, v47) then
                v48 = v47
            else
                v48 = v_u_14(v47)
                if not (v48 and tryHydrate(p46, v48)) then
                    insertNonHydratedInstance(v_u_28, p46)
                    v_u_30 = false
                    v_u_28 = p46
                    return
                end
                deleteHydratableInstance(v_u_28, v47)
            end
            v_u_28 = p46
            v_u_29 = v_u_15(v48)
        else
            insertNonHydratedInstance(v_u_28, p46)
            v_u_30 = false
            v_u_28 = p46
        end
    else
        return
    end
end
function prepareToHydrateHostInstance(p49, p50, p51)
    if not v_u_13 then
        v_u_11(false, "Expected prepareToHydrateHostInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
    end
    local v52 = v_u_19(p49.stateNode, p49.type, p49.memoizedProps, p50, p51, p49)
    p49.updateQueue = v52
    return v52 ~= nil
end
function prepareToHydrateHostTextInstance(p53)
    if not v_u_13 then
        v_u_11(false, "Expected prepareToHydrateHostTextInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
    end
    local v54 = p53.stateNode
    local v55 = p53.memoizedProps
    local v56 = v_u_20(v54, v55, p53)
    if _G.__DEV__ and v56 then
        local v57 = v_u_28
        if v57 ~= nil then
            if v57.tag == v_u_6 then
                v_u_23(v57.stateNode.containerInfo, v54, v55)
                return v56
            end
            if v57.tag == v_u_4 then
                v_u_24(v57.type, v57.memoizedProps, v57.stateNode, v54, v55)
            end
        end
    end
    return v56
end
function prepareToHydrateHostSuspenseInstance(p58)
    if not v_u_13 then
        v_u_11(false, "Expected prepareToHydrateHostSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
    end
    local v59 = p58.memoizedState
    local v60
    if v59 == nil then
        v60 = nil
    else
        v60 = v59.dehydrated
    end
    v_u_11(v60, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
    v_u_21(v60, p58)
end
function skipPastDehydratedSuspenseInstance(p61)
    if not v_u_13 then
        v_u_11(false, "Expected skipPastDehydratedSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
    end
    local v62 = p61.memoizedState
    local v63
    if v62 == nil then
        v63 = nil
    else
        v63 = v62.dehydrated
    end
    v_u_11(v63, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
    return v_u_22(v63)
end
function popToNextHostParent(p64)
    local v65 = p64.return_
    while v65 ~= nil and (v65.tag ~= v_u_4 and (v65.tag ~= v_u_6 and v65.tag ~= v_u_7)) do
        v65 = v65.return_
    end
    v_u_28 = v65
end
function popHydrationState(p66)
    if not v_u_13 then
        return false
    end
    if p66 ~= v_u_28 then
        return false
    end
    if not v_u_30 then
        popToNextHostParent(p66)
        v_u_30 = true
        return false
    end
    local v67 = p66.type
    if p66.tag ~= v_u_4 or v67 ~= "head" and (v67 ~= "body" and not v_u_25(v67, p66.memoizedProps)) then
        local v68 = v_u_29
        while v68 do
            deleteHydratableInstance(p66, v68)
            v68 = v_u_14(v68)
        end
    end
    popToNextHostParent(p66)
    if p66.tag == v_u_7 then
        v_u_29 = skipPastDehydratedSuspenseInstance(p66)
    elseif v_u_28 then
        v_u_29 = v_u_14(p66.stateNode)
    else
        v_u_29 = nil
    end
    return true
end
function resetHydrationState()
    if v_u_13 then
        v_u_28 = nil
        v_u_29 = nil
        v_u_30 = false
    end
end
function getIsHydrating()
    return v_u_30
end
return {
    ["warnIfHydrating"] = warnIfHydrating,
    ["enterHydrationState"] = enterHydrationState,
    ["getIsHydrating"] = getIsHydrating,
    ["reenterHydrationStateFromDehydratedSuspenseInstance"] = reenterHydrationStateFromDehydratedSuspenseInstance,
    ["resetHydrationState"] = resetHydrationState,
    ["tryToClaimNextHydratableInstance"] = tryToClaimNextHydratableInstance,
    ["prepareToHydrateHostInstance"] = prepareToHydrateHostInstance,
    ["prepareToHydrateHostTextInstance"] = prepareToHydrateHostTextInstance,
    ["prepareToHydrateHostSuspenseInstance"] = prepareToHydrateHostSuspenseInstance,
    ["popHydrationState"] = popHydrationState
}