--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactUpdateQueue.new (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = _G.__YOLO__
local v_u_3 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v5 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v_u_6 = v5.NoLane
local v_u_7 = v5.NoLanes
local v_u_8 = v5.isSubsetOfLanes
local v_u_9 = v5.mergeLanes
local v10 = nil
local v11 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_12 = v11.Callback
local v_u_13 = v11.ShouldCapture
local v_u_14 = v11.DidCapture
local v_u_15 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local v_u_16 = require(script.Parent:WaitForChild("ReactTypeOfMode")).StrictMode
local v_u_17 = require(script.Parent:WaitForChild("ReactFiberWorkInProgress")).markSkippedUpdateLanes
local v_u_18 = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v19 = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local v_u_20 = v19.disableLogs
local v_u_21 = v19.reenableLogs
local v22 = {
    ["UpdateState"] = 0,
    ["ReplaceState"] = 1,
    ["ForceUpdate"] = 2,
    ["CaptureUpdate"] = 3
}
local v_u_23 = false
local v_u_24, v_u_25
if v_u_1 then
    v_u_24 = false
    local v_u_26 = nil
    function v22.resetCurrentlyProcessingQueue()
        v_u_26 = nil
    end
    v_u_25 = v_u_26
else
    v_u_25 = nil
    v_u_24 = nil
end
local v_u_27 = table.create(210)
local v_u_28 = v10
local v_u_29 = 210
for v30 = 1, 210 do
    v_u_27[v30] = {
        ["eventTime"] = -1,
        ["lane"] = -1,
        ["tag"] = -1,
        ["payload"] = nil,
        ["callback"] = nil,
        ["next"] = nil
    }
end
function v22.initializeUpdateQueue(p31)
    local v32 = {
        ["baseState"] = p31.memoizedState,
        ["firstBaseUpdate"] = nil,
        ["lastBaseUpdate"] = nil,
        ["shared"] = {
            ["pending"] = nil
        },
        ["effects"] = nil
    }
    p31.updateQueue = v32
end
function v22.cloneUpdateQueue(p33, p34)
    local v35 = p34.updateQueue
    local v36 = p33.updateQueue
    if v35 == v36 then
        p34.updateQueue = table.clone(v36)
    end
end
function v22.createUpdate(p37, p38, p39, p40)
    if v_u_29 <= 0 then
        return {
            ["eventTime"] = p37,
            ["lane"] = p38,
            ["tag"] = 0,
            ["payload"] = p39,
            ["callback"] = p40,
            ["next"] = nil
        }
    end
    local v41 = v_u_27[v_u_29]
    v_u_27[v_u_29] = nil
    v_u_29 = v_u_29 - 1
    v41.eventTime = p37
    v41.lane = p38
    v41.tag = 0
    v41.payload = p39
    v41.callback = p40
    return v41
end
function v22.enqueueUpdate(p42, p43)
    local v44 = p42.updateQueue
    if v44 ~= nil then
        local v45 = v44.shared
        local v46 = v45.pending
        if v46 == nil then
            p43.next = p43
        else
            p43.next = v46.next
            v46.next = p43
        end
        v45.pending = p43
        if v_u_1 and (v_u_25 == v45 and not v_u_24) then
            v_u_4.error("An update (setState, replaceState, or forceUpdate) was scheduled from inside an update function. Update functions should be pure, with zero side-effects. Consider using componentDidUpdate or a callback.")
            v_u_24 = true
        end
    end
end
function v22.enqueueCapturedUpdate(p47, p48)
    local v49 = p47.updateQueue
    local v50 = p47.alternate
    if v50 ~= nil then
        local v51 = v50.updateQueue
        if v49 == v51 then
            local v52 = v49.firstBaseUpdate
            local v53
            if v52 == nil then
                v53 = p48
            else
                local v54 = nil
                v53 = nil
                while true do
                    if true then
                        local v55 = {
                            ["eventTime"] = v52.eventTime,
                            ["lane"] = v52.lane,
                            ["tag"] = v52.tag,
                            ["payload"] = v52.payload,
                            ["callback"] = v52.callback,
                            ["next"] = nil
                        }
                        if v54 == nil then
                            v53 = v55
                        else
                            v54.next = v55
                        end
                    end
                    v52 = v52.next
                    if v52 == nil then
                        break
                    end
                    v54 = v55
                end
                if v55 == nil then
                    v53 = p48
                else
                    v55.next = p48
                end
            end
            p47.updateQueue = {
                ["baseState"] = v51.baseState,
                ["firstBaseUpdate"] = v53,
                ["lastBaseUpdate"] = p48,
                ["shared"] = v51.shared,
                ["effects"] = v51.effects
            }
            return
        end
    end
    local v56 = v49.lastBaseUpdate
    if v56 == nil then
        v49.firstBaseUpdate = p48
    else
        v56.next = p48
    end
    v49.lastBaseUpdate = p48
end
local function v_u_79(p57, _, p58, p59, p60, _)
    local v61 = p58.tag
    if v61 == 1 then
        local v62 = p58.payload
        if type(v62) ~= "function" then
            return v62
        end
        if v_u_1 then
            if not v_u_28 then
                v_u_28 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
            end
            v_u_28.enterDisallowedContextReadInDEV()
        end
        local v63 = v62(p59, p60)
        if v_u_1 then
            if v_u_15 then
                local v64 = p57.mode
                local v65 = v_u_16
                if bit32.band(v64, v65) ~= 0 then
                    v_u_20()
                    local v66 = nil
                    local v67
                    if v_u_2 then
                        v62(p59, p60)
                        v67 = true
                    else
                        v67, v66 = xpcall(v62, v_u_18, p59, p60)
                    end
                    v_u_21()
                    if not v67 then
                        error(v66)
                    end
                end
            end
            if not v_u_28 then
                v_u_28 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
            end
            v_u_28.exitDisallowedContextReadInDEV()
        end
        return v63
    elseif v61 == 3 or v61 == 0 then
        if v61 == 3 then
            local v68 = p57.flags
            local v69 = v_u_13
            local v70 = bit32.bnot(v69)
            local v71 = bit32.band(v68, v70)
            local v72 = v_u_14
            p57.flags = bit32.bor(v71, v72)
        end
        local v73 = p58.payload
        local v74
        if type(v73) == "function" then
            if v_u_1 then
                if not v_u_28 then
                    v_u_28 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
                end
                v_u_28.enterDisallowedContextReadInDEV()
            end
            v74 = v73(p59, p60)
            if v_u_1 then
                if v_u_15 then
                    local v75 = p57.mode
                    local v76 = v_u_16
                    if bit32.band(v75, v76) ~= 0 then
                        v_u_20()
                        local v77 = nil
                        local v78
                        if v_u_2 then
                            v73(p59, p60)
                            v78 = true
                        else
                            v78, v77 = xpcall(v73, v_u_18, p59, p60)
                        end
                        v_u_21()
                        if not v78 then
                            error(v77)
                        end
                    end
                end
                if not v_u_28 then
                    v_u_28 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
                end
                v_u_28.exitDisallowedContextReadInDEV()
            end
        else
            v74 = v73
        end
        if v74 == nil then
            return p59
        else
            return v_u_3.assign({}, p59, v74)
        end
    else
        if v61 ~= 2 then
            return p59
        end
        v_u_23 = true
        return p59
    end
end
v22.getStateFromUpdate = v_u_79
function v22.processUpdateQueue()
    -- failed to decompile
end
function v22.resetHasForceUpdateBeforeProcessing()
    v_u_23 = false
end
function v22.checkHasForceUpdateAfterProcessing()
    return v_u_23
end
function v22.commitUpdateQueue(_, p80, p81)
    local v82 = p80.effects
    p80.effects = nil
    if v82 ~= nil then
        for _, v83 in v82 do
            local v84 = v83.callback
            if v84 ~= nil then
                if type(v84) ~= "function" then
                    error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(v84))))
                end
                v84(p81)
            end
            table.clear(v83)
            local v85 = v_u_27
            table.insert(v85, v83)
            v_u_29 = v_u_29 + 1
        end
    end
end
return v22