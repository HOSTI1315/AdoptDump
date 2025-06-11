--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberBeginWork.new (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local v_u_3 = _G.__COMPAT_WARNINGS__
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).console
local v5 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_6 = v5.Array
local v_u_7 = v5.Object
local v_u_8 = v5.util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("react"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v_u_9 = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v10 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local v_u_11 = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local v_u_12 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_13 = v_u_12.FunctionComponent
local v_u_14 = v_u_12.ClassComponent
local v_u_15 = v_u_12.HostRoot
local v_u_16 = v_u_12.HostComponent
local v_u_17 = v_u_12.HostText
local v_u_18 = v_u_12.HostPortal
local v_u_19 = v_u_12.ForwardRef
local v_u_20 = v_u_12.Fragment
local v_u_21 = v_u_12.Mode
local v_u_22 = v_u_12.ContextProvider
local v_u_23 = v_u_12.ContextConsumer
local v_u_24 = v_u_12.Profiler
local v_u_25 = v_u_12.SuspenseComponent
local v_u_26 = v_u_12.SuspenseListComponent
local v_u_27 = v_u_12.MemoComponent
local v_u_28 = v_u_12.SimpleMemoComponent
local v_u_29 = v_u_12.LazyComponent
local v_u_30 = v_u_12.IncompleteClassComponent
local v_u_31 = v_u_12.OffscreenComponent
local v_u_32 = v_u_12.LegacyHiddenComponent
local v33 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_34 = v33.NoFlags
local v_u_35 = v33.StaticMask
local v_u_36 = v33.PerformedWork
local v_u_37 = v33.Placement
local v_u_38 = v33.Hydrating
local v_u_39 = v33.ContentReset
local v_u_40 = v33.DidCapture
local v_u_41 = v33.Ref
local v_u_42 = v33.Deletion
local v_u_43 = v33.ForceUpdateForLegacySuspense
local v44 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals
local v45 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_46 = v45.debugRenderPhaseSideEffectsForStrictMode
local v_u_47 = v45.disableLegacyContext
local v_u_48 = v45.disableModulePatternComponents
local v_u_49 = v45.enableProfilerTimer
local v_u_50 = v45.enableSchedulerTracing
local v_u_51 = v45.enableSuspenseServerRenderer
local v_u_52 = v45.warnAboutDefaultPropsOnFunctionComponents
local v_u_53 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_54 = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v_u_55 = require(script.Parent.Parent:WaitForChild("shared")).shallowEqual
local v_u_56 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v57 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v_u_58 = v57.REACT_LAZY_TYPE
local _ = v57.getIteratorFn
local v_u_59 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local v60 = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local v_u_61 = v60.getCurrentFiberOwnerNameInDevOrNull
local v_u_62 = v60.setIsRendering
local v63 = require(script.Parent:WaitForChild("ReactFiberHotReloading.new"))
local v_u_64 = v63.resolveFunctionForHotReloading
local v_u_65 = v63.resolveForwardRefForHotReloading
local v_u_66 = v63.resolveClassForHotReloading
local v67 = require(script.Parent:WaitForChild("ReactChildFiber.new"))
local v_u_68 = v67.mountChildFibers
local v_u_69 = v67.reconcileChildFibers
local v_u_70 = v67.cloneChildFibers
local v71 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local v_u_72 = v71.processUpdateQueue
local v_u_73 = v71.cloneUpdateQueue
local v_u_74 = v71.initializeUpdateQueue
local v75 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local v_u_76 = v75.ConcurrentMode
local v_u_77 = v75.NoMode
local v_u_78 = v75.ProfileMode
local v_u_79 = v75.StrictMode
local v_u_80 = v75.BlockingMode
local v81 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local v_u_82 = v81.shouldSetTextContent
local v_u_83 = v81.isSuspenseInstancePending
local v_u_84 = v81.isSuspenseInstanceFallback
local v_u_85 = v81.registerSuspenseInstanceRetry
local v_u_86 = v81.supportsHydration
local v87 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local v_u_88 = v87.pushHostContext
local v_u_89 = v87.pushHostContainer
local v_u_90 = v10.suspenseStackCursor
local v_u_91 = v10.hasSuspenseContext
local v_u_92 = v10.ForceSuspenseFallback
local v_u_93 = v10.addSubtreeSuspenseContext
local v_u_94 = v10.InvisibleParentSuspenseContext
local v_u_95 = v10.pushSuspenseContext
local v_u_96 = v10.setDefaultShallowSuspenseContext
local v97 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
local v_u_98 = v97.propagateContextChange
local v_u_99 = v97.readContext
local v_u_100 = v97.calculateChangedBits
local v_u_101 = v97.prepareToReadContext
local v_u_102 = v97.pushProvider
local v_u_103 = {
    ["renderWithHooksRef"] = nil,
    ["bailoutHooksRef"] = nil,
    ["shouldSuspendRef"] = nil
}
local function v_u_105(...)
    if not v_u_103.renderWithHooksRef then
        local v104 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        v_u_103.renderWithHooksRef = v104.renderWithHooks
        v_u_103.bailoutHooksRef = v104.bailoutHooks
    end
    return v_u_103.renderWithHooksRef(...)
end
local function v_u_107(...)
    if not v_u_103.bailoutHooksRef then
        local v106 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        v_u_103.renderWithHooksRef = v106.renderWithHooks
        v_u_103.bailoutHooksRef = v106.bailoutHooks
    end
    return v_u_103.bailoutHooksRef(...)
end
local v_u_108 = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).stopProfilerTimerIfRunning
local v109 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local v_u_110 = v109.getMaskedContext
local v_u_111 = v109.getUnmaskedContext
local v_u_112 = v109.hasContextChanged
local v_u_113 = v109.pushContextProvider
local v_u_114 = v109.isContextProvider
local v_u_115 = v109.pushTopLevelContextObject
local v_u_116 = v109.invalidateContextProvider
local v117 = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new"))
local v_u_118 = v117.resetHydrationState
local v_u_119 = v117.enterHydrationState
local v_u_120 = v117.reenterHydrationStateFromDehydratedSuspenseInstance
local v_u_121 = v117.tryToClaimNextHydratableInstance
local v_u_122 = v117.warnIfHydrating
local v123 = require(script.Parent:WaitForChild("ReactFiberClassComponent.new"))
local v_u_124 = v123.adoptClassInstance
local v_u_125 = v123.applyDerivedStateFromProps
local v_u_126 = v123.constructClassInstance
local v_u_127 = v123.mountClassInstance
local v_u_128 = v123.resumeMountClassInstance
local v_u_129 = v123.updateClassInstance
local v_u_130 = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local v131 = require(script.Parent:WaitForChild("ReactFiber.new"))
local v_u_132 = v131.resolveLazyComponentTag
local v_u_133 = v131.createFiberFromFragment
local v_u_134 = v131.createFiberFromOffscreen
local v_u_135 = v131.createFiberFromTypeAndProps
local v_u_136 = v131.isSimpleFunctionComponent
local v_u_137 = v131.createWorkInProgress
local v138 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local v_u_139 = v138.pushRenderLanes
local v_u_140 = v138.markSpawnedWork
local v_u_141 = v138.retryDehydratedSuspenseBoundary
local v_u_142 = v138.scheduleUpdateOnFiber
local v_u_143 = v138.renderDidSuspendDelayIfPossible
local v_u_144 = v138.getWorkInProgressRoot
local v_u_145 = v138.getExecutionContext
local v_u_146 = v138.RetryAfterError
local v_u_147 = v138.NoContext
local v_u_148 = nil
local v_u_149 = require(script.Parent:WaitForChild("ReactMutableSource.new")).setWorkInProgressVersion
local v_u_150 = require(script.Parent:WaitForChild("ReactFiberWorkInProgress")).markSkippedUpdateLanes
local v151 = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local v_u_152 = v151.disableLogs
local v_u_153 = v151.reenableLogs
local v_u_154 = v44.ReactCurrentOwner
local v_u_155 = {}
local v_u_156 = nil
local v_u_157 = nil
local v_u_158 = false
local v_u_159 = {
    ["didWarnAboutBadClass"] = {},
    ["didWarnAboutModulePatternComponent"] = {},
    ["didWarnAboutContextTypeOnFunctionComponent"] = {},
    ["didWarnAboutGetDerivedStateOnFunctionComponent"] = {},
    ["didWarnAboutFunctionRefs"] = {},
    ["didWarnAboutDefaultPropsOnFunctionComponent"] = {}
}
local v_u_160 = nil
if v_u_1 then
    v_u_159.didWarnAboutBadClass = {}
    v_u_159.didWarnAboutModulePatternComponent = {}
    v_u_159.didWarnAboutContextTypeOnFunctionComponent = {}
    v_u_159.didWarnAboutGetDerivedStateOnFunctionComponent = {}
    v_u_159.didWarnAboutFunctionRefs = {}
    v_u_155.didWarnAboutReassigningProps = false
    v_u_159.didWarnAboutDefaultPropsOnFunctionComponent = {}
