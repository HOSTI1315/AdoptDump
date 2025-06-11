--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberWorkLoop.new (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = _G.__YOLO__
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).console
local v_u_4 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Set
local v_u_5 = {}
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v_u_6 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v_u_7 = require(script.Parent.Parent:WaitForChild("scheduler"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v8 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local v_u_9 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_10 = v_u_9.enableDebugTracing
local v_u_11 = v_u_9.enableSchedulingProfiler
local v_u_12 = v_u_9.skipUnmountedBoundaries
local v_u_13 = v_u_9.enableDoubleInvokingEffects
local v14 = require(script.Parent.Parent:WaitForChild("shared"))
local v_u_15 = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v16 = v14.ReactSharedInternals
local v_u_17 = v14.invariant
local v18 = require(script.Parent:WaitForChild("SchedulerWithReactIntegration.new"))
local v_u_19 = v18.scheduleCallback
local v_u_20 = v18.cancelCallback
local v_u_21 = v18.getCurrentPriorityLevel
local v_u_22 = v18.runWithPriority
local v_u_23 = v18.shouldYield
local v_u_24 = v18.requestPaint
local v_u_25 = v18.now
local v_u_26 = v18.NoPriority
local v_u_27 = v18.ImmediatePriority
local v_u_28 = v18.UserBlockingPriority
local v_u_29 = v18.NormalPriority
local v_u_30 = v18.flushSyncCallbackQueue
local v_u_31 = v18.scheduleSyncCallback
local v_u_32 = require(script.Parent:WaitForChild("DebugTracing"))
local v_u_33 = require(script.Parent:WaitForChild("SchedulingProfiler"))
local v34 = require(script.Parent.Parent:WaitForChild("scheduler")).tracing
local v_u_35 = v34.__interactionsRef
local v_u_36 = v34.__subscriberRef
local v_u_37 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local v_u_38 = require(script.Parent:WaitForChild("ReactFiber.new"))
local v_u_39 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local v_u_40 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_41 = require(script.Parent:WaitForChild("ReactRootTags")).LegacyRoot
local v_u_42 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_43 = v_u_6.SyncLane
local v_u_44 = v_u_6.SyncBatchedLane
local v_u_45 = v_u_6.NoTimestamp
local v_u_46 = v_u_6.findUpdateLane
local v_u_47 = v_u_6.findTransitionLane
local v_u_48 = v_u_6.findRetryLane
local v_u_49 = v_u_6.includesSomeLane
local v_u_50 = v_u_6.isSubsetOfLanes
local v_u_51 = v_u_6.mergeLanes
local v_u_52 = v_u_6.removeLanes
local v_u_53 = v_u_6.pickArbitraryLane
local v_u_54 = v_u_6.hasDiscreteLanes
local v_u_55 = v_u_6.includesNonIdleWork
local v_u_56 = v_u_6.includesOnlyRetries
local v_u_57 = v_u_6.includesOnlyTransitions
local v_u_58 = v_u_6.getNextLanes
local v_u_59 = v_u_6.returnNextLanesPriority
local v_u_60 = v_u_6.setCurrentUpdateLanePriority
local v_u_61 = v_u_6.getCurrentUpdateLanePriority
local v_u_62 = v_u_6.markStarvedLanesAsExpired
local v_u_63 = v_u_6.getLanesToRetrySynchronouslyOnError
local v_u_64 = v_u_6.getMostRecentEventTime
local v_u_65 = v_u_6.markRootUpdated
local v_u_66 = v_u_6.markRootSuspended
local v_u_67 = v_u_6.markRootPinged
local v_u_68 = v_u_6.markRootExpired
local v_u_69 = v_u_6.markDiscreteUpdatesExpired
local v_u_70 = v_u_6.markRootFinished
local v_u_71 = v_u_6.schedulerPriorityToLanePriority
local v_u_72 = v_u_6.lanePriorityToSchedulerPriority
local v_u_73 = require(script.Parent:WaitForChild("ReactFiberTransition"))
local v74 = require(script.Parent:WaitForChild("ReactFiberUnwindWork.new"))
local v_u_75 = v74.unwindWork
local v_u_76 = v74.unwindInterruptedWork
local v77 = require(script.Parent:WaitForChild("ReactFiberThrow.new"))
local v_u_78 = v77.throwException
local v_u_79 = v77.createRootErrorUpdate
local v_u_80 = v77.createClassErrorUpdate
local v_u_81 = require(script.Parent:WaitForChild("ReactFiberCommitWork.new"))
local v_u_82 = v_u_81.commitBeforeMutationLifeCycles
local v_u_83 = v_u_81.commitPlacement
local v_u_84 = v_u_81.commitWork
local v_u_85 = v_u_81.commitDeletion
local v_u_86 = v_u_81.commitPassiveUnmount
local v_u_87 = v_u_81.commitPassiveUnmountInsideDeletedTree
local v_u_88 = v_u_81.commitPassiveMount
local v_u_89 = v_u_81.commitDetachRef
local v_u_90 = v_u_81.invokeLayoutEffectMountInDEV
local v_u_91 = v_u_81.invokePassiveEffectMountInDEV
local v_u_92 = v_u_81.invokeLayoutEffectUnmountInDEV
local v_u_93 = v_u_81.invokePassiveEffectUnmountInDEV
local v_u_94 = v_u_81.recursivelyCommitLayoutEffects
local v_u_95 = require(script.Parent.Parent:WaitForChild("promise"))
local v_u_96 = require(script.Parent:WaitForChild("ReactUpdateQueue.new")).enqueueUpdate
local v_u_97 = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).resetContextDependencies
local v_u_98 = require(script.Parent.RobloxReactProfiling)
local v_u_99 = nil
local v_u_100 = {
    ["resetHooksAfterThrowRef"] = nil,
    ["ContextOnlyDispatcherRef"] = nil,
    ["getIsUpdatingOpaqueValueInRenderPhaseInDEVRef"] = nil,
    ["originalBeginWorkRef"] = nil,
    ["completeWorkRef"] = nil
}
local function v_u_104(p101, p102, p103)
    if not v_u_100.originalBeginWorkRef then
        v_u_100.originalBeginWorkRef = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).beginWork
    end
    return v_u_100.originalBeginWorkRef(p101, p102, p103)
end
local v_u_105 = nil
local v_u_106 = require(script.Parent:WaitForChild("ReactCapturedValue")).createCapturedValue
local v_u_107 = v8.push
local v_u_108 = v8.pop
local v109 = v8.createCursor
local v_u_110 = require(script.Parent:WaitForChild("ReactProfilerTimer.new"))
local v_u_111 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_112 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local v_u_113 = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local v_u_114 = v_u_113.current
local v_u_115 = v_u_113.resetCurrentFiber
local v_u_116 = v_u_113.setCurrentFiber
local v117 = require(script.Parent.Parent:WaitForChild("shared")).ReactErrorUtils
local v_u_118 = v117.invokeGuardedCallback
local v_u_119 = v117.hasCaughtError
local v_u_120 = v117.clearCaughtError
local v_u_121 = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new")).onCommitRoot
local v_u_122 = require(script.Parent:WaitForChild("ReactTestSelectors")).onCommitRoot
local v_u_123 = require(script.Parent.Parent:WaitForChild("shared")).enqueueTask
local v_u_124 = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).doesFiberContain
local v_u_125 = v16.ReactCurrentDispatcher
local v_u_126 = v16.ReactCurrentOwner
local v_u_127 = v16.IsSomeRendererActing
local v_u_128 = nil
local v_u_129 = {}
v_u_5.NoContext = 0
v_u_5.RetryAfterError = 64
local v_u_130 = {
    ["Incomplete"] = 0,
    ["FatalErrored"] = 1,
    ["Errored"] = 2,
    ["Suspended"] = 3,
    ["SuspendedWithDelay"] = 4,
    ["Completed"] = 5
}
local v_u_131 = 0
local v_u_132 = nil
local v_u_133 = nil
local v_u_134 = v_u_6.NoLanes
v_u_5.subtreeRenderLanes = v_u_6.NoLanes
local v_u_135 = v109(v_u_6.NoLanes)
local v_u_136 = v_u_130.Incomplete
local v_u_137 = nil
local v_u_138 = v_u_6.NoLanes
local v_u_139 = require(script.Parent:WaitForChild("ReactFiberWorkInProgress"))
local v_u_140 = v_u_139.workInProgressRootSkippedLanes
local v_u_141 = v_u_6.NoLanes
local v_u_142 = v_u_6.NoLanes
local v_u_143 = nil
local v_u_144 = 0
local v_u_145 = (1 / 0)
local v_u_146 = nil
function v_u_5.getRenderTargetTime()
    return v_u_145
end
local v_u_147 = false
local v_u_148 = nil
local v_u_149 = nil
local v_u_150 = false
local v_u_151 = nil
local v_u_152 = v_u_26
local v_u_153 = v_u_6.NoLanes
local v_u_154 = nil
local v_u_155 = 0
local v_u_156 = nil
local v_u_157 = 0
local v_u_158 = nil
local v_u_159 = v_u_45
local v_u_160 = v_u_6.NoLanes
local v_u_161 = v_u_6.NoLanes
local v_u_162 = nil
local v_u_163 = false
function v_u_5.getWorkInProgressRoot()
    return v_u_132
end
function v_u_5.requestEventTime()
    local v164 = v_u_131
    if bit32.band(v164, 48) ~= 0 then
        return v_u_25()
    end
    if v_u_159 ~= v_u_45 then
        return v_u_159
    end
    v_u_159 = v_u_25()
    return v_u_159
end
function v_u_5.requestUpdateLane(p165)
    local v166 = p165.mode
    local v167 = v_u_39.BlockingMode
    if bit32.band(v166, v167) == v_u_39.NoMode then
        return v_u_43
    else
        local v168 = v_u_39.ConcurrentMode
        if bit32.band(v166, v168) == v_u_39.NoMode then
            if v_u_21() == v_u_27 then
                return v_u_43
            else
                return v_u_44
            end
        else
            if not v_u_9.deferRenderPhaseUpdateToNextBatch then
                local v169 = v_u_131
                if bit32.band(v169, 16) ~= 0 and v_u_134 ~= v_u_6.NoLanes then
                    return v_u_53(v_u_134)
                end
            end
            if v_u_160 == v_u_6.NoLanes then
                v_u_160 = v_u_138
            end
            if v_u_73.requestCurrentTransition() ~= v_u_73.NoTransition then
                if v_u_161 ~= v_u_6.NoLanes then
                    if v_u_143 == nil then
                        v_u_161 = v_u_6.NoLanes
                    else
                        v_u_161 = v_u_143.pendingLanes
                    end
                end
                return v_u_47(v_u_160, v_u_161)
            end
            local v170 = v_u_21()
            local v171 = v_u_131
            if bit32.band(v171, 4) ~= 0 and v170 == v_u_28 then
                return v_u_46(v_u_6.InputDiscreteLanePriority, v_u_160)
            end
            local v172 = v_u_71(v170)
            if v_u_9.decoupleUpdatePriorityFromScheduler then
                local v173 = v_u_61()
                if v172 ~= v173 and (v173 ~= v_u_6.NoLanePriority and v_u_1) then
                    v_u_3.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(v172), (tostring(v173)))
                end
            end
            return v_u_46(v172, v_u_160)
        end
    end
