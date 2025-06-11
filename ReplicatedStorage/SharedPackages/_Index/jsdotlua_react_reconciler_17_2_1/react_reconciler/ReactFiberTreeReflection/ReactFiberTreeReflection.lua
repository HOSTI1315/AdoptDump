--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberTreeReflection (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v_u_2 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap.get
local v4 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals
local v_u_5 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v6 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_7 = v6.ClassComponent
local v_u_8 = v6.HostComponent
local v_u_9 = v6.HostRoot
local v_u_10 = v6.HostPortal
local v_u_11 = v6.HostText
local v_u_12 = v6.FundamentalComponent
local v_u_13 = v6.SuspenseComponent
local v14 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_15 = v14.NoFlags
local v_u_16 = v14.Placement
local v_u_17 = v14.Hydrating
local v_u_18 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableFundamentalAPI
local v_u_19 = v4.ReactCurrentOwner
local v20 = {}
local function v_u_28(p21)
    local v22
    if p21.alternate then
        v22 = p21
        while p21.return_ do
            p21 = p21.return_
        end
    else
        v22 = p21
        while true do
            local v23 = p21.flags
            local v24 = v_u_16
            local v25 = v_u_17
            local v26 = bit32.bor(v24, v25)
            if bit32.band(v23, v26) ~= v_u_15 then
                v22 = p21.return_
            end
            local v27 = p21.return_
            if not v27 then
                break
            end
            p21 = v27
        end
    end
    if p21.tag == v_u_9 then
        return v22
    else
        return nil
    end
end
v20.getNearestMountedFiber = v_u_28
function v20.getSuspenseInstanceFromFiber(p29)
    if p29.tag == v_u_13 then
        local v30 = p29.memoizedState
        if v30 == nil then
            local v31 = p29.alternate
            if v31 ~= nil then
                v30 = v31.memoizedState
            end
        end
        if v30 then
            return v30.dehydrated
        end
    end
    return nil
end
function v20.getContainerFromFiber(p32)
    if p32.tag == v_u_9 then
        return p32.stateNode.containerInfo
    else
        return nil
    end
end
function v20.isFiberMounted(p33)
    return v_u_28(p33) == p33
end
function v20.isMounted(p34)
    if _G.__DEV__ then
        local v35 = v_u_19.current
        if v35 ~= nil and v35.tag == v_u_7 then
            local v36 = v35.stateNode
            if not v36._warnedAboutRefsInRender then
                v_u_1.error("%s is accessing isMounted inside its render() function. render() should be a pure function of props and state. It should never access something that requires stale data from the previous render, such as refs. Move this logic to componentDidMount and componentDidUpdate instead.", v_u_5(v35.type) or "A component")
            end
            v36._warnedAboutRefsInRender = true
        end
    end
    local v37 = v_u_3(p34)
    if v37 then
        return v_u_28(v37) == v37
    else
        return false
    end
end
local function v_u_50(p38)
    local v39 = p38.alternate
    if not v39 then
        local v40 = v_u_28(p38)
        v_u_2(v40 ~= nil, "Unable to find node on an unmounted component.")
        if v40 == p38 then
            return p38
        else
            return nil
        end
    end
    local v41 = v39
    local v42 = p38
    while true do
        local v43 = p38.return_
        if v43 == nil then
            break
        end
        local v44 = v43.alternate
        if v44 == nil then
            v43 = v43.return_
            if v43 == nil then
                break
            end
            v44 = v43
        else
            if v43.child == v44.child then
                local v45 = v43.child
                while v45 do
                    if v45 == p38 then
                        v_u_2(v_u_28(v43) == v43, "Unable to find node on an unmounted component.")
                        return v42
                    end
                    if v45 == v39 then
                        v_u_2(v_u_28(v43) == v43, "Unable to find node on an unmounted component.")
                        return v41
                    end
                    v45 = v45.sibling
                end
                v_u_2(false, "Unable to find node on an unmounted component.")
            end
            if p38.return_ == v39.return_ then
                local v46 = v43.child
                local v47 = false
                while v46 do
                    if v46 == p38 then
                        v39 = v44
                        p38 = v43
                        v47 = true
                        break
                    end
                    if v46 == v39 then
                        v39 = v43
                        p38 = v44
                        v47 = true
                        break
                    end
                    v46 = v46.sibling
                end
                if v47 then
                    v44 = v39
                    v43 = p38
                else
                    local v48 = v44.child
                    while true do
                        if not v48 then
                            v44 = v39
                            v43 = p38
                            break
                        end
                        if v48 == p38 then
                            local v49 = v44
                            v44 = v43
                            v43 = v49
                            v47 = true
                            break
                        end
                        if v48 == v39 then
                            v47 = true
                            break
                        end
                        v48 = v48.sibling
                    end
                    v_u_2(v47, "Child was not found in either parent set. This indicates a bug in React related to the return pointer. Please file an issue.")
                end
            end
            v_u_2(v43.alternate == v44, "Return fibers should always be each others\' alternates. This error is likely caused by a bug in React. Please file an issue.")
        end
        v39 = v44
        p38 = v43
    end
    v_u_2(p38.tag == v_u_9, "Unable to find node on an unmounted component.")
    if p38.stateNode.current == p38 then
        return v42
    else
        return v41
    end
end
v20.findCurrentFiberUsingSlowPath = v_u_50
function v20.findCurrentHostFiber(p51)
    local v52 = v_u_50(p51)
    if not v52 then
        return nil
    end
    local v53 = v52
    while true do
        local v54 = v52.child
        if v52.tag == v_u_8 or v52.tag == v_u_11 then
            break
        end
        if v54 then
            v54.return_ = v52
        else
            if v52 == v53 then
                return nil
            end
            local v55 = v52.return_
            v54 = v52.sibling
            while not v54 do
                if not v55 or v55 == v53 then
                    return nil
                end
            end
            v54.return_ = v55
        end
        v52 = v54
    end
    return v52
end
function v20.findCurrentHostFiberWithNoPortals(p56)
    local v57 = v_u_50(p56)
    if not v57 then
        return nil
    end
    local v58 = v57
    while true do
        local v59 = v57.child
        if v57.tag == v_u_8 or (v57.tag == v_u_11 or v_u_18 and v57.tag == v_u_12) then
            break
        end
        if v59 and v57.tag ~= v_u_10 then
            v59.return_ = v57
            v57 = v59
        else
            if v57 == v58 then
                return nil
            end
            local v60 = v57.return_
            v57 = v57.sibling
            while not v57 do
                if not v60 or v60 == v58 then
                    return nil
                end
            end
            v57.return_ = v60
        end
    end
    return v57
end
function v20.isFiberSuspenseAndTimedOut(p61)
    local v62 = p61.memoizedState
    local v63
    if p61.tag == v_u_13 and v62 ~= nil then
        v63 = v62.dehydrated == nil
    else
        v63 = false
    end
    return v63
end
function v20.doesFiberContain(p64, p65)
    local v66 = p64.alternate
    while p65 ~= nil do
        if p65 == p64 or p65 == v66 then
            return true
        end
        p65 = p65.return_
    end
    return false
end
return v20