end
local function v_u_177(p161, p162, p163, p164, p165)
    if (v_u_1 or v_u_2) and p162.type ~= p162.elementType then
        local v166 = p163.propTypes
        local v167 = p163.validateProps
        if v166 or v167 then
            v_u_11(v166, v167, p164, "prop", v_u_56(p163))
        end
    end
    local v168 = p163.render
    local v169 = p162.ref
    v_u_101(p162, p165, v_u_155.markWorkInProgressReceivedUpdate)
    local v170
    if v_u_1 then
        v_u_154.current = p162
        v_u_62(true)
        v170 = v_u_105(p161, p162, v168, p164, v169, p165)
        if v_u_46 then
            local v171 = p162.mode
            local v172 = v_u_79
            if bit32.band(v171, v172) ~= 0 then
                v_u_152()
                local v173, v174 = xpcall(v_u_105, v_u_54, p161, p162, v168, p164, v169, p165)
                if v173 then
                    v170 = v174
                end
                v_u_153()
                if not v173 then
                    error(v174)
                end
            end
        end
        v_u_62(false)
    else
        v170 = v_u_105(p161, p162, v168, p164, v169, p165)
    end
    if p161 ~= nil and not v_u_158 then
        v_u_107(p161, p162, p165)
        return v_u_156(p161, p162, p165)
    end
    local v175 = p162.flags
    local v176 = v_u_36
    p162.flags = bit32.bor(v175, v176)
    if p161 == nil then
        p162.child = v_u_68(p162, nil, v170, p165)
    else
        p162.child = v_u_69(p162, p161.child, v170, p165)
    end
    return p162.child
end
local function v_u_198(p178, p179, p180, p181, p182, p183)
    if p178 == nil then
        local v184 = p180.type
        if v_u_136(v184) and (p180.compare == nil and p180.defaultProps == nil) then
            local v185
            if v_u_1 then
                v185 = v_u_64(v184)
            else
                v185 = v184
            end
            p179.tag = v_u_28
            p179.type = v185
            if v_u_1 then
                validateFunctionComponentInDev(p179, v184)
            end
            return v_u_160(p178, p179, v185, p181, p182, p183)
        end
        if v_u_1 or v_u_2 then
            local v186, v187
            if type(v184) == "table" then
                v186 = v184.propTypes
                v187 = v184.validateProps
            else
                v186 = nil
                v187 = nil
            end
            if v186 or v187 then
                v_u_11(v186, v187, p181, "prop", v_u_56(v184))
            end
        end
        local v188 = v_u_135(p180.type, nil, p181, p179, p179.mode, p183)
        v188.ref = p179.ref
        v188.return_ = p179
        p179.child = v188
        return v188
    end
    if v_u_1 or v_u_2 then
        local v189 = p180.type
        local v190, v191
        if type(v189) == "table" then
            v190 = v189.propTypes
            v191 = v189.validateProps
        else
            v190 = nil
            v191 = nil
        end
        if v190 or v191 then
            v_u_11(v190, v191, p181, "prop", v_u_56(v189))
        end
    end
    local v192 = p178.child
    if not v_u_9.includesSomeLane(p182, p183) then
        local v193 = v192.memoizedProps
        local v194 = p180.compare
        if v194 == nil then
            v194 = v_u_55
        end
        if v194(v193, p181) and p178.ref == p179.ref then
            return v_u_156(p178, p179, p183)
        end
    end
    local v195 = p179.flags
    local v196 = v_u_36
    p179.flags = bit32.bor(v195, v196)
    local v197 = v_u_137(v192, p181)
    v197.ref = p179.ref
    v197.return_ = p179
    p179.child = v197
    return v197
end
local function v_u_216(p199, p200, p201, p202, p203, p204)
    if (v_u_1 or v_u_2) and p200.type ~= p200.elementType then
        local v205 = p200.elementType
        if v205["$$typeof"] == v_u_58 then
            local v206 = v205._payload
            local v207 = v205._init
            local v208, v209 = xpcall(v207, v_u_54, v206)
            if not v208 then
                v209 = nil
            end
            local v210, v211
            if v209 == nil or type(v209) ~= "table" then
                v210 = nil
                v211 = nil
            else
                v210 = v209.propTypes
                v211 = v209.validateProps
            end
            if v210 or v211 then
                v_u_11(v210, v211, p202, "prop", v_u_56(v209))
            end
        end
    end
    if p199 ~= nil then
        local v212 = p199.memoizedProps
        local v213 = not v_u_1 and true or p200.type == p199.type
        if v_u_55(v212, p202) and (p199.ref == p200.ref and v213) then
            v_u_158 = false
            if not v_u_9.includesSomeLane(p204, p203) then
                p200.lanes = p199.lanes
                return v_u_156(p199, p200, p204)
            end
            local v214 = p199.flags
            local v215 = v_u_43
            if bit32.band(v214, v215) ~= v_u_34 then
                v_u_158 = true
            end
        end
    end
    return v_u_157(p199, p200, p201, p202, p204)
