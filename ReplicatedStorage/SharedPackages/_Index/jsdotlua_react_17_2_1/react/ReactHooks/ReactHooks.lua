--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactHooks (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array
local v_u_2 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("shared"))
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentDispatcher
return {
    ["useContext"] = function(p4, p5, ...)
        local v6 = v_u_3.current
        if _G.__DEV__ and v6 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        if _G.__DEV__ then
            if p5 ~= nil then
                v_u_2.error("useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s", p5, typeof(p5) == "number" and v_u_1.isArray({ ... }) and "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks" or "")
            end
            if p4._context ~= nil then
                local v7 = p4._context
                if v7.Consumer == p4 then
                    v_u_2.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?")
                elseif v7.Provider == p4 then
                    v_u_2.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?")
                end
            end
        end
        return v6.useContext(p4, p5)
    end,
    ["useState"] = function(p8, ...)
        local v9 = v_u_3.current
        if _G.__DEV__ and v9 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v9.useState(p8, ...)
    end,
    ["useReducer"] = function(p10, p11, p12)
        local v13 = v_u_3.current
        if _G.__DEV__ and v13 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v13.useReducer(p10, p11, p12)
    end,
    ["useRef"] = function(p14)
        local v15 = v_u_3.current
        if _G.__DEV__ and v15 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v15.useRef(p14)
    end,
    ["useBinding"] = function(p16)
        local v17 = v_u_3.current
        if _G.__DEV__ and v17 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v17.useBinding(p16)
    end,
    ["useEffect"] = function(p18, p19)
        local v20 = v_u_3.current
        if _G.__DEV__ and v20 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v20.useEffect(p18, p19)
    end,
    ["useLayoutEffect"] = function(p21, p22)
        local v23 = v_u_3.current
        if _G.__DEV__ and v23 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v23.useLayoutEffect(p21, p22)
    end,
    ["useCallback"] = function(p24, p25)
        local v26 = v_u_3.current
        if _G.__DEV__ and v26 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v26.useCallback(p24, p25)
    end,
    ["useMemo"] = function(p27, p28)
        local v29 = v_u_3.current
        if _G.__DEV__ and v29 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v29.useMemo(p27, p28)
    end,
    ["useImperativeHandle"] = function(p30, p31, p32)
        local v33 = v_u_3.current
        if _G.__DEV__ and v33 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v33.useImperativeHandle(p30, p31, p32)
    end,
    ["useDebugValue"] = function(p34, p35)
        if not _G.__DEV__ then
            return nil
        end
        local v36 = v_u_3.current
        if _G.__DEV__ and v36 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v36.useDebugValue(p34, p35)
    end,
    ["emptyObject"] = {},
    ["useOpaqueIdentifier"] = function()
        local v37 = v_u_3.current
        if _G.__DEV__ and v37 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v37.useOpaqueIdentifier()
    end,
    ["useMutableSource"] = function(p38, p39, p40)
        local v41 = v_u_3.current
        if _G.__DEV__ and v41 == nil then
            v_u_2.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return v41.useMutableSource(p38, p39, p40)
    end
}