end
function requestRetryLane(p174)
    local v175 = p174.mode
    local v176 = v_u_39.BlockingMode
    if bit32.band(v175, v176) == v_u_39.NoMode then
        return v_u_43
    else
        local v177 = v_u_39.ConcurrentMode
        if bit32.band(v175, v177) == v_u_39.NoMode then
            if v_u_21() == v_u_27 then
                return v_u_43
            else
                return v_u_44
            end
        else
            if v_u_160 == v_u_6.NoLanes then
                v_u_160 = v_u_138
            end
            return v_u_48(v_u_160)
        end
    end
end
function v_u_5.scheduleUpdateOnFiber(p178, p179, p180)
    v_u_129.checkForNestedUpdates()
    local v181 = v_u_129.markUpdateLaneFromFiberToRoot(p178, p179)
    if v181 == nil then
        return nil
    end
    v_u_65(v181, p179, p180)
    if v181 ~= v_u_132 then
        ::l4::
        local v182 = v_u_21()
        if p179 ~= v_u_43 then
            local v183 = v_u_131
            if bit32.band(v183, 4) ~= 0 and (v182 == v_u_28 or v182 == v_u_27) then
                if v_u_154 == nil then
                    v_u_154 = v_u_4.new({ v181 })
                else
                    v_u_154:add(v181)
                end
            end
            v_u_99(v181, p180)
            v_u_129.schedulePendingInteractions(v181, p179)
            goto l14
        end
        local v184 = v_u_131
        if bit32.band(v184, 8) ~= 0 then
            local v185 = v_u_131
            if bit32.band(v185, 48) == 0 then
                v_u_129.schedulePendingInteractions(v181, p179)
                v_u_129.performSyncWorkOnRoot(v181)
                ::l14::
                v_u_143 = v181
                return v181
            end
        end
        v_u_99(v181, p180)
        v_u_129.schedulePendingInteractions(v181, p179)
        if v_u_131 == 0 then
            v_u_145 = v_u_25() + 500
            v_u_30()
        end
        goto l14
    end
    v_u_129.warnAboutRenderPhaseUpdatesInDEV(p178)
    if not v_u_9.deferRenderPhaseUpdateToNextBatch then
        local v186 = v_u_131
        if bit32.band(v186, 16) ~= 0 then
            ::l7::
            if v_u_136 == v_u_130.SuspendedWithDelay then
                v_u_129.markRootSuspended(v181, v_u_134)
            end
            goto l4
        end
    end
    v_u_141 = v_u_51(v_u_141, p179)
    goto l7
end
function v_u_129.markUpdateLaneFromFiberToRoot(p187, p188)
    p187.lanes = v_u_51(p187.lanes, p188)
    local v189 = p187.alternate
    if v189 ~= nil then
        v189.lanes = v_u_51(v189.lanes, p188)
    end
    if v_u_1 and v189 == nil then
        local v190 = p187.flags
        local v191 = v_u_42.Placement
        local v192 = v_u_42.Hydrating
        local v193 = bit32.bor(v191, v192)
        if bit32.band(v190, v193) ~= v_u_42.NoFlags then
            v_u_129.warnAboutUpdateOnNotYetMountedFiberInDEV(p187)
        end
    end
    local v194 = p187.return_
    local v195 = p187
    while v194 ~= nil do
        v194.childLanes = v_u_51(v194.childLanes, p188)
        local v196 = v194.alternate
        if v196 == nil then
            if v_u_1 then
                local v197 = v194.flags
                local v198 = v_u_42.Placement
                local v199 = v_u_42.Hydrating
                local v200 = bit32.bor(v198, v199)
                if bit32.band(v197, v200) ~= v_u_42.NoFlags then
                    v_u_129.warnAboutUpdateOnNotYetMountedFiberInDEV(v195)
                end
            end
        else
            v196.childLanes = v_u_51(v196.childLanes, p188)
        end
        local v201 = v194.return_
        p187 = v194
        v194 = v201
    end
    if p187.tag == v_u_40.HostRoot then
        return p187.stateNode
    else
        return nil
    end
end
v_u_99 = function(p_u_202, p203)
    local v204 = p_u_202.callbackNode
    v_u_62(p_u_202, p203)
    local v205
    if p_u_202 == v_u_132 then
        v205 = v_u_134
    else
        v205 = v_u_6.NoLanes
    end
    local v206 = v_u_58(p_u_202, v205)
    local v207 = v_u_59()
    if v206 == v_u_6.NoLanes then
        if v204 ~= nil then
            v_u_20(v204)
            p_u_202.callbackNode = nil
            p_u_202.callbackPriority = v_u_6.NoLanePriority
        end
    else
        if v204 ~= nil then
            if p_u_202.callbackPriority == v207 then
                return
            end
            v_u_20(v204)
        end
        local v208
        if v207 == v_u_6.SyncLanePriority then
            v208 = v_u_31(function()
                local v209 = v_u_98.profileRootBeforeUnitOfWork(p_u_202)
                local v210 = v_u_129.performSyncWorkOnRoot(p_u_202)
                v_u_98.profileRootAfterYielding(v209)
                return v210
            end)
        elseif v207 == v_u_6.SyncBatchedLanePriority then
            v208 = v_u_19(v_u_27, function()
                local v211 = v_u_98.profileRootBeforeUnitOfWork(p_u_202)
                local v212 = v_u_129.performSyncWorkOnRoot(p_u_202)
                v_u_98.profileRootAfterYielding(v211)
                return v212
            end)
        else
            v208 = v_u_19(v_u_72(v207), function()
                local v213 = v_u_98.profileRootBeforeUnitOfWork(p_u_202)
                local v214 = v_u_129.performConcurrentWorkOnRoot(p_u_202)
                v_u_98.profileRootAfterYielding(v213)
                return v214
            end)
        end
        p_u_202.callbackPriority = v207
        p_u_202.callbackNode = v208
    end
end
function v_u_129.performConcurrentWorkOnRoot(p_u_215)
    v_u_159 = v_u_45
    v_u_160 = v_u_6.NoLanes
    v_u_161 = v_u_6.NoLanes
    local v216 = v_u_131
    v_u_17(bit32.band(v216, 48) == 0, "Should not already be working.")
    local v217 = p_u_215.callbackNode
    if v_u_5.flushPassiveEffects() and p_u_215.callbackNode ~= v217 then
        return nil
    end
    local v218 = v_u_58
    local v219
    if p_u_215 == v_u_132 then
        v219 = v_u_134
    else
        v219 = v_u_6.NoLanes
    end
    local v220 = v218(p_u_215, v219)
    if v220 == v_u_6.NoLanes then
        return nil
    end
    local v221 = v_u_129.renderRootConcurrent(p_u_215, v220)
    if v_u_49(v_u_138, v_u_141) then
        v_u_129.prepareFreshStack(p_u_215, v_u_6.NoLanes)
    elseif v221 ~= v_u_130.Incomplete then
        if v221 == v_u_130.Errored then
            local v222 = v_u_131
            v_u_131 = bit32.bor(v222, 64)
            if p_u_215.hydrate then
                p_u_215.hydrate = false
                v_u_37.clearContainer(p_u_215.containerInfo)
            end
            v220 = v_u_63(p_u_215)
            if v220 ~= v_u_6.NoLanes then
                v221 = v_u_129.renderRootSync(p_u_215, v220)
            end
        end
        if v221 == v_u_130.FatalErrored then
            local v223 = v_u_137
            v_u_129.prepareFreshStack(p_u_215, v_u_6.NoLanes)
            v_u_129.markRootSuspended(p_u_215, v220)
            v_u_99(p_u_215, v_u_25())
            error(v223)
        end
        p_u_215.finishedWork = p_u_215.current.alternate
        p_u_215.finishedLanes = v220
        v_u_129.finishConcurrentRender(p_u_215, v221, v220)
    end
    v_u_99(p_u_215, v_u_25())
    return p_u_215.callbackNode == v217 and function()
        return v_u_129.performConcurrentWorkOnRoot(p_u_215)
    end or nil
end
local v_u_224 = 0
local v_u_225 = false
function shouldForceFlushFallbacksInDEV()
    local v226 = v_u_1
    if v226 then
        v226 = v_u_224 > 0
    end
    return v226
end
function v_u_129.finishConcurrentRender(p_u_227, p228, p229)
    if p228 == v_u_130.Incomplete or p228 == v_u_130.FatalErrored then
        v_u_17(false, "Root did not complete. This is a bug in React.")
        return
    elseif p228 == v_u_130.Errored then
        v_u_129.commitRoot(p_u_227)
        return
    elseif p228 == v_u_130.Suspended then
        v_u_129.markRootSuspended(p_u_227, p229)
        if v_u_56(p229) and not shouldForceFlushFallbacksInDEV() then
            local v230 = v_u_144 + 500 - v_u_25()
            if v230 > 10 then
                if v_u_58(p_u_227, v_u_6.NoLanes) == v_u_6.NoLanes then
                    local v231 = p_u_227.suspendedLanes
                    if v_u_50(v231, p229) then
                        p_u_227.timeoutHandle = v_u_37.scheduleTimeout(function()
                            return v_u_129.commitRoot(p_u_227)
                        end, v230)
                    else
                        v_u_67(p_u_227, v231, (v_u_5.requestEventTime()))
                    end
                else
                    return
                end
            end
        end
        v_u_129.commitRoot(p_u_227)
        return
    elseif p228 == v_u_130.SuspendedWithDelay then
        v_u_129.markRootSuspended(p_u_227, p229)
        if not v_u_57(p229) then
            if not shouldForceFlushFallbacksInDEV() then
                local v232 = v_u_64(p_u_227, p229)
                local v233 = v_u_25() - v232
                local v234 = jnd(v233) - v233
                if v234 > 10 then
                    p_u_227.timeoutHandle = v_u_37.scheduleTimeout(function()
                        return v_u_129.commitRoot(p_u_227)
                    end, v234)
                    return
                end
            end
            v_u_129.commitRoot(p_u_227)
        end
    elseif p228 == v_u_130.Completed then
        v_u_129.commitRoot(p_u_227)
    else
        v_u_17(false, "Unknown root exit status.")
    end