end
local function v_u_228(p217, p218, p219)
    local v220 = p218.pendingProps
    local v221 = v220.children
    local v222
    if p217 == nil then
        v222 = nil
    else
        v222 = p217.memoizedState
    end
    if v220.mode == "hidden" or v220.mode == "unstable-defer-without-hiding" then
        local v223 = p218.mode
        local v224 = v_u_76
        if bit32.band(v223, v224) == v_u_77 then
            p218.memoizedState = {
                ["baseLanes"] = v_u_9.NoLanes
            }
            v_u_139(p218, p219)
        else
            if not v_u_9.includesSomeLane(p219, v_u_9.OffscreenLane) then
                if v222 ~= nil then
                    local v225 = v222.baseLanes
                    p219 = v_u_9.mergeLanes(v225, p219)
                end
                if v_u_50 then
                    v_u_140(v_u_9.OffscreenLane)
                end
                p218.childLanes = v_u_9.laneToLanes(v_u_9.OffscreenLane)
                p218.lanes = p218.childLanes
                p218.memoizedState = {
                    ["baseLanes"] = p219
                }
                v_u_139(p218, p219)
                return nil
            end
            p218.memoizedState = {
                ["baseLanes"] = v_u_9.NoLanes
            }
            local v226
            if v222 == nil then
                v226 = p219
            else
                v226 = v222.baseLanes
            end
            v_u_139(p218, v226)
        end
    else
        local v227
        if v222 == nil then
            v227 = p219
        else
            v227 = v_u_9.mergeLanes(v222.baseLanes, p219)
            p218.memoizedState = nil
        end
        v_u_139(p218, v227)
    end
    if p217 == nil then
        p218.child = v_u_68(p218, nil, v221, p219)
    else
        p218.child = v_u_69(p218, p217.child, v221, p219)
    end
    return p218.child
end
function updateFragment(p229, p230, p231)
    local v232 = p230.pendingProps
    if p229 == nil then
        p230.child = v_u_68(p230, nil, v232, p231)
    else
        p230.child = v_u_69(p230, p229.child, v232, p231)
    end
    return p230.child
end
function updateMode(p233, p234, p235)
    local v236 = p234.pendingProps.children
    if p233 == nil then
        p234.child = v_u_68(p234, nil, v236, p235)
    else
        p234.child = v_u_69(p234, p233.child, v236, p235)
    end
    return p234.child
end
function updateProfiler(p237, p238, p239)
    if v_u_49 then
        local v240 = p238.stateNode
        v240.effectDuration = 0
        v240.passiveEffectDuration = 0
    end
    local v241 = p238.pendingProps.children
    if p237 == nil then
        p238.child = v_u_68(p238, nil, v241, p239)
    else
        p238.child = v_u_69(p238, p237.child, v241, p239)
    end
    return p238.child
end
local function v_u_257(p242, p243, p244, p245, p246)
    if (v_u_1 or v_u_2) and (type(p244) ~= "function" and p243.type ~= p243.elementType) then
        local v247, v248
        if type(p244) == "table" then
            v247 = p244.propTypes
            v248 = p244.validateProps
        else
            v247 = nil
            v248 = nil
        end
        if v247 or v248 then
            v_u_11(v247, v248, p245, "prop", v_u_56(p244))
        end
    end
    local v249
    if v_u_47 then
        v249 = nil
    else
        v249 = v_u_110(p243, (v_u_111(p243, p244, true)))
    end
    v_u_101(p243, p246, v_u_155.markWorkInProgressReceivedUpdate)
    local v250
    if v_u_1 then
        v_u_154.current = p243
        v_u_62(true)
        v250 = v_u_105(p242, p243, p244, p245, v249, p246)
        if v_u_46 then
            local v251 = p243.mode
            local v252 = v_u_79
            if bit32.band(v251, v252) ~= 0 then
                v_u_152()
                local v253, v254 = xpcall(v_u_105, v_u_54, p242, p243, p244, p245, v249, p246)
                v_u_153()
                if v253 then
                    v250 = v254
                else
                    error(v254)
                end
            end
        end
        v_u_62(false)
    else
        v250 = v_u_105(p242, p243, p244, p245, v249, p246)
    end
    if p242 ~= nil and not v_u_158 then
        v_u_107(p242, p243, p246)
        return v_u_156(p242, p243, p246)
    end
    local v255 = p243.flags
    local v256 = v_u_36
    p243.flags = bit32.bor(v255, v256)
    if p242 == nil then
        p243.child = v_u_68(p243, nil, v250, p246)
    else
        p243.child = v_u_69(p243, p242.child, v250, p246)
    end
    return p243.child
end
local function v_u_270(p258, p259, p260, p261, p262)
    if (v_u_1 or v_u_2) and p259.type ~= p259.elementType then
        local v263 = p260.propTypes
        local v264 = p260.validateProps
        if v263 or v264 then
            v_u_11(v263, v264, p261, "prop", v_u_56(p260))
        end
    end
    local v265
    if v_u_114(p260) then
        v_u_113(p259)
        v265 = true
    else
        v265 = false
    end
    v_u_101(p259, p262, v_u_155.markWorkInProgressReceivedUpdate)
    local v266
    if p259.stateNode == nil then
        if p258 ~= nil then
            p258.alternate = nil
            p259.alternate = nil
            local v267 = p259.flags
            local v268 = v_u_37
            p259.flags = bit32.bor(v267, v268)
        end
        v_u_126(p259, p260, p261)
        v_u_127(p259, p260, p261, p262)
        v266 = true
    elseif p258 == nil then
        v266 = v_u_128(p259, p260, p261, p262)
    else
        v266 = v_u_129(p258, p259, p260, p261, p262)
    end
    local v269 = finishClassComponent(p258, p259, p260, v266, v265, p262)
    if v_u_1 and (v266 and p259.stateNode.props ~= p261) then
        if not v_u_155.didWarnAboutReassigningProps then
            v_u_4.error("It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.", v_u_56(p259.type) or "a component")
        end
        v_u_155.didWarnAboutReassigningProps = true
    end
    return v269
end
function finishClassComponent(p271, p272, p273, p274, p275, p276)
    local v277 = p272.ref
    if p271 == nil and v277 ~= nil or p271 ~= nil and p271.ref ~= v277 then
        local v278 = p272.flags
        local v279 = v_u_41
        p272.flags = bit32.bor(v278, v279)
    end
    local v280 = p272.flags
    local v281 = v_u_40
    local v282 = bit32.band(v280, v281) ~= v_u_34
    if not (p274 or v282) then
        if p275 then
            v_u_116(p272, p273, false)
        end
        return v_u_156(p271, p272, p276)
    end
    local v283 = p272.stateNode
    v_u_154.current = p272
    local v284
    if v282 then
        if p273.getDerivedStateFromError ~= nil then
            local v285 = p273.getDerivedStateFromError
            if type(v285) == "function" then
                goto l15
            end
        end
        v284 = nil
        if v_u_49 then
            v_u_108(p272)
        end
        ::l19::
        local v286 = p272.flags
        local v287 = v_u_36
        p272.flags = bit32.bor(v286, v287)
        if p271 == nil or not v282 then
            if p271 == nil then
                p272.child = v_u_68(p272, nil, v284, p276)
            else
                p272.child = v_u_69(p272, p271.child, v284, p276)
            end
        else
            p272.child = v_u_69(p272, p271.child, nil, p276)
            p272.child = v_u_69(p272, nil, v284, p276)
        end
        p272.memoizedState = v283.state
        if p275 then
            v_u_116(p272, p273, true)
        end
        return p272.child
    else
        ::l15::
        if v_u_1 then
            v_u_62(true)
            v284 = v283:render()
            if v_u_46 then
                local v288 = p272.mode
                local v289 = v_u_79
                if bit32.band(v288, v289) ~= 0 then
                    v_u_152()
                    local v290, v291 = xpcall(v283.render, v_u_54, v283)
                    v_u_153()
                    if not v290 then
                        error(v291)
                    end
                end
            end
            v_u_62(false)
        else
            v284 = v283:render()
        end
        goto l19
    end
