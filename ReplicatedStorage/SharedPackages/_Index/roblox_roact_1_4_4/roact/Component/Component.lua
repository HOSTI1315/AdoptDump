--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component (ModuleScript)

local v_u_1 = require(script.Parent.assign)
local v_u_2 = require(script.Parent.ComponentLifecyclePhase)
local v_u_3 = require(script.Parent.Type)
local v4 = require(script.Parent.Symbol)
local v_u_5 = require(script.Parent.invalidSetStateMessages)
local v_u_6 = require(script.Parent.internalAssert)
local v_u_7 = require(script.Parent.GlobalConfig).get()
local v_u_8 = v4.named("InternalData")
local v_u_10 = {
    ["__tostring"] = function(p9)
        return p9.__componentName
    end
}
local v11 = {}
setmetatable(v11, v_u_10)
v11[v_u_3] = v_u_3.StatefulComponentClass
v11.__index = v11
v11.__componentName = "Component"
function v11.extend(p12, p13)
    if v_u_7.typeChecks then
        local v14 = v_u_3.of(p12) == v_u_3.StatefulComponentClass
        assert(v14, "Invalid `self` argument to `extend`.")
        local v15 = typeof(p13) == "string"
        assert(v15, "Component class name must be a string")
    end
    local v16 = {}
    for v17, v18 in pairs(p12) do
        if v17 ~= "extend" then
            v16[v17] = v18
        end
    end
    v16[v_u_3] = v_u_3.StatefulComponentClass
    v16.__index = v16
    v16.__componentName = p13
    local v19 = v_u_10
    setmetatable(v16, v19)
    return v16
end
function v11.__getDerivedState(p20, p21, p22)
    if v_u_7.internalTypeChecks then
        v_u_6(v_u_3.of(p20) == v_u_3.StatefulComponentInstance, "Invalid use of `__getDerivedState`")
    end
    local v23 = p20[v_u_8].componentClass
    if v23.getDerivedStateFromProps ~= nil then
        local v24 = v23.getDerivedStateFromProps(p21, p22)
        if v24 ~= nil then
            if v_u_7.typeChecks then
                local v25 = typeof(v24) == "table"
                assert(v25, "getDerivedStateFromProps must return a table!")
            end
            return v24
        end
    end
    return nil
end
function v11.setState(p26, p27)
    if v_u_7.typeChecks then
        local v28 = v_u_3.of(p26) == v_u_3.StatefulComponentInstance
        assert(v28, "Invalid `self` argument to `extend`.")
    end
    local v29 = p26[v_u_8]
    local v30 = v29.lifecyclePhase
    if v30 == v_u_2.ShouldUpdate or (v30 == v_u_2.WillUpdate or v30 == v_u_2.Render) then
        local v31 = v_u_5[v29.lifecyclePhase]
        local v32 = v29.componentClass
        local v33 = v31:format((tostring(v32)))
        error(v33, 2)
    elseif v30 == v_u_2.WillUnmount then
        return
    end
    local v34 = v29.pendingState
    local v35 = nil
    if typeof(p27) == "function" then
        v35 = p27(v34 or p26.state, p26.props)
        if v35 == nil then
            return
        end
    elseif typeof(p27) == "table" then
        v35 = p27
    else
        error("Invalid argument to setState, expected function or table", 2)
    end
    local v36
    if v34 == nil then
        v36 = v_u_1({}, p26.state, v35)
    else
        v36 = v_u_1(v34, v35)
    end
    if v30 == v_u_2.Init then
        p26.state = v_u_1(v36, (p26:__getDerivedState(p26.props, v36)))
        return
    elseif v30 == v_u_2.DidMount or (v30 == v_u_2.DidUpdate or v30 == v_u_2.ReconcileChildren) then
        v29.pendingState = v_u_1(v36, (p26:__getDerivedState(p26.props, v36)))
        return
    elseif v30 == v_u_2.Idle then
        p26:__update(nil, v36)
    else
        local v37 = v_u_5.default
        local v38 = v29.componentClass
        local v39 = v37:format((tostring(v38)))
        error(v39, 2)
    end
end
function v11.getElementTraceback(p40)
    return p40[v_u_8].virtualNode.currentElement.source
end
function v11.render(p41)
    local v42 = p41[v_u_8].componentClass
    local v43 = ("The component %q is missing the `render` method.\n`render` must be defined when creating a Roact component!"):format((tostring(v42)))
    error(v43, 0)
end
function v11.__getContext(p44, p45)
    if v_u_7.internalTypeChecks then
        v_u_6(v_u_3.of(p44) == v_u_3.StatefulComponentInstance, "Invalid use of `__getContext`")
        v_u_6(p45 ~= nil, "Context key cannot be nil")
    end
    return p44[v_u_8].virtualNode.context[p45]
end
function v11.__addContext(p46, p47, p48)
    if v_u_7.internalTypeChecks then
        v_u_6(v_u_3.of(p46) == v_u_3.StatefulComponentInstance, "Invalid use of `__addContext`")
    end
    local v49 = p46[v_u_8].virtualNode
    if v49.originalContext == nil then
        v49.originalContext = v49.context
    end
    v49.context = v_u_1({}, v49.context, {
        [p47] = p48
    })
end
function v11.__validateProps(p50, p51)
    if v_u_7.propValidation then
        local v52 = p50[v_u_8].componentClass.validateProps
        if v52 ~= nil then
            if typeof(v52) ~= "function" then
                error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(v52), p50.__componentName))
            end
            local v53, v54 = v52(p51)
            if not v53 then
                error(("Property validation failed in %s: %s\n\n%s"):format(p50.__componentName, tostring(v54 or "<Validator function did not supply a message>"), p50:getElementTraceback() or "<enable element tracebacks>"), 0)
            end
        end
    else
        return
    end
