--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.isValidElementType (ModuleScript)

local v1 = require(script.Parent:WaitForChild("ReactSymbols"))
local v_u_2 = v1.REACT_CONTEXT_TYPE
local v_u_3 = v1.REACT_FORWARD_REF_TYPE
local v_u_4 = v1.REACT_FRAGMENT_TYPE
local v_u_5 = v1.REACT_PROFILER_TYPE
local v_u_6 = v1.REACT_PROVIDER_TYPE
local v_u_7 = v1.REACT_DEBUG_TRACING_MODE_TYPE
local v_u_8 = v1.REACT_STRICT_MODE_TYPE
local v_u_9 = v1.REACT_SUSPENSE_TYPE
local v_u_10 = v1.REACT_MEMO_TYPE
local v_u_11 = v1.REACT_LAZY_TYPE
local v_u_12 = v1.REACT_FUNDAMENTAL_TYPE
local v_u_13 = v1.REACT_BLOCK_TYPE
local v_u_14 = v1.REACT_SERVER_BLOCK_TYPE
local v_u_15 = v1.REACT_LEGACY_HIDDEN_TYPE
return function(p16)
    local v17 = typeof(p16)
    if v17 == "string" or v17 == "function" then
        return true
    end
    if p16 == v_u_4 or (p16 == v_u_5 or (p16 == v_u_7 or (p16 == v_u_8 or (p16 == v_u_9 or p16 == v_u_15)))) then
        return true
    end
    if v17 == "table" then
        if p16.isReactComponent then
            return true
        end
        if p16["$$typeof"] == v_u_11 or (p16["$$typeof"] == v_u_10 or (p16["$$typeof"] == v_u_6 or (p16["$$typeof"] == v_u_2 or (p16["$$typeof"] == v_u_3 or (p16["$$typeof"] == v_u_12 or (p16["$$typeof"] == v_u_13 or p16[1] == v_u_14)))))) then
            return true
        end
    end
    return false
end