end
local function v_u_312(p292, p293, p294)
    local v295 = p293.stateNode
    if v295.pendingContext then
        v_u_115(p293, v295.pendingContext, v295.pendingContext ~= v295.context)
    elseif v295.context then
        v_u_115(p293, v295.context, false)
    end
    v_u_89(p293, v295.containerInfo)
    local v296 = p293.updateQueue
    local v297 = v_u_53
    local v298
    if p292 == nil then
        v298 = false
    else
        v298 = v296 ~= nil
    end
    v297(v298, "If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue.")
    local v299 = p293.pendingProps
    local v300 = p293.memoizedState
    local v301
    if v300 == nil then
        v301 = nil
    else
        v301 = v300.element
    end
    v_u_73(p292, p293)
    v_u_72(p293, v299, nil, p294)
    local v302 = p293.memoizedState.element
    if v302 == v301 then
        v_u_118()
        return v_u_156(p292, p293, p294)
    end
    local v303 = p293.stateNode
    if v303.hydrate and v_u_119(p293) then
        if v_u_86 then
            local v304 = v303.mutableSourceEagerHydrationData
            if v304 ~= nil then
                for v305 = 1, #v304, 2 do
                    v_u_149(v304[v305], v304[v305 + 1])
                end
            end
        end
        local v306 = v_u_68(p293, nil, v302, p294)
        p293.child = v306
        while v306 do
            local v307 = v306.flags
            local v308 = v_u_37
            local v309 = bit32.bnot(v308)
            local v310 = bit32.band(v307, v309)
            local v311 = v_u_38
            v306.flags = bit32.bor(v310, v311)
            v306 = v306.sibling
        end
    else
        if p292 == nil then
            p293.child = v_u_68(p293, nil, v302, p294)
        else
            p293.child = v_u_69(p293, p292.child, v302, p294)
        end
        v_u_118()
    end
    return p293.child
end
local function v_u_327(p313, p314, p315)
    v_u_88(p314)
    if p313 == nil then
        v_u_121(p314)
    end
    local v316 = p314.type
    local v317 = p314.pendingProps
    local v318
    if p313 == nil then
        v318 = nil
    else
        v318 = p313.memoizedProps
    end
    local v319 = v317.children
    if v_u_82(v316, v317) then
        v319 = nil
    elseif v318 ~= nil and v_u_82(v316, v318) then
        local v320 = p314.flags
        local v321 = v_u_39
        p314.flags = bit32.bor(v320, v321)
    end
    local v322 = p314.flags
    local v323 = v_u_36
    p314.flags = bit32.bor(v322, v323)
    local v324 = p314.ref
    if p313 == nil and v324 ~= nil or p313 ~= nil and p313.ref ~= v324 then
        local v325 = p314.flags
        local v326 = v_u_41
        p314.flags = bit32.bor(v325, v326)
    end
    if p313 == nil then
        p314.child = v_u_68(p314, nil, v319, p315)
    else
        p314.child = v_u_69(p314, p313.child, v319, p315)
    end
    return p314.child
end
local function v_u_343(p328, p329, p330, p331, p332)
    if p328 ~= nil then
        p328.alternate = nil
        p329.alternate = nil
        local v333 = p329.flags
        local v334 = v_u_37
        p329.flags = bit32.bor(v333, v334)
    end
    local v335 = p329.pendingProps
    local v336 = p330._payload
    local v337 = p330._init(v336)
    p329.type = v337
    p329.tag = v_u_132(v337)
    local v338 = p329.tag
    local v339 = v_u_130(v337, v335)
    if v338 == v_u_13 then
        if v_u_1 then
            validateFunctionComponentInDev(p329, v337)
            v337 = v_u_64(v337)
            p329.type = v337
        end
        return v_u_257(nil, p329, v337, v339, p332)
    end
    if v338 == v_u_14 then
        if v_u_1 then
            v337 = v_u_66(v337)
            p329.type = v337
        end
        return v_u_270(nil, p329, v337, v339, p332)
    end
    if v338 == v_u_19 then
        if v_u_1 then
            v337 = v_u_65(v337)
            p329.type = v337
        end
        return v_u_177(nil, p329, v337, v339, p332)
    end
    if v338 == v_u_27 then
        if (v_u_1 or v_u_2) and p329.type ~= p329.elementType then
            local v340 = v337.propTypes
            local v341 = v337.validateProps
            if v340 or v341 then
                v_u_11(v340, v341, v339, "prop", v_u_56(v337))
            end
        end
        return v_u_198(nil, p329, v337, v_u_130(v337.type, v339), p331, p332)
    end
    local v342 = ""
    if v_u_1 then
        if v337 == nil or (type(v337) ~= "table" or v337["$$typeof"] ~= v_u_58) then
            if type(v337) == "table" and v337["$$typeof"] == nil then
                v342 = "\n" .. v_u_8(v337)
            end
        else
            v342 = " Did you wrap a component in React.lazy() more than once?"
        end
    end
    v_u_53(false, "Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s", tostring(v337), v342)
    return nil
end
function mountIncompleteClassComponent(p344, p345, p346, p347, p348)
    if p344 ~= nil then
        p344.alternate = nil
        p345.alternate = nil
        local v349 = p345.flags
        local v350 = v_u_37
        p345.flags = bit32.bor(v349, v350)
    end
    p345.tag = v_u_14
    local v351
    if v_u_114(p346) then
        v_u_113(p345)
        v351 = true
    else
        v351 = false
    end
    v_u_101(p345, p348, v_u_155.markWorkInProgressReceivedUpdate)
    v_u_126(p345, p346, p347)
    v_u_127(p345, p346, p347, p348)
    return finishClassComponent(nil, p345, p346, true, v351, p348)
