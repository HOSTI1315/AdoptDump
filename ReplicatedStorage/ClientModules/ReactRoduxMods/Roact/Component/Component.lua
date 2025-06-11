--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.Component (ModuleScript)

local v_u_1 = require(script.Parent.Reconciler)
local v_u_2 = require(script.Parent.Core)
local v_u_3 = require(script.Parent.GlobalConfig)
local v_u_4 = require(script.Parent.Instrumentation)
local v_u_5 = require(script.Parent.invalidSetStateMessages)
local v6 = {}
local v_u_7 = tick
v6.__index = v6
local function v_u_13(...)
    local v8 = {}
    for v9 = 1, select("#", ...) do
        local v10 = select(v9, ...)
        for v11, v12 in pairs(v10) do
            if v12 == v_u_2.None then
                v8[v11] = nil
            else
                v8[v11] = v12
            end
        end
    end
    return v8
end
function v6.extend(p14, p_u_15)
    local v16 = type(p_u_15) == "string"
    assert(v16, "A name must be provided to create a Roact Component")
    local v_u_17 = {}
    for v18, v19 in pairs(p14) do
        if v18 ~= "extend" then
            v_u_17[v18] = v19
        end
    end
    v_u_17.__index = v_u_17
    setmetatable(v_u_17, {
        ["__tostring"] = function(_)
            return p_u_15
        end
    })
    function v_u_17._new(p20, p21)
        local v22 = {
            ["_setStateBlockedReason"] = nil
        }
        if v_u_17.defaultProps == nil then
            v22.props = p20
        else
            v22.props = v_u_13(v_u_17.defaultProps, p20)
        end
        v22._context = {}
        if p21 then
            for v23, v24 in pairs(p21) do
                v22._context[v23] = v24
            end
        end
        local v25 = v_u_17
        setmetatable(v22, v25)
        if v_u_17.init then
            v22._setStateBlockedReason = "init"
            v_u_17.init(v22, p20)
            v22._setStateBlockedReason = nil
        end
        if not v22.state then
            v22.state = {}
        end
        local v26 = v_u_17.getDerivedStateFromProps and v_u_17.getDerivedStateFromProps(p20, v22.state)
        if v26 then
            v22.state = v_u_13(v22.state, v26)
        end
        return v22
    end
    return v_u_17
end
function v6.render(p27)
    local v28 = getmetatable(p27)
    local v29 = ("The component %q is missing the \'render\' method.\nrender must be defined when creating a Roact component!"):format((tostring(v28)))
    error(v29, 0)
end
function v6.shouldUpdate(_, _, _)
    return true
end
function v6.setState(p30, p31)
    if p30._setStateBlockedReason ~= nil then
        local v32 = v_u_5[p30._setStateBlockedReason]
        if v32 == nil then
            v32 = v_u_5.default
        end
        local v33 = string.format
        local v34 = getmetatable(p30)
        local v35 = v33(v32, (tostring(v34)))
        error(v35, 2)
    end
    if type(p31) == "function" then
        p31 = p31(p30.state, p30.props)
        if p31 == nil then
            return
        end
    end
    p30:_update(nil, (v_u_13(p30.state, p31)))
end
function v6.getElementTraceback(p36)
    return p36._handle._element.source
end
function v6._update(p37, p38, p39)
    p37._setStateBlockedReason = "shouldUpdate"
    local v40
    if v_u_3.getValue("componentInstrumentation") then
        local v41 = v_u_7()
        v40 = p37:shouldUpdate(p38 or p37.props, p39 or p37.state)
        local v42 = v_u_7() - v41
        v_u_4.logShouldUpdate(p37._handle, v40, v42)
    else
        v40 = p37:shouldUpdate(p38 or p37.props, p39 or p37.state)
    end
    p37._setStateBlockedReason = nil
    if v40 then
        p37:_forceUpdate(p38, p39)
    end
end
function v6._forceUpdate(p43, p44, p45)
    local v46 = getmetatable(p43)
    local v47
    if p44 then
        if v46.getDerivedStateFromProps then
            local v48 = v46.getDerivedStateFromProps(p44, p45 or p43.state)
            if v48 ~= nil then
                p45 = v_u_13(p45 or p43.state, v48)
            end
        end
        if v46.defaultProps then
            v47 = nil
            for v49 in pairs(v46.defaultProps) do
                if p44[v49] == nil then
                    v47 = v_u_13(v46.defaultProps, p44)
                    break
                end
            end
            if not v47 then
                v47 = p44
            end
        else
            v47 = p44
        end
    else
        v47 = p44
    end
    if p43.willUpdate then
        p43._setStateBlockedReason = "willUpdate"
        p43:willUpdate(v47 or p43.props, p45 or p43.state)
        p43._setStateBlockedReason = nil
    end
    local v50 = p43.props
    local v51 = p43.state
    if v47 then
        p43.props = v47
    end
    if p45 then
        p43.state = p45
    end
    p43._setStateBlockedReason = "render"
    local v52
    if v_u_3.getValue("componentInstrumentation") then
        local v53 = v_u_7()
        v52 = p43:render()
        local v54 = v_u_7() - v53
        v_u_4.logRenderTime(p43._handle, v54)
    else
        v52 = p43:render()
    end
    p43._setStateBlockedReason = nil
    p43._setStateBlockedReason = "reconcile"
    if p43._handle._child == nil then
        if v52 then
            p43._handle._child = v_u_1._mountInternal(v52, p43._handle._parent, p43._handle._key, p43._context)
        end
    else
        p43._handle._child = v_u_1._reconcileInternal(p43._handle._child, v52)
    end
    p43._setStateBlockedReason = nil
    if p43.didUpdate then
        p43:didUpdate(v50, v51)
    end
end
function v6._mount(p55, p56)
    p55._handle = p56
    p55._setStateBlockedReason = "render"
    local v57
    if v_u_3.getValue("componentInstrumentation") then
        local v58 = v_u_7()
        v57 = p55:render()
        local v59 = v_u_7() - v58
        v_u_4.logRenderTime(p55._handle, v59)
    else
        v57 = p55:render()
    end
    p55._setStateBlockedReason = nil
    if v57 then
        p55._setStateBlockedReason = "reconcile"
        p56._child = v_u_1._mountInternal(v57, p56._parent, p56._key, p55._context)
        p55._setStateBlockedReason = nil
    end
    if p55.didMount then
        p55:didMount()
    end
end
function v6._unmount(p60)
    local v61 = p60._handle
    if p60.willUnmount then
        p60._setStateBlockedReason = "willUnmount"
        p60:willUnmount()
        p60._setStateBlockedReason = nil
    end
    if v61._child then
        v_u_1.unmount(v61._child)
    end
    p60._handle = nil
end
return v6