end
function v_u_129.markRootSuspended(p235, p236)
    v_u_66(p235, (v_u_52(v_u_52(p236, v_u_142), v_u_141)))
end
function v_u_129.performSyncWorkOnRoot(p237)
    local v238 = v_u_131
    v_u_17(bit32.band(v238, 48) == 0, "Should not already be working.")
    v_u_5.flushPassiveEffects()
    local v239, v240
    if p237 == v_u_132 and v_u_49(p237.expiredLanes, v_u_134) then
        v239 = v_u_134
        v240 = v_u_129.renderRootSync(p237, v239)
        if v_u_49(v_u_138, v_u_141) then
            v239 = v_u_58(p237, v239)
            v240 = v_u_129.renderRootSync(p237, v239)
        end
    else
        v239 = v_u_58(p237, v_u_6.NoLanes)
        v240 = v_u_129.renderRootSync(p237, v239)
    end
    if p237.tag ~= v_u_41 and v240 == v_u_130.Errored then
        local v241 = v_u_131
        v_u_131 = bit32.bor(v241, 64)
        if p237.hydrate then
            p237.hydrate = false
            v_u_37.clearContainer(p237.containerInfo)
        end
        v239 = v_u_63(p237)
        if v239 ~= v_u_6.NoLanes then
            v240 = v_u_129.renderRootSync(p237, v239)
        end
    end
    if v240 == v_u_130.FatalErrored then
        local v242 = v_u_137
        v_u_129.prepareFreshStack(p237, v_u_6.NoLanes)
        v_u_129.markRootSuspended(p237, v239)
        v_u_99(p237, v_u_25())
        error(v242)
    end
    p237.finishedWork = p237.current.alternate
    p237.finishedLanes = v239
    v_u_129.commitRoot(p237)
    v_u_99(p237, v_u_25())
    return nil
end
function v_u_5.flushRoot(p243, p244)
    v_u_68(p243, p244)
    v_u_99(p243, v_u_25())
    local v245 = v_u_131
    if bit32.band(v245, 48) == 0 then
        v_u_145 = v_u_25() + 500
        v_u_30()
    end
end
function v_u_5.getExecutionContext()
    return v_u_131
end
function v_u_5.flushDiscreteUpdates()
    local v246 = v_u_131
    if bit32.band(v246, 49) == 0 then
        v_u_129.flushPendingDiscreteUpdates()
        v_u_5.flushPassiveEffects()
    elseif v_u_1 then
        local v247 = v_u_131
        if bit32.band(v247, 16) ~= 0 then
            v_u_3.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is already rendering.")
        end
    end
end
function v_u_5.deferredUpdates(p248)
    if not v_u_9.decoupleUpdatePriorityFromScheduler then
        return v_u_22(v_u_29, p248)
    end
    local v249 = v_u_61()
    local v250, v251
    if v_u_2 then
        v_u_60(v_u_6.DefaultLanePriority)
        v250 = v_u_22(v_u_29, p248)
        v251 = true
    else
        v_u_60(v_u_6.DefaultLanePriority)
        v251, v250 = xpcall(v_u_22, v_u_15, v_u_29, p248)
    end
    v_u_60(v249)
    if v251 then
        return v250
    end
    error(v250)
end
function v_u_129.flushPendingDiscreteUpdates()
    if v_u_154 ~= nil then
        local v252 = v_u_154
        v_u_154 = nil
        v252:forEach(function(p253)
            v_u_69(p253)
            v_u_99(p253, v_u_25())
        end)
    end
    v_u_30()
end
function v_u_5.batchedUpdates(p254, p255)
    local v256 = v_u_131
    local v257 = v_u_131
    v_u_131 = bit32.bor(v257, 1)
    local v258, v259
    if v_u_2 then
        v258 = p254(p255)
        v259 = true
    else
        v259, v258 = xpcall(p254, v_u_15, p255)
    end
    v_u_131 = v256
    if v_u_131 == 0 then
        v_u_145 = v_u_25() + 500
        v_u_30()
    end
    if v259 then
        return v258
    end
    error(v258)
end
function v_u_5.batchedEventUpdates(p260, p261)
    local v262 = v_u_131
    local v263 = v_u_131
    v_u_131 = bit32.bor(v263, 2)
    local v264, v265
    if v_u_2 then
        v264 = p260(p261)
        v265 = true
    else
        v265, v264 = xpcall(p260, v_u_15, p261)
    end
    v_u_131 = v262
    if v_u_131 == 0 then
        v_u_145 = v_u_25() + 500
        v_u_30()
    end
    if v265 then
        return v264
    end
    error(v264)
end
function v_u_5.discreteUpdates(p_u_266, p_u_267, p_u_268, p_u_269, p_u_270)
    local v271 = v_u_131
    local v272 = v_u_131
    v_u_131 = bit32.bor(v272, 4)
    if v_u_9.decoupleUpdatePriorityFromScheduler then
        local v273 = v_u_61()
        v_u_60(v_u_6.InputDiscreteLanePriority)
        local v274, v275 = xpcall(v_u_22, v_u_15, v_u_28, function()
            return p_u_266(p_u_267, p_u_268, p_u_269, p_u_270)
        end)
        v_u_60(v273)
        v_u_131 = v271
        if v_u_131 == 0 then
            v_u_145 = v_u_25() + 500
            v_u_30()
        end
        if v274 then
            return v275
        end
        error(v275)
    else
        local v276, v277 = xpcall(v_u_22, v_u_15, v_u_28, function()
            return p_u_266(p_u_267, p_u_268, p_u_269, p_u_270)
        end)
        v_u_131 = v271
        if v_u_131 == 0 then
            v_u_145 = v_u_25() + 500
            v_u_30()
        end
        if v276 then
            return v277
        end
        error(v277)
    end
end
function v_u_5.unbatchedUpdates(p278, p279)
    local v280 = v_u_131
    local v281 = v_u_131
    v_u_131 = bit32.band(v281, 4294967294)
    local v282 = v_u_131
    v_u_131 = bit32.bor(v282, 8)
    local v283, v284
    if v_u_2 then
        v283 = p278(p279)
        v284 = true
    else
        v284, v283 = xpcall(p278, v_u_15, p279)
    end
    v_u_131 = v280
    if v_u_131 == 0 then
        v_u_145 = v_u_25() + 500
        v_u_30()
    end
    if v284 then
        return v283
    end
    error(v283)
end
function v_u_5.flushSync(p_u_285, p_u_286)
    local v287 = v_u_131
    if bit32.band(v287, 48) ~= 0 then
        if v_u_1 then
            v_u_3.error("flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.")
        end
        return p_u_285(p_u_286)
    end
    local v288 = v_u_131
    v_u_131 = bit32.bor(v288, 1)
    if not v_u_9.decoupleUpdatePriorityFromScheduler then
        local v289, v290
        if v_u_2 then
            v289 = true
            if p_u_285 then
                v290 = v_u_22(v_u_27, function()
                    return p_u_285(p_u_286)
                end)
            else
                v290 = nil
            end
        elseif p_u_285 then
            v289, v290 = xpcall(v_u_22, v_u_15, v_u_27, function()
                return p_u_285(p_u_286)
            end)
        else
            v289 = true
            v290 = nil
        end
        v_u_131 = v287
        v_u_30()
        if not v289 then
            error(v290)
        end
        return v290
    end
    local v291 = v_u_61()
    v_u_60(v_u_6.SyncLanePriority)
    local v292, v293
    if v_u_2 then
        v292 = true
        v_u_60(v_u_6.SyncLanePriority)
        if p_u_285 then
            v293 = v_u_22(v_u_27, function()
                return p_u_285(p_u_286)
            end)
        else
            v293 = nil
        end
    elseif p_u_285 then
        v292, v293 = xpcall(v_u_22, v_u_15, v_u_27, function()
            return p_u_285(p_u_286)
        end)
    else
        v292 = true
        v293 = nil
    end
    v_u_60(v291)
    v_u_131 = v287
    v_u_30()
    if not v292 then
        error(v293)
    end
    return v293
end
function v_u_5.flushControlled(p294)
    local v295 = v_u_131
    local v296 = v_u_131
    v_u_131 = bit32.bor(v296, 1)
    if v_u_9.decoupleUpdatePriorityFromScheduler then
        local v297 = v_u_61()
        v_u_60(v_u_6.SyncLanePriority)
        local v298, v299 = xpcall(v_u_22, v_u_15, v_u_27, p294)
        v_u_60(v297)
        v_u_131 = v295
        if v_u_131 == 0 then
            v_u_145 = v_u_25() + 500
            v_u_30()
        end
        if not v298 then
            error(v299)
            return
        end
    else
        local v300, v301 = xpcall(v_u_22, v_u_15, v_u_27, p294)
        v_u_131 = v295
        if v_u_131 == 0 then
            v_u_145 = v_u_25() + 500
            v_u_30()
        end
        if not v300 then
            error(v301)
        end
    end
end
function v_u_5.pushRenderLanes(p302, p303)
    v_u_107(v_u_135, v_u_5.subtreeRenderLanes, p302)
    v_u_5.subtreeRenderLanes = v_u_51(v_u_5.subtreeRenderLanes, p303)
    v_u_138 = v_u_51(v_u_138, p303)
end
function v_u_5.popRenderLanes(p304)
    v_u_5.subtreeRenderLanes = v_u_135.current
    v_u_108(v_u_135, p304)
end
function v_u_129.prepareFreshStack(p305, p306)
    p305.finishedWork = nil
    p305.finishedLanes = v_u_6.NoLanes
    local v307 = p305.timeoutHandle
    if v307 ~= v_u_37.noTimeout then
        p305.timeoutHandle = v_u_37.noTimeout
        v_u_37.cancelTimeout(v307)
    end
    if v_u_133 ~= nil then
        local v308 = v_u_133.return_
        while v308 ~= nil do
            v_u_76(v308)
            v308 = v308.return_
        end
    end
    v_u_132 = p305
    v_u_133 = v_u_38.createWorkInProgress(p305.current, nil)
    v_u_134 = p306
    v_u_5.subtreeRenderLanes = p306
    v_u_138 = p306
    v_u_136 = v_u_130.Incomplete
    v_u_137 = nil
    v_u_140(v_u_6.NoLanes)
    v_u_141 = v_u_6.NoLanes
    v_u_142 = v_u_6.NoLanes
    if v_u_9.enableSchedulerTracing then
        v_u_158 = nil
    end
    if v_u_1 then
        v_u_112.discardPendingWarnings()
    end
