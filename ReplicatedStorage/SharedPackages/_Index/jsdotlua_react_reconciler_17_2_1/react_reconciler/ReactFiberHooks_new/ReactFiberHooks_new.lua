--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHooks.new (ModuleScript)

local v_u_1 = _G.__DEV__
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_3 = v2.Array
local v_u_4 = v2.Error
local v_u_5 = v2.Object
local v_u_6 = require(script.Parent.Parent:WaitForChild("react")).createRef
local v_u_7 = require(script.Parent.Parent:WaitForChild("react")).createBinding
local v_u_8 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v9 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v10 = require(script.Parent:WaitForChild("ReactHookEffectTags"))
local v11 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals
local v12 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_13 = v12.enableDebugTracing
local v_u_14 = v12.enableSchedulingProfiler
local v15 = v12.enableNewReconciler
local v_u_16 = v12.enableDoubleInvokingEffects
local v_u_17 = require(script.Parent:WaitForChild("ReactTypeOfMode")).DebugTracingMode
local v_u_18 = v9.NoLane
local v_u_19 = v9.NoLanes
local v_u_20 = v9.isSubsetOfLanes
local v_u_21 = v9.mergeLanes
local v_u_22 = v9.removeLanes
local v_u_23 = v9.markRootEntangled
local v_u_24 = v9.markRootMutableRead
local v_u_25 = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).readContext
local v26 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_27 = v26.Update
local v_u_28 = v26.Passive
local v_u_29 = v26.PassiveStatic
local v_u_30 = v26.MountLayoutDev
local v_u_31 = v26.MountPassiveDev
local v_u_32 = v10.HasEffect
local v_u_33 = v10.Layout
local v_u_34 = v10.Passive
local v35 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local v_u_36 = v35.warnIfNotCurrentlyActingUpdatesInDEV
local v_u_37 = v35.scheduleUpdateOnFiber
local v_u_38 = v35.warnIfNotScopedWithMatchingAct
local v_u_39 = v35.requestEventTime
local v_u_40 = v35.requestUpdateLane
local v_u_41 = v35.markSkippedUpdateLanes
local v_u_42 = v35.getWorkInProgressRoot
local v_u_43 = v35.warnIfNotCurrentlyActingEffectsInDEV
local v_u_44 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_45 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_46 = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).markWorkInProgressReceivedUpdate
local v_u_47 = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new")).getIsHydrating
local v_u_48 = require(script.Parent:WaitForChild("ReactFiberHostConfig")).makeClientId
local v49 = require(script.Parent:WaitForChild("ReactMutableSource.new"))
local v_u_50 = v49.warnAboutMultipleRenderersDEV
local v_u_51 = v49.getWorkInProgressVersion
local v_u_52 = v49.setWorkInProgressVersion
local v_u_53 = v49.markSourceAsDirty
local v_u_54 = require(script.Parent:WaitForChild("DebugTracing")).logStateUpdateScheduled
local v_u_55 = require(script.Parent:WaitForChild("SchedulingProfiler")).markStateUpdateScheduled
local v_u_56 = v11.ReactCurrentDispatcher
local v_u_57 = v_u_1 and {} or nil
local v_u_58 = {}
local v_u_59 = v_u_19
local v_u_60 = nil
local v_u_61 = nil
local v_u_62 = nil
local v_u_63 = false
local v_u_64 = false
local v_u_65 = nil
local v_u_66 = nil
local v_u_67 = 0
local v_u_68 = nil
local v_u_69 = nil
local v_u_70 = nil
local v_u_71 = nil
local v_u_72 = nil
local v_u_73 = nil
local v_u_74 = nil
function updateHookTypesDev()
    if v_u_1 then
        local v75 = v_u_65
        if v_u_66 ~= nil then
            v_u_67 = v_u_67 + 1
            if v_u_66[v_u_67] ~= v75 then
                warnOnHookMismatchInDev(v75)
            end
        end
    end
