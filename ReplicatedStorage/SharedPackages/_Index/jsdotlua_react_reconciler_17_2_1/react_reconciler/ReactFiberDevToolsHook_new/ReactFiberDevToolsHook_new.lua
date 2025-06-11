--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberDevToolsHook.new (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v2 = {}
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableProfilerTimer
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent.Parent:WaitForChild("shared"))
local v_u_4 = require(script.Parent:WaitForChild("ReactFiberFlags")).DidCapture
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = false
function v2.isDevToolsPresent()
    return _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil
end
function v2.injectInternals(p_u_8)
    if _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
        return false
    end
    local v_u_9 = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__
    if v_u_9.isDisabled then
        return true
    end
    if not v_u_9.supportsFiber then
        if _G.__DEV__ then
            v_u_1.error("The installed version of React DevTools is too old and will not work with the current version of React. Please update React DevTools. https://reactjs.org/link/react-devtools")
        end
        return true
    end
    local v10, v11 = pcall(function()
        v_u_5 = v_u_9.inject(p_u_8)
        v_u_6 = v_u_9
    end)
    if not v10 and _G.__DEV__ then
        v_u_1.error("React instrumentation encountered an error: %s.", v11)
    end
    return true
end
function v2.onScheduleRoot(p12, p13)
    if _G.__DEV__ and v_u_6 then
        local v14 = v_u_6.onScheduleFiberRoot
        local v15
        if typeof(v14) == "function" then
            v15 = true
        elseif typeof(v14) == "table" then
            local v16 = getmetatable(v14)
            v15 = v16 and rawget(v16, "__call") and true or (v14._isMockFunction and true or false)
        else
            v15 = false
        end
        if v15 then
            local v17, v18 = pcall(v_u_6.onScheduleFiberRoot, v_u_5, p12, p13)
            if not v17 and (_G.__DEV__ and not v_u_7) then
                v_u_7 = true
                v_u_1.error("React instrumentation encountered an error: %s", v18)
            end
        end
    end
end
function v2.onCommitRoot(p_u_19, p_u_20)
    if v_u_6 then
        local v21 = v_u_6.onCommitFiberRoot
        local v22
        if typeof(v21) == "function" then
            v22 = true
        elseif typeof(v21) == "table" then
            local v23 = getmetatable(v21)
            v22 = v23 and rawget(v23, "__call") and true or (v21._isMockFunction and true or false)
        else
            v22 = false
        end
        if v22 then
            local v27, v28 = pcall(function()
                local v24 = p_u_19.current.flags
                local v25 = v_u_4
                local v26 = bit32.band(v24, v25) == v_u_4
                if v_u_3 then
                    v_u_6.onCommitFiberRoot(v_u_5, p_u_19, p_u_20, v26)
                else
                    v_u_6.onCommitFiberRoot(v_u_5, p_u_19, nil, v26)
                end
            end)
            if not v27 and (_G.__DEV__ and not v_u_7) then
                v_u_7 = true
                v_u_1.error("React instrumentation encountered an error: %s", v28)
            end
        end
    end
end
function v2.onCommitUnmount(p29)
    if v_u_6 then
        local v30 = v_u_6.onCommitFiberUnmount
        local v31
        if typeof(v30) == "function" then
            v31 = true
        elseif typeof(v30) == "table" then
            local v32 = getmetatable(v30)
            v31 = v32 and rawget(v32, "__call") and true or (v30._isMockFunction and true or false)
        else
            v31 = false
        end
        if v31 then
            local v33, v34 = pcall(v_u_6.onCommitFiberUnmount, v_u_5, p29)
            if not v33 and (_G.__DEV__ and not v_u_7) then
                v_u_7 = true
                v_u_1.error("React instrumentation encountered an error: %s", v34)
            end
        end
    end
end
return v2