--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactBaseClasses (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = _G.__COMPAT_WARNINGS__
local v_u_3 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
local v_u_5 = require(script.Parent:WaitForChild("ReactNoopUpdateQueue"))
local v_u_6 = {}
if v_u_1 then
    v_u_3.freeze(v_u_6)
end
local v_u_7 = require(script.Parent.Parent:WaitForChild("shared")).UninitializedState
local v_u_8 = {
    ["didMount"] = "componentDidMount",
    ["shouldUpdate"] = "shouldComponentUpdate",
    ["willUpdate"] = "UNSAFE_componentWillUpdate",
    ["didUpdate"] = "componentDidUpdate",
    ["willUnmount"] = "componentWillUnmount"
}
local function v22(p9, p10, p11)
    if v_u_8[p10] ~= nil then
        if p9[v_u_8[p10]] == nil then
            if p10 == "willUpdate" and p9.componentWillUpdate then
                local v12 = p9.__componentName
                v_u_4.warn("%s already defined \'%s\', but it also defining the deprecated Roact method \'%s\'. %s should only implement one of these methods, preferably using the non-deprecated name.", v12, "UNSAFE_componentWillUpdate", p10, v12)
            else
                local v13 = p9.__componentName
                local v14 = v_u_8[p10]
                if v_u_1 and v_u_2 then
                    local v15, v16 = debug.info(3, "sln")
                    local v17 = v_u_4.warn
                    local v18 = "%s is using method \'%s\', which is no longer supported and should be updated to \'%s\'\nFile: %s:%s"
                    local v19 = string.match(v15, "%.%u[%.%w]-$")
                    if v19 then
                        v15 = string.gsub(v19, "^%.", "")
                    end
                    v17(v18, v13, p10, v14, v15, (tostring(v16)))
                end
            end
        else
            local v20 = p9.__componentName
            local v21 = v_u_8[p10]
            v_u_4.warn("%s already defined \'%s\', but it also defining the deprecated Roact method \'%s\'. %s should only implement one of these methods, preferably using the non-deprecated name.", v20, v21, p10, v20)
        end
        p10 = v_u_8[p10]
    end
    rawset(p9, p10, p11)
end
local v24 = setmetatable({
    ["__componentName"] = "Component"
}, {
    ["__newindex"] = v22,
    ["__index"] = {
        ["isReactComponent"] = true
    },
    ["__tostring"] = function(p23)
        return p23.__componentName
    end
})
local v_u_25 = _G.__TESTEZ_RUNNING_TEST__ and 0 or 900
local v_u_26 = table.create(v_u_25)
local v_u_27 = 1
for _ = 1, v_u_25 do
    table.insert(v_u_26, {
        ["props"] = nil,
        ["context"] = nil,
        ["state"] = v_u_7,
        ["__refs"] = v_u_6,
        ["__updater"] = v_u_5
    })
end
local function v_u_33(p28, p29, p30)
    if v_u_1 and p30 ~= nil then
        v_u_4.warn("Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.", p28.__componentName)
    end
    local v31
    if p29 then
        v31 = type(p29)
    else
        v31 = p29
    end
    if p29 == nil or v31 ~= "table" and v31 ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
    end
    local v32 = p28.state
    if v31 == "function" then
        p29 = p29(v32, p28.props)
    end
    p28.state = v_u_3.assign({}, v32, p29)
end
function v24.extend(p34, p35)
    if p35 == nil then
        if v_u_2 then
            v_u_4.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.")
            p35 = ""
        else
            p35 = ""
        end
    elseif type(p35) ~= "string" then
        error("Component class name must be a string")
    end
    local v_u_36 = {
        ["__componentName"] = p35,
        ["setState"] = p34.setState,
        ["forceUpdate"] = p34.forceUpdate,
        ["init"] = nil
    }
    v_u_36.__index = v_u_36
    function v_u_36.__ctor(p37, p38, p39)
        local v40
        if v_u_27 <= v_u_25 then
            v40 = v_u_26[v_u_27]
            v40.props = p37
            v40.context = p38
            v_u_26[v_u_27] = nil
            v_u_27 = v_u_27 + 1
        else
            v40 = {
                ["props"] = p37,
                ["context"] = p38,
                ["state"] = v_u_7,
                ["__refs"] = v_u_6,
                ["__updater"] = p39 or v_u_5
            }
        end
        local v41 = v_u_36
        local v42 = setmetatable(v40, v41)
        if v_u_36.init then
            local v43 = v_u_36.init
            if type(v43) == "function" then
                v42.setState = v_u_33
                v_u_36.init(v42, p37, p38)
                v42.setState = nil
            end
        end
        return v42
    end
    local v44 = getmetatable(p34)
    setmetatable(v_u_36, v44)
    return v_u_36
end
function v24.setState(p45, p46, p47)
    if p46 ~= nil and (type(p46) ~= "table" and type(p46) ~= "function") then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
    end
    p45.__updater.enqueueSetState(p45, p46, p47, "setState")
end
function v24.forceUpdate(p48, p49)
    p48.__updater.enqueueForceUpdate(p48, p49, "forceUpdate")
end
if v_u_1 then
    local v50 = {
        ["isMounted"] = { "isMounted", "Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks." },
        ["replaceState"] = { "replaceState", "Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236)." }
    }
    for v51, _ in v50 do
        if v50[v51] ~= nil then
            local v_u_52 = v50[v51]
            v24[v51] = function()
                v_u_4.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v_u_52[1], v_u_52[2])
                return nil
            end
        end
    end
end
local v53 = v24:extend("PureComponent")
v53.extend = v24.extend
setmetatable(v53, {
    ["__newindex"] = v22,
    ["__index"] = {
        ["isReactComponent"] = true,
        ["isPureReactComponent"] = true
    },
    ["__tostring"] = function(p54)
        return p54.__componentName
    end
})
return {
    ["Component"] = v24,
    ["PureComponent"] = v53
}