end
local function v_u_378(p352, p353, p354, p355)
    if p352 ~= nil then
        p352.alternate = nil
        p353.alternate = nil
        local v356 = p353.flags
        local v357 = v_u_37
        p353.flags = bit32.bor(v356, v357)
    end
    local v358 = p353.pendingProps
    local v359
    if v_u_47 then
        v359 = nil
    else
        v359 = v_u_110(p353, (v_u_111(p353, p354, false)))
    end
    v_u_101(p353, p355, v_u_155.markWorkInProgressReceivedUpdate)
    local v360
    if v_u_1 then
        if type(p354) == "table" then
            local v361 = p354.render
            if type(v361) == "function" then
                local v362 = v_u_56(p354) or "Unknown"
                if not v_u_159.didWarnAboutBadClass[v362] then
                    v_u_4.error("The <%s /> component appears to have a render method, but doesn\'t extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.", v362, v362)
                    v_u_159.didWarnAboutBadClass[v362] = true
                end
            end
        end
        local v363 = p353.mode
        local v364 = v_u_79
        if bit32.band(v363, v364) ~= 0 then
            v_u_59.recordLegacyContextWarning(p353)
        end
        v_u_62(true)
        v_u_154.current = p353
        v360 = v_u_105(nil, p353, p354, v358, v359, p355)
        v_u_62(false)
    else
        v360 = v_u_105(nil, p353, p354, v358, v359, p355)
    end
    local v365 = p353.flags
    local v366 = v_u_36
    p353.flags = bit32.bor(v365, v366)
    local v367 = type(v360)
    if v_u_1 and (v360 ~= nil and v367 == "table") then
        local v368 = v360.render
        if type(v368) == "function" and v360["$$typeof"] == nil then
            local v369 = v_u_56(p354) or "Unknown"
            if not v_u_159.didWarnAboutModulePatternComponent[v369] then
                v_u_4.error("The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ", v369, v369)
                v_u_159.didWarnAboutModulePatternComponent[v369] = true
            end
        end
    end
    if not v_u_48 and (v360 ~= nil and v367 == "table") then
        local v370 = v360.render
        if type(v370) == "function" and v360["$$typeof"] == nil then
            if v_u_1 then
                local v371 = v_u_56(p354) or "Unknown"
                if not v_u_159.didWarnAboutModulePatternComponent[v371] then
                    v_u_4.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. v371, v371)
                    v_u_159.didWarnAboutModulePatternComponent[v371] = true
                end
            end
            p353.tag = v_u_14
            p353.memoizedState = nil
            p353.updateQueue = nil
            local v372
            if v_u_114(p354) then
                v_u_113(p353)
                v372 = true
            else
                v372 = false
            end
            p353.memoizedState = v360.state
            v_u_74(p353)
            local v373
            if type(p354) == "function" then
                v373 = nil
            else
                v373 = p354.getDerivedStateFromProps
            end
            if v373 ~= nil and type(v373) == "function" then
                v_u_125(p353, p354, v373, v358)
            end
            v_u_124(p353, v360)
            v_u_127(p353, p354, v358, p355)
            return finishClassComponent(nil, p353, p354, true, v372, p355)
        end
    end
    p353.tag = v_u_13
    if v_u_1 then
        if v_u_47 and p354.contextTypes then
            v_u_4.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.", v_u_56(p354) or "Unknown")
        end
        if v_u_46 then
            local v374 = p353.mode
            local v375 = v_u_79
            if bit32.band(v374, v375) ~= 0 then
                v_u_152()
                local v376, v377 = xpcall(v_u_105, v_u_54, nil, p353, p354, v358, v359, p355)
                v_u_153()
                if v376 then
                    v360 = v377
                else
                    error(v377)
                end
            end
        end
    end
    p353.child = v_u_68(p353, nil, v360, p355)
    if v_u_1 then
        validateFunctionComponentInDev(p353, p354)
    end
    return p353.child
end
function validateFunctionComponentInDev(p379, p380)
    if v_u_1 then
        if p379.ref ~= nil then
            local v381 = ""
            local v382 = v_u_61()
            if v382 then
                v381 = v381 .. "\n\nCheck the render method of `" .. v382 .. "`."
            end
            local v383 = v382 or (p379._debugID or "")
            local v384 = p379._debugSource
            if v384 then
                v383 = v384.fileName .. ":" .. v384.lineNumber
            end
            if not v_u_159.didWarnAboutFunctionRefs[v383] then
                v_u_159.didWarnAboutFunctionRefs[v383] = true
                v_u_4.error("Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s", v381)
            end
        end
        if v_u_52 and (type(p380) ~= "function" and p380.defaultProps ~= nil) then
            local v385 = v_u_56(p380) or "Unknown"
            if not v_u_159.didWarnAboutDefaultPropsOnFunctionComponent[v385] then
                v_u_4.error("%s: Support for defaultProps will be removed from function components in a future major release.", v385)
                v_u_159.didWarnAboutDefaultPropsOnFunctionComponent[v385] = true
            end
        end
        if type(p380) ~= "function" and p380.getDerivedStateFromProps ~= nil then
            local v386 = p380.getDerivedStateFromProps
            if type(v386) == "function" then
                local v387 = v_u_56(p380) or "Unknown"
                if not v_u_159.didWarnAboutGetDerivedStateOnFunctionComponent[v387] then
                    v_u_4.error("%s: Function components do not support getDerivedStateFromProps.", v387)
                    v_u_159.didWarnAboutGetDerivedStateOnFunctionComponent[v387] = true
                end
            end
        end
        if type(p380) ~= "function" and p380.contextType ~= nil then
            local v388 = p380.contextType
            if type(v388) == "table" then
                local v389 = v_u_56(p380) or "Unknown"
                if not v_u_159.didWarnAboutContextTypeOnFunctionComponent[v389] then
                    v_u_4.error("%s: Function components do not support contextType.", v389)
                    v_u_159.didWarnAboutContextTypeOnFunctionComponent[v389] = true
                end
            end
        end
    end
end
local v_u_390 = {
    ["dehydrated"] = nil,
    ["retryLane"] = v_u_9.NoLane
}
local v_u_391 = nil
local v_u_392 = nil
local v_u_393 = nil
local v_u_394 = nil
local v_u_395 = nil
local function v_u_435(p396, p397, p398)
    local v399 = p397.pendingProps
    if v_u_1 then
        if not v_u_103.shouldSuspendRef then
            v_u_103.shouldSuspendRef = require(script.Parent:WaitForChild("ReactFiberReconciler")).shouldSuspend
        end
        if v_u_103.shouldSuspendRef(p397) then
            local v400 = p397.flags
            local v401 = v_u_40
            p397.flags = bit32.bor(v400, v401)
        end
    end
    local v402 = v_u_90.current
    local v403 = false
    local v404 = p397.flags
    local v405 = v_u_40
    local v406 = bit32.band(v404, v405) ~= v_u_34
    if not v406 then
        local v407
        if p396 == nil or p396.memoizedState ~= nil then
            v407 = v_u_91(v402, v_u_92)
        else
            v407 = false
        end
        if not v407 then
            if (p396 == nil or p396.memoizedState ~= nil) and (v399.fallback ~= nil and v399.unstable_avoidThisFallback ~= true) then
                v402 = v_u_93(v402, v_u_94)
            end
            ::l16::
            v_u_95(p397, (v_u_96(v402)))
            if p396 == nil then
                if v399.fallback ~= nil then
                    v_u_121(p397)
                    if v_u_51 then
                        local v408 = p397.memoizedState
                        if v408 ~= nil then
                            local v409 = v408.dehydrated
                            if v409 ~= nil then
                                return v_u_392(p397, v409, p398)
                            end
                        end
                    end
                end
                local v410 = v399.children
                local v411 = v399.fallback
                if not v403 then
                    if v399.unstable_expectedLoadTime ~= nil then
                        local v412 = v399.unstable_expectedLoadTime
                        if type(v412) == "number" then
                            local v413 = mountSuspenseFallbackChildren(p397, v410, v411, p398)
                            p397.child.memoizedState = {
                                ["baseLanes"] = p398
                            }
                            p397.memoizedState = v_u_390
                            p397.lanes = v_u_9.SomeRetryLane
                            if v_u_50 then
                                v_u_140(v_u_9.SomeRetryLane)
                            end
                            return v413
                        end
                    end
                    return v_u_393(p397, v410, p398)
                end
                local v414 = mountSuspenseFallbackChildren(p397, v410, v411, p398)
                p397.child.memoizedState = {
                    ["baseLanes"] = p398
                }
                p397.memoizedState = v_u_390
                return v414
            end
            local v415 = p396.memoizedState
            if v415 == nil then
                if not v403 then
                    local v416 = v_u_391(p396, p397, v399.children, p398)
                    p397.memoizedState = nil
                    return v416
                end
                local v417 = v399.fallback
                local v418 = v_u_394(p396, p397, v399.children, v417, p398)
                local v419 = p397.child
                local v420 = p396.child.memoizedState
                if v420 == nil then
                    v419.memoizedState = {
                        ["baseLanes"] = p398
                    }
                else
                    v419.memoizedState = {
                        ["baseLanes"] = v_u_9.mergeLanes(v420.baseLanes, p398)
                    }
                end
                v419.childLanes = v_u_9.removeLanes(p396.childLanes, p398)
                p397.memoizedState = v_u_390
                return v418
            end
            if v_u_51 then
                local v421 = v415.dehydrated
                if v421 ~= nil then
                    if not v406 then
                        return v_u_395(p396, p397, v421, v415, p398)
                    end
                    if p397.memoizedState ~= nil then
                        p397.child = p396.child
                        local v422 = p397.flags
                        local v423 = v_u_40
                        p397.flags = bit32.bor(v422, v423)
                        return nil
                    end
                    local v424 = v399.children
                    local v425 = v399.fallback
                    local v426 = mountSuspenseFallbackAfterRetryWithoutHydrating(p396, p397, v424, v425, p398)
                    p397.child.memoizedState = {
                        ["baseLanes"] = p398
                    }
                    p397.memoizedState = v_u_390
                    return v426
                end
            end
            if not v403 then
                local v427 = v_u_391(p396, p397, v399.children, p398)
                p397.memoizedState = nil
                return v427
            end
            local v428 = v399.fallback
            local v429 = v_u_394(p396, p397, v399.children, v428, p398)
            local v430 = p397.child
            local v431 = p396.child.memoizedState
            if v431 == nil then
                v430.memoizedState = {
                    ["baseLanes"] = p398
                }
            else
                v430.memoizedState = {
                    ["baseLanes"] = v_u_9.mergeLanes(v431.baseLanes, p398)
                }
            end
            v430.childLanes = v_u_9.removeLanes(p396.childLanes, p398)
            p397.memoizedState = v_u_390
            return v429
        end
    end
    local v432 = p397.flags
    local v433 = v_u_40
    local v434 = bit32.bnot(v433)
    p397.flags = bit32.band(v432, v434)
    v403 = true
    goto l16
