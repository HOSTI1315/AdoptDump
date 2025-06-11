--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.RobloxReactProfiling (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_2 = require(script.Parent:WaitForChild("ReactWorkTags"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v3 = _G.__REACT_MICROPROFILER_LEVEL or 0
local v_u_4 = false
local v_u_5 = nil
function startTimerSampling(p6)
    if v_u_4 then
        warn("RobloxReactProfiling Timer Sampling already running.")
    end
    v_u_4 = true
    v_u_5 = p6
end
function endTimerSampling()
    v_u_4 = false
    v_u_5 = nil
end
function getFirstStringKey(p7)
    for v8, _ in p7 do
        if type(v8) == "string" then
            return v8
        end
    end
    return nil
end
function startTimer(p9)
    if v_u_4 then
        p9.startTime = os.clock()
    end
end
function endTimer(p10)
    if v_u_4 then
        p10.endTime = os.clock()
        if v_u_5 then
            v_u_5(p10)
        end
    end
end
function profileRootBeforeUnitOfWork(p11)
    local v12 = p11.current
    local v13 = nil
    if v12 then
        if v12.memoizedProps then
            v13 = getFirstStringKey(v12.memoizedProps)
        end
        if v13 == nil and (v12.stateNode and v12.stateNode.containerInfo) then
            v13 = v12.stateNode.containerInfo.Name
        end
    end
    local v14
    if v13 == "Folder" and v12.child then
        local v15 = v12.child
        if v15.memoizedProps then
            v14 = getFirstStringKey(v15.memoizedProps)
        else
            v14 = nil
        end
        if v14 == nil and (v15.stateNode and v15.stateNode.containerInfo) then
            v14 = v15.stateNode.containerInfo.Name
        end
        if v14 == nil then
            v14 = v13
        end
    else
        v14 = v13
    end
    if v14 == nil then
        return nil
    end
    local v16 = {
        ["id"] = v14,
        ["startTime"] = 0,
        ["endTime"] = 0
    }
    startTimer(v16)
    debug.profilebegin(v14)
    return v16
end
function profileRootAfterYielding(p17)
    if p17 then
        endTimer(p17)
        debug.profileend()
    end
end
function profileUnitOfWorkBefore(p18)
    local v19 = v_u_1(p18.type)
    if p18.key then
        local v20 = p18.key
        v19 = tostring(v20) .. "=" .. (v19 or "?")
    end
    local v21 = nil
    if p18.stateNode and (p18.tag == v_u_2.HostComponent or p18.tag == v_u_2.HostText) then
        local v22 = p18.stateNode:FindFirstAncestorWhichIsA("LayerCollector")
        if v22 then
            v21 = "[" .. v22:GetFullName() .. "] "
        end
    end
    if v21 then
        v19 = v21 .. " : " .. (v19 or "?")
    end
    if v19 == nil then
        return false
    end
    debug.profilebegin(v19)
    return true
end
function profileUnitOfWorkAfter(p23)
    if p23 then
        debug.profileend()
    end
end
function profileCommitBefore()
    debug.profilebegin("Commit")
end
function profileCommitAfter()
    debug.profileend()
end
function noop(...) end
local v24 = {
    ["startTimerSampling"] = startTimerSampling,
    ["endTimerSampling"] = endTimerSampling
}
local v25
if v3 >= 1 then
    v25 = profileRootBeforeUnitOfWork
else
    v25 = noop
end
v24.profileRootBeforeUnitOfWork = v25
local v26
if v3 >= 1 then
    v26 = profileRootAfterYielding
else
    v26 = noop
end
v24.profileRootAfterYielding = v26
local v27
if v3 >= 10 then
    v27 = profileUnitOfWorkBefore
else
    v27 = noop
end
v24.profileUnitOfWorkBefore = v27
local v28
if v3 >= 10 then
    v28 = profileUnitOfWorkAfter
else
    v28 = noop
end
v24.profileUnitOfWorkAfter = v28
local v29
if v3 >= 1 then
    v29 = profileCommitBefore
else
    v29 = noop
end
v24.profileCommitBefore = v29
local v30
if v3 >= 1 then
    v30 = profileCommitAfter
else
    v30 = noop
end
v24.profileCommitAfter = v30
return v24