end
function v_u_129.handleError(p_u_309, p_u_310)
    while true do
        local v_u_311 = v_u_133
        local v314, v315 = pcall(function()
            v_u_97()
            if not v_u_100.resetHooksAfterThrowRef then
                v_u_105 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
                v_u_100.resetHooksAfterThrowRef = v_u_105.resetHooksAfterThrow
                v_u_100.ContextOnlyDispatcherRef = v_u_105.ContextOnlyDispatcher
                v_u_100.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v_u_105.getIsUpdatingOpaqueValueInRenderPhaseInDEV
            end
            v_u_100.resetHooksAfterThrowRef()
            v_u_115()
            v_u_126.current = nil
            if v_u_311 == nil or v_u_311.return_ == nil then
                v_u_136 = v_u_130.FatalErrored
                v_u_137 = p_u_310
                v_u_133 = nil
            else
                if v_u_9.enableProfilerTimer then
                    local v312 = v_u_311.mode
                    local v313 = v_u_39.ProfileMode
                    if bit32.band(v312, v313) ~= 0 then
                        v_u_110.stopProfilerTimerIfRunningAndRecordDelta(v_u_311, true)
                    end
                end
                v_u_78(p_u_309, v_u_311.return_, v_u_311, p_u_310, v_u_134, v_u_5.onUncaughtError, v_u_5.renderDidError)
                v_u_129.completeUnitOfWork(v_u_311)
            end
        end)
        if v314 then
            break
        end
        p_u_310 = v315
        if v_u_133 == v_u_311 and v_u_311 ~= nil then
            v_u_311 = v_u_311.return_
            v_u_133 = v_u_311
        else
            v_u_311 = v_u_133
        end
    end
end
function v_u_129.pushDispatcher()
    local v316 = v_u_125.current
    local v317 = v_u_125
    if not v_u_100.ContextOnlyDispatcherRef then
        v_u_105 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        v_u_100.resetHooksAfterThrowRef = v_u_105.resetHooksAfterThrow
        v_u_100.ContextOnlyDispatcherRef = v_u_105.ContextOnlyDispatcher
        v_u_100.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v_u_105.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    v317.current = v_u_100.ContextOnlyDispatcherRef
    if v316 ~= nil then
        return v316
    end
    if not v_u_100.ContextOnlyDispatcherRef then
        v_u_105 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        v_u_100.resetHooksAfterThrowRef = v_u_105.resetHooksAfterThrow
        v_u_100.ContextOnlyDispatcherRef = v_u_105.ContextOnlyDispatcher
        v_u_100.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v_u_105.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return v_u_100.ContextOnlyDispatcherRef
end
function v_u_129.popDispatcher(p318)
    v_u_125.current = p318
end
function v_u_129.pushInteractions(p319)
    if not v_u_9.enableSchedulerTracing then
        return nil
    end
    local v320 = v_u_35.current
    v_u_35.current = p319.memoizedInteractions
    return v320
end
function v_u_129.popInteractions(p321)
    if v_u_9.enableSchedulerTracing then
        v_u_35.current = p321
    end
end
function v_u_5.markCommitTimeOfFallback()
    v_u_144 = v_u_25()
end
function v_u_5.markSkippedUpdateLanes(p322)
    v_u_139.markSkippedUpdateLanes(p322)
end
function v_u_5.renderDidSuspend()
    if v_u_136 == v_u_130.Incomplete then
        v_u_136 = v_u_130.Suspended
    end
end
function v_u_5.renderDidSuspendDelayIfPossible()
    if v_u_136 == v_u_130.Incomplete or v_u_136 == v_u_130.Suspended then
        v_u_136 = v_u_130.SuspendedWithDelay
    end
    if v_u_132 ~= nil and (v_u_55(v_u_140()) or v_u_55(v_u_141)) then
        v_u_129.markRootSuspended(v_u_132, v_u_134)
    end
end
function v_u_5.renderDidError()
    if v_u_136 ~= v_u_130.Completed then
        v_u_136 = v_u_130.Errored
    end
end
function v_u_5.renderHasNotSuspendedYet()
    return v_u_136 == v_u_130.Incomplete
end
function v_u_129.renderRootSync(p323, p324)
    local v325 = v_u_131
    local v326 = v_u_131
    v_u_131 = bit32.bor(v326, 16)
    local v327 = v_u_129.pushDispatcher()
    if v_u_132 ~= p323 or v_u_134 ~= p324 then
        v_u_129.prepareFreshStack(p323, p324)
        v_u_129.startWorkOnPendingInteractions(p323, p324)
    end
    local v328 = v_u_129.pushInteractions(p323)
    if v_u_1 and v_u_10 then
        v_u_32.logRenderStarted(p324)
    end
    if v_u_11 then
        v_u_33.markRenderStarted(p324)
    end
    while true do
        local v329 = nil
        local v330
        if v_u_2 then
            v_u_129.workLoopSync()
            v330 = true
        else
            v330, v329 = xpcall(v_u_129.workLoopSync, v_u_15)
        end
        if v330 then
            v_u_97()
            if v_u_9.enableSchedulerTracing then
                v_u_129.popInteractions(v328)
            end
            v_u_131 = v325
            v_u_129.popDispatcher(v327)
            if v_u_133 ~= nil then
                v_u_17(false, "Cannot commit an incomplete root. This error is likely caused by a bug in React. Please file an issue.")
            end
            if v_u_1 and v_u_10 then
                v_u_32.logRenderStopped()
            end
            if v_u_11 then
                v_u_33.markRenderStopped()
            end
            v_u_132 = nil
            v_u_134 = v_u_6.NoLanes
            return v_u_136
        end
        v_u_129.handleError(p323, v329)
    end
end
function v_u_129.workLoopSync()
    while v_u_133 ~= nil do
        v_u_129.performUnitOfWork(v_u_133)
    end
end
function v_u_129.renderRootConcurrent(p331, p332)
    local v333 = v_u_131
    local v334 = v_u_131
    v_u_131 = bit32.bor(v334, 16)
    local v335 = v_u_129.pushDispatcher()
    if v_u_132 ~= p331 or v_u_134 ~= p332 then
        v_u_145 = v_u_25() + 500
        v_u_129.prepareFreshStack(p331, p332)
        v_u_129.startWorkOnPendingInteractions(p331, p332)
    end
    local v336 = v_u_129.pushInteractions(p331)
    if v_u_1 and v_u_10 then
        v_u_32.logRenderStarted(p332)
    end
    if v_u_11 then
        v_u_33.markRenderStarted(p332)
    end
    while true do
        local v337, v338
        if v_u_2 then
            v_u_129.workLoopConcurrent()
            v337 = "break"
            v338 = true
        else
            v338, v337 = xpcall(v_u_129.workLoopConcurrent, v_u_15)
            if v338 then
                v337 = "break"
            end
        end
        if v337 == "break" then
            v_u_97()
            if v_u_9.enableSchedulerTracing then
                v_u_129.popInteractions(v336)
            end
            v_u_129.popDispatcher(v335)
            v_u_131 = v333
            if v_u_1 and v_u_10 then
                v_u_32.logRenderStopped()
            end
            if v_u_133 ~= nil then
                if v_u_11 then
                    v_u_33.markRenderYielded()
                end
                return v_u_130.Incomplete
            end
            if v_u_11 then
                v_u_33.markRenderStopped()
            end
            v_u_132 = nil
            v_u_134 = v_u_6.NoLanes
            return v_u_136
        end
        if not v338 then
            v_u_129.handleError(p331, v337)
        end
    end
end
function v_u_129.workLoopConcurrent()
    while v_u_133 ~= nil and not v_u_23() do
        v_u_129.performUnitOfWork(v_u_133)
    end
end
function v_u_129.performUnitOfWork(p339)
    local v340 = v_u_98.profileUnitOfWorkBefore(p339)
    local v341 = p339.alternate
    v_u_116(p339)
    if v_u_9.enableProfilerTimer then
        local v342 = p339.mode
        local v343 = v_u_39.ProfileMode
        if bit32.band(v342, v343) ~= v_u_39.NoMode then
            v_u_110.startProfilerTimer(p339)
            v344 = v_u_129.beginWork(v341, p339, v_u_5.subtreeRenderLanes)
            v_u_110.stopProfilerTimerIfRunningAndRecordDelta(p339, true)
            ::l4::
            v_u_115()
            p339.memoizedProps = p339.pendingProps
            if v344 == nil then
                v_u_129.completeUnitOfWork(p339)
            else
                v_u_133 = v344
            end
            v_u_126.current = nil
            v_u_98.profileUnitOfWorkAfter(v340)
            return
        end
    end
    local v344 = v_u_129.beginWork(v341, p339, v_u_5.subtreeRenderLanes)
    goto l4
end
function v_u_129.completeUnitOfWork(p345)
    while true do
        local v346 = p345.alternate
        local v347 = p345.return_
        local v348 = p345.flags
        local v349 = v_u_42.Incomplete
        if bit32.band(v348, v349) == v_u_42.NoFlags then
            break
        end
        local v350 = v_u_75(p345, v_u_5.subtreeRenderLanes)
        if v350 ~= nil then
            local v351 = v350.flags
            local v352 = v_u_42.HostEffectMask
            v350.flags = bit32.band(v351, v352)
            v_u_133 = v350
            return
        end
        if v_u_9.enableProfilerTimer then
            local v353 = p345.mode
            local v354 = v_u_39.ProfileMode
            if bit32.band(v353, v354) ~= v_u_39.NoMode then
                v_u_110.stopProfilerTimerIfRunningAndRecordDelta(p345, false)
                local v355 = p345.actualDuration or 0
                local v356 = p345.child
                while v356 ~= nil do
                    v355 = v355 + (v356.actualDuration or 0)
                    v356 = v356.sibling
                end
                p345.actualDuration = v355
            end
        end
        if v347 ~= nil then
            local v357 = v347.flags
            local v358 = v_u_42.Incomplete
            v347.flags = bit32.bor(v357, v358)
            v347.subtreeFlags = v_u_42.NoFlags
            v347.deletions = nil
        end
        ::l12::
        local v359 = p345.sibling
        if v359 ~= nil then
            v_u_133 = v359
            return
        end
        v_u_133 = v347
        if v347 == nil then
            if v_u_136 == v_u_130.Incomplete then
                v_u_136 = v_u_130.Completed
            end
            return
        end
        p345 = v347
    end
    v_u_116(p345)
    if v_u_9.enableProfilerTimer then
        local v360 = p345.mode
        local v361 = v_u_39.ProfileMode
        if bit32.band(v360, v361) ~= v_u_39.NoMode then
            v_u_110.startProfilerTimer(p345)
            local v362 = v_u_5.subtreeRenderLanes
            if not v_u_100.completeWorkRef then
                v_u_100.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
            end
            v364 = v_u_100.completeWorkRef(v346, p345, v362)
            v_u_110.stopProfilerTimerIfRunningAndRecordDelta(p345, false)
            goto l8
        end
    end
    local v363 = v_u_5.subtreeRenderLanes
    if not v_u_100.completeWorkRef then
        v_u_100.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
    end
    local v364 = v_u_100.completeWorkRef(v346, p345, v363)
    ::l8::
    v_u_115()
    if v364 ~= nil then
        v_u_133 = v364
        return
    end
    goto l12