end
v_u_393 = function(p436, p437, p438)
    local v439 = v_u_134({
        ["mode"] = "visible",
        ["children"] = p437
    }, p436.mode, p438, nil)
    v439.return_ = p436
    p436.child = v439
    return v439
end
function mountSuspenseFallbackChildren(p440, p441, p442, p443)
    local v444 = p440.mode
    local v445 = p440.child
    local v446 = {
        ["mode"] = "hidden",
        ["children"] = p441
    }
    local v447 = v_u_80
    local v448
    if bit32.band(v444, v447) == v_u_77 and v445 ~= nil then
        v445.childLanes = v_u_9.NoLanes
        v445.pendingProps = v446
        if v_u_49 then
            local v449 = p440.mode
            local v450 = v_u_78
            if bit32.band(v449, v450) ~= 0 then
                v445.actualDuration = 0
                v445.actualStartTime = -1
                v445.selfBaseDuration = 0
                v445.treeBaseDuration = 0
            end
        end
        v448 = v_u_133(p442, v444, p443, nil)
    else
        v445 = v_u_134(v446, v444, v_u_9.NoLanes, nil)
        v448 = v_u_133(p442, v444, p443, nil)
    end
    v445.return_ = p440
    v448.return_ = p440
    v445.sibling = v448
    p440.child = v445
    return v448
end
v_u_391 = function(p451, p452, p453, p454)
    local v455 = p451.child
    local v456 = v455.sibling
    local v457 = v_u_137(v455, {
        ["mode"] = "visible",
        ["children"] = p453
    })
    local v458 = p452.mode
    local v459 = v_u_80
    if bit32.band(v458, v459) == v_u_77 then
        v457.lanes = p454
    end
    v457.return_ = p452
    v457.sibling = nil
    if v456 ~= nil then
        local v460 = p452.deletions
        if v460 == nil then
            p452.deletions = { v456 }
            local v461 = p452.flags
            local v462 = v_u_42
            p452.flags = bit32.bor(v461, v462)
        else
            table.insert(v460, v456)
        end
    end
    p452.child = v457
    return v457
end
v_u_394 = function(p463, p464, p465, p466, p467)
    local v468 = p464.mode
    local v469 = p463.child
    local v470 = v469.sibling
    local v471 = {
        ["mode"] = "hidden",
        ["children"] = p465
    }
    local v472 = v_u_80
    local v473
    if bit32.band(v468, v472) == v_u_77 and p464.child ~= v469 then
        v473 = p464.child
        v473.childLanes = v_u_9.NoLanes
        v473.pendingProps = v471
        if v_u_49 then
            local v474 = p464.mode
            local v475 = v_u_78
            if bit32.band(v474, v475) ~= 0 then
                v473.actualDuration = 0
                v473.actualStartTime = -1
                v473.selfBaseDuration = v469.selfBaseDuration
                v473.treeBaseDuration = v469.treeBaseDuration
            end
        end
        p464.deletions = nil
    else
        v473 = v_u_137(v469, v471)
        local v476 = v469.subtreeFlags
        local v477 = v_u_35
        v473.subtreeFlags = bit32.band(v476, v477)
    end
    local v478
    if v470 == nil then
        v478 = v_u_133(p466, v468, p467, nil)
        local v479 = v478.flags
        local v480 = v_u_37
        v478.flags = bit32.bor(v479, v480)
    else
        v478 = v_u_137(v470, p466)
    end
    v478.return_ = p464
    v473.return_ = p464
    v473.sibling = v478
    p464.child = v473
    return v478
end
function mountSuspenseFallbackAfterRetryWithoutHydrating(p481, p482, p483, p484, p485)
    local v486 = p482.mode
    local v487 = v_u_134(p483, v486, v_u_9.NoLanes, nil)
    local v488 = v_u_133(p484, v486, p485, nil)
    local v489 = v488.flags
    local v490 = v_u_37
    v488.flags = bit32.bor(v489, v490)
    v487.return_ = p482
    v488.return_ = p482
    v487.sibling = v488
    p482.child = v487
    local v491 = p482.mode
    local v492 = v_u_80
    if bit32.band(v491, v492) ~= v_u_77 then
        v_u_69(p482, p481.child, nil, p485)
    end
    return v488
end
v_u_392 = function(p493, p494, _)
    local v495 = p493.mode
    local v496 = v_u_80
    if bit32.band(v495, v496) == v_u_77 then
        if v_u_1 then
            v_u_4.error("Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.")
        end
        p493.lanes = v_u_9.laneToLanes(v_u_9.SyncLane)
    elseif v_u_84(p494) then
        if v_u_50 then
            v_u_140(v_u_9.DefaultHydrationLane)
        end
        p493.lanes = v_u_9.laneToLanes(v_u_9.DefaultHydrationLane)
    else
        p493.lanes = v_u_9.laneToLanes(v_u_9.OffscreenLane)
        if v_u_50 then
            v_u_140(v_u_9.OffscreenLane)
        end
    end
    return nil