end
function v11.__mount(p55, p56, p57)
    if v_u_7.internalTypeChecks then
        v_u_6(v_u_3.of(p55) == v_u_3.StatefulComponentClass, "Invalid use of `__mount`")
        v_u_6(v_u_3.of(p57) == v_u_3.VirtualNode, "Expected arg #2 to be of type VirtualNode")
    end
    local v58 = p57.currentElement
    local v59 = p57.hostParent
    local v60 = {
        ["reconciler"] = p56,
        ["virtualNode"] = p57,
        ["componentClass"] = p55,
        ["lifecyclePhase"] = v_u_2.Init,
        ["pendingState"] = nil
    }
    local v61 = {
        [v_u_3] = v_u_3.StatefulComponentInstance,
        [v_u_8] = v60
    }
    setmetatable(v61, p55)
    p57.instance = v61
    local v62 = v58.props
    if p55.defaultProps ~= nil then
        v62 = v_u_1({}, p55.defaultProps, v62)
    end
    v61:__validateProps(v62)
    v61.props = v62
    v61._context = v_u_1({}, p57.legacyContext)
    v61.state = v_u_1({}, v61:__getDerivedState(v61.props, {}))
    if v61.init ~= nil then
        v61:init(v61.props)
        v_u_1(v61.state, v61:__getDerivedState(v61.props, v61.state))
    end
    p57.legacyContext = v61._context
    v60.lifecyclePhase = v_u_2.Render
    local v63 = v61:render()
    v60.lifecyclePhase = v_u_2.ReconcileChildren
    p56.updateVirtualNodeWithRenderResult(p57, v59, v63)
    if v61.didMount ~= nil then
        v60.lifecyclePhase = v_u_2.DidMount
        v61:didMount()
    end
    if v60.pendingState ~= nil then
        v61:__update(nil, nil)
    end
    v60.lifecyclePhase = v_u_2.Idle
end
function v11.__unmount(p64)
    if v_u_7.internalTypeChecks then
        v_u_6(v_u_3.of(p64) == v_u_3.StatefulComponentInstance, "Invalid use of `__unmount`")
    end
    local v65 = p64[v_u_8]
    local v66 = v65.virtualNode
    local v67 = v65.reconciler
    if p64.willUnmount ~= nil then
        v65.lifecyclePhase = v_u_2.WillUnmount
        p64:willUnmount()
    end
    for _, v68 in pairs(v66.children) do
        v67.unmountVirtualNode(v68)
    end
end
function v11.__update(p69, p70, p71)
    if v_u_7.internalTypeChecks then
        v_u_6(v_u_3.of(p69) == v_u_3.StatefulComponentInstance, "Invalid use of `__update`")
        v_u_6(v_u_3.of(p70) == v_u_3.Element and true or p70 == nil, "Expected arg #1 to be of type Element or nil")
        v_u_6(typeof(p71) == "table" and true or p71 == nil, "Expected arg #2 to be of type table or nil")
    end
    local v72 = p69[v_u_8]
    local v73 = v72.componentClass
    local v74 = p69.props
    if p70 ~= nil then
        v74 = p70.props
        if v73.defaultProps ~= nil then
            v74 = v_u_1({}, v73.defaultProps, v74)
        end
        p69:__validateProps(v74)
    end
    local v75 = 0
    while true do
        local v76
        if v72.pendingState == nil then
            v76 = nil
        else
            v76 = v72.pendingState
            v72.pendingState = nil
        end
        if p71 ~= nil or v74 ~= p69.props then
            if v76 == nil then
                v76 = p71 or p69.state
            else
                v76 = v_u_1(v76, p71)
            end
            local v77 = p69:__getDerivedState(v74, v76)
            if v77 ~= nil then
                v76 = v_u_1({}, v76, v77)
            end
            p71 = nil
        end
        if not p69:__resolveUpdate(v74, v76) then
            return false
        end
        v75 = v75 + 1
        if v75 > 100 then
            local v78 = error
            local v79 = v72.componentClass
            v78(("The component %q has reached the setState update recursion limit.\nWhen using `setState` in `didUpdate`, make sure that it won\'t repeat infinitely!"):format((tostring(v79))), 3)
        end
        if v72.pendingState == nil then
            return true
        end
    end
end
function v11.__resolveUpdate(p80, p81, p82)
    if v_u_7.internalTypeChecks then
        v_u_6(v_u_3.of(p80) == v_u_3.StatefulComponentInstance, "Invalid use of `__resolveUpdate`")
    end
    local v83 = p80[v_u_8]
    local v84 = v83.virtualNode
    local v85 = v83.reconciler
    local v86 = p80.props
    local v87 = p80.state
    if p81 == nil then
        p81 = v86
    end
    if p82 == nil then
        p82 = v87
    end
    if p80.shouldUpdate ~= nil then
        v83.lifecyclePhase = v_u_2.ShouldUpdate
        if not p80:shouldUpdate(p81, p82) then
            v83.lifecyclePhase = v_u_2.Idle
            return false
        end
    end
    if p80.willUpdate ~= nil then
        v83.lifecyclePhase = v_u_2.WillUpdate
        p80:willUpdate(p81, p82)
    end
    v83.lifecyclePhase = v_u_2.Render
    p80.props = p81
    p80.state = p82
    local v88 = v84.instance:render()
    v83.lifecyclePhase = v_u_2.ReconcileChildren
    v85.updateVirtualNodeWithRenderResult(v84, v84.hostParent, v88)
    if p80.didUpdate ~= nil then
        v83.lifecyclePhase = v_u_2.DidUpdate
        p80:didUpdate(v86, v87)
    end
    v83.lifecyclePhase = v_u_2.Idle
    return true
end
return v11