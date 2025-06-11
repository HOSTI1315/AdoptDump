--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberClassComponent.new (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v4 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v5 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
local v6 = require(script.Parent.Parent:WaitForChild("react"))
local v7 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_8 = v7.Update
local v_u_9 = v7.Snapshot
local v_u_10 = v7.MountLayoutDev
local v11 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_12 = v11.debugRenderPhaseSideEffectsForStrictMode
local v_u_13 = v11.disableLegacyContext
local v_u_14 = v11.enableDebugTracing
local v_u_15 = v11.enableSchedulingProfiler
local v_u_16 = v11.warnAboutDeprecatedLifecycles
local v_u_17 = v11.enableDoubleInvokingEffects
local v_u_18 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local v_u_19 = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).isMounted
local v20 = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap
local v_u_21 = v20.get
local v_u_22 = v20.set
local v_u_23 = require(script.Parent.Parent:WaitForChild("shared")).shallowEqual
local v_u_24 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_25 = require(script.Parent.Parent:WaitForChild("shared")).UninitializedState
local v_u_26 = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v27 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v_u_28 = v27.REACT_CONTEXT_TYPE
local v_u_29 = v27.REACT_PROVIDER_TYPE
local v_u_30 = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local v31 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local v_u_32 = v31.DebugTracingMode
local v_u_33 = v31.StrictMode
local v_u_34 = v5.enqueueUpdate
local v_u_35 = v5.processUpdateQueue
local v_u_36 = v5.checkHasForceUpdateAfterProcessing
local v_u_37 = v5.resetHasForceUpdateBeforeProcessing
local v_u_38 = v5.createUpdate
local v_u_39 = v5.ReplaceState
local v_u_40 = v5.ForceUpdate
local v_u_41 = v5.initializeUpdateQueue
local v_u_42 = v5.cloneUpdateQueue
local v_u_43 = v4.NoLanes
local v44 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local v_u_45 = v44.cacheContext
local v_u_46 = v44.getMaskedContext
local v_u_47 = v44.getUnmaskedContext
local v_u_48 = v44.hasContextChanged
local v_u_49 = v44.emptyContextObject
local v_u_50 = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).readContext
local v51 = require(script.Parent:WaitForChild("DebugTracing"))
local v_u_52 = v51.logForceUpdateScheduled
local v_u_53 = v51.logStateUpdateScheduled
local v54 = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local v_u_55 = v54.disableLogs
local v_u_56 = v54.reenableLogs
local v57 = require(script.Parent:WaitForChild("SchedulingProfiler"))
local v_u_58 = v57.markForceUpdateScheduled
local v_u_59 = v57.markStateUpdateScheduled
local v_u_60 = {}
local v_u_61 = v6.Component:extend("").__refs
local v_u_62, v_u_63, v_u_64, v_u_65, v_u_66, v_u_67, v_u_68, v_u_69, v_u_70
if v_u_1 then
    local v_u_71 = {}
    v_u_62 = {}
    v_u_63 = {}
    v_u_64 = function(p72, p73)
        if p72 ~= nil and type(p72) ~= "function" then
            local v74 = p73 .. "_" .. tostring(p72)
            if not v_u_71[v74] then
                v_u_71[v74] = true
                v_u_3.error("%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", p73, (tostring(p72)))
            end
        end
    end
    v_u_65 = {}
    v_u_66 = function(_, _) end
    v_u_67 = {}
    v_u_68 = {}
    v_u_69 = {}
    v_u_70 = {}
else
    v_u_62 = nil
    v_u_63 = nil
    v_u_64 = nil
    v_u_65 = nil
    v_u_66 = nil
    v_u_67 = nil
    v_u_68 = nil
    v_u_69 = nil
    v_u_70 = nil
end
local function v_u_85(p75, p76, p77, p78)
    local v79 = p75.memoizedState
    if v_u_1 and v_u_12 then
        local v80 = p75.mode
        local v81 = v_u_33
        if bit32.band(v80, v81) ~= 0 then
            v_u_55()
            local v82, v83 = xpcall(p77, v_u_26, p78, v79)
            v_u_56()
            if not v82 then
                error(v83)
            end
        end
    end
    local v84 = p77(p78, v79)
    if v_u_1 then
        v_u_66(p76, v84)
    end
    if v84 ~= nil then
        v79 = v_u_2.assign({}, v79, v84)
    end
    p75.memoizedState = v79
    if p75.lanes == v_u_43 then
        p75.updateQueue.baseState = v79
    end
