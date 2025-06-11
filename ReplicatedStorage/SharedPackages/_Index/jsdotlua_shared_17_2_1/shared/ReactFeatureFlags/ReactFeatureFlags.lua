--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactFeatureFlags (ModuleScript)

local v1 = {
    ["enableFilterEmptyStringAttributesDOM"] = true,
    ["enableDebugTracing"] = false
}
local v2 = _G.__PROFILE__
if v2 then
    v2 = _G.__EXPERIMENTAL__
end
v1.enableSchedulingProfiler = v2
v1.debugRenderPhaseSideEffectsForStrictMode = _G.__DEV__
v1.replayFailedUnitOfWorkWithInvokeGuardedCallback = _G.__DEV__
v1.warnAboutDeprecatedLifecycles = true
v1.enableProfilerTimer = _G.__PROFILE__
v1.enableProfilerCommitHooks = false
v1.enableSchedulerTracing = _G.__PROFILE__
v1.enableSuspenseServerRenderer = _G.__EXPERIMENTAL__
v1.enableSelectiveHydration = _G.__EXPERIMENTAL__
v1.enableBlocksAPI = _G.__EXPERIMENTAL__
v1.enableLazyElements = _G.__EXPERIMENTAL__
v1.enableSchedulerDebugging = false
v1.disableJavaScriptURLs = false
v1.enableFundamentalAPI = false
v1.enableScopeAPI = false
v1.enableCreateEventHandleAPI = false
v1.warnAboutUnmockedScheduler = false
v1.enableSuspenseCallback = false
v1.warnAboutDefaultPropsOnFunctionComponents = false
v1.disableSchedulerTimeoutBasedOnReactExpirationTime = false
v1.enableTrustedTypesIntegration = false
v1.warnAboutSpreadingKeyToJSX = true
v1.enableComponentStackLocations = true
v1.enableNewReconciler = true
v1.skipUnmountedBoundaries = true
v1.disableInputAttributeSyncing = true
v1.warnAboutStringRefs = false
v1.disableLegacyContext = false
v1.disableTextareaChildren = false
v1.disableModulePatternComponents = false
v1.warnUnstableRenderSubtreeIntoContainer = false
v1.enableLegacyFBSupport = true
v1.deferRenderPhaseUpdateToNextBatch = false
v1.decoupleUpdatePriorityFromScheduler = true
v1.enableDiscreteEventFlushingChange = false
v1.enableEagerRootListeners = false
v1.enableDoubleInvokingEffects = false
return v1