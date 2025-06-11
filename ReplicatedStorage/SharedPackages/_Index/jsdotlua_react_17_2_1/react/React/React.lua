--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.React (ModuleScript)

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v1 = require(script.Parent:WaitForChild("ReactMutableSource"))
local v2 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals
local v3 = require(script.Parent:WaitForChild("ReactBaseClasses"))
local v4 = require(script.Parent:WaitForChild("ReactChildren"))
local v5 = require(script.Parent:WaitForChild("ReactElementValidator"))
local v6 = require(script.Parent:WaitForChild("ReactElement"))
local v7 = require(script.Parent:WaitForChild("ReactCreateRef"))
local v8 = require(script.Parent:WaitForChild("ReactForwardRef"))
local v9 = require(script.Parent:WaitForChild("ReactHooks"))
local v10 = require(script.Parent:WaitForChild("ReactMemo"))
local v11 = require(script.Parent:WaitForChild("ReactContext"))
local v12 = require(script.Parent:WaitForChild("ReactLazy"))
local v13 = require(script.Parent:WaitForChild("ReactBinding.roblox"))
local v14 = require(script.Parent:WaitForChild("None.roblox"))
local v15 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v16 = _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
require(script.Parent.Parent:WaitForChild("shared"))
local v17
if v16 then
    v17 = v5.createElementWithValidation
else
    v17 = v6.createElement
end
local v18
if v16 then
    v18 = v5.cloneElementWithValidation
else
    v18 = v6.cloneElement
end
return {
    ["Children"] = v4,
    ["createMutableSource"] = v1,
    ["createRef"] = v7.createRef,
    ["Component"] = v3.Component,
    ["PureComponent"] = v3.PureComponent,
    ["createContext"] = v11.createContext,
    ["forwardRef"] = v8.forwardRef,
    ["lazy"] = v12.lazy,
    ["memo"] = v10.memo,
    ["useCallback"] = v9.useCallback,
    ["useContext"] = v9.useContext,
    ["useEffect"] = v9.useEffect,
    ["useImperativeHandle"] = v9.useImperativeHandle,
    ["useDebugValue"] = v9.useDebugValue,
    ["useLayoutEffect"] = v9.useLayoutEffect,
    ["useMemo"] = v9.useMemo,
    ["useMutableSource"] = v9.useMutableSource,
    ["useReducer"] = v9.useReducer,
    ["useRef"] = v9.useRef,
    ["useBinding"] = v9.useBinding,
    ["useState"] = v9.useState,
    ["Fragment"] = v15.REACT_FRAGMENT_TYPE,
    ["Profiler"] = v15.REACT_PROFILER_TYPE,
    ["StrictMode"] = v15.REACT_STRICT_MODE_TYPE,
    ["unstable_DebugTracingMode"] = v15.REACT_DEBUG_TRACING_MODE_TYPE,
    ["Suspense"] = v15.REACT_SUSPENSE_TYPE,
    ["createElement"] = v17,
    ["cloneElement"] = v18,
    ["isValidElement"] = v6.isValidElement,
    ["__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED"] = v2,
    ["unstable_LegacyHidden"] = v15.REACT_LEGACY_HIDDEN_TYPE,
    ["createBinding"] = v13.create,
    ["joinBindings"] = v13.join,
    ["None"] = v14,
    ["__subscribeToBinding"] = v13.subscribe,
    ["Event"] = require(script.Parent.Parent:WaitForChild("shared")).Event,
    ["Change"] = require(script.Parent.Parent:WaitForChild("shared")).Change,
    ["Tag"] = require(script.Parent.Parent:WaitForChild("shared")).Tag,
    ["unstable_parseReactError"] = require(script.Parent.Parent:WaitForChild("shared")).parseReactError
}