end
v_u_395 = function(p_u_497, p498, p499, p500, p501)
    v_u_122()
    local v502 = v_u_145()
    local v503 = v_u_146
    if bit32.band(v502, v503) ~= v_u_147 then
        v_u_69(p498, p_u_497.child, nil, p501)
        local v504 = v_u_393(p498, p498.pendingProps.children, p501)
        local v505 = v504.flags
        local v506 = v_u_37
        v504.flags = bit32.bor(v505, v506)
        p498.memoizedState = nil
        return v504
    end
    local v507 = p498.mode
    local v508 = v_u_80
    if bit32.band(v507, v508) == v_u_77 then
        v_u_69(p498, p_u_497.child, nil, p501)
        local v509 = v_u_393(p498, p498.pendingProps.children, p501)
        local v510 = v509.flags
        local v511 = v_u_37
        v509.flags = bit32.bor(v510, v511)
        p498.memoizedState = nil
        return v509
    end
    if v_u_84(p499) then
        v_u_69(p498, p_u_497.child, nil, p501)
        local v512 = v_u_393(p498, p498.pendingProps.children, p501)
        local v513 = v512.flags
        local v514 = v_u_37
        v512.flags = bit32.bor(v513, v514)
        p498.memoizedState = nil
        return v512
    end
    if not (v_u_158 or v_u_9.includesSomeLane(p501, p_u_497.childLanes)) then
        if not v_u_83(p499) then
            v_u_120(p498, p499)
            local v515 = v_u_393(p498, p498.pendingProps.children, p501)
            local v516 = v515.flags
            local v517 = v_u_38
            v515.flags = bit32.bor(v516, v517)
            return v515
        end
        local v518 = p498.flags
        local v519 = v_u_40
        p498.flags = bit32.bor(v518, v519)
        p498.child = p_u_497.child
        local function v520()
            return v_u_141(p_u_497)
        end
        if v_u_50 then
            if v_u_148 == nil then
                v_u_148 = require(script.Parent.Parent:WaitForChild("scheduler")).tracing.unstable_wrap
            end
            v520 = v_u_148(v520)
        end
        v_u_85(p499, v520)
        return nil
    end
    local v521 = v_u_144()
    if v521 ~= nil then
        local v522 = v_u_9.getBumpedLaneForHydration(v521, p501)
        if v522 ~= v_u_9.NoLane and v522 ~= p500.retryLane then
            p500.retryLane = v522
            v_u_142(p_u_497, v522, v_u_9.NoTimestamp)
        end
    end
    v_u_143()
    v_u_69(p498, p_u_497.child, nil, p501)
    local v523 = v_u_393(p498, p498.pendingProps.children, p501)
    local v524 = v523.flags
    local v525 = v_u_37
    v523.flags = bit32.bor(v524, v525)
    p498.memoizedState = nil
    return v523
end
function updatePortalComponent(p526, p527, p528)
    v_u_89(p527, p527.stateNode.containerInfo)
    local v529 = p527.pendingProps
    if p526 == nil then
        p527.child = v_u_69(p527, nil, v529, p528)
    elseif p526 == nil then
        p527.child = v_u_68(p527, nil, v529, p528)
    else
        p527.child = v_u_69(p527, p526.child, v529, p528)
    end
    return p527.child
end
local v_u_530 = false
local function v_u_542(p531, p532, p533)
    local v534 = p532.type._context
    local v535 = p532.pendingProps
    local v536 = p532.memoizedProps
    local v537 = v535.value
    if v_u_1 or v_u_2 then
        if v_u_6.indexOf(v_u_7.keys(v535), "value") < 1 and not v_u_530 then
            v_u_530 = true
            v_u_4.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?")
        end
        local v538 = p532.type.propTypes
        local v539 = p532.type.validateProps
        if v538 or v539 then
            v_u_11(v538, v539, v535, "prop", "Context.Provider")
        end
    end
    v_u_102(p532, v537)
    if v536 ~= nil then
        local v540 = v_u_100(v534, v537, v536.value)
        if v540 == 0 then
            if v536.children == v535.children and not v_u_112() then
                return v_u_156(p531, p532, p533)
            end
        else
            v_u_98(p532, v534, v540, p533)
        end
    end
    local v541 = v535.children
    if p531 == nil then
        p532.child = v_u_68(p532, nil, v541, p533)
    else
        p532.child = v_u_69(p532, p531.child, v541, p533)
    end
    return p532.child
end
local v_u_543 = {
    ["usingContextAsConsumer"] = false,
    ["usingLegacyConsumer"] = false
}
function updateContextConsumer(p544, p545, p546)
    local v547 = p545.type
    if v_u_1 then
        if v547._context == nil then
            if v547 ~= v547.Consumer and not v_u_543.usingContextAsConsumer then
                v_u_543.usingContextAsConsumer = true
                v_u_4.error("Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?")
            end
        else
            v547 = v547._context
        end
    end
    local v548 = p545.pendingProps
    local v549
    if v548.render then
        if v_u_1 and (v_u_3 and not v_u_543.usingLegacyConsumer) then
            v_u_543.usingLegacyConsumer = true
            v_u_4.warn("Your Context.Consumer component is using legacy Roact syntax, which won\'t be supported in future versions of Roact. \nPlease provide no props and supply the \'render\' function as a child (the 3rd argument of createElement). For example: \n       createElement(ContextConsumer, {render = function(...) end})\nbecomes:\n       createElement(ContextConsumer, nil, function(...) end)\nFor more info, reference the React documentation here: \nhttps://reactjs.org/docs/context.html#contextconsumer")
        end
        v549 = v548.render
    else
        v549 = v548.children
    end
    if v_u_1 and type(v549) ~= "function" then
        v_u_4.error("A context consumer was rendered with multiple children, or a child that isn\'t a function. A context consumer expects a single child that is a function. If you did pass a function, make sure there is no trailing or leading whitespace around it.")
    end
    v_u_101(p545, p546, v_u_155.markWorkInProgressReceivedUpdate)
    local v550 = v_u_99(v547, v548.unstable_observedBits)
    local v551
    if v_u_1 then
        v_u_154.current = p545
        v_u_62(true)
        v551 = v549(v550)
        v_u_62(false)
    else
        v551 = v549(v550)
    end
    local v552 = p545.flags
    local v553 = v_u_36
    p545.flags = bit32.bor(v552, v553)
    if p544 == nil then
        p545.child = v_u_68(p545, nil, v551, p546)
    else
        p545.child = v_u_69(p545, p544.child, v551, p546)
    end
    return p545.child
end
function v_u_155.markWorkInProgressReceivedUpdate()
    v_u_158 = true
end
local function v_u_557(p554, p555, p556)
    if p554 then
        p555.dependencies = p554.dependencies
    end
    if v_u_49 then
        v_u_108(p555)
    end
    v_u_150(p555.lanes)
    if not v_u_9.includesSomeLane(p556, p555.childLanes) then
        return nil
    end
    v_u_70(p554, p555)
    return p555.child
