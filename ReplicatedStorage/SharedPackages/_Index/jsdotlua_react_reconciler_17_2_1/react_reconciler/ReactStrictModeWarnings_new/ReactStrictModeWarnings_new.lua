--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactStrictModeWarnings.new (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local v_u_3 = v2.resetCurrentFiber
local v_u_4 = v2.setCurrentFiber
local v_u_5 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_6 = require(script.Parent:WaitForChild("ReactTypeOfMode")).StrictMode
local v7 = {
    ["recordUnsafeLifecycleWarnings"] = function(_, _) end,
    ["flushPendingUnsafeLifecycleWarnings"] = function() end,
    ["recordLegacyContextWarning"] = function(_, _) end,
    ["flushLegacyContextWarning"] = function() end,
    ["discardPendingWarnings"] = function() end
}
if _G.__DEV__ then
    local function v_u_11(p8)
        local v9 = {}
        for v10, _ in p8 do
            table.insert(v9, v10)
        end
        table.sort(v9)
        return table.concat(v9, ", ")
    end
    local v_u_12 = {}
    local v_u_13 = {}
    local v_u_14 = {}
    local v_u_15 = {}
    local v_u_16 = {}
    local v_u_17 = {}
    local v_u_18 = {}
    function v7.recordUnsafeLifecycleWarnings(p19, p20)
        if not v_u_18[p19.type] then
            local v21 = p20.componentWillMount
            if typeof(v21) == "function" then
                local v22 = v_u_12
                table.insert(v22, p19)
            end
            local v23 = p19.mode
            local v24 = v_u_6
            if bit32.band(v23, v24) ~= 0 then
                local v25 = p20.UNSAFE_componentWillMount
                if typeof(v25) == "function" then
                    local v26 = v_u_13
                    table.insert(v26, p19)
                end
            end
            local v27 = p20.componentWillReceiveProps
            if typeof(v27) == "function" then
                local v28 = v_u_14
                table.insert(v28, p19)
            end
            local v29 = p19.mode
            local v30 = v_u_6
            if bit32.band(v29, v30) ~= 0 then
                local v31 = p20.UNSAFE_componentWillReceiveProps
                if typeof(v31) == "function" then
                    local v32 = v_u_15
                    table.insert(v32, p19)
                end
            end
            local v33 = p20.componentWillUpdate
            if typeof(v33) == "function" then
                local v34 = v_u_16
                table.insert(v34, p19)
            end
            local v35 = p19.mode
            local v36 = v_u_6
            if bit32.band(v35, v36) ~= 0 then
                local v37 = p20.UNSAFE_componentWillUpdate
                if typeof(v37) == "function" then
                    local v38 = v_u_17
                    table.insert(v38, p19)
                end
            end
        end
    end
    function v7.flushPendingUnsafeLifecycleWarnings()
        local v39 = {}
        if #v_u_12 > 0 then
            for _, v40 in v_u_12 do
                v39[v_u_5(v40.type) or "Component"] = true
                v_u_18[v40.type] = true
            end
            table.clear(v_u_12)
        end
        local v41 = {}
        if #v_u_13 > 0 then
            for _, v42 in v_u_13 do
                v41[v_u_5(v42.type) or "Component"] = true
                v_u_18[v42.type] = true
            end
            table.clear(v_u_13)
        end
        local v43 = {}
        if #v_u_14 > 0 then
            for _, v44 in v_u_14 do
                v43[v_u_5(v44.type) or "Component"] = true
                v_u_18[v44.type] = true
            end
            table.clear(v_u_14)
        end
        local v45 = {}
        if #v_u_15 > 0 then
            for _, v46 in v_u_15 do
                v45[v_u_5(v46.type) or "Component"] = true
                v_u_18[v46.type] = true
            end
            table.clear(v_u_15)
        end
        local v47 = {}
        if #v_u_16 > 0 then
            for _, v48 in v_u_16 do
                v47[v_u_5(v48.type) or "Component"] = true
                v_u_18[v48.type] = true
            end
            table.clear(v_u_16)
        end
        local v49 = {}
        if #v_u_17 > 0 then
            for _, v50 in v_u_17 do
                v49[v_u_5(v50.type) or "Component"] = true
                v_u_18[v50.type] = true
            end
            table.clear(v_u_17)
        end
        if next(v41) ~= nil then
            local v51 = v_u_11(v41)
            v_u_1.error("Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n\nPlease update the following components: %s", v51)
        end
        if next(v45) ~= nil then
            local v52 = v_u_11(v45)
            v_u_1.error("Using UNSAFE_componentWillReceiveProps in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you\'re updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n\nPlease update the following components: %s", v52)
        end
        if next(v49) ~= nil then
            local v53 = v_u_11(v49)
            v_u_1.error("Using UNSAFE_componentWillUpdate in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n\nPlease update the following components: %s", v53)
        end
        if next(v39) ~= nil then
            local v54 = v_u_11(v39)
            v_u_1.warn("componentWillMount has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n* Rename componentWillMount to UNSAFE_componentWillMount to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v54)
        end
        if next(v43) ~= nil then
            local v55 = v_u_11(v43)
            v_u_1.warn("componentWillReceiveProps has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you\'re updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v55)
        end
        if next(v47) ~= nil then
            local v56 = v_u_11(v47)
            v_u_1.warn("componentWillUpdate has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v56)
        end
    end
    local v_u_57 = {}
    local v_u_58 = {}
    function v7.recordLegacyContextWarning(p59, p60)
        local v61 = p59
        local v62 = nil
        while p59 ~= nil do
            local v63 = p59.mode
            local v64 = v_u_6
            if bit32.band(v63, v64) ~= 0 then
                v62 = p59
            end
            p59 = p59.return_
        end
        if v62 == nil then
            v_u_1.error("Expected to find a StrictMode component in a strict mode tree. This error is likely caused by a bug in React. Please file an issue.")
            return
        end
        if v_u_58[v61.type] then
            return
        end
        local v65 = v_u_57[v62]
        local v66 = v61.type
        if typeof(v66) ~= "function" then
            if v61.type.contextTypes == nil and v61.type.childContextTypes == nil then
                if p60 ~= nil then
                    local v67 = p60.getChildContext
                    if typeof(v67) ~= "function" then
                        goto l11
                    end
                    goto l13
                end
            else
                ::l13::
                if v65 == nil then
                    v65 = {}
                    v_u_57[v62] = v65
                end
                table.insert(v65, v61)
            end
        end
        ::l11::
    end
    function v7.flushLegacyContextWarning()
        for _, v68 in v_u_57 do
            if #v68 == 0 then
                return
            end
            local v_u_69 = v68[1]
            local v70 = {}
            for _, v71 in v68 do
                v70[v_u_5(v71.type) or "Component"] = true
                v_u_58[v71.type] = true
            end
            local v_u_72 = v_u_11(v70)
            local v73, v74 = pcall(function()
                v_u_4(v_u_69)
                v_u_1.error("Legacy context API has been detected within a strict-mode tree.\n\nThe old API will be supported in all 16.x releases, but applications using it should migrate to the new version.\n\nPlease update the following components: %s\n\nLearn more about this warning here: https://reactjs.org/link/legacy-context", v_u_72)
            end)
            v_u_3()
            if not v73 then
                error(v74)
            end
        end
    end
    function v7.discardPendingWarnings()
        table.clear(v_u_12)
        table.clear(v_u_13)
        table.clear(v_u_14)
        table.clear(v_u_15)
        table.clear(v_u_16)
        table.clear(v_u_17)
        table.clear(v_u_57)
    end
end
return v7