--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared (ModuleScript)

require(script.Parent:WaitForChild("luau-polyfill"))
local v1 = require(script:WaitForChild("ReactTypes"))
require(script:WaitForChild("flowtypes.roblox"))
require(script:WaitForChild("ReactElementType"))
local v2 = require(script:WaitForChild("ReactFiberHostConfig"))
local v3 = require(script:WaitForChild("ReactSharedInternals"))
local v4 = require(script:WaitForChild("ErrorHandling.roblox"))
return {
    ["checkPropTypes"] = require(script:WaitForChild("checkPropTypes")),
    ["console"] = require(script:WaitForChild("console")),
    ["ConsolePatchingDev"] = require(script:WaitForChild("ConsolePatchingDev.roblox")),
    ["consoleWithStackDev"] = require(script:WaitForChild("consoleWithStackDev")),
    ["enqueueTask"] = require(script:WaitForChild("enqueueTask.roblox")),
    ["ExecutionEnvironment"] = require(script:WaitForChild("ExecutionEnvironment")),
    ["formatProdErrorMessage"] = require(script:WaitForChild("formatProdErrorMessage")),
    ["getComponentName"] = require(script:WaitForChild("getComponentName")),
    ["invariant"] = require(script:WaitForChild("invariant")),
    ["invokeGuardedCallbackImpl"] = require(script:WaitForChild("invokeGuardedCallbackImpl")),
    ["isValidElementType"] = require(script:WaitForChild("isValidElementType")),
    ["objectIs"] = require(script:WaitForChild("objectIs")),
    ["ReactComponentStackFrame"] = require(script:WaitForChild("ReactComponentStackFrame")),
    ["ReactElementType"] = require(script:WaitForChild("ReactElementType")),
    ["ReactErrorUtils"] = require(script:WaitForChild("ReactErrorUtils")),
    ["ReactFeatureFlags"] = require(script:WaitForChild("ReactFeatureFlags")),
    ["ReactInstanceMap"] = require(script:WaitForChild("ReactInstanceMap")),
    ["ReactSharedInternals"] = v3,
    ["ReactFiberHostConfig"] = v2,
    ["ReactSymbols"] = require(script:WaitForChild("ReactSymbols")),
    ["ReactVersion"] = require(script:WaitForChild("ReactVersion")),
    ["shallowEqual"] = require(script:WaitForChild("shallowEqual")),
    ["UninitializedState"] = require(script:WaitForChild("UninitializedState.roblox")),
    ["ReactTypes"] = v1,
    ["describeError"] = v4.describeError,
    ["errorToString"] = v4.errorToString,
    ["parseReactError"] = v4.parseReactError,
    ["Symbol"] = require(script:WaitForChild("Symbol.roblox")),
    ["Type"] = require(script:WaitForChild("Type.roblox")),
    ["Change"] = require(script:WaitForChild("PropMarkers"):WaitForChild("Change")),
    ["Event"] = require(script:WaitForChild("PropMarkers"):WaitForChild("Event")),
    ["Tag"] = require(script:WaitForChild("PropMarkers"):WaitForChild("Tag"))
}