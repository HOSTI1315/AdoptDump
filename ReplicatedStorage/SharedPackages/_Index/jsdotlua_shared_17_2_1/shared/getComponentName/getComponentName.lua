--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.getComponentName (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("console"))
local v2 = require(script.Parent:WaitForChild("ReactSymbols"))
local v_u_3 = v2.REACT_CONTEXT_TYPE
local v_u_4 = v2.REACT_FORWARD_REF_TYPE
local v_u_5 = v2.REACT_FRAGMENT_TYPE
local v_u_6 = v2.REACT_PORTAL_TYPE
local v_u_7 = v2.REACT_MEMO_TYPE
local v_u_8 = v2.REACT_PROFILER_TYPE
local v_u_9 = v2.REACT_PROVIDER_TYPE
local v_u_10 = v2.REACT_STRICT_MODE_TYPE
local v_u_11 = v2.REACT_SUSPENSE_TYPE
local v_u_12 = v2.REACT_SUSPENSE_LIST_TYPE
local v_u_13 = v2.REACT_LAZY_TYPE
local v_u_14 = v2.REACT_BLOCK_TYPE
require(script.Parent:WaitForChild("ReactTypes"))
local v_u_15 = require(script.Parent:WaitForChild("ErrorHandling.roblox")).describeError
local function v_u_28(p16)
    if p16 == nil then
        return nil
    else
        local v17 = typeof(p16)
        if _G.__DEV__ and v17 == "table" then
            local v18 = p16.tag
            if typeof(v18) == "number" then
                v_u_1.warn("Received an unexpected object in getComponentName(). This is likely a bug in React. Please file an issue.")
            end
        end
        if v17 == "function" then
            local v19 = debug.info(p16, "n")
            if v19 and string.len(v19) > 0 then
                return v19
            else
                return nil
            end
        else
            if v17 == "string" then
                return p16
            end
            if p16 == v_u_5 then
                return "Fragment"
            end
            if p16 == v_u_6 then
                return "Portal"
            end
            if p16 == v_u_8 then
                return "Profiler"
            end
            if p16 == v_u_10 then
                return "StrictMode"
            end
            if p16 == v_u_11 then
                return "Suspense"
            end
            if p16 == v_u_12 then
                return "SuspenseList"
            end
            if v17 == "table" then
                local v20 = p16["$$typeof"]
                if v20 == v_u_3 then
                    return (p16.displayName or "Context") .. ".Consumer"
                end
                if v20 == v_u_9 then
                    return (p16._context.displayName or "Context") .. ".Provider"
                end
                if v20 == v_u_4 then
                    local v21 = p16.render
                    local v22 = typeof(v21) == "table" and (v21.displayName or (v21.name or "")) or "<function>"
                    return p16.displayName or (v22 ~= "" and string.format("%s(%s)", "ForwardRef", v22) or "ForwardRef")
                end
                if v20 == v_u_7 then
                    return v_u_28(p16.type)
                end
                if v20 == v_u_14 then
                    return v_u_28(p16._render)
                end
                if v20 == v_u_13 then
                    local v23 = p16._payload
                    local v24 = p16._init
                    local v25, v26 = xpcall(v24, v_u_15, v23)
                    if v25 then
                        return v_u_28(v26)
                    else
                        return nil
                    end
                end
                if p16.displayName then
                    return p16.displayName
                end
                if p16.name then
                    return p16.name
                end
                local v27 = getmetatable(p16)
                if v27 and rawget(v27, "__tostring") then
                    return tostring(p16)
                end
            end
            return nil
        end
    end
end
return v_u_28