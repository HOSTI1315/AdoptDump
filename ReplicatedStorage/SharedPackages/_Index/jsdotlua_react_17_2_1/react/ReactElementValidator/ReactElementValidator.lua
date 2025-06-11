--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactElementValidator (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = v1.Array
local v_u_3 = v1.Boolean
local v_u_4 = v1.Object
local v_u_5 = require(script.Parent.Parent:WaitForChild("shared")).console
local v_u_6 = v1.util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
local v_u_7 = require(script.Parent.Parent:WaitForChild("shared")).isValidElementType
local v_u_8 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v9 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v_u_10 = v9.getIteratorFn
local _ = v9.REACT_FORWARD_REF_TYPE
local _ = v9.REACT_MEMO_TYPE
local v_u_11 = v9.REACT_FRAGMENT_TYPE
local v_u_12 = v9.REACT_ELEMENT_TYPE
local v_u_13 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.warnAboutSpreadingKeyToJSX
local v_u_14 = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local v_u_15 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner
local v16 = require(script.Parent:WaitForChild("ReactElement"))
local v_u_17 = v16.isValidElement
local v_u_18 = v16.createElement
local v_u_19 = v16.cloneElement
local v_u_20 = v16.jsxDEV
local v_u_21 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame
local v_u_22 = require(script.Parent.Parent:WaitForChild("shared")).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV
local v23 = {}
local v_u_24
if _G.__DEV__ then
    v_u_24 = false
else
    v_u_24 = nil
end
local v_u_25 = {}
local function v_u_30(p26)
    local v27 = v_u_15.current and v_u_8(v_u_15.current.type)
    local v28 = not v27 and "" or "\n\nCheck the render method of `" .. v27 .. "`."
    if not v_u_3.toJSBoolean(v28) then
        local v29
        if typeof(p26) == "string" then
            v29 = p26
        elseif typeof(p26) == "table" then
            v29 = p26.displayName or p26.name
        else
            v29 = nil
        end
        if not v29 and typeof(p26) == "function" then
            v29 = debug.info(p26, "n")
            if v29 == "" then
                v29 = nil
            end
        end
        if v29 then
            v28 = string.format("\n\nCheck the top-level render call using <%s>.", v29)
        end
    end
    return v28
end
local function v_u_43(p31, p32, p33)
    if p31._store == nil or p31._store.validated then
        return
    else
        p31._store.validated = true
        if p31.key ~= nil == (p33 ~= nil) then
            local v34 = v_u_30(p32)
            if not v_u_25[v34] then
                v_u_25[v34] = true
                local v35
                if p31 and (p31._owner and p31._owner ~= v_u_15.current) then
                    local v36 = string.format
                    local v37 = v_u_8
                    local v38 = p31._owner.type
                    v35 = v36(" It was passed a child from %s.", (tostring(v37(v38))))
                else
                    v35 = ""
                end
                if _G.__DEV__ then
                    if _G.__DEV__ then
                        if p31 then
                            local v39 = p31._owner
                            local v40
                            if v39 then
                                v40 = v39.type
                            else
                                v40 = nil
                            end
                            v_u_21((v_u_22(p31.type, p31._source, v40)))
                        else
                            v_u_21(nil)
                        end
                    end
                    if p31.key == nil or p33 == nil then
                        v_u_5.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", v34, v35)
                    else
                        local v41 = v_u_5.error
                        local v42 = p31.key
                        v41("Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(v42), tostring(p33), v34, v35)
                    end
                    if _G.__DEV__ then
                        v_u_21(nil)
                    end
                end
            end
        else
            return
        end
    end
end
local function v_u_51(p44, p45)
    if typeof(p44) == "table" then
        if v_u_2.isArray(p44) then
            for v46 = 1, #p44 do
                local v47 = p44[v46]
                if v_u_17(v47) then
                    v_u_43(v47, p45)
                end
            end
        elseif v_u_17(p44) then
            if p44._store then
                p44._store.validated = true
                return
            end
        elseif p44 then
            local v48 = v_u_10(p44)
            if typeof(v48) == "function" and v48 ~= p44.entries then
                local v49 = v48(p44)
                local v50 = v49.next()
                while not v50.done do
                    if v_u_17(v50.value) then
                        v_u_43(v50.value, p45, v50.key)
                    end
                    v50 = v49.next()
                end
            end
        end
    else
        return
    end
end
local function v_u_58(p52)
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        local v53 = p52.type
        if v53 == nil or typeof(v53) == "string" then
            return
        end
        if typeof(v53) == "function" then
            return
        end
        if typeof(v53) ~= "table" then
            return
        end
        local v54 = v53.propTypes
        local v55 = v53.validateProps
        if v54 or v55 then
            local v56 = v_u_8(v53)
            v_u_14(v54, v55, p52.props, "prop", v56, p52)
        elseif v53.PropTypes ~= nil and not v_u_24 then
            v_u_24 = true
            local v57 = v_u_8(v53)
            v_u_5.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", v57 or "Unknown")
        end
        if v53.getDefaultProps ~= nil then
            v_u_5.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.")
        end
    end
end
local function v_u_67(p59)
    if _G.__DEV__ then
        local v60 = v_u_4.keys(p59.props)
        for v61 = 1, #v60 do
            local v62 = v60[v61]
            if v62 ~= "children" and v62 ~= "key" then
                if _G.__DEV__ then
                    if p59 then
                        local v63 = p59._owner
                        local v64
                        if v63 then
                            v64 = v63.type
                        else
                            v64 = nil
                        end
                        v_u_21((v_u_22(p59.type, p59._source, v64)))
                    else
                        v_u_21(nil)
                    end
                end
                v_u_5.error("Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.", v62)
                if _G.__DEV__ then
                    v_u_21(nil)
                end
                break
            end
        end
        if p59.ref ~= nil then
            if _G.__DEV__ then
                if p59 then
                    local v65 = p59._owner
                    local v66
                    if v65 then
                        v66 = v65.type
                    else
                        v66 = nil
                    end
                    v_u_21((v_u_22(p59.type, p59._source, v66)))
                else
                    v_u_21(nil)
                end
            end
            v_u_5.error("Invalid attribute `ref` supplied to `React.Fragment`.")
            if _G.__DEV__ then
                v_u_21(nil)
            end
        end
    end
end
local function v_u_83(p68, p69, p70, p71, p72, p73)
    local v74 = v_u_7(p68)
    if not v74 then
        local v75 = ""
        if p68 == nil or typeof(p68) == "table" and #v_u_4.keys(p68) == 0 then
            v75 = v75 .. " You likely forgot to export your component from the file it\'s defined in, or you might have mixed up default and named imports."
        end
        local v76 = p72 == nil and "" or "\n\nCheck your code at " .. string.gsub(p72.fileName, "^.*[\\/]", "") .. ":" .. p72.lineNumber .. "."
        local v77
        if v76 then
            v77 = v75 .. v76
        else
            local v78 = v_u_15.current and v_u_8(v_u_15.current.type)
            v77 = v75 .. (not v78 and "" or "\n\nCheck the render method of `" .. v78 .. "`.")
        end
        local v79
        if p68 == nil then
            v79 = "nil"
        elseif v_u_2.isArray(p68) then
            v79 = "array"
        elseif typeof(p68) == "table" and p68["$$typeof"] == v_u_12 then
            v79 = string.format("<%s />", v_u_8(p68.type) or "Unknown")
            v77 = v77 .. " Did you accidentally export a JSX literal or Element instead of a component?"
        else
            v79 = typeof(p68)
            v77 = v77 .. "\n" .. v_u_6(p68)
        end
        if _G.__DEV__ then
            v_u_5.error("React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v79, v77)
        end
    end
    local v80 = v_u_20(p68, p69, p70, p72, p73)
    if v80 == nil then
        return v80
    else
        if v74 then
            local v81 = p69.children
            if v81 ~= nil then
                if p71 then
                    if v_u_2.isArray(v81) then
                        for v82 = 1, #v81 do
                            v_u_51(v81[v82], p68)
                        end
                        v_u_4.freeze(v81)
                    elseif _G.__DEV__ then
                        v_u_5.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.")
                    end
                else
                    v_u_51(v81, p68)
                end
            end
        end
        if _G.__DEV__ and v_u_13 and p69.key ~= nil then
            v_u_5.error("React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />", v_u_8(p68) or "ComponentName")
        end
        if p68 == v_u_11 then
            v_u_67(v80)
            return v80
        else
            v_u_58(v80)
            return v80
        end
    end
end
v23.jsxWithValidation = v_u_83
function v23.jsxWithValidationStatic(p84, p85, p86)
    return v_u_83(p84, p85, p86, true)
end
function v23.jsxWithValidationDynamic(p87, p88, p89)
    return v_u_83(p87, p88, p89, false)
end
function v23.createElementWithValidation(p90, p91, ...)
    local v92 = v_u_7(p90)
    if not v92 then
        local v93 = ""
        if p90 == nil or typeof(p90) == "table" and #v_u_4.keys(p90) == 0 then
            v93 = v93 .. " You likely forgot to export your component from the file it\'s defined in, or you might have mixed up default and named imports."
        end
        local v94
        if p91 == nil then
            v94 = ""
        else
            local v95 = p91.__source
            v94 = v95 == nil and "" or "\n\nCheck your code at " .. string.gsub(v95.fileName, "^.*[\\/]", "") .. ":" .. v95.lineNumber .. "."
        end
        local v96
        if v94 then
            v96 = v93 .. v94
        else
            local v97 = v_u_15.current and v_u_8(v_u_15.current.type)
            v96 = v93 .. (not v97 and "" or "\n\nCheck the render method of `" .. v97 .. "`.")
        end
        local v98
        if p90 == nil then
            v98 = "nil"
        elseif v_u_2.isArray(p90) then
            v98 = "array"
        elseif p90 == nil or (typeof(p90) ~= "table" or p90["$$typeof"] ~= v_u_12) then
            v98 = typeof(p90)
            if p90 ~= nil then
                v96 = v96 .. "\n" .. v_u_6(p90)
            end
        else
            v98 = string.format("<%s />", v_u_8(p90.type) or "Unknown")
            v96 = v96 .. " Did you accidentally export a JSX literal or Element instead of a component?"
        end
        if _G.__DEV__ then
            v_u_5.error("React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v98, v96)
        end
    end
    local v99 = v_u_18(p90, p91, ...)
    if v99 == nil then
        return v99
    else
        if v92 then
            for v100 = 1, select("#", ...) do
                v_u_51(select(v100, ...), p90)
            end
        end
        if p90 == v_u_11 then
            v_u_67(v99)
            return v99
        else
            v_u_58(v99)
            return v99
        end
    end
end
function v23.cloneElementWithValidation(p101, p102, ...)
    local v103 = { p101, p102, ... }
    local v104 = v_u_19(p101, p102, ...)
    for v105 = 3, #v103 do
        v_u_51(v103[v105], v104.type)
    end
    v_u_58(v104)
    return v104
end
return v23