end
function warnOnHookMismatchInDev(p76)
    if v_u_1 then
        local v77 = v_u_45(v_u_60.type) or "Component"
        if not v_u_57[v77] then
            v_u_57[v77] = true
            if v_u_66 ~= nil then
                local v78 = ""
                for v79 = 1, v_u_67 do
                    local v80 = v_u_66[v79]
                    local v81
                    if v79 == v_u_67 then
                        v81 = p76
                    else
                        v81 = v80
                    end
                    local v82 = tostring(v79) .. ". " .. (v80 or "undefined")
                    while string.len(v82) < 30 do
                        v82 = v82 .. " "
                    end
                    v78 = v78 .. v82 .. v81 .. "\n"
                end
                v_u_8.error("React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n   Previous render            Next render\n   ------------------------------------------------------\n%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v77, v78)
            end
        end
    end
end
local function v83()
    error(v_u_4.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."))
end
local function v_u_94(p84, p85)
    if p85 == nil then
        if v_u_1 then
            v_u_8.error("%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.", v_u_65)
        end
        return false
    end
    local v86 = 0
    for v87, _ in p84 do
        if v86 < v87 then
            v86 = v87
        end
    end
    local v88 = 0
    for v89, _ in p85 do
        if v88 < v89 then
            v88 = v89
        end
    end
    if v86 ~= v88 then
        return false
    end
    for v90 = 1, math.min(v88, v86) do
        local v91 = p84[v90]
        local v92 = p85[v90]
        local v93
        if v91 == v92 and (v91 ~= 0 or 1 / v91 == 1 / v92) then
            v93 = true
        elseif v91 == v91 then
            v93 = false
        else
            v93 = v92 ~= v92
        end
        if not v93 then
            return false
        end
    end
    return true
end
function v_u_58.bailoutHooks(p95, p96, p97)
    p96.updateQueue = p95.updateQueue
    if v_u_1 and v_u_16 then
        local v98 = p96.flags
        local v99 = v_u_31
        local v100 = v_u_28
        local v101 = v_u_30
        local v102 = v_u_27
        local v103 = bit32.bor(v99, v100, v101, v102)
        local v104 = bit32.bnot(v103)
        p96.flags = bit32.band(v98, v104)
    else
        local v105 = p96.flags
        local v106 = v_u_28
        local v107 = v_u_27
        local v108 = bit32.bor(v106, v107)
        local v109 = bit32.bnot(v108)
        p96.flags = bit32.band(v105, v109)
    end
    p95.lanes = v_u_22(p95.lanes, p97)
end
local v_u_110 = false
function v_u_58.resetHooksAfterThrow()
    v_u_56.current = v_u_58.ContextOnlyDispatcher
    if v_u_63 then
        local v111 = v_u_60.memoizedState
        while v111 ~= nil do
            local v112 = v111.queue
            if v112 ~= nil then
                v112.pending = nil
            end
            v111 = v111.next
        end
        v_u_63 = false
    end
    v_u_59 = v_u_19
    v_u_60 = nil
    v_u_61 = nil
    v_u_62 = nil
    if v_u_1 then
        v_u_66 = nil
        v_u_67 = 0
        v_u_65 = nil
        v_u_110 = false
    end
    v_u_64 = false
end
local function v_u_117()
    local v113
    if v_u_61 == nil then
        local v114 = v_u_60.alternate
        if v114 == nil then
            v113 = nil
        else
            v113 = v114.memoizedState
        end
    else
        v113 = v_u_61.next
    end
    local v115
    if v_u_62 == nil then
        v115 = v_u_60.memoizedState
    else
        v115 = v_u_62.next
    end
    if v115 == nil then
        if v113 == nil then
            error(v_u_4.new("Rendered more hooks than during the previous render."))
        end
        v_u_61 = v113
        local v116 = {
            ["memoizedState"] = v_u_61.memoizedState,
            ["baseState"] = v_u_61.baseState,
            ["baseQueue"] = v_u_61.baseQueue,
            ["queue"] = v_u_61.queue,
            ["next"] = nil
        }
        if v_u_62 == nil then
            v_u_62 = v116
            v_u_60.memoizedState = v116
        else
            v_u_62.next = v116
            v_u_62 = v116
        end
    else
        v_u_62 = v115
        local _ = v_u_62.next
        v_u_61 = v113
    end
    return v_u_62
end
function basicStateReducer(p118, p119)
    if type(p119) == "function" then
        return p119(p118)
    else
        return p119
    end
end
function mountReducer(p120, p121, p122)
    local v123 = {
        ["memoizedState"] = nil,
        ["baseState"] = nil,
        ["baseQueue"] = nil,
        ["queue"] = nil,
        ["next"] = nil
    }
    if v_u_62 == nil then
        v_u_60.memoizedState = v123
        v_u_62 = v123
    else
        v_u_62.next = v123
        v_u_62 = v123
    end
    local v124 = v_u_62
    if p122 ~= nil then
        p121 = p122(p121)
    end
    v124.baseState = p121
    v124.memoizedState = v124.baseState
    local v_u_125 = {
        ["pending"] = nil,
        ["dispatch"] = nil,
        ["lastRenderedReducer"] = p120,
        ["lastRenderedState"] = p121
    }
    v124.queue = v_u_125
    local v_u_126 = v_u_60
    local function v128(p127, ...)
        dispatchAction(v_u_126, v_u_125, p127, ...)
    end
    v_u_125.dispatch = v128
    return v124.memoizedState, v128
end
function updateReducer(p129, _, _)
    local v130 = v_u_117()
    local v131 = v130.queue
    local v132 = v131 ~= nil
    assert(v132, "Should have a queue. This is likely a bug in React. Please file an issue.")
    v131.lastRenderedReducer = p129
    local v133 = v_u_61
    local v134 = v133.baseQueue
    local v135 = v131.pending
    if v135 == nil then
        v135 = v134
    else
        if v134 ~= nil then
            local v136 = v134.next
            v134.next = v135.next
            v135.next = v136
        end
        v133.baseQueue = v135
        v131.pending = nil
    end
    if v135 == nil then
        ::l9::
        local v137 = v131.dispatch
        return v130.memoizedState, v137
    else
        local v138 = v135.next
        local v139 = v133.baseState
        local v140 = v138
        local v141 = nil
        local v142 = nil
        local v143 = nil
        while true do
            if true then
                local v144 = v138.lane
                local v145 = v_u_59
                if bit32.band(v145, v144) == v144 then
                    if v141 ~= nil then
                        v141.next = {
                            ["lane"] = v_u_18,
                            ["action"] = v138.action,
                            ["eagerReducer"] = v138.eagerReducer,
                            ["eagerState"] = v138.eagerState,
                            ["next"] = nil
                        }
                        v141 = v141.next
                    end
                    if v138.eagerReducer == p129 then
                        v139 = v138.eagerState
                    else
                        v139 = p129(v139, v138.action)
                    end
                else
                    local v146 = {
                        ["lane"] = v144,
                        ["action"] = v138.action,
                        ["eagerReducer"] = v138.eagerReducer,
                        ["eagerState"] = v138.eagerState,
                        ["next"] = nil
                    }
                    if v141 == nil then
                        v142 = v146
                        v141 = v142
                        v143 = v139
                        local v147 = v142
                        v142 = v141
                        v147 = v141
                        v141 = v142
                    else
                        v141.next = v146
                        v141 = v141.next
                    end
                    v_u_60.lanes = v_u_21(v_u_60.lanes, v144)
                    v_u_41(v144)
                end
            end
            v138 = v138.next
            if v138 == nil or v138 == v140 then
                if v141 == nil then
                    v143 = v139
                else
                    v141.next = v142
                end
                local v148 = v130.memoizedState
                local v149
                if v139 == v148 and (v139 ~= 0 or 1 / v139 == 1 / v148) then
                    v149 = true
                elseif v139 == v139 then
                    v149 = false
                else
                    v149 = v148 ~= v148
                end
                if not v149 then
                    v_u_46()
                end
                v130.memoizedState = v139
                v130.baseState = v143
                v130.baseQueue = v141
                v131.lastRenderedState = v139
                goto l9
            end
        end
    end
end
function rerenderReducer(p150, _, _)
    local v151 = v_u_117()
    local v152 = v151.queue
    local v153 = v152 ~= nil
    assert(v153, "Should have a queue. This is likely a bug in React. Please file an issue.")
    v152.lastRenderedReducer = p150
    local v154 = v152.dispatch
    local v155 = v152.pending
    local v156 = v151.memoizedState
    if v155 ~= nil then
        v152.pending = nil
        local v157 = v155.next
        local v158 = v157
        repeat
            v156 = p150(v156, v157.action)
            v157 = v157.next
        until v157 == v158
        local v159 = v151.memoizedState
        local v160
        if v156 == v159 and (v156 ~= 0 or 1 / v156 == 1 / v159) then
            v160 = true
        elseif v156 == v156 then
            v160 = false
        else
            v160 = v159 ~= v159
        end
        if not v160 then
            v_u_46()
        end
        v151.memoizedState = v156
        if v151.baseQueue == nil then
            v151.baseState = v156
        end
        v152.lastRenderedState = v156
    end
    return v156, v154
end
function readFromUnsubcribedMutableSource(p161, p162, p163)
    if v_u_1 then
        v_u_50(p162)
    end
    local v164 = p162._getVersion(p162._source)
    local v165 = v_u_51(p162)
    local v166
    if v165 == nil then
        v166 = v_u_20(v_u_59, p161.mutableReadLanes)
        if v166 then
            v_u_52(p162, v164)
        end
    else
        v166 = v165 == v164
    end
    if v166 then
        local v167 = p163(p162._source)
        if v_u_1 and type(v167) == "function" then
            v_u_8.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
        end
        return v167
    end
    v_u_53(p162)
    error(v_u_4.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."))
end
function useMutableSource(p168, p_u_169, p_u_170, p_u_171)
    local v_u_172 = v_u_42()
    v_u_44(v_u_172 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.")
    local v_u_173 = p_u_169._getVersion
    local v_u_174 = v_u_173(p_u_169._source)
    local v175 = v_u_56.current
    local v176 = v175 ~= nil
    assert(v176, "dispatcher was nil, this is a bug in React")
    local v177, v_u_178 = v175.useState(function()
        return readFromUnsubcribedMutableSource(v_u_172, p_u_169, p_u_170)
    end)
    local v_u_179 = v177
    local v180 = v_u_62
    local v181 = p168.memoizedState
    if v181.refs == nil then
        local v182 = error
        local v183 = debug.traceback
        v182((tostring(v183())))
    end
    local v_u_184 = v181.refs
    local v185 = v_u_184.getSnapshot
    local v186 = v181.source
    local v187 = v181.subscribe
    local v_u_188 = v_u_60
    p168.memoizedState = {
        ["refs"] = v_u_184,
        ["source"] = p_u_169,
        ["subscribe"] = p_u_171
    }
    v175.useEffect(function()
        v_u_184.getSnapshot = p_u_170
        v_u_184.setSnapshot = v_u_178
        local v189 = v_u_173(p_u_169._source)
        local v190 = v_u_174
        local v191
        if v190 == v189 and (v190 ~= 0 or 1 / v190 == 1 / v189) then
            v191 = true
        elseif v190 == v190 then
            v191 = false
        else
            v191 = v189 ~= v189
        end
        if not v191 then
            local v192 = p_u_170(p_u_169._source)
            if v_u_1 and type(v192) == "function" then
                v_u_8.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
            end
            local v193 = v_u_179
            local v194
            if v193 == v192 and (v193 ~= 0 or 1 / v193 == 1 / v192) then
                v194 = true
            elseif v193 == v193 then
                v194 = false
            else
                v194 = v192 ~= v192
            end
            if not v194 then
                v_u_178(v192)
                v_u_24(v_u_172, (v_u_40(v_u_188)))
            end
            v_u_23(v_u_172, v_u_172.mutableReadLanes)
        end
    end, { p_u_170, p_u_169, p_u_171 })
    v175.useEffect(function()
        local function v199()
            local v_u_195 = v_u_184.getSnapshot
            local v_u_196 = v_u_184.setSnapshot
            local v197, v_u_198 = pcall(function()
                v_u_196(v_u_195(p_u_169._source))
                v_u_24(v_u_172, (v_u_40(v_u_188)))
            end)
            if not v197 then
                v_u_196(function()
                    error(v_u_198)
                end)
            end
        end
        local v200 = p_u_171(p_u_169._source, v199)
        if v_u_1 and type(v200) ~= "function" then
            v_u_8.error("Mutable source subscribe function must return an unsubscribe function.")
        end
        return v200
    end, { p_u_169, p_u_171 })
    local v201
    if v185 == p_u_170 and (v185 ~= 0 or 1 / v185 == 1 / p_u_170) then
        v201 = true
    elseif v185 == v185 then
        v201 = false
    else
        v201 = p_u_170 ~= p_u_170
    end
    if v201 then
        local v202
        if v186 == p_u_169 and (v186 ~= 0 or 1 / v186 == 1 / p_u_169) then
            v202 = true
        elseif v186 == v186 then
            v202 = false
        else
            v202 = p_u_169 ~= p_u_169
        end
        if v202 then
            local v203
            if v187 == p_u_171 and (v187 ~= 0 or 1 / v187 == 1 / p_u_171) then
                v203 = true
            elseif v187 == v187 then
                v203 = false
            else
                v203 = p_u_171 ~= p_u_171
            end
            if v203 then
                ::l33::
                return v_u_179
            end
        end
    end
    local v_u_204 = {
        ["pending"] = nil,
        ["dispatch"] = nil,
        ["lastRenderedReducer"] = basicStateReducer,
        ["lastRenderedState"] = v_u_179
    }
    local v_u_205 = v_u_60
    local function v206(...)
        dispatchAction(v_u_205, v_u_204, ...)
    end
    v_u_204.dispatch = v206
    v180.queue = v_u_204
    v180.baseQueue = nil
    local v207 = readFromUnsubcribedMutableSource(v_u_172, p_u_169, p_u_170)
    v180.baseState = v207
    v180.memoizedState = v180.baseState
    v_u_179 = v207
    goto l33
end
function mountMutableSource(p208, p209, p210)
    local v211 = {
        ["memoizedState"] = nil,
        ["baseState"] = nil,
        ["baseQueue"] = nil,
        ["queue"] = nil,
        ["next"] = nil
    }
    if v_u_62 == nil then
        v_u_60.memoizedState = v211
        v_u_62 = v211
    else
        v_u_62.next = v211
        v_u_62 = v211
    end
    local v212 = v_u_62
    local v213 = {
        ["refs"] = {
            ["getSnapshot"] = p209,
            ["setSnapshot"] = nil
        },
        ["source"] = p208,
        ["subscribe"] = p210
    }
    v212.memoizedState = v213
    return useMutableSource(v212, p208, p209, p210)
end
function updateMutableSource(p214, p215, p216)
    local v217 = v_u_117()
    return useMutableSource(v217, p214, p215, p216)
end
function mountState(p218)
    local v219 = {
        ["memoizedState"] = nil,
        ["baseState"] = nil,
        ["baseQueue"] = nil,
        ["queue"] = nil,
        ["next"] = nil
    }
    if v_u_62 == nil then
        v_u_60.memoizedState = v219
        v_u_62 = v219
    else
        v_u_62.next = v219
        v_u_62 = v219
    end
    local v220 = v_u_62
    if type(p218) == "function" then
        p218 = p218()
    end
    v220.baseState = p218
    v220.memoizedState = v220.baseState
    local v_u_221 = {
        ["pending"] = nil,
        ["dispatch"] = nil,
        ["lastRenderedReducer"] = nil,
        ["lastRenderedState"] = p218,
        ["lastRenderedReducer"] = basicStateReducer
    }
    v220.queue = v_u_221
    local v_u_222 = v_u_60
    local function v224(p223, ...)
        dispatchAction(v_u_222, v_u_221, p223, ...)
    end
    v_u_221.dispatch = v224
    return v220.memoizedState, v224
end
function updateState(p225)
    return updateReducer(basicStateReducer, p225)
end
function rerenderState(p226)
    return rerenderReducer(basicStateReducer, p226)
end
local function v_u_236(p227, p228, p229, p230)
    local v231 = {
        ["tag"] = p227,
        ["create"] = p228,
        ["destroy"] = p229,
        ["deps"] = p230,
        ["next"] = nil
    }
    local v232 = v_u_60.updateQueue
    if v232 == nil then
        local v233 = {
            ["lastEffect"] = nil
        }
        v_u_60.updateQueue = v233
        v231.next = v231
        v233.lastEffect = v231
        return v231
    end
    local v234 = v232.lastEffect
    if v234 == nil then
        v232.lastEffect = v231
        v231.next = v231
        return v231
    end
    local v235 = v234.next
    v234.next = v231
    v231.next = v235
    v232.lastEffect = v231
    return v231
end
function mountBinding(p237)
    local v238 = {
        ["memoizedState"] = nil,
        ["baseState"] = nil,
        ["baseQueue"] = nil,
        ["queue"] = nil,
        ["next"] = nil
    }
    if v_u_62 == nil then
        v_u_60.memoizedState = v238
        v_u_62 = v238
    else
        v_u_62.next = v238
        v_u_62 = v238
    end
    local v239 = v_u_62
    local v240, v241 = v_u_7(p237)
    v239.memoizedState = { v240, v241 }
    return v240, v241
end
function updateBinding(_)
    local v242 = v_u_117().memoizedState
    return unpack(v242)
end
function mountRef(p243)
    local v244 = {
        ["memoizedState"] = nil,
        ["baseState"] = nil,
        ["baseQueue"] = nil,
        ["queue"] = nil,
        ["next"] = nil
    }
    if v_u_62 == nil then
        v_u_60.memoizedState = v244
        v_u_62 = v244
    else
        v_u_62.next = v244
        v_u_62 = v244
    end
    local v245 = v_u_62
    local v246 = v_u_6()
    v246.current = p243
    v245.memoizedState = v246
    return v246
end
function updateRef(_)
    return v_u_117().memoizedState
end
local function v_u_256(p247, p248, p249, p250)
    local v251 = {
        ["memoizedState"] = nil,
        ["baseState"] = nil,
        ["baseQueue"] = nil,
        ["queue"] = nil,
        ["next"] = nil
    }
    if v_u_62 == nil then
        v_u_60.memoizedState = v251
        v_u_62 = v251
    else
        v_u_62.next = v251
        v_u_62 = v251
    end
    local v252 = v_u_62
    local v253 = v_u_60
    local v254 = v_u_60.flags
    v253.flags = bit32.bor(v254, p247)
    local v255 = v_u_32
    v252.memoizedState = v_u_236(bit32.bor(v255, p248), p249, nil, p250)
end
function updateEffectImpl(p257, p258, p259, p260)
    local v261 = v_u_117()
    local v262
    if v_u_61 == nil then
        v262 = nil
    else
        local v263 = v_u_61.memoizedState
        v262 = v263.destroy
        if p260 ~= nil and v_u_94(p260, v263.deps) then
            v261.memoizedState = v_u_236(p258, p259, v262, p260)
            return
        end
    end
    local v264 = v_u_60
    local v265 = v_u_60.flags
    v264.flags = bit32.bor(v265, p257)
    local v266 = v_u_32
    v261.memoizedState = v_u_236(bit32.bor(v266, p258), p259, v262, p260)
end
local function v_u_289(p267, p268)
    if v_u_1 then
        local v269 = _G.jest
        if type(v269) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
            v_u_43(v_u_60)
        end
    end
    if v_u_1 and v_u_16 then
        local v270 = v_u_31
        local v271 = v_u_28
        local v272 = v_u_29
        local v273 = bit32.bor(v270, v271, v272)
        local v274 = v_u_34
        local v275 = {
            ["memoizedState"] = nil,
            ["baseState"] = nil,
            ["baseQueue"] = nil,
            ["queue"] = nil,
            ["next"] = nil
        }
        if v_u_62 == nil then
            v_u_60.memoizedState = v275
            v_u_62 = v275
        else
            v_u_62.next = v275
            v_u_62 = v275
        end
        local v276 = v_u_62
        local v277 = v_u_60
        local v278 = v_u_60.flags
        v277.flags = bit32.bor(v278, v273)
        local v279 = v_u_32
        v276.memoizedState = v_u_236(bit32.bor(v279, v274), p267, nil, p268)
    else
        local v280 = v_u_28
        local v281 = v_u_29
        local v282 = bit32.bor(v280, v281)
        local v283 = v_u_34
        local v284 = {
            ["memoizedState"] = nil,
            ["baseState"] = nil,
            ["baseQueue"] = nil,
            ["queue"] = nil,
            ["next"] = nil
        }
        if v_u_62 == nil then
            v_u_60.memoizedState = v284
            v_u_62 = v284
        else
            v_u_62.next = v284
            v_u_62 = v284
        end
        local v285 = v_u_62
        local v286 = v_u_60
        local v287 = v_u_60.flags
        v286.flags = bit32.bor(v287, v282)
        local v288 = v_u_32
        v285.memoizedState = v_u_236(bit32.bor(v288, v283), p267, nil, p268)
    end
end
local function v_u_293(p290, p291)
    if v_u_1 then
        local v292 = _G.jest
        if type(v292) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
            v_u_43(v_u_60)
        end
    end
    updateEffectImpl(v_u_28, v_u_34, p290, p291)
end
local function v_u_312(p294, p295)
    if v_u_1 and v_u_16 then
        local v296 = v_u_30
        local v297 = v_u_27
        local v298 = bit32.bor(v296, v297)
        local v299 = v_u_33
        local v300 = {
            ["memoizedState"] = nil,
            ["baseState"] = nil,
            ["baseQueue"] = nil,
            ["queue"] = nil,
            ["next"] = nil
        }
        if v_u_62 == nil then
            v_u_60.memoizedState = v300
            v_u_62 = v300
        else
            v_u_62.next = v300
            v_u_62 = v300
        end
        local v301 = v_u_62
        local v302 = v_u_60
        local v303 = v_u_60.flags
        v302.flags = bit32.bor(v303, v298)
        local v304 = v_u_32
        v301.memoizedState = v_u_236(bit32.bor(v304, v299), p294, nil, p295)
    else
        local v305 = v_u_27
        local v306 = v_u_33
        local v307 = {
            ["memoizedState"] = nil,
            ["baseState"] = nil,
            ["baseQueue"] = nil,
            ["queue"] = nil,
            ["next"] = nil
        }
        if v_u_62 == nil then
            v_u_60.memoizedState = v307
            v_u_62 = v307
        else
            v_u_62.next = v307
            v_u_62 = v307
        end
        local v308 = v_u_62
        local v309 = v_u_60
        local v310 = v_u_60.flags
        v309.flags = bit32.bor(v310, v305)
        local v311 = v_u_32
        v308.memoizedState = v_u_236(bit32.bor(v311, v306), p294, nil, p295)
    end
end
local function v_u_315(p313, p314)
    updateEffectImpl(v_u_27, v_u_33, p313, p314)
end
function imperativeHandleEffect(p316, p_u_317)
    if p_u_317 ~= nil and type(p_u_317) == "function" then
        p_u_317((p316()))
        return function()
            return p_u_317(nil)
        end
    end
    if p_u_317 == nil then
        return nil
    end
    if v_u_1 then
        local v318
        if getmetatable(p_u_317) == nil then
            v318 = false
        else
            v318 = #v_u_5.keys(p_u_317) == 0
        end
        if not v318 then
            v_u_8.error("Expected useImperativeHandle() first argument to either be a ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. v_u_3.join(v_u_5.keys(p_u_317), ", ") .. "}")
        end
    end
    p_u_317.current = p316()
    return function()
        p_u_317.current = nil
    end
end
function mountImperativeHandle(p_u_319, p_u_320, p321)
    if v_u_1 and type(p_u_320) ~= "function" then
        v_u_8.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", p_u_320 == nil and "nil" or type(p_u_320))
    end
    local v322
    if p321 == nil then
        v322 = nil
    else
        v322 = v_u_3.concat(p321, { p_u_319 })
    end
    if not (v_u_1 and v_u_16) then
        return v_u_256(v_u_27, v_u_33, function()
            return imperativeHandleEffect(p_u_320, p_u_319)
        end, v322)
    end
    local v323 = v_u_30
    local v324 = v_u_27
    return v_u_256(bit32.bor(v323, v324), v_u_33, function()
        return imperativeHandleEffect(p_u_320, p_u_319)
    end, v322)
end
function updateImperativeHandle(p_u_325, p_u_326, p327)
    if v_u_1 and type(p_u_326) ~= "function" then
        local v328 = not p_u_326 and "nil" or type(p_u_326)
        v_u_8.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", v328)
    end
    local v329
    if p327 == nil then
        v329 = nil
    else
        v329 = table.clone(p327)
        table.insert(v329, p_u_325)
    end
    return updateEffectImpl(v_u_27, v_u_33, function()
        return imperativeHandleEffect(p_u_326, p_u_325)
    end, v329)
end
function mountDebugValue(_, _) end
local v_u_330 = mountDebugValue
function mountCallback(p331, p332)
    local v333 = {
        ["memoizedState"] = nil,
        ["baseState"] = nil,
        ["baseQueue"] = nil,
        ["queue"] = nil,
        ["next"] = nil
    }
    if v_u_62 == nil then
        v_u_60.memoizedState = v333
        v_u_62 = v333
    else
        v_u_62.next = v333
        v_u_62 = v333
    end
    v_u_62.memoizedState = { p331, p332 }
    return p331
end
function updateCallback(p334, p335)
    local v336 = v_u_117()
    local v337 = v336.memoizedState
    if v337 ~= nil and (p335 ~= nil and v_u_94(p335, v337[2])) then
        return v337[1]
    end
    v336.memoizedState = { p334, p335 }
    return p334
end
function mountMemo(p338, p339)
    local v340 = {
        ["memoizedState"] = nil,
        ["baseState"] = nil,
        ["baseQueue"] = nil,
        ["queue"] = nil,
        ["next"] = nil
    }
    if v_u_62 == nil then
        v_u_60.memoizedState = v340
        v_u_62 = v340
    else
        v_u_62.next = v340
        v_u_62 = v340
    end
    local v341 = v_u_62
    local v342 = { p338() }
    v341.memoizedState = { v342, p339 }
    return unpack(v342)
end
function updateMemo(p343, p344)
    local v345 = v_u_117()
    local v346 = v345.memoizedState
    if v346 ~= nil and (p344 ~= nil and v_u_94(p344, v346[2])) then
        local v347 = v346[1]
        return unpack(v347)
    end
    local v348 = { p343() }
    v345.memoizedState = { v348, p344 }
    return unpack(v348)
end
function v_u_58.getIsUpdatingOpaqueValueInRenderPhaseInDEV()
    if v_u_1 then
        return false
    else
        return nil
    end
end
function mountOpaqueIdentifier()
    local v349 = nil
    if v_u_1 then
        v_u_8.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV")
    else
        v349 = v_u_48
    end
    if not v_u_47() then
        local v350 = v349()
        mountState(v350)
        return v350
    end
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: ReactFiberHooks: getIsHydrating() true")
    error("FIXME (roblox): ReactFiberHooks: getIsHydrating() true is unimplemented")
    return nil
end
function updateOpaqueIdentifier()
    local v351, _ = updateState(nil)
    return v351
end
function rerenderOpaqueIdentifier()
    local v352, _ = rerenderState(nil)
    return v352
end
function dispatchAction(p353, p354, p355, ...)
    if v_u_1 then
        local v356
        if select("#", ...) == 1 then
            v356 = select(1, ...)
        else
            v356 = nil
        end
        if type(v356) == "function" then
            v_u_8.error("State updates from the useState() and useReducer() Hooks don\'t support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().")
        end
    end
    local v357 = v_u_39()
    local v358 = v_u_40(p353)
    local v359 = {
        ["lane"] = v358,
        ["action"] = p355,
        ["eagerReducer"] = nil,
        ["eagerState"] = nil,
        ["next"] = nil
    }
    local v360 = p354.pending
    if v360 == nil then
        v359.next = v359
    else
        v359.next = v360.next
        v360.next = v359
    end
    p354.pending = v359
    local v361 = p353.alternate
    if p353 == v_u_60 or v361 ~= nil and v361 == v_u_60 then
        v_u_63 = true
        v_u_64 = true
    else
        if p353.lanes == v_u_19 and (v361 == nil or v361.lanes == v_u_19) then
            local v362 = p354.lastRenderedReducer
            if v362 ~= nil then
                local v363
                if v_u_1 then
                    v363 = v_u_56.current
                    v_u_56.current = v_u_73
                else
                    v363 = nil
                end
                local v364 = p354.lastRenderedState
                local v365, v366 = pcall(v362, v364, p355)
                if v365 then
                    v359.eagerReducer = v362
                    v359.eagerState = v366
                end
                if v_u_1 then
                    v_u_56.current = v363
                end
                local v367
                if v366 == v364 and (v366 ~= 0 or 1 / v366 == 1 / v364) then
                    v367 = true
                elseif v366 == v366 then
                    v367 = false
                else
                    v367 = v364 ~= v364
                end
                if v367 then
                    return
                end
            end
        end
        if v_u_1 then
            local v368 = _G.jest
            if type(v368) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
                v_u_38(p353)
                v_u_36(p353)
            end
        end
        v_u_37(p353, v358, v357)
    end
    if v_u_1 and v_u_13 then
        local v369 = p353.mode
        local v370 = v_u_17
        if bit32.band(v369, v370) ~= 0 then
            v_u_54(v_u_45(p353.type) or "Unknown", v358, p355)
        end
    end
    if v_u_14 then
        v_u_55(p353, v358)
    end
end
local v_u_371 = {
    ["readContext"] = v_u_25,
    ["useCallback"] = v83,
    ["useContext"] = v83,
    ["useEffect"] = v83,
    ["useImperativeHandle"] = v83,
    ["useLayoutEffect"] = v83,
    ["useMemo"] = v83,
    ["useReducer"] = v83,
    ["useRef"] = v83,
    ["useBinding"] = v83,
    ["useState"] = v83,
    ["useDebugValue"] = v83,
    ["useMutableSource"] = v83,
    ["useOpaqueIdentifier"] = v83,
    ["unstable_isNewReconciler"] = v15
}
v_u_58.ContextOnlyDispatcher = v_u_371
local v_u_372 = {
    ["readContext"] = v_u_25,
    ["useCallback"] = mountCallback,
    ["useContext"] = v_u_25,
    ["useEffect"] = v_u_289,
    ["useImperativeHandle"] = mountImperativeHandle,
    ["useLayoutEffect"] = v_u_312,
    ["useMemo"] = mountMemo,
    ["useReducer"] = mountReducer,
    ["useRef"] = mountRef,
    ["useBinding"] = mountBinding,
    ["useState"] = mountState,
    ["useDebugValue"] = mountDebugValue,
    ["useMutableSource"] = mountMutableSource,
    ["useOpaqueIdentifier"] = mountOpaqueIdentifier,
    ["unstable_isNewReconciler"] = v15
}
local v_u_373 = {
    ["readContext"] = v_u_25,
    ["useCallback"] = updateCallback,
    ["useContext"] = v_u_25,
    ["useEffect"] = v_u_293,
    ["useImperativeHandle"] = updateImperativeHandle,
    ["useLayoutEffect"] = v_u_315,
    ["useMemo"] = updateMemo,
    ["useReducer"] = updateReducer,
    ["useRef"] = updateRef,
    ["useBinding"] = updateBinding,
    ["useState"] = updateState,
    ["useDebugValue"] = v_u_330,
    ["useMutableSource"] = updateMutableSource,
    ["useOpaqueIdentifier"] = updateOpaqueIdentifier,
    ["unstable_isNewReconciler"] = v15
}
local v_u_374 = {
    ["readContext"] = v_u_25,
    ["useCallback"] = updateCallback,
    ["useContext"] = v_u_25,
    ["useEffect"] = v_u_293,
    ["useImperativeHandle"] = updateImperativeHandle,
    ["useLayoutEffect"] = v_u_315,
    ["useMemo"] = updateMemo,
    ["useReducer"] = rerenderReducer,
    ["useRef"] = updateRef,
    ["useBinding"] = updateBinding,
    ["useState"] = rerenderState,
    ["useDebugValue"] = v_u_330,
    ["useMutableSource"] = updateMutableSource,
    ["useOpaqueIdentifier"] = rerenderOpaqueIdentifier,
    ["unstable_isNewReconciler"] = v15
}
if v_u_1 then
    v_u_68 = {
        ["readContext"] = function(p375, p376)
            return v_u_25(p375, p376)
        end,
        ["useCallback"] = function(p377, p378)
            v_u_65 = "useCallback"
            if v_u_1 then
                local v379 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v379 }
                else
                    local v380 = v_u_66
                    table.insert(v380, v379)
                end
            end
            if not v_u_1 or p378 == nil then
                ::l6::
                return mountCallback(p377, p378)
            end
            local v381
            if type(p378) == "table" then
                for v382, _ in p378 do
                    if type(v382) ~= "number" then
                        v381 = false
                        goto l10
                    end
                end
                v381 = true
                goto l10
            else
                v381 = false
                ::l10::
                if not v381 then
                    v_u_8.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v_u_65, (type(p378)))
                end
                goto l6
            end
        end,
        ["useContext"] = function(p383, p384)
            v_u_65 = "useContext"
            if v_u_1 then
                local v385 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v385 }
                else
                    local v386 = v_u_66
                    table.insert(v386, v385)
                end
            end
            return v_u_25(p383, p384)
        end,
        ["useEffect"] = function(p387, p388)
            v_u_65 = "useEffect"
            if v_u_1 then
                local v389 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v389 }
                else
                    local v390 = v_u_66
                    table.insert(v390, v389)
                end
            end
            if not v_u_1 or p388 == nil then
                ::l6::
                return v_u_289(p387, p388)
            end
            local v391
            if type(p388) == "table" then
                for v392, _ in p388 do
                    if type(v392) ~= "number" then
                        v391 = false
                        goto l10
                    end
                end
                v391 = true
                goto l10
            else
                v391 = false
                ::l10::
                if not v391 then
                    v_u_8.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v_u_65, (type(p388)))
                end
                goto l6
            end
        end,
        ["useImperativeHandle"] = function(p393, p394, p395)
            v_u_65 = "useImperativeHandle"
            if v_u_1 then
                local v396 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v396 }
                else
                    local v397 = v_u_66
                    table.insert(v397, v396)
                end
            end
            if not v_u_1 or p395 == nil then
                ::l6::
                return mountImperativeHandle(p393, p394, p395)
            end
            local v398
            if type(p395) == "table" then
                for v399, _ in p395 do
                    if type(v399) ~= "number" then
                        v398 = false
                        goto l10
                    end
                end
                v398 = true
                goto l10
            else
                v398 = false
                ::l10::
                if not v398 then
                    v_u_8.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v_u_65, (type(p395)))
                end
                goto l6
            end
        end,
        ["useLayoutEffect"] = function(p400, p401)
            v_u_65 = "useLayoutEffect"
            if v_u_1 then
                local v402 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v402 }
                else
                    local v403 = v_u_66
                    table.insert(v403, v402)
                end
            end
            if not v_u_1 or p401 == nil then
                ::l6::
                return v_u_312(p400, p401)
            end
            local v404
            if type(p401) == "table" then
                for v405, _ in p401 do
                    if type(v405) ~= "number" then
                        v404 = false
                        goto l10
                    end
                end
                v404 = true
                goto l10
            else
                v404 = false
                ::l10::
                if not v404 then
                    v_u_8.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v_u_65, (type(p401)))
                end
                goto l6
            end
        end,
        ["useMemo"] = function(p406, p407)
            v_u_65 = "useMemo"
            if v_u_1 then
                local v408 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v408 }
                else
                    local v409 = v_u_66
                    table.insert(v409, v408)
                end
            end
            if not v_u_1 or p407 == nil then
                ::l6::
                local v410 = v_u_56.current
                v_u_56.current = v_u_72
                local v411 = { pcall(mountMemo, p406, p407) }
                v_u_56.current = v410
                if not v411[1] then
                    error(v411[2])
                end
                return unpack(v411, 2)
            end
            local v412
            if type(p407) == "table" then
                for v413, _ in p407 do
                    if type(v413) ~= "number" then
                        v412 = false
                        goto l10
                    end
                end
                v412 = true
                goto l10
            else
                v412 = false
                ::l10::
                if not v412 then
                    v_u_8.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v_u_65, (type(p407)))
                end
                goto l6
            end
        end,
        ["useReducer"] = function(p414, p415, p416)
            v_u_65 = "useReducer"
            if v_u_1 then
                local v417 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v417 }
                else
                    local v418 = v_u_66
                    table.insert(v418, v417)
                end
            end
            local v419 = v_u_56.current
            v_u_56.current = v_u_72
            local v420, v421, v422 = pcall(mountReducer, p414, p415, p416)
            v_u_56.current = v419
            if not v420 then
                error(v421)
            end
            return v421, v422
        end,
        ["useRef"] = function(p423)
            v_u_65 = "useRef"
            if v_u_1 then
                local v424 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v424 }
                else
                    local v425 = v_u_66
                    table.insert(v425, v424)
                end
            end
            return mountRef(p423)
        end,
        ["useBinding"] = function(p426)
            v_u_65 = "useBinding"
            if v_u_1 then
                local v427 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v427 }
                else
                    local v428 = v_u_66
                    table.insert(v428, v427)
                end
            end
            return mountBinding(p426)
        end,
        ["useState"] = function(p429)
            v_u_65 = "useState"
            if v_u_1 then
                local v430 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v430 }
                else
                    local v431 = v_u_66
                    table.insert(v431, v430)
                end
            end
            local v432 = v_u_56.current
            v_u_56.current = v_u_72
            local v433, v434, v435 = pcall(mountState, p429)
            v_u_56.current = v432
            if not v433 then
                error(v434)
            end
            return v434, v435
        end,
        ["useDebugValue"] = function(p436, p437)
            v_u_65 = "useDebugValue"
            if v_u_1 then
                local v438 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v438 }
                else
                    local v439 = v_u_66
                    table.insert(v439, v438)
                end
            end
            return mountDebugValue(p436, p437)
        end,
        ["useMutableSource"] = function(p440, p441, p442)
            v_u_65 = "useMutableSource"
            if v_u_1 then
                local v443 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v443 }
                else
                    local v444 = v_u_66
                    table.insert(v444, v443)
                end
            end
            return mountMutableSource(p440, p441, p442)
        end,
        ["useOpaqueIdentifier"] = function()
            v_u_65 = "useOpaqueIdentifier"
            if v_u_1 then
                local v445 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v445 }
                else
                    local v446 = v_u_66
                    table.insert(v446, v445)
                end
            end
            return mountOpaqueIdentifier()
        end,
        ["unstable_isNewReconciler"] = v15
    }
    v_u_69 = {
        ["readContext"] = function(p447, p448)
            return v_u_25(p447, p448)
        end,
        ["useCallback"] = function(p449, p450)
            v_u_65 = "useCallback"
            updateHookTypesDev()
            if not v_u_1 or p450 == nil then
                ::l2::
                return mountCallback(p449, p450)
            end
            local v451
            if type(p450) == "table" then
                for v452, _ in p450 do
                    if type(v452) ~= "number" then
                        v451 = false
                        goto l6
                    end
                end
                v451 = true
                goto l6
            else
                v451 = false
                ::l6::
                if not v451 then
                    v_u_8.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v_u_65, (type(p450)))
                end
                goto l2
            end
        end,
        ["useContext"] = function(p453, p454)
            v_u_65 = "useContext"
            updateHookTypesDev()
            return v_u_25(p453, p454)
        end,
        ["useEffect"] = function(p455, p456)
            v_u_65 = "useEffect"
            updateHookTypesDev()
            return v_u_289(p455, p456)
        end,
        ["useImperativeHandle"] = function(p457, p458, p459)
            v_u_65 = "useImperativeHandle"
            updateHookTypesDev()
            return mountImperativeHandle(p457, p458, p459)
        end,
        ["useLayoutEffect"] = function(p460, p461)
            v_u_65 = "useLayoutEffect"
            updateHookTypesDev()
            return v_u_312(p460, p461)
        end,
        ["useMemo"] = function(p462, p463)
            v_u_65 = "useMemo"
            updateHookTypesDev()
            local v464 = v_u_56.current
            v_u_56.current = v_u_72
            local v465 = { pcall(mountMemo, p462, p463) }
            v_u_56.current = v464
            if not v465[1] then
                error(v465[2])
            end
            return unpack(v465, 2)
        end,
        ["useReducer"] = function(p466, p467, p468)
            v_u_65 = "useReducer"
            updateHookTypesDev()
            local v469 = v_u_56.current
            v_u_56.current = v_u_72
            local v470, v471, v472 = pcall(mountReducer, p466, p467, p468)
            v_u_56.current = v469
            if not v470 then
                error(v471)
            end
            return v471, v472
        end,
        ["useRef"] = function(p473)
            v_u_65 = "useRef"
            updateHookTypesDev()
            return mountRef(p473)
        end,
        ["useBinding"] = function(p474)
            v_u_65 = "useBinding"
            updateHookTypesDev()
            return mountBinding(p474)
        end,
        ["useState"] = function(p475)
            v_u_65 = "useState"
            updateHookTypesDev()
            local v476 = v_u_56.current
            v_u_56.current = v_u_72
            local v477, v478, v479 = pcall(mountState, p475)
            v_u_56.current = v476
            if not v477 then
                error(v478)
            end
            return v478, v479
        end,
        ["useDebugValue"] = function(p480, p481)
            v_u_65 = "useDebugValue"
            updateHookTypesDev()
            return mountDebugValue(p480, p481)
        end,
        ["useMutableSource"] = function(p482, p483, p484)
            v_u_65 = "useMutableSource"
            updateHookTypesDev()
            return mountMutableSource(p482, p483, p484)
        end,
        ["useOpaqueIdentifier"] = function()
            v_u_65 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return mountOpaqueIdentifier()
        end,
        ["unstable_isNewReconciler"] = v15
    }
    v_u_70 = {
        ["readContext"] = function(p485, p486)
            return v_u_25(p485, p486)
        end,
        ["useCallback"] = function(p487, p488)
            v_u_65 = "useCallback"
            updateHookTypesDev()
            return updateCallback(p487, p488)
        end,
        ["useContext"] = function(p489, p490)
            v_u_65 = "useContext"
            updateHookTypesDev()
            return v_u_25(p489, p490)
        end,
        ["useEffect"] = function(p491, p492)
            v_u_65 = "useEffect"
            updateHookTypesDev()
            return v_u_293(p491, p492)
        end,
        ["useImperativeHandle"] = function(p493, p494, p495)
            v_u_65 = "useImperativeHandle"
            updateHookTypesDev()
            return updateImperativeHandle(p493, p494, p495)
        end,
        ["useLayoutEffect"] = function(p496, p497)
            v_u_65 = "useLayoutEffect"
            updateHookTypesDev()
            return v_u_315(p496, p497)
        end,
        ["useMemo"] = function(p498, p499)
            v_u_65 = "useMemo"
            updateHookTypesDev()
            local v500 = v_u_56.current
            v_u_56.current = v_u_73
            local v501 = { pcall(updateMemo, p498, p499) }
            v_u_56.current = v500
            if not v501[1] then
                error(v501[2])
            end
            return unpack(v501, 2)
        end,
        ["useReducer"] = function(p502, p503, p504)
            v_u_65 = "useReducer"
            updateHookTypesDev()
            local v505 = v_u_56.current
            v_u_56.current = v_u_73
            local v506, v507, v508 = pcall(updateReducer, p502, p503, p504)
            v_u_56.current = v505
            if not v506 then
                error(v507)
            end
            return v507, v508
        end,
        ["useRef"] = function(p509)
            v_u_65 = "useRef"
            updateHookTypesDev()
            return updateRef(p509)
        end,
        ["useBinding"] = function(p510)
            v_u_65 = "useBinding"
            updateHookTypesDev()
            return updateBinding(p510)
        end,
        ["useState"] = function(p511)
            v_u_65 = "useState"
            updateHookTypesDev()
            local v512 = v_u_56.current
            v_u_56.current = v_u_73
            local v513, v514, v515 = pcall(updateState, p511)
            v_u_56.current = v512
            if not v513 then
                error(v514)
            end
            return v514, v515
        end,
        ["useDebugValue"] = function(p516, p517)
            v_u_65 = "useDebugValue"
            updateHookTypesDev()
            return v_u_330(p516, p517)
        end,
        ["useMutableSource"] = function(p518, p519, p520)
            v_u_65 = "useMutableSource"
            updateHookTypesDev()
            return updateMutableSource(p518, p519, p520)
        end,
        ["useOpaqueIdentifier"] = function()
            v_u_65 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return updateOpaqueIdentifier()
        end,
        ["unstable_isNewReconciler"] = v15
    }
    v_u_71 = {
        ["readContext"] = function(p521, p522)
            return v_u_25(p521, p522)
        end,
        ["useCallback"] = function(p523, p524)
            v_u_65 = "useCallback"
            updateHookTypesDev()
            return mountCallback(p523, p524)
        end,
        ["useContext"] = function(p525, p526)
            v_u_65 = "useContext"
            updateHookTypesDev()
            return v_u_25(p525, p526)
        end,
        ["useEffect"] = function(p527, p528)
            v_u_65 = "useEffect"
            updateHookTypesDev()
            return v_u_293(p527, p528)
        end,
        ["useImperativeHandle"] = function(p529, p530, p531)
            v_u_65 = "useImperativeHandle"
            updateHookTypesDev()
            return updateImperativeHandle(p529, p530, p531)
        end,
        ["useLayoutEffect"] = function(p532, p533)
            v_u_65 = "useLayoutEffect"
            updateHookTypesDev()
            return v_u_315(p532, p533)
        end,
        ["useMemo"] = function(p534, p535)
            v_u_65 = "useMemo"
            updateHookTypesDev()
            local v536 = v_u_56.current
            v_u_56.current = v_u_74
            local v537 = { pcall(updateMemo, p534, p535) }
            v_u_56.current = v536
            if not v537[1] then
                error(v537[2])
            end
            return unpack(v537, 2)
        end,
        ["useReducer"] = function(p538, p539, p540)
            v_u_65 = "useReducer"
            updateHookTypesDev()
            local v541 = v_u_56.current
            v_u_56.current = v_u_74
            local v542, v543, v544 = pcall(rerenderReducer, p538, p539, p540)
            v_u_56.current = v541
            if not v542 then
                error(v543)
            end
            return v543, v544
        end,
        ["useRef"] = function(p545)
            v_u_65 = "useRef"
            updateHookTypesDev()
            return updateRef(p545)
        end,
        ["useBinding"] = function(p546)
            v_u_65 = "useBinding"
            updateHookTypesDev()
            return updateBinding(p546)
        end,
        ["useState"] = function(p547)
            v_u_65 = "useState"
            updateHookTypesDev()
            local v548 = v_u_56.current
            v_u_56.current = v_u_74
            local v549, v550, v551 = pcall(rerenderState, p547)
            v_u_56.current = v548
            if not v549 then
                error(v550)
            end
            return v550, v551
        end,
        ["useDebugValue"] = function(p552, p553)
            v_u_65 = "useDebugValue"
            updateHookTypesDev()
            return v_u_330(p552, p553)
        end,
        ["useMutableSource"] = function(p554, p555, p556)
            v_u_65 = "useMutableSource"
            updateHookTypesDev()
            return updateMutableSource(p554, p555, p556)
        end,
        ["useOpaqueIdentifier"] = function()
            v_u_65 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return rerenderOpaqueIdentifier()
        end,
        ["unstable_isNewReconciler"] = v15
    }
    local _ = {
        ["readContext"] = function(p557, p558)
            v_u_8.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return v_u_25(p557, p558)
        end,
        ["useCallback"] = function(p559, p560)
            v_u_65 = "useCallback"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v561 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v561 }
                else
                    local v562 = v_u_66
                    table.insert(v562, v561)
                end
            end
            return mountCallback(p559, p560)
        end,
        ["useContext"] = function(p563, p564)
            v_u_65 = "useContext"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v565 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v565 }
                else
                    local v566 = v_u_66
                    table.insert(v566, v565)
                end
            end
            return v_u_25(p563, p564)
        end,
        ["useEffect"] = function(p567, p568)
            v_u_65 = "useEffect"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v569 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v569 }
                else
                    local v570 = v_u_66
                    table.insert(v570, v569)
                end
            end
            return v_u_289(p567, p568)
        end,
        ["useImperativeHandle"] = function(p571, p572, p573)
            v_u_65 = "useImperativeHandle"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v574 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v574 }
                else
                    local v575 = v_u_66
                    table.insert(v575, v574)
                end
            end
            return mountImperativeHandle(p571, p572, p573)
        end,
        ["useLayoutEffect"] = function(p576, p577)
            v_u_65 = "useLayoutEffect"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v578 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v578 }
                else
                    local v579 = v_u_66
                    table.insert(v579, v578)
                end
            end
            return v_u_312(p576, p577)
        end,
        ["useMemo"] = function(p580, p581)
            v_u_65 = "useMemo"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v582 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v582 }
                else
                    local v583 = v_u_66
                    table.insert(v583, v582)
                end
            end
            local v584 = v_u_56.current
            v_u_56.current = v_u_72
            local v585 = { pcall(mountMemo, p580, p581) }
            v_u_56.current = v584
            if not v585[1] then
                error(v585[2])
            end
            return unpack(v585, 2)
        end,
        ["useReducer"] = function(p586, p587, p588)
            v_u_65 = "useReducer"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v589 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v589 }
                else
                    local v590 = v_u_66
                    table.insert(v590, v589)
                end
            end
            local v591 = v_u_56.current
            v_u_56.current = v_u_72
            local v592, v593, v594 = pcall(mountReducer, p586, p587, p588)
            v_u_56.current = v591
            if not v592 then
                error(v593)
            end
            return v593, v594
        end,
        ["useRef"] = function(p595)
            v_u_65 = "useRef"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v596 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v596 }
                else
                    local v597 = v_u_66
                    table.insert(v597, v596)
                end
            end
            return mountRef(p595)
        end,
        ["useBinding"] = function(p598)
            v_u_65 = "useBinding"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v599 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v599 }
                else
                    local v600 = v_u_66
                    table.insert(v600, v599)
                end
            end
            return mountBinding(p598)
        end,
        ["useState"] = function(p601)
            v_u_65 = "useState"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v602 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v602 }
                else
                    local v603 = v_u_66
                    table.insert(v603, v602)
                end
            end
            local v604 = v_u_56.current
            v_u_56.current = v_u_72
            local v605, v606, v607 = pcall(mountState, p601)
            v_u_56.current = v604
            if not v605 then
                error(v606)
            end
            return v606, v607
        end,
        ["useDebugValue"] = function(p608, p609)
            v_u_65 = "useDebugValue"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v610 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v610 }
                else
                    local v611 = v_u_66
                    table.insert(v611, v610)
                end
            end
            return mountDebugValue(p608, p609)
        end,
        ["useMutableSource"] = function(p612, p613, p614)
            v_u_65 = "useMutableSource"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v615 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v615 }
                else
                    local v616 = v_u_66
                    table.insert(v616, v615)
                end
            end
            return mountMutableSource(p612, p613, p614)
        end,
        ["useOpaqueIdentifier"] = function()
            v_u_65 = "useOpaqueIdentifier"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if v_u_1 then
                local v617 = v_u_65
                if v_u_66 == nil then
                    v_u_66 = { v617 }
                else
                    local v618 = v_u_66
                    table.insert(v618, v617)
                end
            end
            return mountOpaqueIdentifier()
        end,
        ["unstable_isNewReconciler"] = v15
    }
    v_u_73 = {
        ["readContext"] = function(p619, p620)
            v_u_8.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return v_u_25(p619, p620)
        end,
        ["useCallback"] = function(p621, p622)
            v_u_65 = "useCallback"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return mountCallback(p621, p622)
        end,
        ["useContext"] = function(p623, p624)
            v_u_65 = "useContext"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return v_u_25(p623, p624)
        end,
        ["useEffect"] = function(p625, p626)
            v_u_65 = "useEffect"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return v_u_293(p625, p626)
        end,
        ["useImperativeHandle"] = function(p627, p628, p629)
            v_u_65 = "useImperativeHandle"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateImperativeHandle(p627, p628, p629)
        end,
        ["useLayoutEffect"] = function(p630, p631)
            v_u_65 = "useLayoutEffect"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return v_u_315(p630, p631)
        end,
        ["useMemo"] = function(p632, p633)
            v_u_65 = "useMemo"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local v634 = v_u_56.current
            v_u_56.current = v_u_73
            local v635 = { pcall(updateMemo, p632, p633) }
            v_u_56.current = v634
            if not v635[1] then
                error(v635[2])
            end
            return unpack(v635, 2)
        end,
        ["useReducer"] = function(p636, p637, p638)
            v_u_65 = "useReducer"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local v639 = v_u_56.current
            v_u_56.current = v_u_73
            local v640, v641, v642 = pcall(updateReducer, p636, p637, p638)
            v_u_56.current = v639
            if not v640 then
                error(v641)
            end
            return v641, v642
        end,
        ["useRef"] = function(p643)
            v_u_65 = "useRef"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateRef(p643)
        end,
        ["useBinding"] = function(p644)
            v_u_65 = "useBinding"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateBinding(p644)
        end,
        ["useState"] = function(p645)
            v_u_65 = "useState"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local v646 = v_u_56.current
            v_u_56.current = v_u_73
            local v647, v648, v649 = pcall(updateState, p645)
            v_u_56.current = v646
            if not v647 then
                error(v648)
            end
            return v648, v649
        end,
        ["useDebugValue"] = function(p650, p651)
            v_u_65 = "useDebugValue"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return v_u_330(p650, p651)
        end,
        ["useMutableSource"] = function(p652, p653, p654)
            v_u_65 = "useMutableSource"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateMutableSource(p652, p653, p654)
        end,
        ["useOpaqueIdentifier"] = function()
            v_u_65 = "useOpaqueIdentifier"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateOpaqueIdentifier()
        end,
        ["unstable_isNewReconciler"] = v15
    }
    local _ = {
        ["readContext"] = function(p655, p656)
            v_u_8.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return v_u_25(p655, p656)
        end,
        ["useCallback"] = function(p657, p658)
            v_u_65 = "useCallback"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateCallback(p657, p658)
        end,
        ["useContext"] = function(p659, p660)
            v_u_65 = "useContext"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return v_u_25(p659, p660)
        end,
        ["useEffect"] = function(p661, p662)
            v_u_65 = "useEffect"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return v_u_293(p661, p662)
        end,
        ["useImperativeHandle"] = function(p663, p664, p665)
            v_u_65 = "useImperativeHandle"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateImperativeHandle(p663, p664, p665)
        end,
        ["useLayoutEffect"] = function(p666, p667)
            v_u_65 = "useLayoutEffect"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return v_u_315(p666, p667)
        end,
        ["useMemo"] = function(p668, p669)
            v_u_65 = "useMemo"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local v670 = v_u_56.current
            v_u_56.current = v_u_73
            local v671 = { pcall(updateMemo, p668, p669) }
            v_u_56.current = v670
            if not v671[1] then
                error(v671[2])
            end
            return unpack(v671, 2)
        end,
        ["useReducer"] = function(p672, p673, p674)
            v_u_65 = "useReducer"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local v675 = v_u_56.current
            v_u_56.current = v_u_73
            local v676, v677, v678 = pcall(rerenderReducer, p672, p673, p674)
            v_u_56.current = v675
            if not v676 then
                error(v677)
            end
            return v677, v678
        end,
        ["useRef"] = function(p679)
            v_u_65 = "useRef"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateRef(p679)
        end,
        ["useBinding"] = function(p680)
            v_u_65 = "useBinding"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateBinding(p680)
        end,
        ["useState"] = function(p681)
            v_u_65 = "useState"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local v682 = v_u_56.current
            v_u_56.current = v_u_73
            local v683, v684, v685 = pcall(rerenderState, p681)
            v_u_56.current = v682
            if not v683 then
                error(v684)
            end
            return v684, v685
        end,
        ["useDebugValue"] = function(p686, p687)
            v_u_65 = "useDebugValue"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return v_u_330(p686, p687)
        end,
        ["useMutableSource"] = function(p688, p689, p690)
            v_u_65 = "useMutableSource"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateMutableSource(p688, p689, p690)
        end,
        ["useOpaqueIdentifier"] = function()
            v_u_65 = "useOpaqueIdentifier"
            v_u_8.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return rerenderOpaqueIdentifier()
        end,
        ["unstable_isNewReconciler"] = v15
    }