end
function v_u_129.commitRoot(p_u_365)
    local v_u_366 = v_u_21()
    v_u_22(v_u_27, function()
        v_u_98.profileCommitBefore()
        local v367 = v_u_129.commitRootImpl(p_u_365, v_u_366)
        v_u_98.profileCommitAfter()
        return v367
    end)
    return nil
end
function v_u_129.commitRootImpl(p368, p369)
    repeat
        v_u_5.flushPassiveEffects()
    until v_u_151 == nil
    flushRenderPhaseStrictModeWarningsInDEV()
    local v370 = v_u_131
    v_u_17(bit32.band(v370, 48) == 0, "Should not already be working.")
    local v371 = p368.finishedWork
    local v372 = p368.finishedLanes
    if v_u_1 and v_u_10 then
        v_u_32.logCommitStarted(v372)
    end
    if v_u_11 then
        v_u_33.markCommitStarted(v372)
    end
    if v371 == nil then
        if v_u_1 and v_u_10 then
            v_u_32.logCommitStopped()
        end
        if v_u_11 then
            v_u_33.markCommitStopped()
        end
        return nil
    end
    p368.finishedWork = nil
    p368.finishedLanes = v_u_6.NoLanes
    v_u_17(v371 ~= p368.current, "Cannot commit the same tree as before. This error is likely caused by a bug in React. Please file an issue.")
    p368.callbackNode = nil
    local v373 = v_u_51(v371.lanes, v371.childLanes)
    v_u_70(p368, v373)
    if v_u_154 ~= nil and (not v_u_54(v373) and v_u_154:has(p368)) then
        v_u_154:delete(p368)
    end
    if p368 == v_u_132 then
        v_u_132 = nil
        v_u_133 = nil
        v_u_134 = v_u_6.NoLanes
    end
    local v374 = v371.subtreeFlags
    local v375 = v_u_42.BeforeMutationMask
    local v376 = v_u_42.MutationMask
    local v377 = v_u_42.LayoutMask
    local v378 = v_u_42.PassiveMask
    local v379 = bit32.bor(v375, v376, v377, v378)
    local v380 = bit32.band(v374, v379) ~= v_u_42.NoFlags
    local v381 = v371.flags
    local v382 = v_u_42.BeforeMutationMask
    local v383 = v_u_42.MutationMask
    local v384 = v_u_42.LayoutMask
    local v385 = v_u_42.PassiveMask
    local v386 = bit32.bor(v382, v383, v384, v385)
    if not v380 and bit32.band(v381, v386) == v_u_42.NoFlags then
        p368.current = v371
        if v_u_9.enableProfilerTimer then
            v_u_110.recordCommitTime()
        end
        goto l68
    end
    local v387
    if v_u_9.decoupleUpdatePriorityFromScheduler then
        v387 = v_u_61()
        v_u_60(v_u_6.SyncLanePriority)
    else
        v387 = nil
    end
    local v388 = v_u_131
    local v389 = v_u_131
    v_u_131 = bit32.bor(v389, 32)
    local v390 = v_u_129.pushInteractions(p368)
    v_u_126.current = nil
    v_u_162 = v_u_37.prepareForCommit(p368.containerInfo)
    v_u_163 = false
    v_u_129.commitBeforeMutationEffects(v371)
    v_u_162 = nil
    if v_u_9.enableProfilerTimer then
        v_u_110.recordCommitTime()
    end
    v_u_129.commitMutationEffects(v371, p368, p369)
    if v_u_163 then
        v_u_37.afterActiveInstanceBlur()
    end
    v_u_37.resetAfterCommit(p368.containerInfo)
    p368.current = v371
    if v_u_1 and v_u_10 then
        v_u_32.logLayoutEffectsStarted(v372)
    end
    if v_u_11 then
        v_u_33.markLayoutEffectsStarted(v372)
    end
    if v_u_1 then
        v_u_116(v371)
        v_u_118(nil, v_u_94, nil, v371, p368, v_u_5.captureCommitPhaseError, v_u_5.schedulePassiveEffectCallback)
        if v_u_119() then
            v_u_128(v371, v371, (v_u_120()))
        end
        v_u_115()
    else
        local v391 = nil
        local v392
        if v_u_2 then
            v_u_94(v371, p368, v_u_5.captureCommitPhaseError, v_u_5.schedulePassiveEffectCallback)
            v392 = true
        else
            v392, v391 = xpcall(v_u_94, v_u_15, v371, p368, v_u_5.captureCommitPhaseError, v_u_5.schedulePassiveEffectCallback)
        end
        if not v392 then
            v_u_128(v371, v371, v391)
        end
    end
    if v_u_1 and v_u_10 then
        v_u_32.logLayoutEffectsStopped()
    end
    if v_u_11 then
        v_u_33.markLayoutEffectsStopped()
    end
    local v393 = v371.subtreeFlags
    local v394 = v_u_42.PassiveMask
    if bit32.band(v393, v394) == v_u_42.NoFlags then
        local v395 = v371.flags
        local v396 = v_u_42.PassiveMask
        if bit32.band(v395, v396) == v_u_42.NoFlags then
            ::l63::
            v_u_24()
            if v_u_9.enableSchedulerTracing then
                v_u_129.popInteractions(v390)
            end
            v_u_131 = v388
            if v_u_9.decoupleUpdatePriorityFromScheduler and v387 ~= nil then
                v_u_60(v387)
            end
            ::l68::
            local v397 = v_u_150
            if v_u_150 then
                v_u_150 = false
                v_u_151 = p368
                v_u_153 = v372
                v_u_152 = p369
            end
            local v398 = p368.pendingLanes
            if v398 == v_u_6.NoLanes then
                v_u_149 = nil
            elseif v_u_9.enableSchedulerTracing then
                if v_u_158 ~= nil then
                    local v399 = v_u_158
                    v_u_158 = nil
                    for v400 = 1, #v399 do
                        scheduleInteractions(p368, v399[v400], p368.memoizedInteractions)
                    end
                end
                v_u_129.schedulePendingInteractions(p368, v398)
            end
            if v_u_1 and (v_u_13 and not v397) then
                commitDoubleInvokeEffectsInDEV(p368.current, false)
            end
            if v_u_9.enableSchedulerTracing and not v397 then
                v_u_129.finishPendingInteractions(p368, v372)
            end
            if v398 == v_u_43 then
                if p368 == v_u_156 then
                    v_u_155 = v_u_155 + 1
                else
                    v_u_155 = 0
                    v_u_156 = p368
                end
            else
                v_u_155 = 0
            end
            v_u_121(v371.stateNode, p369)
            if v_u_1 then
                v_u_122()
            end
            v_u_99(p368, v_u_25())
            if v_u_147 then
                v_u_147 = false
                local v401 = v_u_148
                v_u_148 = nil
                error(v401)
            end
            local v402 = v_u_131
            if bit32.band(v402, 8) ~= 0 then
                if v_u_1 and v_u_10 then
                    v_u_32.logCommitStopped()
                end
                if v_u_11 then
                    v_u_33.markCommitStopped()
                end
                return nil
            end
            v_u_30()
            if v_u_1 and v_u_10 then
                v_u_32.logCommitStopped()
            end
            if v_u_11 then
                v_u_33.markCommitStopped()
            end
            return nil
        end
    end
    if not v_u_150 then
        v_u_150 = true
        v_u_19(v_u_29, function()
            v_u_5.flushPassiveEffects()
            return nil
        end)
    end
    goto l63
end
function v_u_129.commitBeforeMutationEffects(p403)
    while p403 ~= nil do
        if p403.deletions ~= nil then
            v_u_129.commitBeforeMutationEffectsDeletions(p403.deletions)
        end
        if p403.child ~= nil then
            local v404 = p403.subtreeFlags
            local v405 = v_u_42.BeforeMutationMask
            if bit32.band(v404, v405) ~= v_u_42.NoFlags then
                v_u_129.commitBeforeMutationEffects(p403.child)
            end
        end
        if v_u_1 then
            v_u_116(p403)
            v_u_118(nil, v_u_129.commitBeforeMutationEffectsImpl, nil, p403)
            if v_u_119() then
                local v406 = v_u_120()
                v_u_5.captureCommitPhaseError(p403, p403.return_, v406)
            end
            v_u_115()
        else
            local v407 = nil
            local v408
            if v_u_2 then
                v_u_129.commitBeforeMutationEffectsImpl(p403)
                v408 = true
            else
                v408, v407 = xpcall(v_u_129.commitBeforeMutationEffectsImpl, v_u_15, p403)
            end
            if not v408 then
                v_u_5.captureCommitPhaseError(p403, p403.return_, v407)
            end
        end
        p403 = p403.sibling
    end
end
function v_u_129.commitBeforeMutationEffectsImpl(p409)
    local v410 = p409.alternate
    local v411 = p409.flags
    if not v_u_163 and (v_u_162 ~= nil and (p409.tag == v_u_40.SuspenseComponent and (v_u_81.isSuspenseBoundaryBeingHidden(v410, p409) and v_u_124(p409, v_u_162)))) then
        v_u_163 = true
        v_u_37.beforeActiveInstanceBlur()
    end
    local v412 = v_u_42.Snapshot
    if bit32.band(v411, v412) ~= v_u_42.NoFlags then
        v_u_116(p409)
        v_u_82(v410, p409)
        v_u_115()
    end
    local v413 = v_u_42.Passive
    if bit32.band(v411, v413) ~= v_u_42.NoFlags and not v_u_150 then
        v_u_150 = true
        v_u_19(v_u_29, function()
            v_u_5.flushPassiveEffects()
            return nil
        end)
    end
