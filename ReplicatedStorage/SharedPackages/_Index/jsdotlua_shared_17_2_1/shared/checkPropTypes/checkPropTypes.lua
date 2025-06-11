--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.checkPropTypes (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error
local v_u_2 = require(script.Parent:WaitForChild("console"))
local v_u_3 = {}
local v_u_4 = require(script.Parent:WaitForChild("ReactComponentStackFrame")).describeUnknownElementTypeFrameInDEV
local v5 = require(script.Parent:WaitForChild("ReactSharedInternals"))
local v_u_6 = require(script.Parent:WaitForChild("ErrorHandling.roblox")).describeError
local v_u_7 = v5.ReactDebugCurrentFrame
return function(p_u_8, p9, p_u_10, p_u_11, p_u_12, p13)
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if p_u_8 and p9 then
            v_u_2.warn("You\'ve defined both propTypes and validateProps on " .. (p_u_12 or "a component"))
        end
        if p9 then
            if typeof(p9) == "function" then
                local v14, v15 = p9(p_u_10)
                if not v14 then
                    local v16 = string.format("validateProps failed on a %s type in %s: %s", p_u_11, p_u_12 or "<UNKNOWN Component>", (tostring(v15 or "<Validator function did not supply a message>")))
                    error(v16)
                end
            else
                v_u_2.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(p9), p_u_12 or ""))
            end
        end
        if p_u_8 then
            local v17 = typeof(p_u_8) == "table"
            assert(v17, "propTypes needs to be a table")
            for v_u_18, _ in p_u_8 do
                local _, v26 = xpcall(function()
                    local v19 = p_u_8[v_u_18]
                    if typeof(v19) ~= "function" then
                        local v20 = v_u_1.new
                        local v21 = p_u_12 or "React class"
                        local v22 = p_u_11
                        local v23 = v_u_18
                        local v24 = p_u_8[v_u_18]
                        local v25 = v20(v21 .. ": " .. v22 .. " type `" .. v23 .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(v24) .. "`.This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.")
                        v25.name = "Invariant Violation"
                        error(v25)
                    end
                    return p_u_8[v_u_18](p_u_10, v_u_18, p_u_12, p_u_11, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED")
                end, v_u_6)
                local v27 = typeof(v26) == "table"
                if v26 ~= nil and not v27 then
                    if _G.__DEV__ then
                        if p13 then
                            local v28 = p13._owner
                            local v29 = v_u_4
                            local v30 = p13.type
                            local v31 = p13._source
                            local v32
                            if v28 == nil then
                                v32 = nil
                            else
                                v32 = v28.type
                            end
                            local v33 = v29(v30, v31, v32)
                            v_u_7.setExtraStackFrame(v33)
                        else
                            v_u_7.setExtraStackFrame(nil)
                        end
                    end
                    v_u_2.error(string.format("%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).", p_u_12 or "React class", p_u_11, v_u_18, (typeof(v26))))
                    if _G.__DEV__ then
                        v_u_7.setExtraStackFrame(nil)
                    end
                end
                if v27 and v_u_3[v26.message] == nil then
                    local v34 = v_u_3
                    local v35 = v26.message
                    v34[tostring(v35)] = true
                    if _G.__DEV__ then
                        if p13 then
                            local v36 = p13._owner
                            local v37 = v_u_4
                            local v38 = p13.type
                            local v39 = p13._source
                            local v40
                            if v36 == nil then
                                v40 = nil
                            else
                                v40 = v36.type
                            end
                            local v41 = v37(v38, v39, v40)
                            v_u_7.setExtraStackFrame(v41)
                        else
                            v_u_7.setExtraStackFrame(nil)
                        end
                    end
                    local v42 = v_u_2.warn
                    local v43 = string.format
                    local v44 = v26.message
                    v42(v43("Failed %s type: %s", p_u_11, (tostring(v44))))
                    if _G.__DEV__ then
                        v_u_7.setExtraStackFrame(nil)
                    end
                end
            end
        end
    end
end