end
function v_u_58.renderWithHooks(p691, p692, p693, p694, p695, p696)
    v_u_59 = p696
    v_u_60 = p692
    if v_u_1 then
        local v697
        if p691 == nil then
            v697 = nil
        else
            v697 = p691._debugHookTypes
        end
        v_u_66 = v697
        v_u_67 = 0
    end
    p692.memoizedState = nil
    p692.updateQueue = nil
    p692.lanes = v_u_19
    if v_u_1 then
        if p691 == nil or p691.memoizedState == nil then
            if v_u_66 == nil then
                v_u_56.current = v_u_68
            else
                v_u_56.current = v_u_69
            end
        else
            v_u_56.current = v_u_70
        end
    else
        v_u_56.current = (p691 == nil or p691.memoizedState == nil) and v_u_372 or v_u_373
    end
    local v698 = p693(p694, p695)
    if v_u_64 then
        local v699 = 0
        while true do
            v_u_64 = false
            if v699 >= 25 then
                error(v_u_4.new("Too many re-renders. React limits the number of renders to prevent an infinite loop."))
            end
            v699 = v699 + 1
            v_u_61 = nil
            v_u_62 = nil
            p692.updateQueue = nil
            if v_u_1 then
                v_u_67 = 0
            end
            v_u_56.current = v_u_1 and v_u_71 or v_u_374
            v698 = p693(p694, p695)
            if not v_u_64 then
                goto l19
            end
        end
    else
        ::l19::
        v_u_56.current = v_u_371
        if v_u_1 then
            p692._debugHookTypes = v_u_66
        end
        local v700
        if v_u_61 == nil then
            v700 = false
        else
            v700 = v_u_61.next ~= nil
        end
        v_u_59 = v_u_19
        v_u_60 = nil
        v_u_61 = nil
        v_u_62 = nil
        if v_u_1 then
            v_u_65 = nil
            v_u_66 = nil
            v_u_67 = 0
        end
        v_u_63 = false
        if v700 then
            error(v_u_4.new("Rendered fewer hooks than expected. This may be caused by an accidental early return statement."))
        end
        return v698
    end
end
return v_u_58