end
function v_u_129.commitBeforeMutationEffectsDeletions(p414)
    for v415 = 1, #p414 do
        if v_u_124(p414[v415], v_u_162) then
            v_u_163 = true
            v_u_37.beforeActiveInstanceBlur()
        end
    end
end
function v_u_129.commitMutationEffects(p416, p417, p418)
    while p416 ~= nil do
        local v419 = p416.deletions
        if v419 ~= nil then
            for _, v420 in v419 do
                local v421, v422 = xpcall(v_u_85, v_u_15, p417, v420, p416, p418)
                if not v421 then
                    v_u_5.captureCommitPhaseError(v420, p416, v422)
                end
            end
        end
        if p416.child ~= nil then
            local v423 = p416.subtreeFlags
            local v424 = v_u_42.MutationMask
            if bit32.band(v423, v424) ~= v_u_42.NoFlags then
                v_u_129.commitMutationEffects(p416.child, p417, p418)
            end
        end
        if v_u_1 then
            v_u_116(p416)
            v_u_118(nil, v_u_129.commitMutationEffectsImpl, nil, p416, p417, p418)
            if v_u_119() then
                local v425 = v_u_120()
                v_u_5.captureCommitPhaseError(p416, p416.return_, v425)
            end
            v_u_115()
        else
            local v426 = nil
            local v427
            if v_u_2 then
                v_u_129.commitMutationEffectsImpl(p416, p417, p418)
                v427 = true
            else
                v427, v426 = xpcall(v_u_129.commitMutationEffectsImpl, v_u_15, p416, p417, p418)
            end
            if not v427 then
                v_u_5.captureCommitPhaseError(p416, p416.return_, v426)
            end
        end
        p416 = p416.sibling
    end
end
function v_u_129.commitMutationEffectsImpl(p428, _, _)
    local v429 = p428.flags
    local v430 = v_u_42.Ref
    if bit32.band(v429, v430) ~= 0 then
        local v431 = p428.alternate
        if v431 ~= nil then
            v_u_89(v431)
        end
    end
    local v432 = v_u_42.Placement
    local v433 = v_u_42.Update
    local v434 = v_u_42.Hydrating
    local v435 = bit32.bor(v432, v433, v434)
    local v436 = bit32.band(v429, v435)
    if v436 == v_u_42.Placement then
        v_u_83(p428)
        local v437 = p428.flags
        local v438 = v_u_42.Placement
        local v439 = bit32.bnot(v438)
        p428.flags = bit32.band(v437, v439)
        return
    elseif v436 == v_u_42.PlacementAndUpdate then
        v_u_83(p428)
        local v440 = p428.flags
        local v441 = v_u_42.Placement
        local v442 = bit32.bnot(v441)
        p428.flags = bit32.band(v440, v442)
        v_u_84(p428.alternate, p428)
    elseif v436 == v_u_42.Update then
        v_u_84(p428.alternate, p428)
    end
end
function v_u_129.commitMutationEffectsDeletions(p443, p444, p445, p446)
    for _, v447 in p443 do
        local v448, v449 = xpcall(v_u_85, v_u_15, p445, v447, p444, p446)
        if not v448 then
            v_u_5.captureCommitPhaseError(v447, p444, v449)
        end
    end
end
function v_u_5.schedulePassiveEffectCallback()
    if not v_u_150 then
        v_u_150 = true
        v_u_19(v_u_29, function()
            v_u_5.flushPassiveEffects()
            return nil
        end)
    end
end
local v_u_450 = nil
function v_u_5.flushPassiveEffects()
    if v_u_152 == v_u_26 then
        return false
    end
    local v451
    if v_u_29 < v_u_152 then
        v451 = v_u_29
    else
        v451 = v_u_152
    end
    v_u_152 = v_u_26
    if not v_u_9.decoupleUpdatePriorityFromScheduler then
        return v_u_22(v451, v_u_450)
    end
    local v452 = v_u_61()
    v_u_60(v_u_71(v451))
    local v453, v454
    if v_u_2 then
        v_u_60(v_u_71(v451))
        v453 = v_u_22(v451, v_u_450)
        v454 = true
    else
        v454, v453 = xpcall(v_u_22, v_u_15, v451, v_u_450)
    end
    v_u_60(v452)
    if not v454 then
        error(v453)
    end
    return v453
end
local function v_u_467(p455, p456)
    while p456 ~= nil do
        local v457
        if v_u_9.enableProfilerTimer and (v_u_9.enableProfilerCommitHooks and p456.tag == v_u_40.Profiler) then
            v457 = v_u_146
            v_u_146 = p456
        else
            v457 = nil
        end
        local v458 = p456.subtreeFlags
        local v459 = v_u_42.PassiveMask
        local v460 = bit32.band(v458, v459)
        if p456.child ~= nil and v460 ~= v_u_42.NoFlags then
            v_u_467(p455, p456.child)
        end
        local v461 = p456.flags
        local v462 = v_u_42.Passive
        if bit32.band(v461, v462) ~= v_u_42.NoFlags then
            if v_u_1 then
                v_u_116(p456)
                v_u_118(nil, v_u_88, nil, p455, p456)
                if v_u_119() then
                    local v463 = v_u_120()
                    v_u_5.captureCommitPhaseError(p456, p456.return_, v463)
                end
                v_u_115()
            else
                local v464 = nil
                local v465
                if v_u_2 then
                    v_u_88(p455, p456)
                    v465 = true
                else
                    v465, v464 = xpcall(v_u_88, v_u_15, p455, p456)
                end
                if not v465 then
                    v_u_5.captureCommitPhaseError(p456, p456.return_, v464)
                end
            end
        end
        if v_u_9.enableProfilerTimer and (v_u_9.enableProfilerCommitHooks and p456.tag == v_u_40.Profiler) then
            if v457 ~= nil then
                local v466 = v457.stateNode
                v466.passiveEffectDuration = v466.passiveEffectDuration + p456.stateNode.passiveEffectDuration
            end
            v_u_146 = v457
        end
        p456 = p456.sibling
    end
end
local function v_u_477(p468)
    while p468 ~= nil do
        local v469 = p468.deletions
        if v469 ~= nil then
            for v470 = 1, #v469 do
                local v471 = v469[v470]
                v_u_129.flushPassiveUnmountEffectsInsideOfDeletedTree(v471, p468)
                v_u_129.detachFiberAfterEffects(v471)
            end
        end
        local v472 = p468.child
        if v472 ~= nil then
            local v473 = p468.subtreeFlags
            local v474 = v_u_42.PassiveMask
            if bit32.band(v473, v474) ~= v_u_42.NoFlags then
                v_u_477(v472)
            end
        end
        local v475 = p468.flags
        local v476 = v_u_42.Passive
        if bit32.band(v475, v476) ~= v_u_42.NoFlags then
            v_u_116(p468)
            v_u_86(p468)
            v_u_115()
        end
        p468 = p468.sibling
    end
end
function v_u_129.flushPassiveUnmountEffectsInsideOfDeletedTree(p478, p479)
    local v480 = p478.subtreeFlags
    local v481 = v_u_42.PassiveStatic
    if bit32.band(v480, v481) ~= v_u_42.NoFlags then
        local v482 = p478.child
        while v482 ~= nil do
            v_u_129.flushPassiveUnmountEffectsInsideOfDeletedTree(v482, p479)
            v482 = v482.sibling
        end
    end
    local v483 = p478.flags
    local v484 = v_u_42.PassiveStatic
    if bit32.band(v483, v484) ~= v_u_42.NoFlags then
        v_u_116(p478)
        v_u_87(p478, p479)
        v_u_115()
    end
end
v_u_450 = function()
    if v_u_151 == nil then
        return false
    end
    local v485 = v_u_151
    local v486 = v_u_153
    v_u_151 = nil
    v_u_153 = v_u_6.NoLanes
    local v487 = v_u_131
    v_u_17(bit32.band(v487, 48) == 0, "Cannot flush passive effects while already rendering.")
    if v_u_1 and v_u_10 then
        v_u_32.logPassiveEffectsStarted(v486)
    end
    if v_u_11 then
        v_u_33.markPassiveEffectsStarted(v486)
    end
    local v488 = v_u_131
    local v489 = v_u_131
    v_u_131 = bit32.bor(v489, 32)
    local v490 = v_u_129.pushInteractions(v485)
    v_u_477(v485.current)
    v_u_467(v485, v485.current)
    if v_u_1 and v_u_10 then
        v_u_32.logPassiveEffectsStopped()
    end
    if v_u_11 then
        v_u_33.markPassiveEffectsStopped()
    end
    if v_u_1 and v_u_13 then
        commitDoubleInvokeEffectsInDEV(v485.current, true)
    end
    if v_u_9.enableSchedulerTracing then
        v_u_129.popInteractions(v490)
        v_u_129.finishPendingInteractions(v485, v486)
    end
    v_u_131 = v488
    v_u_30()
    if v_u_151 == nil then
        v_u_157 = 0
    else
        v_u_157 = v_u_157 + 1
    end
    return true
end
function v_u_5.isAlreadyFailedLegacyErrorBoundary(p491)
    local v492
    if v_u_149 == nil then
        v492 = false
    else
        v492 = v_u_149:has(p491)
    end
    return v492
end
function v_u_5.markLegacyErrorBoundaryAsFailed(p493)
    if v_u_149 == nil then
        v_u_149 = v_u_4.new({ p493 })
    else
        v_u_149:add(p493)
    end
end
function v_u_5.onUncaughtError(p494)
    if not v_u_147 then
        v_u_147 = true
        v_u_148 = p494
    end
end
v_u_128 = function(p495, p496, p497)
    v_u_96(p495, (v_u_79(p495, v_u_106(p497, p496), v_u_43, v_u_5.onUncaughtError)))
    local v498 = v_u_5.requestEventTime()
    local v499 = v_u_129.markUpdateLaneFromFiberToRoot(p495, v_u_43)
    if v499 ~= nil then
        v_u_65(v499, v_u_43, v498)
        v_u_99(v499, v498)
        v_u_129.schedulePendingInteractions(v499, v_u_43)
    end
end
function v_u_5.captureCommitPhaseError()
    -- failed to decompile