end
function remountFiber(p558, p559, p560)
    if v_u_1 then
        local v561 = p559.return_
        if v561 == nil then
            error("Cannot swap the root fiber.")
        end
        local v562 = v561 ~= nil
        assert(v562, "returnFiber was nil in remountFiber")
        p558.alternate = nil
        p559.alternate = nil
        p560.index = p559.index
        p560.sibling = p559.sibling
        p560.return_ = p559.return_
        p560.ref = p559.ref
        if p559 == v561.child then
            v561.child = p560
        else
            local v563 = v561.child
            if v563 == nil then
                error("Expected parent to have a child.")
            end
            local v564 = v563 ~= nil
            assert(v564, "prevSibling was nil in remountFiber")
            while v563.sibling ~= p559 do
                v563 = v563.sibling
                if v563 == nil then
                    error("Expected to find the previous sibling.")
                end
            end
            v563.sibling = p560
        end
        local v565 = v561.deletions
        if v565 == nil then
            v561.deletions = { p558 }
            local v566 = v561.flags
            local v567 = v_u_42
            v561.flags = bit32.bor(v566, v567)
        else
            table.insert(v565, p558)
        end
        local v568 = p560.flags
        local v569 = v_u_37
        p560.flags = bit32.bor(v568, v569)
        return p560
    end
    error("Did not expect this call in production. This is a bug in React. Please file an issue.")
end
function v_u_155.beginWork(p570, p571, p572)
    local v573 = p571.lanes
    if v_u_1 and (p571._debugNeedsRemount and p570 ~= nil) then
        return remountFiber(p570, p571, v_u_135(p571.type, p571.key, p571.pendingProps, p571._debugOwner or nil, p571.mode, p571.lanes))
    end
    if p570 == nil then
        v_u_158 = false
        goto l17
    end
    if p570.memoizedProps == p571.pendingProps and not v_u_112() then
        local v574
        if v_u_1 then
            v574 = p571.type ~= p570.type
        else
            v574 = false
        end
        if not v574 then
            if not v_u_9.includesSomeLane(p572, v573) then
                v_u_158 = false
                if p571.tag == v_u_15 then
                    local v575 = p571.stateNode
                    if v575.pendingContext then
                        v_u_115(p571, v575.pendingContext, v575.pendingContext ~= v575.context)
                    elseif v575.context then
                        v_u_115(p571, v575.context, false)
                    end
                    v_u_89(p571, v575.containerInfo)
                    v_u_118()
                elseif p571.tag == v_u_16 then
                    v_u_88(p571)
                elseif p571.tag == v_u_14 then
                    if v_u_114(p571.type) then
                        v_u_113(p571)
                    end
                elseif p571.tag == v_u_18 then
                    v_u_89(p571, p571.stateNode.containerInfo)
                elseif p571.tag == v_u_22 then
                    v_u_102(p571, p571.memoizedProps.value)
                elseif p571.tag == v_u_24 then
                    if v_u_49 then
                        local v576 = p571.stateNode
                        v576.effectDuration = 0
                        v576.passiveEffectDuration = 0
                    end
                elseif p571.tag == v_u_25 then
                    local v577 = p571.memoizedState
                    if v577 ~= nil then
                        if v_u_51 and v577.dehydrated ~= nil then
                            v_u_95(p571, v_u_96(v_u_90.current))
                            local v578 = p571.flags
                            local v579 = v_u_40
                            p571.flags = bit32.bor(v578, v579)
                            return nil
                        else
                            local v580 = p571.child.childLanes
                            if v_u_9.includesSomeLane(p572, v580) then
                                return v_u_435(p570, p571, p572)
                            else
                                v_u_95(p571, v_u_96(v_u_90.current))
                                local v581 = v_u_557(p570, p571, p572)
                                if v581 == nil then
                                    return nil
                                else
                                    return v581.sibling
                                end
                            end
                        end
                    end
                    v_u_95(p571, v_u_96(v_u_90.current))
                elseif p571.tag == v_u_26 then
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"))
                    error("FIXME (roblox): beginWork: SuspenseListComponent is unimplemented", 2)
                elseif p571.tag == v_u_31 or p571.tag == v_u_32 then
                    p571.lanes = v_u_9.NoLanes
                    return v_u_228(p570, p571, p572)
                end
                return v_u_557(p570, p571, p572)
            end
            local v582 = p570.flags
            local v583 = v_u_43
            if bit32.band(v582, v583) == v_u_34 then
                v_u_158 = false
            else
                v_u_158 = true
            end
            goto l17
        end
    end
    v_u_158 = true
    ::l17::
    p571.lanes = v_u_9.NoLanes
    if p571.tag == v_u_12.IndeterminateComponent then
        return v_u_378(p570, p571, p571.type, p572)
    end
    if p571.tag == v_u_29 then
        return v_u_343(p570, p571, p571.elementType, v573, p572)
    end
    if p571.tag == v_u_13 then
        local v584 = p571.type
        local v585 = p571.pendingProps
        if p571.elementType ~= v584 then
            v585 = v_u_130(v584, v585)
        end
        return v_u_257(p570, p571, v584, v585, p572)
    end
    if p571.tag == v_u_14 then
        local v586 = p571.type
        local v587 = p571.pendingProps
        return v_u_270(p570, p571, v586, p571.elementType == v586 and v587 and v587 or v_u_130(v586, v587), p572)
    end
    if p571.tag == v_u_15 then
        return v_u_312(p570, p571, p572)
    end
    if p571.tag == v_u_16 then
        return v_u_327(p570, p571, p572)
    end
    if p571.tag == v_u_17 then
        if p570 == nil then
            v_u_121(p571)
        end
        return nil
    end
    if p571.tag == v_u_25 then
        return v_u_435(p570, p571, p572)
    end
    if p571.tag == v_u_18 then
        return updatePortalComponent(p570, p571, p572)
    end
    if p571.tag == v_u_19 then
        local v588 = p571.type
        local v589 = p571.pendingProps
        if p571.elementType ~= v588 then
            v589 = v_u_130(v588, v589)
        end
        return v_u_177(p570, p571, v588, v589, p572)
    end
    if p571.tag == v_u_20 then
        return updateFragment(p570, p571, p572)
    end
    if p571.tag == v_u_21 then
        return updateMode(p570, p571, p572)
    end
    if p571.tag == v_u_24 then
        return updateProfiler(p570, p571, p572)
    end
    if p571.tag == v_u_22 then
        return v_u_542(p570, p571, p572)
    end
    if p571.tag == v_u_23 then
        return updateContextConsumer(p570, p571, p572)
    end
    if p571.tag == v_u_27 then
        local v590 = p571.type
        local v591 = v_u_130(v590, p571.pendingProps)
        if (v_u_1 or v_u_2) and p571.type ~= p571.elementType then
            local v592, v593
            if type(v590) == "table" then
                v592 = v590.propTypes
                v593 = v590.validateProps
            else
                v592 = nil
                v593 = nil
            end
            if v592 or v593 then
                v_u_11(v592, v593, v591, "prop", v_u_56(v590))
            end
        end
        return v_u_198(p570, p571, v590, v_u_130(v590.type, v591), v573, p572)
    end
    if p571.tag == v_u_28 then
        return v_u_216(p570, p571, p571.type, p571.pendingProps, v573, p572)
    end
    if p571.tag == v_u_30 then
        local v594 = p571.type
        local v595 = p571.pendingProps
        local v596 = p571.elementType == v594 and v595 and v595 or v_u_130(v594, v595)
        return mountIncompleteClassComponent(p570, p571, v594, v596, p572)
    end
    if p571.tag == v_u_31 then
        return v_u_228(p570, p571, p572)
    end
    if p571.tag == v_u_32 then
        return v_u_228(p570, p571, p572)
    end
    local v597 = v_u_53
    local v598 = p571.tag
    v597(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v598)))
    return nil
end
return v_u_155