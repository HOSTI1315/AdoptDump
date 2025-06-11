--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberReconciler.new (ModuleScript)

local v_u_1 = _G.__DEV__
require(script.Parent.Parent:WaitForChild("shared"))
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_3 = v2.Array
local v_u_4 = v2.Object
local v_u_5 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v6 = require(script.Parent:WaitForChild("ReactRootTags"))
local v7 = require(script.Parent:WaitForChild("ReactFiberFlags"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local v8 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_9 = v8.FundamentalComponent
require(script.Parent.Parent:WaitForChild("shared"))
local v10 = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v11 = require(script.Parent:WaitForChild("ReactFiberTreeReflection"))
local v_u_12 = v11.findCurrentHostFiber
local v_u_13 = v11.findCurrentHostFiberWithNoPortals
local v_u_14 = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap.get
local v_u_15 = v8.HostComponent
local v_u_16 = v8.ClassComponent
local v_u_17 = v8.HostRoot
local v_u_18 = v8.SuspenseComponent
local v_u_19 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_20 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_21 = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v_u_22 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulingProfiler
local v_u_23 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals
local v_u_24 = require(script.Parent:WaitForChild("ReactFiberHostConfig")).getPublicInstance
local v25 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local v_u_26 = v25.findCurrentUnmaskedContext
local v_u_27 = v25.processChildContext
local v_u_28 = v25.emptyContextObject
local v_u_29 = v25.isContextProvider
local v_u_30 = require(script.Parent:WaitForChild("ReactFiberRoot.new")).createFiberRoot
local v31 = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new"))
local v_u_32 = v31.injectInternals
local v_u_33 = v31.onScheduleRoot
local v34 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local v_u_35 = v34.requestEventTime
local v_u_36 = v34.requestUpdateLane
local v_u_37 = v34.scheduleUpdateOnFiber
local v_u_38 = v34.flushRoot
local v39 = v34.batchedEventUpdates
local v40 = v34.batchedUpdates
local v41 = v34.unbatchedUpdates
local v_u_42 = v34.flushSync
local v43 = v34.flushControlled
local v44 = v34.deferredUpdates
local v45 = v34.discreteUpdates
local v46 = v34.flushDiscreteUpdates
local v47 = v34.flushPassiveEffects
local v_u_48 = v34.warnIfNotScopedWithMatchingAct
local v_u_49 = v34.warnIfUnmockedScheduler
local v50 = v34.IsThisRendererActing
local v51 = v34.act
local v52 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local v_u_53 = v52.createUpdate
local v_u_54 = v52.enqueueUpdate
local v_u_55 = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local v_u_56 = v_u_55.isRendering
local v_u_57 = v_u_55.resetCurrentFiber
local v_u_58 = v_u_55.setCurrentFiber
local v59 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local v_u_60 = v59.StrictMode
local v_u_61 = v10.SyncLane
local v_u_62 = v10.InputDiscreteHydrationLane
local v_u_63 = v10.SelectiveHydrationLane
local v_u_64 = v10.NoTimestamp
local v_u_65 = v10.getHighestPriorityPendingLanes
local v_u_66 = v10.higherPriorityLane
local v_u_67 = v10.getCurrentUpdateLanePriority
local v_u_68 = v10.setCurrentUpdateLanePriority
local v_u_69 = require(script.Parent:WaitForChild("SchedulingProfiler")).markRenderScheduled
local v70 = {
    ["ReactRootTags"] = v6,
    ["ReactWorkTags"] = v8,
    ["ReactTypeOfMode"] = v59,
    ["ReactFiberFlags"] = v7,
    ["getNearestMountedFiber"] = v11.getNearestMountedFiber,
    ["findCurrentFiberUsingSlowPath"] = v11.findCurrentFiberUsingSlowPath,
    ["createPortal"] = require(script.Parent:WaitForChild("ReactPortal")).createPortal
}
local v_u_71, v_u_72
if v_u_1 then
    v_u_71 = false
    v_u_72 = {}
else
    v_u_71 = nil
    v_u_72 = nil
end
local function v_u_77(p73)
    local v74 = v_u_14(p73)
    if v74 == nil then
        local v75 = p73.render
        if typeof(v75) == "function" then
            v_u_20(false, "Unable to find node on an unmounted component.")
        else
            v_u_20(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(v_u_4.keys(p73)))
        end
    end
    local v76 = v_u_12(v74)
    if v76 == nil then
        return nil
    else
        return v76.stateNode
    end
end
local function v91(p78, p_u_79)
    if not v_u_1 then
        return v_u_77(p78)
    end
    local v_u_80 = v_u_14(p78)
    if v_u_80 == nil then
        local v81 = p78.render
        if typeof(v81) == "function" then
            v_u_20(false, "Unable to find node on an unmounted component.")
        else
            v_u_20(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(v_u_4.keys(p78)))
        end
    end
    local v_u_82 = v_u_12(v_u_80)
    if v_u_82 == nil then
        return nil
    end
    local v83 = v_u_82.mode
    local v84 = v_u_60
    if bit32.band(v83, v84) ~= 0 then
        local v_u_85 = v_u_19(v_u_80.type) or "Component"
        if not v_u_72[v_u_85] then
            v_u_72[v_u_85] = true
            local v86 = v_u_55.current
            local v89, v90 = xpcall(function()
                v_u_58(v_u_82)
                local v87 = v_u_80.mode
                local v88 = v_u_60
                if bit32.band(v87, v88) == 0 then
                    v_u_5.error("%s is deprecated in StrictMode. %s was passed an instance of %s which renders StrictMode children. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p_u_79, p_u_79, v_u_85)
                else
                    v_u_5.error("%s is deprecated in StrictMode. %s was passed an instance of %s which is inside StrictMode. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p_u_79, p_u_79, v_u_85)
                end
            end, v_u_21)
            if v86 then
                v_u_58(v86)
            else
                v_u_57()
            end
            if not v89 then
                error(v90)
            end
        end
    end
    return v_u_82.stateNode
end
function v70.createContainer(p92, p93, p94, p95)
    return v_u_30(p92, p93, p94, p95)
end
function v70.updateContainer(p96, p97, p98, p99)
    if v_u_1 then
        v_u_33(p97, p96)
    end
    local v100 = p97.current
    local v101 = v_u_35()
    if v_u_1 and _G.__TESTEZ_RUNNING_TEST__ then
        v_u_49(v100)
        v_u_48(v100)
    end
    local v102 = v_u_36(v100)
    if v_u_22 then
        v_u_69(v102)
    end
    local v103
    if p98 then
        local v104 = v_u_14(p98)
        v103 = v_u_26(v104)
        if v104.tag == v_u_16 then
            local v105 = v104.type
            if v_u_29(v105) then
                v103 = v_u_27(v104, v105, v103)
            end
        end
    else
        v103 = v_u_28
    end
    if p97.context == nil then
        p97.context = v103
    else
        p97.pendingContext = v103
    end
    if v_u_1 and (v_u_56 and (v_u_55.current ~= nil and not v_u_71)) then
        v_u_71 = true
        v_u_5.error("Render methods should be a pure function of props and state; triggering nested component updates from render is not allowed. If necessary, trigger nested updates in componentDidUpdate.\n\nCheck the render method of %s.", v_u_19(v_u_55.current.type) or "Unknown")
    end
    local v106 = v_u_53(v101, v102)
    if p96 == nil then
        p96 = v_u_4.None
    end
    v106.payload = {
        ["element"] = p96
    }
    if p99 ~= nil then
        if v_u_1 and typeof(p99) ~= "function" then
            v_u_5.error("render(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", (tostring(p99)))
        end
        v106.callback = p99
    end
    v_u_54(v100, v106)
    v_u_37(v100, v102, v101)
    return v102
end
v70.batchedEventUpdates = v39
v70.batchedUpdates = v40
v70.unbatchedUpdates = v41
v70.deferredUpdates = v44
v70.discreteUpdates = v45
v70.flushDiscreteUpdates = v46
v70.flushControlled = v43
v70.flushSync = v_u_42
v70.flushPassiveEffects = v47
v70.IsThisRendererActing = v50
v70.act = v51
function v70.getPublicRootInstance(p107)
    local v108 = p107.current
    if v108.child then
        if v108.child.tag == v_u_15 then
            return v_u_24(v108.child.stateNode)
        else
            return v108.child.stateNode
        end
    else
        return nil
    end
end
local v_u_109 = nil
function v70.attemptSynchronousHydration(p_u_110)
    if p_u_110.tag == v_u_17 then
        local v111 = p_u_110.stateNode
        if v111.hydrate then
            v_u_38(v111, (v_u_65(v111)))
            return
        end
    elseif p_u_110.tag == v_u_18 then
        local v_u_112 = v_u_35()
        v_u_42(function()
            return v_u_37(p_u_110, v_u_61, v_u_112)
        end)
        v_u_109(p_u_110, v_u_62)
    end
end
v_u_109 = function(p113, p114)
    local v115 = p113.memoizedState
    if v115 and (v115 ~= nil and v115.dehydrated ~= nil) then
        v115.retryLane = v_u_66(v115.retryLane, p114)
    end
    local v116 = p113.alternate
    if v116 then
        local v117 = v116.memoizedState
        if v117 and (v117 ~= nil and v117.dehydrated ~= nil) then
            v117.retryLane = v_u_66(v117.retryLane, p114)
        end
    end
end
function v70.attemptUserBlockingHydration(p118)
    if p118.tag == v_u_18 then
        local v119 = v_u_62
        v_u_37(p118, v119, (v_u_35()))
        v_u_109(p118, v119)
    end
end
function v70.attemptContinuousHydration(p120)
    if p120.tag == v_u_18 then
        local v121 = v_u_63
        v_u_37(p120, v121, (v_u_35()))
        v_u_109(p120, v121)
    end
end
function v70.attemptHydrationAtCurrentPriority(p122)
    if p122.tag == v_u_18 then
        local v123 = v_u_35()
        local v124 = v_u_36(p122)
        v_u_37(p122, v124, v123)
        v_u_109(p122, v124)
    end
end
function v70.runWithPriority(p125, p126)
    local v127 = v_u_67()
    v_u_68(p125)
    local v128, v129 = xpcall(p126, v_u_21)
    v_u_68(v127)
    if not v128 then
        error(v129)
    end
    return v129
end
v70.getCurrentUpdateLanePriority = v_u_67
v70.findHostInstance = v_u_77
v70.findHostInstanceWithWarning = v91
function v70.findHostInstanceWithNoPortals(p130)
    local v131 = v_u_13(p130)
    if v131 == nil then
        return nil
    elseif v131.tag == v_u_9 then
        return v131.stateNode.instance
    else
        return v131.stateNode
    end
end
local function v_u_132(_)
    return false
end
function v70.shouldSuspend(p133)
    return v_u_132(p133)
end
local v_u_134, v_u_135, v_u_136, v_u_137, v_u_138, v_u_139, v_u_140, v_u_141
if v_u_1 then
    local function v_u_147(p142, p143, p144)
        local v145 = p143[p144]
        local v146
        if v_u_3.isArray(p142) then
            v146 = v_u_3.slice(p142)
        else
            v146 = table.clone(p142)
        end
        if p144 + 1 == #p143 then
            if v_u_3.isArray(v146) then
                v_u_3.splice(v146, v145, 1)
                return v146
            else
                v146[v145] = nil
                return v146
            end
        else
            v146[v145] = v_u_147(p142[v145], p143, p144 + 1)
            return v146
        end
    end
    local function v_u_154(p148, p149, p150, p151)
        local v152 = p149[p151]
        local v153
        if v_u_3.isArray(p148) then
            v153 = v_u_3.slice(p148)
        else
            v153 = table.clone(p148)
        end
        if p151 + 1 == #p149 then
            v153[p150[p151]] = v153[v152]
            if v_u_3.isArray(v153) then
                v_u_3.splice(v153, v152, 1)
                return v153
            else
                v153[v152] = nil
                return v153
            end
        else
            v153[v152] = v_u_154(p148[v152], p149, p150, p151 + 1)
            return v153
        end
    end
    local function v_u_159(p155, p156, p157)
        if #p156 == #p157 then
            for v158 = 1, #p157 do
                if p156[v158] ~= p157[v158] then
                    v_u_5.warn("copyWithRename() expects paths to be the same except for the deepest key")
                    return nil
                end
            end
            return v_u_154(p155, p156, p157, 0)
        else
            v_u_5.warn("copyWithRename() expects paths of the same length")
            return nil
        end
    end
    local function v_u_166(p160, p161, p162, p163)
        if #p161 + 1 <= p162 then
            return p163
        end
        local v164 = p161[p162]
        local v165
        if v_u_3.isArray(p160) then
            v165 = v_u_3.slice(p160)
        else
            v165 = table.clone(p160)
        end
        v165[v164] = v_u_166(p160[v164], p161, p162 + 2, p163)
        return v165
    end
    v_u_134 = function(p167)
        v_u_132 = p167
    end
    v_u_135 = function(p168, p169, p170)
        p168.pendingProps = v_u_166(p168.memoizedProps, p169, 1, p170)
        local v171 = p168.alternate
        if v171 then
            v171.pendingProps = p168.pendingProps
        end
        v_u_37(p168, v_u_61, v_u_64)
    end
    v_u_136 = function(p172, p173)
        p172.pendingProps = v_u_147(p172.memoizedProps, p173, 0)
        local v174 = p172.alternate
        if v174 then
            v174.pendingProps = p172.pendingProps
        end
        v_u_37(p172, v_u_61, v_u_64)
    end
    v_u_137 = function(p175, p176, p177)
        p175.pendingProps = v_u_159(p175.memoizedProps, p176, p177)
        local v178 = p175.alternate
        if v178 then
            v178.pendingProps = p175.pendingProps
        end
        v_u_37(p175, v_u_61, v_u_64)
    end
    v_u_138 = function(p179)
        v_u_37(p179, v_u_61, v_u_64)
    end
    v_u_139 = function(p180, p181, p182, p183)
        local v184 = p180.memoizedState
        while v184 ~= nil and p181 > 1 do
            v184 = v184.next
            p181 = p181 - 1
        end
        if v184 ~= nil then
            local v185 = v_u_166(v184.memoizedState, p182, 1, p183)
            v184.memoizedState = v185
            v184.baseState = v185
            p180.memoizedProps = table.clone(p180.memoizedProps)
            v_u_37(p180, v_u_61, v_u_64)
        end
    end
    v_u_140 = function(p186, p187, p188)
        local v189 = p186.memoizedState
        while v189 ~= nil and p187 > 1 do
            v189 = v189.next
            p187 = p187 - 1
        end
        if v189 ~= nil then
            local v190 = v_u_147(v189.memoizedState, p188, 0)
            v189.memoizedState = v190
            v189.baseState = v190
            p186.memoizedProps = table.clone(p186.memoizedProps)
            v_u_37(p186, v_u_61, v_u_64)
        end
    end
    v_u_141 = function(p191, p192, p193, p194)
        local v195 = p191.memoizedState
        while v195 ~= nil and p192 > 1 do
            v195 = v195.next
            p192 = p192 - 1
        end
        if v195 ~= nil then
            local v196 = v_u_159(v195.memoizedState, p193, p194)
            v195.memoizedState = v196
            v195.baseState = v196
            p191.memoizedProps = table.clone(p191.memoizedProps)
            v_u_37(p191, v_u_61, v_u_64)
        end
    end
else
    v_u_135 = nil
    v_u_136 = nil
    v_u_137 = nil
    v_u_134 = nil
    v_u_138 = nil
    v_u_139 = nil
    v_u_140 = nil
    v_u_141 = nil
end
function findHostInstanceByFiber(p197)
    local v198 = v_u_12(p197)
    if v198 == nil then
        return nil
    else
        return v198.stateNode
    end
end
function emptyFindFiberByHostInstance(_)
    return nil
end
function getCurrentFiberForDevTools()
    return v_u_55.current
end
function v70.injectIntoDevTools(p199)
    local v200 = p199.findFiberByHostInstance
    local v201 = v_u_23.ReactCurrentDispatcher
    local v202
    if v_u_1 then
        v202 = getCurrentFiberForDevTools
    else
        v202 = nil
    end
    return v_u_32({
        ["bundleType"] = p199.bundleType,
        ["version"] = p199.version,
        ["rendererPackageName"] = p199.rendererPackageName,
        ["rendererConfig"] = p199.rendererConfig,
        ["overrideHookState"] = v_u_139,
        ["overrideHookStateDeletePath"] = v_u_140,
        ["overrideHookStateRenamePath"] = v_u_141,
        ["overrideProps"] = v_u_135,
        ["overridePropsDeletePath"] = v_u_136,
        ["overridePropsRenamePath"] = v_u_137,
        ["setSuspenseHandler"] = v_u_134,
        ["scheduleUpdate"] = v_u_138,
        ["currentDispatcherRef"] = v201,
        ["findHostInstanceByFiber"] = findHostInstanceByFiber,
        ["findFiberByHostInstance"] = v200 or emptyFindFiberByHostInstance,
        ["getCurrentFiber"] = v202
    })
end
v70.robloxReactProfiling = require(script.Parent.RobloxReactProfiling)
return v70