end
local v_u_86 = nil
local function v_u_117()
    local v87 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    local v_u_88 = v87.requestEventTime
    local v_u_89 = v87.requestUpdateLane
    local v_u_90 = v87.scheduleUpdateOnFiber
    v_u_86 = {
        ["isMounted"] = v_u_19,
        ["enqueueSetState"] = function(p91, p92, p93)
            local v94 = v_u_21(p91)
            local v95 = v_u_88()
            local v96 = v_u_89(v94)
            local v97 = v_u_38(v95, v96, p92, p93)
            if p93 ~= nil and v_u_1 then
                v_u_64(p93, "setState")
            end
            v_u_34(v94, v97)
            v_u_90(v94, v96, v95)
            if v_u_1 and v_u_14 then
                local v98 = v94.mode
                local v99 = v_u_32
                if bit32.band(v98, v99) ~= 0 then
                    v_u_53(v_u_24(v94.type) or "Unknown", v96, p92)
                end
            end
            if v_u_15 then
                v_u_59(v94, v96)
            end
        end,
        ["enqueueReplaceState"] = function(p100, p101, p102)
            local v103 = v_u_21(p100)
            local v104 = v_u_88()
            local v105 = v_u_89(v103)
            local v106 = v_u_38(v104, v105, p101, p102)
            v106.tag = v_u_39
            if p102 ~= nil and v_u_1 then
                v_u_64(p102, "replaceState")
            end
            v_u_34(v103, v106)
            v_u_90(v103, v105, v104)
            if v_u_1 and v_u_14 then
                local v107 = v103.mode
                local v108 = v_u_32
                if bit32.band(v107, v108) ~= 0 then
                    v_u_53(v_u_24(v103.type) or "Unknown", v105, p101)
                end
            end
            if v_u_15 then
                v_u_59(v103, v105)
            end
        end,
        ["enqueueForceUpdate"] = function(p109, p110)
            local v111 = v_u_21(p109)
            local v112 = v_u_88()
            local v113 = v_u_89(v111)
            local v114 = v_u_38(v112, v113, nil, p110)
            v114.tag = v_u_40
            if p110 ~= nil and v_u_1 then
                v_u_64(p110, "forceUpdate")
            end
            v_u_34(v111, v114)
            v_u_90(v111, v113, v112)
            if v_u_1 and v_u_14 then
                local v115 = v111.mode
                local v116 = v_u_32
                if bit32.band(v115, v116) ~= 0 then
                    v_u_52(v_u_24(v111.type) or "Unknown", v113)
                end
            end
            if v_u_15 then
                v_u_58(v111, v113)
            end
        end
    }
end
function checkShouldComponentUpdate(p118, p119, p120, p121, p122, p123, p124)
    local v125 = p118.stateNode
    if v125.shouldComponentUpdate ~= nil then
        local v126 = v125.shouldComponentUpdate
        if type(v126) == "function" then
            if v_u_1 and v_u_12 then
                local v127 = p118.mode
                local v128 = v_u_33
                if bit32.band(v127, v128) ~= 0 then
                    v_u_55()
                    local v129, v130 = xpcall(v125.shouldComponentUpdate, v_u_26, v125, p121, p123, p124)
                    v_u_56()
                    if not v129 then
                        error(v130)
                    end
                end
            end
            local v131 = v125:shouldComponentUpdate(p121, p123, p124)
            if v_u_1 and v131 == nil then
                v_u_3.error("%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.", v_u_24(p119) or "Component")
            end
            return v131
        end
    end
    return (type(p119) ~= "table" or not p119.isPureReactComponent) and true or not (v_u_23(p120, p121) and v_u_23(p122, p123))