end
function v_u_5.pingSuspendedRoot(p500, p501, p502)
    local v503 = p500.pingCache
    if v503 ~= nil then
        v503[p501] = nil
    end
    local v504 = v_u_5.requestEventTime()
    v_u_67(p500, p502, v504)
    if v_u_132 == p500 and v_u_50(v_u_134, p502) then
        if v_u_136 == v_u_130.SuspendedWithDelay or v_u_136 == v_u_130.Suspended and (v_u_56(v_u_134) and v_u_25() - v_u_144 < 500) then
            v_u_129.prepareFreshStack(p500, v_u_6.NoLanes)
        else
            v_u_142 = v_u_51(v_u_142, p502)
        end
    end
    v_u_99(p500, v504)
    v_u_129.schedulePendingInteractions(p500, p502)
end
function retryTimedOutBoundary(p505, p506)
    if p506 == v_u_6.NoLane then
        p506 = requestRetryLane(p505)
    end
    local v507 = v_u_5.requestEventTime()
    local v508 = v_u_129.markUpdateLaneFromFiberToRoot(p505, p506)
    if v508 ~= nil then
        v_u_65(v508, p506, v507)
        v_u_99(v508, v507)
        v_u_129.schedulePendingInteractions(v508, p506)
    end
end
function v_u_5.resolveRetryWakeable(p509, p510)
    local v511 = v_u_6.NoLane
    local v512 = p509.stateNode
    if v512 ~= nil then
        v512:delete(p510)
    end
    retryTimedOutBoundary(p509, v511)
end
function jnd(p513)
    if p513 < 120 then
        return 120
    end
    if p513 < 480 then
        return 480
    end
    if p513 < 1080 then
        return 1080
    end
    if p513 < 1920 then
        return 1920
    end
    if p513 < 3000 then
        return 3000
    end
    if p513 < 4320 then
        return 4320
    end
    local v514 = p513 / 1960
    return math.ceil(v514) * 1960
end
function v_u_129.checkForNestedUpdates()
    if v_u_155 > 50 then
        v_u_155 = 0
        v_u_156 = nil
        v_u_17(false, "Maximum update depth exceeded. This can happen when a component repeatedly calls setState inside componentWillUpdate or componentDidUpdate. React limits the number of nested updates to prevent infinite loops.")
    end
    if v_u_1 and v_u_157 > 50 then
        v_u_157 = 0
        v_u_3.error("Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn\'t have a dependency array, or one of the dependencies changes on every render.")
    end
end
function flushRenderPhaseStrictModeWarningsInDEV()
    if v_u_1 then
        v_u_112.flushLegacyContextWarning()
        if v_u_9.warnAboutDeprecatedLifecycles then
            v_u_112.flushPendingUnsafeLifecycleWarnings()
        end
    end
end
function commitDoubleInvokeEffectsInDEV(p515, p516)
    if v_u_1 and v_u_13 then
        v_u_116(p515)
        invokeEffectsInDev(p515, v_u_42.MountLayoutDev, v_u_92)
        if p516 then
            invokeEffectsInDev(p515, v_u_42.MountPassiveDev, v_u_93)
        end
        invokeEffectsInDev(p515, v_u_42.MountLayoutDev, v_u_90)
        if p516 then
            invokeEffectsInDev(p515, v_u_42.MountPassiveDev, v_u_91)
        end
        v_u_115()
    end
end
function invokeEffectsInDev(p517, p518, p519)
    if v_u_1 and v_u_13 then
        while p517 ~= nil do
            if p517.child ~= nil then
                local v520 = p517.subtreeFlags
                if bit32.band(v520, p518) ~= v_u_42.NoFlags then
                    invokeEffectsInDev(p517.child, p518, p519)
                end
            end
            local v521 = p517.flags
            if bit32.band(v521, p518) ~= v_u_42.NoFlags then
                p519(p517)
            end
            p517 = p517.sibling
        end
    end
end
local v_u_522 = nil
function v_u_129.warnAboutUpdateOnNotYetMountedFiberInDEV(p_u_523)
    if v_u_1 then
        local v524 = v_u_131
        if bit32.band(v524, 16) ~= 0 then
            return
        end
        local v525 = p_u_523.mode
        local v526 = v_u_39.BlockingMode
        local v527 = v_u_39.ConcurrentMode
        local v528 = bit32.bor(v526, v527)
        if bit32.band(v525, v528) == 0 then
            return
        end
        local v529 = p_u_523.tag
        if v529 ~= v_u_40.IndeterminateComponent and (v529 ~= v_u_40.HostRoot and (v529 ~= v_u_40.ClassComponent and (v529 ~= v_u_40.FunctionComponent and (v529 ~= v_u_40.ForwardRef and (v529 ~= v_u_40.MemoComponent and (v529 ~= v_u_40.SimpleMemoComponent and v529 ~= v_u_40.Block)))))) then
            return
        end
        local v530 = v_u_111(p_u_523.type) or "ReactComponent"
        if v_u_522 == nil then
            v_u_522 = {
                [v530] = true
            }
        else
            if v_u_522[v530] then
                return
            end
            v_u_522[v530] = true
        end
        local v531 = v_u_113.current
        local v532, v533 = pcall(function()
            v_u_116(p_u_523)
            v_u_3.error("Can\'t perform a React state update on a component that hasn\'t mounted yet. This indicates that you have a side-effect in your render function that asynchronously later calls tries to update the component. Move this work to useEffect instead.")
        end)
        if v531 then
            v_u_116(p_u_523)
        else
            v_u_115()
        end
        if not v532 then
            error(v533)
        end
    end
end
if v_u_1 and v_u_9.replayFailedUnitOfWorkWithInvokeGuardedCallback then
    function v_u_129.beginWork(p534, p535, p536)
        local v537 = v_u_38.assignFiberPropertiesInDEV(nil, p535)
        local v538, v539 = xpcall(v_u_104, v_u_15, p534, p535, p536)
        if not v538 then
            if v539 ~= nil and typeof(v539) == "table" then
                local v540 = v539.andThen
                if typeof(v540) == "function" then
                    error(v539)
                end
            end
            v_u_97()
            if not v_u_100.resetHooksAfterThrowRef then
                v_u_105 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
                v_u_100.resetHooksAfterThrowRef = v_u_105.resetHooksAfterThrow
                v_u_100.ContextOnlyDispatcherRef = v_u_105.ContextOnlyDispatcher
                v_u_100.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v_u_105.getIsUpdatingOpaqueValueInRenderPhaseInDEV
            end
            v_u_100.resetHooksAfterThrowRef()
            v_u_76(p535)
            v_u_38.assignFiberPropertiesInDEV(p535, v537)
            if v_u_9.enableProfilerTimer then
                local v541 = p535.mode
                local v542 = v_u_39.ProfileMode
                if bit32.band(v541, v542) ~= 0 then
                    v_u_110.startProfilerTimer(p535)
                end
            end
            v_u_118(nil, v_u_104, nil, p534, p535, p536)
            if v_u_119() then
                local v543 = v_u_120()
                error(v543)
                return v539
            end
            error(v539)
        end
        return v539
    end
else
    v_u_129.beginWork = v_u_104
end
local v_u_544 = false
local v_u_545 = v_u_1 and {} or nil
function v_u_129.warnAboutRenderPhaseUpdatesInDEV(p546)
    if v_u_1 and v_u_113.isRendering then
        local v547 = v_u_131
        if bit32.band(v547, 16) ~= 0 then
            if not v_u_100.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
                v_u_105 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
                v_u_100.resetHooksAfterThrowRef = v_u_105.resetHooksAfterThrow
                v_u_100.ContextOnlyDispatcherRef = v_u_105.ContextOnlyDispatcher
                v_u_100.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v_u_105.getIsUpdatingOpaqueValueInRenderPhaseInDEV
            end
            if not v_u_100.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
                if p546.tag == v_u_40.FunctionComponent or (p546.tag == v_u_40.ForwardRef or p546.tag == v_u_40.SimpleMemoComponent) then
                    local v548 = v_u_133 == nil and "Unknown" or v_u_111(v_u_133.type)
                    if v_u_545[v548] == nil then
                        v_u_545[v548] = true
                        local v549 = v_u_111(p546.type) or "Unknown"
                        v_u_3.error("Cannot update a component (`%s`) while rendering a different component (`%s`). To locate the bad setState() call inside `%s`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render", v549, v548, v548)
                        return
                    end
                elseif p546.tag == v_u_40.ClassComponent and not v_u_544 then
                    v_u_3.error("Cannot update during an existing state transition (such as within `render`). Render methods should be a pure function of props and state.")
                    v_u_544 = true
                end
            end
        end
    end
end
v_u_5.IsThisRendererActing = {
    ["current"] = false
}
function v_u_5.warnIfNotScopedWithMatchingAct(p_u_550)
    if v_u_1 and (v_u_37.warnsIfNotActing == true and (v_u_127.current == true and v_u_5.IsThisRendererActing.current ~= true)) then
        local v551 = v_u_113.current
        local v552, v553 = pcall(function()
            v_u_116(p_u_550)
            v_u_3.error("It looks like you\'re using the wrong act() around your test interactions.\nBe sure to use the matching version of act() corresponding to your renderer:\n\n-- for react-roblox:\nlocal React = require(Packages.React)\n-- ...\nReact.TestUtils.act(function() ... end)\n\n-- for react-test-renderer:\nlocal TestRenderer = require(Packages.ReactTestRenderer)\n-- ...\nTestRenderer.act(function() ... end)")
        end)
        if v551 then
            v_u_116(p_u_550)
        else
            v_u_115()
        end
        if not v552 then
            error(v553)
        end
    end
end
function v_u_5.warnIfNotCurrentlyActingEffectsInDEV(p554)
    if v_u_1 and v_u_37.warnsIfNotActing == true then
        local v555 = p554.mode
        local v556 = v_u_39.StrictMode
        if bit32.band(v555, v556) ~= v_u_39.NoMode and (v_u_127.current == false and v_u_5.IsThisRendererActing.current == false) then
            v_u_3.error("An update to %s ran an effect, but was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you\'re testing the behavior the user would see in the real client. Learn more at https://reactjs.org/link/wrap-tests-with-act", v_u_111(p554.type))
        end
    end
