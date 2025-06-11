--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactElement (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactLazy"))
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_5 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_ELEMENT_TYPE
local v_u_6 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner
local v_u_7 = {
    ["key"] = true,
    ["ref"] = true,
    ["__self"] = true,
    ["__source"] = true
}
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = v_u_1 and {} or nil
local v11 = {}
local v_u_12 = {
    ["isReactWarning"] = true
}
local function v_u_17(p13, p_u_14)
    p13.key = nil
    local v16 = {
        ["__index"] = function(_, p15)
            if p15 ~= "key" then
                return nil
            end
            if v_u_1 and not v_u_8 then
                v_u_8 = true
                v_u_3.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p_u_14)
            end
            return v_u_12
        end
    }
    setmetatable(p13, v16)
end
local function v_u_22(p18, p_u_19)
    p18.ref = nil
    local v21 = {
        ["__index"] = function(_, p20)
            if p20 ~= "ref" then
                return nil
            end
            if v_u_1 and not v_u_9 then
                v_u_9 = true
                v_u_3.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p_u_19)
            end
            return v_u_12
        end
    }
    setmetatable(p18, v21)
end
local function v_u_26(p23)
    if v_u_1 then
        local v24 = p23.ref
        if type(v24) == "string" and v_u_6.current then
            local v25 = v_u_4(v_u_6.current.type)
            if not v_u_10[v25] then
                error(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", v25 or "Unknown", p23.ref))
            end
        end
    end
end
local function v_u_40(p27, p28, p29, p30, p31, p32, p33)
    local v34 = {
        ["type"] = p27,
        ["key"] = p28,
        ["ref"] = p29,
        ["props"] = p33,
        ["_owner"] = p32,
        ["$$typeof"] = v_u_5
    }
    if v_u_1 then
        local v_u_35 = {
            ["validated"] = false
        }
        v34._store = setmetatable({}, {
            ["__index"] = v_u_35,
            ["__newindex"] = function(p36, p37, p38)
                if p37 == "validated" then
                    v_u_35.validated = p38
                else
                    rawset(p36, p37, p38)
                end
            end
        })
        local v39 = {
            ["__index"] = {
                ["_self"] = p30,
                ["_source"] = p31
            }
        }
        setmetatable(v34, v39)
    end
    return v34
end
function v11.jsx(_, _, _)
    error("JSX is currently unsupported")
end
function v11.jsxDEV(_, _, _, _, _)
    error("JSX is currently unsupported")
    return nil
end
function v11.createElement(p41, p42, ...)
    local v43 = p42 == nil and {} or table.clone(p42)
    local v44 = nil
    local v45 = nil
    local v46
    if p42 == nil then
        v46 = nil
        ::l5::
        local v47 = select("#", ...)
        if v47 == 1 then
            v43.children = select(1, ...)
        elseif v47 > 1 then
            local v48 = table.create(v47)
            for v49 = 1, v47 do
                local v50 = select(v49, ...)
                table.insert(v48, v50)
            end
            if v_u_1 then
                table.freeze(v48)
            end
            v43.children = v48
        end
        if type(p41) == "table" and p41.defaultProps then
            local v51 = p41.defaultProps
            for v52, _ in v51 do
                if v43[v52] == nil then
                    v43[v52] = v51[v52]
                end
            end
        end
        if v_u_1 then
            if v44 or v45 then
                local v53
                if type(p41) == "function" then
                    v53 = debug.info(p41, "n") or "<function>"
                else
                    v53 = type(p41) == "table" and (p41.displayName or (p41.name or "Unknown")) or p41
                end
                if v44 then
                    v_u_17(v43, v53)
                end
                if v45 then
                    v_u_22(v43, v53)
                end
            end
            v46 = v46 == nil and {
                ["fileName"] = debug.info(3, "s"),
                ["lineNumber"] = debug.info(3, "l")
            } or v46
        end
        return v_u_40(p41, v44, v45, nil, v46, v_u_6.current, v43)
    end
    if v_u_1 and p42.ref ~= nil then
        local v54 = p42.ref
        if type(v54) == "table" and p42.ref.isReactWarning then
            v57 = false
            ::l11::
            if v57 then
                v45 = p42.ref
                if v_u_1 then
                    v_u_26(p42)
                end
            end
            if v_u_1 and p42.key ~= nil then
                local v55 = p42.key
                if type(v55) == "table" and p42.key.isReactWarning then
                    v56 = false
                    ::l22::
                    if v56 then
                        v44 = p42.key
                        if type(v44) ~= "number" then
                            v44 = tostring(v44)
                        end
                    end
                    if p42.__source == nil then
                        v46 = nil
                    else
                        v46 = p42.__source
                    end
                    if v43.key ~= nil then
                        v43.key = nil
                    end
                    if v43.ref ~= nil then
                        v43.ref = nil
                    end
                    if v43.__self ~= nil then
                        v43.__self = nil
                    end
                    if v43.__source ~= nil then
                        v43.__source = nil
                    end
                    goto l5
                end
            end
            local v56 = p42.key ~= nil
            goto l22
        end
    end
    local v57 = p42.ref ~= nil
    goto l11
end
function v11.cloneAndReplaceKey(p58, p59)
    return v_u_40(p58.type, p59, p58.ref, p58._self, p58._source, p58._owner, p58.props)
end
function v11.cloneElement(p60, p61, ...)
    if p60 == nil then
        error(v_u_2.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(p60)))
    end
    local v62 = p60.props
    local v63 = v62 == nil and {} or table.clone(v62)
    local v64 = p60.key
    local v65 = p60.ref
    local v66 = p60._source
    local v67 = p60._owner
    if p61 ~= nil then
        local v68 = p61.ref
        if v68 == nil then
            if v_u_1 and p61.ref ~= nil then
                local v69 = p61.ref
                if type(v69) == "table" and p61.ref.isReactWarning then
                    goto l10
                end
            end
            local _ = p61.ref == nil
        else
            v67 = v_u_6.current
            v65 = v68
        end
        ::l10::
        local v70 = p61.key
        if v70 == nil then
            if v_u_1 and p61.key ~= nil then
                local v71 = p61.key
                if type(v71) == "table" and p61.key.isReactWarning then
                    goto l7
                end
            end
            local _ = p61.key == nil
        elseif type(v70) == "number" then
            v64 = v70
        else
            v64 = v70 or "nil"
        end
    end
    ::l7::
    local v72 = p60.type
    local v73
    if type(v72) == "table" then
        v73 = v72.defaultProps
    else
        v73 = nil
    end
    if p61 ~= nil then
        for v74, _ in p61 do
            if p61[v74] ~= nil and not v_u_7[v74] then
                if p61[v74] == nil and v73 ~= nil then
                    v63[v74] = v73[v74]
                else
                    v63[v74] = p61[v74]
                end
            end
        end
    end
    local v75 = select("#", ...)
    if v75 == 1 then
        v63.children = select(1, ...)
    elseif v75 > 1 then
        v63.children = { ... }
    end
    return v_u_40(p60.type, v64, v65, nil, v66, v67, v63)
end
function v11.isValidElement(p76)
    local v77
    if type(p76) == "table" then
        v77 = p76["$$typeof"] == v_u_5
    else
        v77 = false
    end
    return v77
end
return v11