end
local function v_u_149(p132, p133, p134)
    local v135 = p132.stateNode
    if v_u_1 then
        local v136 = v_u_24(p133) or "Component"
        if not v135.render then
            local v137 = p133.render
            if type(v137) == "function" then
                v_u_3.error("%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?", v136)
            else
                v_u_3.error("%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.", v136)
            end
        end
        if v135.getInitialState and not (v135.getInitialState.isReactClassApproved or v135.state) then
            v_u_3.error("getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?", v136)
        end
        if v135.getDefaultProps and not v135.getDefaultProps.isReactClassApproved then
            v_u_3.error("getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.", v136)
        end
        if v135.propTypes and not p133.propTypes then
            v_u_3.error("propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.", v136)
        end
        if v135.contextType and not p133.contextType then
            v_u_3.error("contextType was defined as an instance property on %s. Use a static property to define contextType instead.", v136)
        end
        if v_u_13 then
            if p133.childContextTypes then
                v_u_3.error("%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.", v136)
            end
            if p133.contextTypes then
                v_u_3.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.", v136)
            end
        else
            if v135.contextTypes and not p133.contextTypes then
                v_u_3.error("contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.", v136)
            end
            if type(p133) == "table" and (p133.contextType and (p133.contextTypes and not v_u_63[p133])) then
                v_u_63[p133] = true
                v_u_3.error("%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.", v136)
            end
        end
        local v138 = v135.componentShouldUpdate
        if type(v138) == "function" then
            v_u_3.error("%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.", v136)
        end
        if type(p133) == "table" and (p133.isPureReactComponent and v135.shouldComponentUpdate ~= nil) then
            v_u_3.error("%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.", v_u_24(p133) or "A pure component")
        end
        local v139 = v135.componentDidUnmount
        if type(v139) == "function" then
            v_u_3.error("%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?", v136)
        end
        local v140 = v135.componentDidReceiveProps
        if type(v140) == "function" then
            v_u_3.error("%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().", v136)
        end
        local v141 = v135.componentWillRecieveProps
        if type(v141) == "function" then
            v_u_3.error("%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v136)
        end
        local v142 = v135.UNSAFE_componentWillRecieveProps
        if type(v142) == "function" then
            v_u_3.error("%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v136)
        end
        local v143 = v135.props ~= p134
        if v135.props ~= nil and v143 then
            v_u_3.error("%s(...): When calling super() in `%s`, make sure to pass up the same props that your component\'s constructor was passed.", v136, v136)
        end
        if rawget(v135, "defaultProps") then
            v_u_3.error("Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.", v136, v136)
        end
        local v144 = v135.getSnapshotBeforeUpdate
        if type(v144) == "function" then
            local v145 = v135.componentDidUpdate
            if type(v145) ~= "function" and not v_u_67[p133] then
                v_u_67[p133] = true
                v_u_3.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.", v_u_24(p133))
            end
        end
        local v146 = v135.state
        if v146 ~= nil and type(v146) ~= "table" then
            v_u_3.error("%s.state: must be set to an object or nil", v136)
        end
        if type(p133) == "table" then
            local v147 = v135.getChildContext
            if type(v147) == "function" then
                local v148 = p133.childContextTypes
                if type(v148) ~= "table" then
                    v_u_3.error("%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().", v136)
                end
            end
        end
    end
end
local function v152(p150, p151)
    if v_u_86 == nil then
        v_u_117()
    end
    p151.__updater = v_u_86
    p150.stateNode = p151
    v_u_22(p151, p150)
    if v_u_1 then
        p151._reactInternalInstance = v_u_60
    end
end
local function v193(p153, p154, p155)
    local v156 = false
    local v157 = v_u_49
    local v158 = v_u_49
    local v159 = p154.contextType
    if v_u_1 and p154.contextType ~= nil then
        local v160
        if v159 == nil then
            v160 = true
        elseif v159["$$typeof"] == v_u_28 then
            v160 = v159._context == nil
        else
            v160 = false
        end
        if not (v160 or v_u_70[p154]) then
            v_u_70[p154] = true
            local v161 = ""
            local v162
            if v159 == nil then
                v162 = " However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file."
            elseif type(v159) == "table" then
                if v159["$$typeof"] == v_u_29 then
                    v162 = " Did you accidentally pass the Context.Provider instead?"
                elseif v159._context == nil then
                    local v163 = v161 .. " However, it is set to an object with keys {"
                    for v164, _ in v159 do
                        v163 = v163 .. v164 .. ", "
                    end
                    v162 = v163 .. "}."
                else
                    v162 = " Did you accidentally pass the Context.Consumer instead?"
                end
            else
                v162 = " However, it is set to a " .. type(v159) .. "."
            end
            v_u_3.error("%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s", v_u_24(p154) or "Component", v162)
        end
    end
    if v159 == nil or type(v159) ~= "table" then
        if not v_u_13 then
            v157 = v_u_47(p153, p154, true)
            v156 = p154.contextTypes ~= nil
            v158 = v156 and v_u_46(p153, v157) or v_u_49
        end
    else
        v158 = v_u_50(v159)
    end
    if v_u_1 and v_u_12 then
        local v165 = p153.mode
        local v166 = v_u_33
        if bit32.band(v165, v166) ~= 0 then
            v_u_55()
            local v167, v168 = xpcall(p154.__ctor, v_u_26, p155, v158)
            v_u_56()
            if not v167 then
                error(v168)
            end
        end
    end
    local v169 = p154.__ctor(p155, v158)
    p153.memoizedState = v169.state
    local v170 = p153.memoizedState
    if v_u_86 == nil then
        v_u_117()
    end
    v169.__updater = v_u_86
    p153.stateNode = v169
    v_u_22(v169, p153)
    if v_u_1 then
        v169._reactInternalInstance = v_u_60
    end
    if v_u_1 then
        local v171 = p154.getDerivedStateFromProps
        if type(v171) == "function" and v170 == v_u_25 then
            local v172 = v_u_24(p154) or "Component"
            if not v_u_69[v172] then
                v_u_69[v172] = true
                v_u_3.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", v172, v172)
            end
        end
        local v173 = p154.getDerivedStateFromProps
        if type(v173) ~= "function" then
            local v174 = v169.getSnapshotBeforeUpdate
            if type(v174) ~= "function" then
                goto l44
            end
        end
        local v175 = nil
        local v176 = nil
        local v177 = nil
        local v178 = v169.componentWillMount
        local v179
        if type(v178) == "function" then
            v179 = "componentWillMount"
        else
            local v180 = v169.UNSAFE_componentWillMount
            v179 = type(v180) == "function" and "UNSAFE_componentWillMount" or v175
        end
        local v181 = v169.componentWillReceiveProps
        local v182
        if type(v181) == "function" then
            v182 = "componentWillReceiveProps"
        else
            local v183 = v169.UNSAFE_componentWillReceiveProps
            v182 = type(v183) == "function" and "UNSAFE_componentWillReceiveProps" or v176
        end
        local v184 = v169.componentWillUpdate
        local v185
        if type(v184) == "function" then
            v185 = "componentWillUpdate"
        else
            local v186 = v169.UNSAFE_componentWillUpdate
            v185 = type(v186) == "function" and "UNSAFE_componentWillUpdate" or v177
        end
        if v179 ~= nil or (v182 ~= nil or v185 ~= nil) then
            local v187 = v_u_24(p154) or "Component"
            local v188 = p154.getDerivedStateFromProps
            local v189 = type(v188) == "function" and "getDerivedStateFromProps()" or "getSnapshotBeforeUpdate()"
            local v190 = v179 == nil and "" or "\n  " .. tostring(v179)
            local v191 = v182 == nil and "" or "\n  " .. tostring(v182)
            local v192 = v185 == nil and "" or "\n  " .. tostring(v185)
            if not v_u_62[v187] then
                v_u_62[v187] = true
                v_u_3.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles", v187, v189, v190, v191, v192)
            end
        end
        goto l44
    else
        ::l44::
        if v156 then
            v_u_45(p153, v157, v158)
        end
        return v169
    end
end
local function v_u_199(p194, p195)
    local v196 = p195.state
    if p195.componentWillMount ~= nil then
        local v197 = p195.componentWillMount
        if type(v197) == "function" then
            p195:componentWillMount()
        end
    end
    if p195.UNSAFE_componentWillMount ~= nil then
        local v198 = p195.UNSAFE_componentWillMount
        if type(v198) == "function" then
            p195:UNSAFE_componentWillMount()
        end
    end
    if v196 ~= p195.state then
        if v_u_1 then
            v_u_3.error("%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component\'s constructor). Use setState instead.", v_u_24(p194.type) or "Component")
        end
        if v_u_86 == nil then
            v_u_117()
        end
        v_u_86.enqueueReplaceState(p195, p195.state)
    end
end
function callComponentWillReceiveProps(p200, p201, p202, p203)
    local v204 = p201.state
    if p201.componentWillReceiveProps ~= nil then
        local v205 = p201.componentWillReceiveProps
        if type(v205) == "function" then
            p201:componentWillReceiveProps(p202, p203)
        end
    end
    if p201.UNSAFE_componentWillReceiveProps ~= nil then
        local v206 = p201.UNSAFE_componentWillReceiveProps
        if type(v206) == "function" then
            p201:UNSAFE_componentWillReceiveProps(p202, p203)
        end
    end
    if p201.state ~= v204 then
        if v_u_1 then
            local v207 = v_u_24(p200.type) or "Component"
            if not v_u_65[v207] then
                v_u_65[v207] = true
                v_u_3.error("%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component\'s constructor). Use setState instead.", v207)
            end
        end
        if v_u_86 == nil then
            v_u_117()
        end
        v_u_86.enqueueReplaceState(p201, p201.state)
    end
end
local function v230(p208, p209, p210, p211)
    if v_u_1 then
        v_u_149(p208, p209, p210)
    end
    local v212 = p208.stateNode
    v212.props = p210
    v212.state = p208.memoizedState
    v212.__refs = v_u_61
    v_u_41(p208)
    local v213
    if type(p209) == "table" then
        v213 = p209.contextType
    else
        v213 = nil
    end
    if v213 == nil or type(v213) ~= "table" then
        if v_u_13 then
            v212.context = v_u_49
        else
            v212.context = v_u_46(p208, (v_u_47(p208, p209, true)))
        end
    else
        v212.context = v_u_50(v213)
    end
    if v_u_1 then
        if v212.state == p210 then
            local v214 = v_u_24(p209) or "Component"
            if not v_u_68[v214] then
                v_u_68[v214] = true
                v_u_3.error("%s: It is not recommended to assign props directly to state because updates to props won\'t be reflected in state. In most cases, it is better to use props directly.", v214)
            end
        end
        local v215 = p208.mode
        local v216 = v_u_33
        if bit32.band(v215, v216) ~= 0 then
            v_u_18.recordLegacyContextWarning(p208, v212)
        end
        if v_u_16 then
            v_u_18.recordUnsafeLifecycleWarnings(p208, v212)
        end
    end
    v_u_35(p208, p210, v212, p211)
    v212.state = p208.memoizedState
    local v217 = type(p209)
    local v218
    if type(p209) == "table" then
        v218 = p209.getDerivedStateFromProps
    else
        v218 = nil
    end
    if v218 ~= nil and type(v218) == "function" then
        v_u_85(p208, p209, v218, p210)
        v212.state = p208.memoizedState
    end
    if v217 == "table" then
        local v219 = p209.getDerivedStateFromProps
        if type(v219) ~= "function" then
            local v220 = v212.getSnapshotBeforeUpdate
            if type(v220) ~= "function" then
                local v221 = v212.UNSAFE_componentWillMount
                if type(v221) ~= "function" then
                    local v222 = v212.componentWillMount
                    if type(v222) ~= "function" then
                        goto l25
                    end
                end
                v_u_199(p208, v212)
                v_u_35(p208, p210, v212, p211)
                v212.state = p208.memoizedState
                goto l25
            end
        end
    end
    ::l25::
    local v223 = v212.componentDidMount
    if type(v223) == "function" then
        if v_u_1 and v_u_17 then
            local v224 = p208.flags
            local v225 = v_u_10
            local v226 = v_u_8
            local v227 = bit32.bor(v225, v226)
            p208.flags = bit32.bor(v224, v227)
            return
        end
        local v228 = p208.flags
        local v229 = v_u_8
        p208.flags = bit32.bor(v228, v229)
    end
end
function resumeMountClassInstance(p231, p232, p233, p234)
    local v235 = p231.stateNode
    local v236 = p231.memoizedProps
    v235.props = v236
    local v237 = v235.context
    local v238 = p232.contextType
    local v239 = v_u_49
    if v238 == nil or type(v238) ~= "table" then
        if not v_u_13 then
            v239 = v_u_46(p231, (v_u_47(p231, p232, true)))
        end
    else
        v239 = v_u_50(v238)
    end
    local v240 = p232.getDerivedStateFromProps
    local v241
    if type(v240) == "function" then
        v241 = true
    else
        local v242 = v235.getSnapshotBeforeUpdate
        v241 = type(v242) == "function"
    end
    if v241 then
        ::l11::
        v_u_37()
        local v243 = p231.memoizedState
        v235.state = v243
        v_u_35(p231, p233, v235, p234)
        local v244 = p231.memoizedState
        if v236 == p233 and (v243 == v244 and not (v_u_48() or v_u_36())) then
            local v245 = v235.componentDidMount
            if type(v245) == "function" then
                if v_u_1 and v_u_17 then
                    local v246 = p231.flags
                    local v247 = v_u_10
                    local v248 = v_u_8
                    p231.flags = bit32.bor(v246, v247, v248)
                else
                    local v249 = p231.flags
                    local v250 = v_u_8
                    p231.flags = bit32.bor(v249, v250)
                end
            end
            return false
        end
        if v240 ~= nil and type(v240) == "function" then
            v_u_85(p231, p232, v240, p233)
            v244 = p231.memoizedState
        end
        local v251 = v_u_36() or checkShouldComponentUpdate(p231, p232, v236, p233, v243, v244, v239)
        if not v251 then
            local v252 = v235.componentDidMount
            if type(v252) == "function" then
                if v_u_1 and v_u_17 then
                    local v253 = p231.flags
                    local v254 = v_u_10
                    local v255 = v_u_8
                    p231.flags = bit32.bor(v253, v254, v255)
                else
                    local v256 = p231.flags
                    local v257 = v_u_8
                    p231.flags = bit32.bor(v256, v257)
                end
            end
            p231.memoizedProps = p233
            p231.memoizedState = v244
            goto l41
        end
        if v241 then
            ::l34::
            local v258 = v235.componentDidMount
            if type(v258) == "function" then
                if v_u_1 and v_u_17 then
                    local v259 = p231.flags
                    local v260 = v_u_10
                    local v261 = v_u_8
                    p231.flags = bit32.bor(v259, v260, v261)
                else
                    local v262 = p231.flags
                    local v263 = v_u_8
                    p231.flags = bit32.bor(v262, v263)
                end
            end
            ::l41::
            v235.props = p233
            v235.state = v244
            v235.context = v239
            return v251
        else
            local v264 = v235.UNSAFE_componentWillMount
            if type(v264) ~= "function" then
                local v265 = v235.componentWillMount
                if type(v265) ~= "function" then
                    goto l34
                end
            end
            local v266 = v235.componentWillMount
            if type(v266) == "function" then
                v235:componentWillMount()
            end
            local v267 = v235.UNSAFE_componentWillMount
            if type(v267) == "function" then
                v235:UNSAFE_componentWillMount()
            end
            goto l34
        end
    else
        local v268 = v235.UNSAFE_componentWillReceiveProps
        if type(v268) ~= "function" then
            local v269 = v235.componentWillReceiveProps
            if type(v269) ~= "function" then
                goto l11
            end
        end
        if v236 ~= p233 or v237 ~= v239 then
            callComponentWillReceiveProps(p231, v235, p233, v239)
        end
        goto l11
    end
end
return {
    ["adoptClassInstance"] = v152,
    ["constructClassInstance"] = v193,
    ["mountClassInstance"] = v230,
    ["resumeMountClassInstance"] = resumeMountClassInstance,
    ["updateClassInstance"] = function(p270, p271, p272, p273, p274)
        local v275 = p271.stateNode
        v_u_42(p270, p271)
        local v276 = p271.memoizedProps
        local v277
        if p271.type == p271.elementType then
            v277 = v276
        else
            v277 = v_u_30(p271.type, v276)
        end
        v275.props = v277
        local v278 = p271.pendingProps
        local v279 = v275.context
        local v280, v281
        if type(p272) == "table" then
            v280 = p272.contextType
            v281 = p272.getDerivedStateFromProps
        else
            v280 = nil
            v281 = nil
        end
        local v282 = v_u_49
        if type(v280) == "table" then
            v282 = v_u_50(v280)
        elseif not v_u_13 then
            v282 = v_u_46(p271, (v_u_47(p271, p272, true)))
        end
        local v283
        if v281 == nil or type(v281) ~= "function" then
            if v275.getSnapshotBeforeUpdate == nil then
                v283 = false
            else
                local v284 = v275.getSnapshotBeforeUpdate
                v283 = type(v284) == "function"
            end
        else
            v283 = true
        end
        if not v283 then
            if v275.UNSAFE_componentWillReceiveProps ~= nil then
                local v285 = v275.UNSAFE_componentWillReceiveProps
                if type(v285) == "function" then
                    ::l20::
                    if v276 ~= v278 or v279 ~= v282 then
                        callComponentWillReceiveProps(p271, v275, p273, v282)
                    end
                    goto l17
                end
            end
            if v275.componentWillReceiveProps ~= nil then
                local v286 = v275.componentWillReceiveProps
                if type(v286) ~= "function" then
                    goto l17
                end
                goto l20
            end
        end
        ::l17::
        v_u_37()
        local v287 = p271.memoizedState
        v275.state = v287
        local _ = v275.state
        v_u_35(p271, p273, v275, p274)
        local v288 = p271.memoizedState
        if v276 == v278 and (v287 == v288 and not (v_u_48() or v_u_36())) then
            if v275.componentDidUpdate ~= nil then
                local v289 = v275.componentDidUpdate
                if type(v289) == "function" and (v276 ~= p270.memoizedProps or v287 ~= p270.memoizedState) then
                    local v290 = p271.flags
                    local v291 = v_u_8
                    p271.flags = bit32.bor(v290, v291)
                end
            end
            if v275.getSnapshotBeforeUpdate ~= nil then
                local v292 = v275.getSnapshotBeforeUpdate
                if type(v292) == "function" and (v276 ~= p270.memoizedProps or v287 ~= p270.memoizedState) then
                    local v293 = p271.flags
                    local v294 = v_u_9
                    p271.flags = bit32.bor(v293, v294)
                end
            end
            return false
        end
        if v281 ~= nil and type(v281) == "function" then
            v_u_85(p271, p272, v281, p273)
            v288 = p271.memoizedState
        end
        local v295 = v_u_36() or checkShouldComponentUpdate(p271, p272, v277, p273, v287, v288, v282)
        if not v295 then
            if v275.componentDidUpdate ~= nil then
                local v296 = v275.componentDidUpdate
                if type(v296) == "function" and (v276 ~= p270.memoizedProps or v287 ~= p270.memoizedState) then
                    local v297 = p271.flags
                    local v298 = v_u_8
                    p271.flags = bit32.bor(v297, v298)
                end
            end
            if v275.getSnapshotBeforeUpdate ~= nil then
                local v299 = v275.getSnapshotBeforeUpdate
                if type(v299) == "function" and (v276 ~= p270.memoizedProps or v287 ~= p270.memoizedState) then
                    local v300 = p271.flags
                    local v301 = v_u_9
                    p271.flags = bit32.bor(v300, v301)
                end
            end
            p271.memoizedProps = p273
            p271.memoizedState = v288
            goto l61
        end
        if not v283 then
            if v275.UNSAFE_componentWillUpdate ~= nil then
                local v302 = v275.UNSAFE_componentWillUpdate
                if type(v302) == "function" then
                    ::l50::
                    if v275.componentWillUpdate ~= nil then
                        local v303 = v275.componentWillUpdate
                        if type(v303) == "function" then
                            v275:componentWillUpdate(p273, v288, v282)
                        end
                    end
                    if v275.UNSAFE_componentWillUpdate ~= nil then
                        local v304 = v275.UNSAFE_componentWillUpdate
                        if type(v304) == "function" then
                            v275:UNSAFE_componentWillUpdate(p273, v288, v282)
                        end
                    end
                    goto l47
                end
            end
            if v275.componentWillUpdate ~= nil then
                local v305 = v275.componentWillUpdate
                if type(v305) ~= "function" then
                    goto l47
                end
                goto l50
            end
        end
        ::l47::
        if v275.componentDidUpdate ~= nil then
            local v306 = v275.componentDidUpdate
            if type(v306) == "function" then
                local v307 = p271.flags
                local v308 = v_u_8
                p271.flags = bit32.bor(v307, v308)
            end
        end
        if v275.getSnapshotBeforeUpdate ~= nil then
            local v309 = v275.getSnapshotBeforeUpdate
            if type(v309) == "function" then
                local v310 = p271.flags
                local v311 = v_u_9
                p271.flags = bit32.bor(v310, v311)
            end
        end
        ::l61::
        v275.props = p273
        v275.state = v288
        v275.context = v282
        return v295
    end,
    ["applyDerivedStateFromProps"] = v_u_85,
    ["emptyRefsObject"] = v_u_61
}