end
function v_u_5.warnIfNotCurrentlyActingUpdatesInDEV(p_u_557)
    if v_u_1 and (v_u_37.warnsIfNotActing == true and (v_u_131 == 0 and (v_u_127.current == false and v_u_5.IsThisRendererActing.current == false))) then
        local v558 = v_u_114
        local v559, v560 = pcall(function()
            v_u_116(p_u_557)
            v_u_3.error("An update to %s inside a test was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you\'re testing the behavior the user would see in the client application. Learn more at https://reactjs.org/link/wrap-tests-with-act", v_u_111(p_u_557.type))
        end)
        if v558 then
            v_u_116(p_u_557)
        else
            v_u_115()
        end
        if v559 then
            return v560
        end
    end
end
local v_u_561 = false
function v_u_5.warnIfUnmockedScheduler(p562)
    if v_u_1 and (v_u_561 == false and v_u_7.unstable_flushAllWithoutAsserting == nil) then
        local v563 = p562.mode
        local v564 = v_u_39.BlockingMode
        if bit32.band(v563, v564) == 0 then
            local v565 = p562.mode
            local v566 = v_u_39.ConcurrentMode
            if bit32.band(v565, v566) == 0 then
                if v_u_9.warnAboutUnmockedScheduler == true then
                    v_u_561 = true
                    v_u_3.error("Starting from React v18, the \'scheduler\' module will need to be mocked to guarantee consistent behaviour across tests and client applications. For example, with Jest: \njest.mock(\'scheduler\', function() return require(@pkg/scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
                end
                goto l2
            end
        end
        v_u_561 = true
        v_u_3.error("In Concurrent or Sync modes, the \'scheduler\' module needs to be mocked to guarantee consistent behaviour across tests and client application. For example, with Jest: \njest.mock(\'scheduler\', function() return require(@pkg/scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
    else
        ::l2::
    end
end
function computeThreadID(p567, p568)
    return p568 * 1000 + p567.interactionThreadID
end
function v_u_5.markSpawnedWork(p569)
    if v_u_9.enableSchedulerTracing then
        if v_u_158 == nil then
            v_u_158 = { p569 }
        else
            local v570 = v_u_158
            table.insert(v570, p569)
        end
    else
        return
    end
end
function scheduleInteractions(p571, p572, p573)
    if v_u_9.enableSchedulerTracing then
        if p573.size > 0 then
            local v574 = p571.pendingInteractionMap
            local v_u_575 = v574:get(p572)
            if v_u_575 == nil then
                v574:set(p572, v_u_4.new(p573))
                for _, v576 in p573 do
                    v576.__count = v576.__count + 1
                end
            else
                p573:forEach(function(p577)
                    if not v_u_575:has(p577) then
                        p577.__count = p577.__count + 1
                    end
                    v_u_575:add(p577)
                end)
            end
            local v578 = v_u_36.current
            if v578 ~= nil then
                local v579 = computeThreadID(p571, p572)
                v578.onWorkScheduled(p573, v579)
            end
        end
    end
end
function v_u_129.schedulePendingInteractions(p580, p581)
    if v_u_9.enableSchedulerTracing then
        scheduleInteractions(p580, p581, v_u_35.current)
    end
end
function v_u_129.startWorkOnPendingInteractions(p582, p_u_583)
    if v_u_9.enableSchedulerTracing then
        local v_u_584 = v_u_4.new()
        p582.pendingInteractionMap:forEach(function(p585, p586)
            if v_u_49(p_u_583, p586) then
                p585:forEach(function(p587)
                    v_u_584:add(p587)
                end)
            end
        end)
        p582.memoizedInteractions = v_u_584
        if v_u_584.size > 0 then
            local v588 = v_u_36.current
            if v588 ~= nil then
                local v589 = computeThreadID(p582, p_u_583)
                local v590, v_u_591 = xpcall(v588.onWorkStarted, v_u_15, v_u_584, v589)
                if not v590 then
                    v_u_19(v_u_27, function()
                        error(v_u_591)
                    end)
                end
            end
        end
    end
end
function v_u_129.finishPendingInteractions(p592, p593)
    if v_u_9.enableSchedulerTracing then
        local v_u_594 = p592.pendingLanes
        local v_u_595 = nil
        local v_u_596, v597
        if v_u_595 == nil or p592.memoizedInteractions.size <= 0 then
            v_u_596 = nil
            v597 = true
        else
            local v598 = computeThreadID(p592, p593)
            v_u_595 = v_u_36.current
            v597, v_u_596 = xpcall(v_u_595.onWorkStopped, v_u_15, p592.memoizedInteractions, v598)
        end
        local v_u_599 = p592.pendingInteractionMap
        v_u_599:forEach(function(p600, p601)
            if not v_u_49(v_u_594, p601) then
                v_u_599:delete(p601)
                p600:forEach(function(p602)
                    p602.__count = p602.__count - 1
                    if v_u_595 ~= nil and p602.__count == 0 then
                        local v603, v_u_604 = xpcall(v_u_595.onInteractionScheduledWorkCompleted, v_u_15, p602)
                        if not v603 then
                            v_u_19(v_u_27, function()
                                error(v_u_604)
                            end)
                        end
                    end
                end)
            end
        end)
        if not v597 then
            v_u_19(v_u_27, function()
                error(v_u_596)
            end)
        end
    end
end
local v_u_605 = false
local v_u_606 = false
local v_u_607 = v_u_7.unstable_flushAllWithoutAsserting
local v_u_608 = typeof(v_u_607) == "function"
local function v_u_616()
    if v_u_607 == nil then
        local v609 = v_u_605
        v_u_605 = true
        local v611, v612 = xpcall(function()
            local v610 = false
            while v_u_5.flushPassiveEffects() do
                v610 = true
            end
            return v610
        end, v_u_15)
        v_u_605 = v609
        if v611 then
            return v612
        end
        error(v612)
    else
        local v613 = v_u_605
        v_u_605 = true
        local v614, v615 = xpcall(v_u_607, v_u_15)
        v_u_605 = v613
        if v614 then
            return v615
        end
        error(v615)
    end
end
local function v_u_620(p_u_617)
    local v618, v619 = xpcall(v_u_616, v_u_15)
    if v618 then
        v618, v619 = xpcall(v_u_123, v_u_15, function()
            if v_u_616() then
                v_u_620(p_u_617)
            else
                p_u_617()
            end
        end)
    end
    if not v618 then
        p_u_617(v619)
    end
end
function v_u_5.act(p621)
    if not v_u_1 and (not _G.__ROACT_17_MOCK_SCHEDULER__ and v_u_225 == false) then
        v_u_225 = true
        v_u_3.error("act(...) is not supported in production builds of React, and might not behave as expected.")
    end
    local v_u_622 = v_u_224
    v_u_224 = v_u_224 + 1
    local v_u_623 = v_u_127.current
    local v_u_624 = v_u_5.IsThisRendererActing.current
    local v_u_625 = v_u_606
    v_u_127.current = true
    v_u_5.IsThisRendererActing.current = true
    v_u_606 = true
    local v626, v_u_627 = xpcall(v_u_5.batchedUpdates, v_u_15, p621)
    if not v626 then
        v_u_224 = v_u_224 - 1
        v_u_127.current = v_u_623
        v_u_5.IsThisRendererActing.current = v_u_624
        v_u_606 = v_u_625
        if v_u_1 and v_u_622 < v_u_224 then
            v_u_3.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
        error(v_u_627)
    end
    if v_u_627 ~= nil and typeof(v_u_627) == "table" then
        local v628 = v_u_627.andThen
        if typeof(v628) == "function" then
            local v_u_629 = false
            if v_u_1 then
                local v630 = v_u_95
                if typeof(v630) ~= nil then
                    v_u_95.resolve():andThen(function() end):andThen(function()
                        if v_u_629 == false then
                            v_u_3.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). This could lead to unexpected testing behaviour, interleaving multiple act calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);")
                        end
                    end)
                end
            end
            return {
                ["andThen"] = function(_, p_u_631, p_u_632)
                    v_u_629 = true
                    return v_u_627:andThen(function()
                        if v_u_224 > 1 or v_u_608 == true and v_u_623 == true then
                            v_u_224 = v_u_224 - 1
                            v_u_127.current = v_u_623
                            v_u_5.IsThisRendererActing.current = v_u_624
                            v_u_606 = v_u_625
                            if v_u_1 and v_u_622 < v_u_224 then
                                v_u_3.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                            end
                            p_u_631()
                        else
                            v_u_620(function(p633)
                                v_u_224 = v_u_224 - 1
                                v_u_127.current = v_u_623
                                v_u_5.IsThisRendererActing.current = v_u_624
                                v_u_606 = v_u_625
                                if v_u_1 and v_u_622 < v_u_224 then
                                    v_u_3.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                                end
                                if p633 then
                                    p_u_632(p633)
                                else
                                    p_u_631()
                                end
                            end)
                        end
                    end, function(p634)
                        v_u_224 = v_u_224 - 1
                        v_u_127.current = v_u_623
                        v_u_5.IsThisRendererActing.current = v_u_624
                        v_u_606 = v_u_625
                        if v_u_1 and v_u_622 < v_u_224 then
                            v_u_3.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                        end
                        p_u_632(p634)
                    end)
                end
            }
        end
    end
    if v_u_1 and v_u_627 ~= nil then
        v_u_3.error("The callback passed to act(...) function must return nil, or a Promise. You returned %s", (tostring(v_u_627)))
    end
    local v635, v636 = xpcall(function()
        if v_u_224 == 1 and (v_u_608 == false or v_u_623 == false) then
            v_u_616()
        end
        v_u_224 = v_u_224 - 1
        v_u_127.current = v_u_623
        v_u_5.IsThisRendererActing.current = v_u_624
        v_u_606 = v_u_625
        if v_u_1 and v_u_622 < v_u_224 then
            v_u_3.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
    end, v_u_15)
    if not v635 then
        v_u_224 = v_u_224 - 1
        v_u_127.current = v_u_623
        v_u_5.IsThisRendererActing.current = v_u_624
        v_u_606 = v_u_625
        if v_u_1 and v_u_622 < v_u_224 then
            v_u_3.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
        error(v636)
    end
    return {
        ["andThen"] = function(_, p637, _)
            if v_u_1 then
                v_u_3.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.")
            end
            p637()
        end
    }
end
function v_u_129.detachFiberAfterEffects(p638)
    p638.child = nil
    p638.deletions = nil
    p638.dependencies = nil
    p638.memoizedProps = nil
    p638.memoizedState = nil
    p638.pendingProps = nil
    p638.sibling = nil
    p638.stateNode = nil
    p638.updateQueue = nil
    if v_u_1 then
        p638._debugOwner = nil
    end
end
return v_u_5