--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactSymbols (ModuleScript)

local v_u_6 = {
    ["REACT_ELEMENT_TYPE"] = 60103,
    ["REACT_PORTAL_TYPE"] = 60106,
    ["REACT_FRAGMENT_TYPE"] = 60107,
    ["REACT_STRICT_MODE_TYPE"] = 60108,
    ["REACT_PROFILER_TYPE"] = 60114,
    ["REACT_PROVIDER_TYPE"] = 60109,
    ["REACT_CONTEXT_TYPE"] = 60110,
    ["REACT_FORWARD_REF_TYPE"] = 60112,
    ["REACT_SUSPENSE_TYPE"] = 60113,
    ["REACT_SUSPENSE_LIST_TYPE"] = 60120,
    ["REACT_MEMO_TYPE"] = 60115,
    ["REACT_LAZY_TYPE"] = 60116,
    ["REACT_BLOCK_TYPE"] = 60121,
    ["REACT_SERVER_BLOCK_TYPE"] = 60122,
    ["REACT_FUNDAMENTAL_TYPE"] = 60117,
    ["REACT_SCOPE_TYPE"] = 60119,
    ["REACT_OPAQUE_ID_TYPE"] = 60128,
    ["REACT_DEBUG_TRACING_MODE_TYPE"] = 60129,
    ["REACT_OFFSCREEN_TYPE"] = 60130,
    ["REACT_LEGACY_HIDDEN_TYPE"] = 60131,
    ["REACT_BINDING_TYPE"] = 60132,
    ["getIteratorFn"] = function(p_u_1)
        if typeof(p_u_1) == "table" then
            return p_u_1["$$typeof"] ~= v_u_6.REACT_PORTAL_TYPE and function()
                local v_u_2 = nil
                local v_u_3 = nil
                return {
                    ["next"] = function()
                        local v4, v5 = next(p_u_1, v_u_2)
                        v_u_2 = v4
                        v_u_3 = v5
                        return {
                            ["done"] = v_u_3 == nil,
                            ["key"] = v_u_2,
                            ["value"] = v_u_3
                        }
                    end
                }
            end or nil
        else
            return nil
        end
    end
}
return v_u_6