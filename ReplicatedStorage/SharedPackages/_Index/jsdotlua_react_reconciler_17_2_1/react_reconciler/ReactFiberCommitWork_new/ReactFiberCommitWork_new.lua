--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberCommitWork.new (ModuleScript)

local function v_u_2(p1)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(p1))
    error("FIXME (roblox): " .. p1 .. " is unimplemented", 2)
end
local v_u_3 = _G.__DEV__
local v_u_4 = _G.__YOLO__
local v_u_5 = 0
local v_u_6 = require(script.Parent.Parent:WaitForChild("shared")).console
local v7 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_8 = v7.Error
local v_u_9 = v7.Set
local v10 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v11 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local v12 = require(script.Parent:WaitForChild("ReactHookEffectTags"))
local v_u_13 = require(script.Parent.Parent:WaitForChild("scheduler")).tracing.unstable_wrap
local v14 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_15 = v14.enableSchedulerTracing
local v_u_16 = v14.enableProfilerTimer
local v_u_17 = v14.enableProfilerCommitHooks
local v_u_18 = v14.enableSuspenseCallback
local v_u_19 = v14.enableDoubleInvokingEffects
local v20 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_21 = v20.FunctionComponent
local v_u_22 = v20.ForwardRef
local v_u_23 = v20.ClassComponent
local v_u_24 = v20.HostRoot
local v_u_25 = v20.HostComponent
local v_u_26 = v20.HostText
local v_u_27 = v20.HostPortal
local v_u_28 = v20.Profiler
local v_u_29 = v20.SuspenseComponent
local v_u_30 = v20.DehydratedFragment
local v_u_31 = v20.IncompleteClassComponent
local v_u_32 = v20.MemoComponent
local v_u_33 = v20.SimpleMemoComponent
local v_u_34 = v20.SuspenseListComponent
local v_u_35 = v20.FundamentalComponent
local v_u_36 = v20.ScopeComponent
local v_u_37 = v20.Block
local v_u_38 = v20.OffscreenComponent
local v_u_39 = v20.LegacyHiddenComponent
local v40 = require(script.Parent.Parent:WaitForChild("shared")).ReactErrorUtils
local v_u_41 = v40.invokeGuardedCallback
local v_u_42 = v40.hasCaughtError
local v_u_43 = v40.clearCaughtError
local v44 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_45 = v44.NoFlags
local v_u_46 = v44.ContentReset
local v_u_47 = v44.Placement
local v_u_48 = v44.Snapshot
local v_u_49 = v44.Update
local v_u_50 = v44.Callback
local v_u_51 = v44.LayoutMask
local v_u_52 = v44.PassiveMask
local v_u_53 = v44.Ref
local v_u_54 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_55 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_56 = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v_u_57 = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local v_u_58 = v_u_57.current
local v_u_59 = v_u_57.resetCurrentFiber
local v_u_60 = v_u_57.setCurrentFiber
local v_u_61 = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new")).onCommitUnmount
local v_u_62 = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local v63 = require(script.Parent:WaitForChild("ReactProfilerTimer.new"))
local v_u_64 = v63.startLayoutEffectTimer
local v_u_65 = v63.recordPassiveEffectDuration
local v_u_66 = v63.recordLayoutEffectDuration
local v_u_67 = v63.startPassiveEffectTimer
local v_u_68 = v63.getCommitTime
local v_u_69 = require(script.Parent:WaitForChild("ReactTypeOfMode")).ProfileMode
local v_u_70 = v11.commitUpdateQueue
local v_u_71 = v10.getPublicInstance
local v_u_72 = v10.supportsMutation
local v_u_73 = v10.supportsPersistence
local v_u_74 = v10.supportsHydration
local v_u_75 = v10.commitMount
local v_u_76 = v10.commitUpdate
local v_u_77 = v10.resetTextContent
local v_u_78 = v10.commitTextUpdate
local v_u_79 = v10.appendChild
local v_u_80 = v10.appendChildToContainer
local v_u_81 = v10.insertBefore
local v_u_82 = v10.insertInContainerBefore
local v_u_83 = v10.removeChild
local v_u_84 = v10.removeChildFromContainer
local v_u_85 = v10.hideInstance
local v_u_86 = v10.hideTextInstance
local v_u_87 = v10.unhideInstance
local v_u_88 = v10.unhideTextInstance
local v_u_89 = v10.commitHydratedSuspenseInstance
local v_u_90 = v10.clearContainer
local v_u_91 = nil
local function v_u_94(p92, p93)
    if not v_u_91 then
        v_u_91 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    v_u_91.resolveRetryWakeable(p92, p93)
end
local function v_u_95()
    v_u_6.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback())
end
local function v_u_97(_, _, p96)
    v_u_6.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle")
    error(p96)
end
local v_u_98 = v12.NoFlags
local v_u_99 = v12.HasEffect
local v_u_100 = v12.Layout
local v_u_101 = v12.Passive
local v_u_102 = nil
local function v_u_103()
    if not v_u_102 then
        v_u_102 = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).didWarnAboutReassigningProps
    end
    return v_u_102
end
local v_u_104 = nil
local v_u_105 = nil
local v_u_106 = nil
local v_u_107 = nil
local v_u_108 = nil
local v_u_109 = nil
local v_u_110 = nil
local v_u_111 = nil
local function v_u_118(p112, p_u_113)
    p_u_113.props = p112.memoizedProps
    p_u_113.state = p112.memoizedState
    if v_u_16 and v_u_17 then
        local v114 = p112.mode
        local v115 = v_u_69
        if bit32.band(v114, v115) ~= 0 then
            local v116, v117 = xpcall(function()
                v_u_64()
                p_u_113:componentWillUnmount()
            end, v_u_56)
            v_u_66(p112)
            if not v116 then
                error(v117)
                return
            end
            ::l6::
            return
        end
    end
    p_u_113:componentWillUnmount()
    goto l6
end
function safelyCallComponentWillUnmount(p119, p120, p121)
    local v122, v123 = xpcall(v_u_118, v_u_56, p119, p120)
    if not v122 then
        v_u_97(p119, p121, v123)
    end
end
local function v129(p124, p125, p126)
    local v127, v128 = xpcall(p126, v_u_56)
    if not v127 then
        v_u_97(p124, p125, v128)
    end
end
local function v_u_141(p130, p131, p132)
    local v133 = p131.updateQueue
    local v134
    if v133 == nil then
        v134 = nil
    else
        v134 = v133.lastEffect
    end
    if v134 == nil then
        ::l4::
        return
    else
        local v135 = v134.next
        local v136 = v135
        while true do
            local v137 = v135.tag
            if bit32.band(v137, p130) == p130 then
                local v138 = v135.destroy
                v135.destroy = nil
                if v138 ~= nil then
                    local v139, v140 = xpcall(v138, v_u_56)
                    if not v139 then
                        v_u_97(p131, p132, v140)
                    end
                end
            end
            v135 = v135.next
            if v135 == v136 then
                goto l4
            end
        end
    end
end
local function v_u_152(p142, p143)
    local v144 = p143.updateQueue
    local v145
    if v144 == nil then
        v145 = nil
    else
        v145 = v144.lastEffect
    end
    if v145 == nil then
        ::l5::
        return
    else
        local v146 = v145.next
        local v147 = v146
        while true do
            local v148 = v146.tag
            if bit32.band(v148, p142) == p142 then
                v146.destroy = v146.create()
                if v_u_3 then
                    local v149 = v146.destroy
                    if v149 ~= nil and typeof(v149) ~= "function" then
                        local v150
                        if v149 == nil then
                            v150 = " You returned nil. If your effect does not require clean up, return nil (or nothing)."
                        else
                            local v151 = v149.andThen
                            v150 = typeof(v151) == "function" and "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:\n\nuseEffect(function()\n  function fetchData()\n    -- You can await here\n    local response = MyAPI.getData(someId):await()\n    -- ...\n  end\n  fetchData()\nend, {someId}) -- Or {} if effect doesn\'t need props or state\n\nLearn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" or " You returned: " .. v149
                        end
                        v_u_6.error("An effect function must not return anything besides a function, which is used for clean-up.%s", v150)
                    end
                end
            end
            v146 = v146.next
            if v146 == v147 then
                goto l5
            end
        end
    end
end
function commitProfilerPassiveEffect(p153, p154)
    if v_u_16 and (v_u_17 and p154.tag == v_u_28) then
        local v155 = p154.stateNode.passiveEffectDuration
        local v156 = p154.memoizedProps.id
        local v157 = p154.memoizedProps.onPostCommit
        local v158 = v_u_68()
        if typeof(v157) == "function" then
            if v_u_15 then
                v157(v156, p154.alternate == nil and "mount" or "update", v155, v158, p153.memoizedInteractions)
                return
            end
            v157(v156, p154.alternate == nil and "mount" or "update", v155, v158)
        end
    end
end
local function v_u_200(p_u_159, p160, p161, p162)
    if p161 ~= nil then
        v_u_97 = p161
    end
    if p162 ~= nil then
        v_u_95 = p162
    end
    local v163 = p_u_159.flags
    local v164 = p_u_159.tag
    if v164 == v_u_28 then
        local v165
        if v_u_16 and v_u_17 then
            v165 = v_u_111
            v_u_111 = p_u_159
        else
            v165 = nil
        end
        local v166 = p_u_159.child
        while v166 ~= nil do
            local v167 = p_u_159.subtreeFlags
            local v168 = v_u_51
            if bit32.band(v167, v168) ~= v_u_45 then
                if v_u_3 then
                    local v169 = v_u_58
                    v_u_60(v166)
                    v_u_41(nil, v_u_200, nil, v166, p160, v_u_97, v_u_95)
                    if v_u_42() then
                        v_u_97(v166, p_u_159, (v_u_43()))
                    end
                    if v169 == nil then
                        v_u_59()
                    else
                        v_u_60(v169)
                    end
                else
                    local v170, v171 = xpcall(v_u_200, v_u_56, v166, p160, v_u_97, v_u_95)
                    if not v170 then
                        v_u_97(v166, p_u_159, v171)
                    end
                end
            end
            v166 = v166.sibling
        end
        local v172 = v_u_49
        local v173 = v_u_50
        local v174 = bit32.bor(v172, v173)
        if bit32.band(v163, v174) ~= v_u_45 and v_u_16 then
            if v_u_3 then
                local v175 = v_u_58
                v_u_60(p_u_159)
                v_u_41(nil, commitLayoutEffectsForProfiler, nil, p_u_159, p160)
                if v_u_42() then
                    local v176 = v_u_43()
                    v_u_97(p_u_159, p_u_159.return_, v176)
                end
                if v175 == nil then
                    v_u_59()
                else
                    v_u_60(v175)
                end
            else
                local v177, v178 = xpcall(commitLayoutEffectsForProfiler, v_u_56, p_u_159, p160)
                if not v177 then
                    v_u_97(p_u_159, p_u_159.return_, v178)
                end
            end
        end
        if v_u_16 and v_u_17 then
            if v165 ~= nil then
                local v179 = v165.stateNode
                v179.effectDuration = v179.effectDuration + p_u_159.stateNode.effectDuration
            end
            v_u_111 = v165
            return
        end
        ::l33::
        return
    end
    local v180 = p_u_159.child
    while v180 ~= nil do
        local v181 = p_u_159.subtreeFlags
        local v182 = v_u_51
        if bit32.band(v181, v182) ~= v_u_45 then
            if v_u_3 then
                local v183 = v_u_57.current
                v_u_60(v180)
                if v_u_5 < 20 then
                    v_u_5 = v_u_5 + 1
                    v_u_41(nil, v_u_200, nil, v180, p160, v_u_97, v_u_95)
                    v_u_5 = v_u_5 - 1
                    if v_u_42() then
                        v_u_97(v180, p_u_159, (v_u_43()))
                    end
                else
                    v_u_200(v180, p160, v_u_97, v_u_95)
                end
                if v183 == nil then
                    v_u_59()
                else
                    v_u_60(v183)
                end
            else
                local v184 = nil
                local v185
                if v_u_4 or v_u_5 >= 20 then
                    v_u_200(v180, p160, v_u_97, v_u_95)
                    v185 = true
                else
                    v_u_5 = v_u_5 + 1
                    v185, v184 = xpcall(v_u_200, v_u_56, v180, p160, v_u_97, v_u_95)
                    v_u_5 = v_u_5 - 1
                end
                if not v185 then
                    v_u_97(v180, p_u_159, v184)
                end
            end
        end
        v180 = v180.sibling
    end
    local v186 = v_u_49
    local v187 = v_u_50
    local v188 = bit32.bor(v186, v187)
    if bit32.band(v163, v188) == v_u_45 then
        ::l56::
        local v189 = v_u_53
        if bit32.band(v163, v189) ~= 0 then
            commitAttachRef(p_u_159)
        end
        goto l33
    end
    if v164 ~= v_u_21 and (v164 ~= v_u_22 and (v164 ~= v_u_33 and v164 ~= v_u_37)) then
        if v164 == v_u_23 then
            v_u_109(p_u_159)
        elseif v164 == v_u_24 then
            v_u_107(p_u_159)
        elseif v164 == v_u_25 then
            v_u_108(p_u_159)
        elseif v164 == v_u_29 then
            commitSuspenseHydrationCallbacks(p160, p_u_159)
        elseif v164 ~= v_u_35 and (v164 ~= v_u_27 and (v164 ~= v_u_26 and (v164 ~= v_u_31 and (v164 ~= v_u_39 and (v164 ~= v_u_38 and (v164 ~= v_u_36 and v164 ~= v_u_34)))))) then
            v_u_55(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
        end
        goto l56
    end
    if v_u_16 and v_u_17 then
        local v190 = p_u_159.mode
        local v191 = v_u_69
        if bit32.band(v190, v191) ~= 0 then
            local v194, v195 = xpcall(function()
                v_u_64()
                local v192 = v_u_100
                local v193 = v_u_99
                v_u_152(bit32.bor(v192, v193), p_u_159)
            end, v_u_56)
            v_u_66(p_u_159)
            if not v194 then
                error(v195)
            end
            ::l67::
            local v196 = p_u_159.subtreeFlags
            local v197 = v_u_52
            if bit32.band(v196, v197) ~= v_u_45 then
                v_u_95()
            end
            goto l56
        end
    end
    local v198 = v_u_100
    local v199 = v_u_99
    v_u_152(bit32.bor(v198, v199), p_u_159)
    goto l67
end
function commitLayoutEffectsForProfiler(p201, p202)
    if v_u_16 then
        local v203 = p201.flags
        local v204 = p201.alternate
        local v205 = p201.memoizedProps.onCommit
        local v206 = p201.memoizedProps.onRender
        local v207 = p201.stateNode.effectDuration
        local v208 = v_u_68()
        local v209 = v_u_49
        local v210 = v_u_50
        if bit32.band(v203, v209) ~= v_u_45 then
            local v211
            if typeof(v206) == "function" then
                v211 = true
            elseif typeof(v206) == "table" then
                local v212 = getmetatable(v206)
                v211 = v212 and rawget(v212, "__call") and true or (v206._isMockFunction and true or false)
            else
                v211 = false
            end
            if v211 then
                if v_u_15 then
                    v206(p201.memoizedProps.id, v204 == nil and "mount" or "update", p201.actualDuration, p201.treeBaseDuration, p201.actualStartTime, v208, p202.memoizedInteractions)
                else
                    v206(p201.memoizedProps.id, v204 == nil and "mount" or "update", p201.actualDuration, p201.treeBaseDuration, p201.actualStartTime, v208)
                end
            end
        end
        if v_u_17 and bit32.band(v203, v210) ~= v_u_45 then
            local v213
            if typeof(v205) == "function" then
                v213 = true
            elseif typeof(v205) == "table" then
                local v214 = getmetatable(v205)
                v213 = v214 and rawget(v214, "__call") and true or (v205._isMockFunction and true or false)
            else
                v213 = false
            end
            if v213 then
                if v_u_15 then
                    v205(p201.memoizedProps.id, v204 == nil and "mount" or "update", v207, v208, p202.memoizedInteractions)
                    return
                end
                v205(p201.memoizedProps.id, v204 == nil and "mount" or "update", v207, v208)
            end
        end
    end
end
v_u_109 = function(p215)
    local v_u_216 = p215.stateNode
    local v217 = p215.alternate
    local v218 = p215.flags
    local v219 = v_u_49
    if bit32.band(v218, v219) == 0 then
        ::l2::
        local v220 = p215.updateQueue
        if v220 ~= nil then
            if v_u_3 and (p215.type == p215.elementType and not v_u_103) then
                if v_u_216.props ~= p215.memoizedProps then
                    v_u_6.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_54(p215.type) or "instance")
                end
                if v_u_216.state ~= p215.memoizedState then
                    v_u_6.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_54(p215.type) or "instance")
                end
            end
            v_u_70(p215, v220, v_u_216)
        end
        return
    else
        if v217 ~= nil then
            local v_u_221 = p215.elementType == p215.type and v217.memoizedProps or v_u_62(p215.type, v217.memoizedProps)
            local v_u_222 = v217.memoizedState
            if v_u_3 and (p215.type == p215.elementType and not v_u_103) then
                if v_u_216.props ~= p215.memoizedProps then
                    v_u_6.error("Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_54(p215.type) or "instance")
                end
                if v_u_216.state ~= p215.memoizedState then
                    v_u_6.error("Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_54(p215.type) or "instance")
                end
            end
            if v_u_16 and v_u_17 then
                local v223 = p215.mode
                local v224 = v_u_69
                if bit32.band(v223, v224) ~= 0 then
                    local v225, v226 = xpcall(function()
                        v_u_64()
                        v_u_216:componentDidUpdate(v_u_221, v_u_222, v_u_216.__reactInternalSnapshotBeforeUpdate)
                    end, v_u_56)
                    v_u_66(p215)
                    if not v225 then
                        error(v226)
                    end
                    goto l2
                end
            end
            v_u_216:componentDidUpdate(v_u_221, v_u_222, v_u_216.__reactInternalSnapshotBeforeUpdate)
            goto l2
        end
        if v_u_3 and (p215.type == p215.elementType and not v_u_103) then
            if v_u_216.props ~= p215.memoizedProps then
                v_u_6.error("Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_54(p215.type) or "instance")
            end
            if v_u_216.state ~= p215.memoizedState then
                v_u_6.error("Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_54(p215.type) or "instance")
            end
        end
        if v_u_16 and v_u_17 then
            local v227 = p215.mode
            local v228 = v_u_69
            if bit32.band(v227, v228) ~= 0 then
                local v229, v230 = xpcall(function()
                    v_u_64()
                    v_u_216:componentDidMount()
                end, v_u_56)
                v_u_66(p215)
                if not v229 then
                    error(v230)
                end
                goto l2
            end
        end
        v_u_216:componentDidMount()
        goto l2
    end
end
v_u_107 = function(p231)
    local v232 = p231.updateQueue
    if v232 ~= nil then
        local v233 = nil
        if p231.child ~= nil then
            local v234 = p231.child
            if v234.tag == v_u_25 then
                v233 = v_u_71(v234.stateNode)
            elseif v234.tag == v_u_23 then
                v233 = v234.stateNode
            end
        end
        v_u_70(p231, v232, v233)
    end
end
v_u_108 = function(p235)
    local v236 = p235.stateNode
    if p235.alternate == nil then
        local v237 = p235.flags
        local v238 = v_u_49
        if bit32.band(v237, v238) ~= 0 then
            v_u_75(v236, p235.type, p235.memoizedProps, p235)
        end
    end
end
local function v_u_244(p239, p240)
    if not v_u_72 then
        return
    end
    local v241 = p239
    while true do
        while p239.tag == v_u_25 do
            local v242 = p239.stateNode
            if p240 then
                v_u_85(v242)
            else
                v_u_87(p239.stateNode, p239.memoizedProps)
            end
            ::l7::
            if p239 == v241 then
                return
            end
            while p239.sibling == nil do
                if p239.return_ == nil or p239.return_ == v241 then
                    return
                end
                p239 = p239.return_
            end
            p239.sibling.return_ = p239.return_
            p239 = p239.sibling
        end
        if p239.tag == v_u_26 then
            local v243 = p239.stateNode
            if p240 then
                v_u_86(v243)
            else
                v_u_88(v243, p239.memoizedProps)
            end
            goto l7
        end
        if (p239.tag == v_u_38 or p239.tag == v_u_39) and (p239.memoizedState ~= nil and p239 ~= v241) or p239.child == nil then
            goto l7
        end
        p239.child.return_ = p239
        p239 = p239.child
    end
end
function commitAttachRef(p245)
    local v246 = p245.ref
    if v246 ~= nil then
        local v247 = p245.stateNode
        if p245.tag == v_u_25 then
            v247 = v_u_71(v247)
        end
        if typeof(v246) == "function" then
            v246(v247)
            return
        end
        if v_u_3 and typeof(v246) ~= "table" then
            v_u_6.error("Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().", v_u_54(p245.type) or "instance")
            return
        end
        v246.current = v247
    end
end
function commitDetachRef(p248)
    local v249 = p248.ref
    if v249 ~= nil then
        if typeof(v249) == "function" then
            v249(nil)
            return
        end
        v249.current = nil
    end
end
local function v_u_250()
    -- failed to decompile
end
local function v_u_256(p251, p252, p253, p254)
    local v255 = p252
    while true do
        while true do
            v_u_250(p251, p252, p253, p254)
            if p252.child ~= nil and (not v_u_72 or p252.tag ~= v_u_27) then
                break
            end
            if p252 == v255 then
                return
            end
            while p252.sibling == nil do
                if p252.return_ == nil or p252.return_ == v255 then
                    return
                end
                p252 = p252.return_
            end
            p252.sibling.return_ = p252.return_
            p252 = p252.sibling
        end
        p252.child.return_ = p252
        p252 = p252.child
    end
end
local function v_u_259(p257)
    local v258 = p257.return_
    while v258 ~= nil do
        if v_u_104(v258) then
            return v258
        end
        v258 = v258.return_
    end
    error(v_u_8.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
end
v_u_104 = function(p260)
    return (p260.tag == v_u_25 or p260.tag == v_u_24) and true or p260.tag == v_u_27
end
local function v_u_267(p261)
    while true do
        local v262 = false
        while p261.sibling == nil do
            if p261.return_ == nil or v_u_104(p261.return_) then
                return nil
            end
            p261 = p261.return_
        end
        p261.sibling.return_ = p261.return_
        p261 = p261.sibling
        while p261.tag ~= v_u_25 and (p261.tag ~= v_u_26 and p261.tag ~= v_u_30) do
            local v263 = p261.flags
            local v264 = v_u_47
            if bit32.band(v263, v264) ~= 0 or (p261.child == nil or p261.tag == v_u_27) then
                v262 = true
                break
            end
            p261.child.return_ = p261
            p261 = p261.child
        end
        if not v262 then
            local v265 = p261.flags
            local v266 = v_u_47
            if bit32.band(v265, v266) == 0 then
                return p261.stateNode
            end
        end
    end
end
local function v279(p268)
    if v_u_72 then
        local v269 = v_u_259(p268)
        local v270 = nil
        local v271 = nil
        local v272 = v269.stateNode
        if v269.tag == v_u_25 then
            v270 = v272
            v271 = false
        elseif v269.tag == v_u_24 then
            v270 = v272.containerInfo
            v271 = true
        elseif v269.tag == v_u_27 then
            v270 = v272.containerInfo
            v271 = true
        else
            v_u_55(false, "Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.")
        end
        local v273 = v269.flags
        local v274 = v_u_46
        if bit32.band(v273, v274) ~= 0 then
            v_u_77(v270)
            local v275 = v269.flags
            local v276 = v_u_46
            local v277 = bit32.bnot(v276)
            v269.flags = bit32.band(v275, v277)
        end
        local v278 = v_u_267(p268)
        if v271 then
            v_u_106(p268, v278, v270)
        else
            v_u_105(p268, v278, v270)
        end
    else
        return
    end
end
v_u_106 = function(p280, p281, p282)
    local v283 = p280.tag
    if v283 == v_u_25 and true or v283 == v_u_26 then
        local v284 = p280.stateNode
        if p281 then
            v_u_82(p282, v284, p281)
        else
            v_u_80(p282, v284)
        end
    elseif v283 ~= v_u_27 then
        local v285 = p280.child
        if v285 ~= nil then
            v_u_106(v285, p281, p282)
            local v286 = v285.sibling
            while v286 ~= nil do
                v_u_106(v286, p281, p282)
                v286 = v286.sibling
            end
        end
    end
end
v_u_105 = function(p287, p288, p289)
    local v290 = p287.tag
    if v290 == v_u_25 and true or v290 == v_u_26 then
        local v291 = p287.stateNode
        if p288 then
            v_u_81(p289, v291, p288)
        else
            v_u_79(p289, v291)
        end
    elseif v290 ~= v_u_27 then
        local v292 = p287.child
        if v292 ~= nil then
            v_u_105(v292, p288, p289)
            local v293 = v292.sibling
            while v293 ~= nil do
                v_u_105(v293, p288, p289)
                v293 = v293.sibling
            end
        end
    end
end
v_u_110 = function(p294, p295, p296, p297)
    local v298 = p295
    local v299 = false
    local v300 = nil
    local v301 = nil
    while v299 do
        ::l2::
        if p295.tag == v_u_25 or p295.tag == v_u_26 then
            v_u_256(p294, p295, p296, p297)
            if v300 then
                v_u_84(v301, p295.stateNode)
            else
                v_u_83(v301, p295.stateNode)
            end
            ::l18::
            if p295 == v298 then
                return
            end
            while p295.sibling == nil do
                if p295.return_ == nil or p295.return_ == v298 then
                    return
                end
                p295 = p295.return_
                if p295.tag == v_u_27 then
                    v299 = false
                end
            end
            p295.sibling.return_ = p295.return_
            p295 = p295.sibling
        elseif p295.tag == v_u_27 then
            if p295.child == nil then
                goto l18
            end
            v301 = p295.stateNode.containerInfo
            p295.child.return_ = p295
            p295 = p295.child
            v300 = true
        else
            v_u_250(p294, p295, p296, p297)
            if p295.child == nil then
                goto l18
            end
            p295.child.return_ = p295
            p295 = p295.child
        end
    end
    local v302 = p295.return_
    while true do
        if v302 == nil then
            error(v_u_8.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
        end
        v301 = v302.stateNode
        if v302.tag == v_u_25 then
            v300 = false
            break
        end
        if v302.tag == v_u_24 then
            v301 = v301.containerInfo
            v300 = true
            break
        end
        if v302.tag == v_u_27 then
            v301 = v301.containerInfo
            v300 = true
            break
        end
        v302 = v302.return_
    end
    v299 = true
    goto l2
end
local function v310(p303, p304, p305, p306)
    v_u_110(p303, p304, p305, p306)
    local v307 = p304.alternate
    local v308 = p304.alternate
    if v308 ~= nil then
        v308.return_ = nil
        p304.alternate = nil
    end
    p304.return_ = nil
    if v307 ~= nil then
        local v309 = v307.alternate
        if v309 ~= nil then
            v309.return_ = nil
            v307.alternate = nil
        end
        v307.return_ = nil
    end
end
function commitSuspenseComponent(p311)
    local v312 = p311.memoizedState
    if v312 ~= nil then
        if not v_u_91 then
            v_u_91 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
        end
        v_u_91.markCommitTimeOfFallback()
        if v_u_72 then
            v_u_244(p311.child, true)
        end
    end
    if v_u_18 and v312 ~= nil then
        local v313 = p311.memoizedProps.suspenseCallback
        if typeof(v313) == "function" then
            local v314 = p311.updateQueue
            if v314 ~= nil then
                v313(table.clone(v314))
                return
            end
        elseif v_u_3 and v313 ~= nil then
            v_u_6.error("Unexpected type for suspenseCallback: %s", (tostring(v313)))
        end
    end
end
function commitSuspenseHydrationCallbacks(p315, p316)
    if v_u_74 then
        if p316.memoizedState == nil then
            local v317 = p316.alternate
            if v317 ~= nil then
                local v318 = v317.memoizedState
                if v318 ~= nil then
                    local v319 = v318.dehydrated
                    if v319 ~= nil then
                        v_u_89(v319)
                        if v_u_18 then
                            local v320 = p315.hydrationCallbacks
                            local v321 = v320 ~= nil and v320.onHydrated
                            if v321 then
                                v321(v319)
                            end
                        end
                    end
                end
            end
        end
    end
end
function attachSuspenseRetryListeners(p_u_322)
    local v323 = p_u_322.updateQueue
    if v323 ~= nil then
        p_u_322.updateQueue = nil
        local v324 = p_u_322.stateNode
        if v324 == nil then
            p_u_322.stateNode = v_u_9.new()
            v324 = p_u_322.stateNode
        end
        for v_u_325, _ in v323 do
            local function v_u_326()
                return v_u_94(p_u_322, v_u_325)
            end
            if not v324:has(v_u_325) then
                if v_u_15 and v_u_325.__reactDoNotTraceInteractions ~= true then
                    v_u_326 = v_u_13(v_u_326)
                end
                v324:add(v_u_325)
                v_u_325:andThen(function()
                    return v_u_326()
                end, function()
                    return v_u_326()
                end)
            end
        end
    end
end
function isSuspenseBoundaryBeingHidden(p327, p328)
    if p327 ~= nil then
        local v329 = p327.memoizedState
        if v329 == nil or v329.dehydrated ~= nil then
            local v330 = p328.memoizedState
            local v331
            if v330 == nil then
                v331 = false
            else
                v331 = v330.dehydrated == nil
            end
            return v331
        end
    end
    return false
end
function commitResetTextContent(p332)
    if v_u_72 then
        v_u_77(p332.stateNode)
    end
end
function invokeLayoutEffectMountInDEV(p333)
    if v_u_3 and v_u_19 then
        if p333.tag == v_u_21 or (p333.tag == v_u_22 or (p333.tag == v_u_33 or p333.tag == v_u_37)) then
            local v334 = v_u_100
            local v335 = v_u_99
            v_u_41(nil, v_u_152, nil, bit32.bor(v334, v335), p333)
            if v_u_42() then
                local v336 = v_u_43()
                v_u_97(p333, p333.return_, v336)
            end
            return
        end
    elseif p333.tag == v_u_23 then
        local v337 = p333.stateNode
        v_u_41(nil, v337.componentDidMount, v337)
        if v_u_42() then
            local v338 = v_u_43()
            v_u_97(p333, p333.return_, v338)
        end
        return
    end
end
function invokePassiveEffectMountInDEV(p339)
    if v_u_3 and (v_u_19 and (p339.tag == v_u_21 or (p339.tag == v_u_22 or (p339.tag == v_u_33 or p339.tag == v_u_37)))) then
        local v340 = v_u_101
        local v341 = v_u_99
        v_u_41(nil, v_u_152, nil, bit32.bor(v340, v341), p339)
        if v_u_42() then
            local v342 = v_u_43()
            v_u_97(p339, p339.return_, v342)
        end
    end
end
function invokeLayoutEffectUnmountInDEV(p343)
    if v_u_3 and v_u_19 then
        if p343.tag == v_u_21 or (p343.tag == v_u_22 or (p343.tag == v_u_33 or p343.tag == v_u_37)) then
            local v344 = v_u_100
            local v345 = v_u_99
            v_u_41(nil, v_u_141, nil, bit32.bor(v344, v345), p343, p343.return_)
            if v_u_42() then
                local v346 = v_u_43()
                v_u_97(p343, p343.return_, v346)
            end
            return
        end
    elseif p343.tag == v_u_23 then
        local v347 = p343.stateNode
        local v348 = v347.componentWillUnmount
        if typeof(v348) == "function" then
            safelyCallComponentWillUnmount(p343, v347, p343.return_)
        end
        return
    end
end
function invokePassiveEffectUnmountInDEV(p349)
    if v_u_3 and (v_u_19 and (p349.tag == v_u_21 or (p349.tag == v_u_22 or (p349.tag == v_u_33 or p349.tag == v_u_37)))) then
        local v350 = v_u_101
        local v351 = v_u_99
        v_u_41(nil, v_u_141, nil, bit32.bor(v350, v351), p349, p349.return_)
        if v_u_42() then
            local v352 = v_u_43()
            v_u_97(p349, p349.return_, v352)
        end
    end
end
return {
    ["safelyCallDestroy"] = v129,
    ["commitBeforeMutationLifeCycles"] = function(p353, p354)
        if p354.tag == v_u_21 or (p354.tag == v_u_22 or (p354.tag == v_u_33 or p354.tag == v_u_37)) then
            return
        elseif p354.tag == v_u_23 then
            local v355 = p354.flags
            local v356 = v_u_48
            if bit32.band(v355, v356) ~= 0 and p353 ~= nil then
                local v357 = p353.memoizedProps
                local v358 = p353.memoizedState
                local v359 = p354.stateNode
                if v_u_3 and (p354.type == p354.elementType and not v_u_103) then
                    if v359.props ~= p354.memoizedProps then
                        v_u_6.error("Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", v_u_54(p354.type) or "instance")
                    end
                    if v359.state ~= p354.memoizedState then
                        v_u_6.error("Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", v_u_54(p354.type) or "instance")
                    end
                end
                v359.__reactInternalSnapshotBeforeUpdate = v359:getSnapshotBeforeUpdate(p354.elementType == p354.type and v357 and v357 or v_u_62(p354.type, v357), v358)
            end
            return
        elseif p354.tag == v_u_24 then
            if v_u_72 then
                local v360 = p354.flags
                local v361 = v_u_48
                if bit32.band(v360, v361) ~= 0 then
                    v_u_90(p354.stateNode.containerInfo)
                end
            end
            return
        elseif p354.tag ~= v_u_25 and (p354.tag ~= v_u_26 and (p354.tag ~= v_u_27 and p354.tag ~= v_u_31)) then
            v_u_55(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
        end
    end,
    ["commitResetTextContent"] = commitResetTextContent,
    ["commitPlacement"] = v279,
    ["commitDeletion"] = v310,
    ["commitWork"] = function(p362, p_u_363)
        if p_u_363.tag ~= v_u_21 and (p_u_363.tag ~= v_u_22 and (p_u_363.tag ~= v_u_32 and (p_u_363.tag ~= v_u_33 and p_u_363.tag ~= v_u_37))) then
            if p_u_363.tag == v_u_23 then
                return
            elseif p_u_363.tag == v_u_25 then
                local v364 = p_u_363.stateNode
                if v364 ~= nil then
                    local v365 = p_u_363.memoizedProps
                    local v366
                    if p362 then
                        v366 = p362.memoizedProps
                    else
                        v366 = v365
                    end
                    local v367 = p_u_363.type
                    local v368 = p_u_363.updateQueue
                    p_u_363.updateQueue = nil
                    if v368 ~= nil then
                        v_u_76(v364, v368, v367, v366, v365, p_u_363)
                    end
                end
                return
            elseif p_u_363.tag == v_u_26 then
                v_u_55(p_u_363.stateNode ~= nil, "This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue.")
                local v369 = p_u_363.stateNode
                local v370 = p_u_363.memoizedProps
                local v371
                if p362 == nil then
                    v371 = nil
                else
                    local _ = p362.memoizedProps
                    v371 = v370
                end
                v_u_78(v369, v371, v370)
                return
            elseif p_u_363.tag == v_u_24 then
                if v_u_74 then
                    local v372 = p_u_363.stateNode
                    if v372.hydrate then
                        v372.hydrate = false
                        v_u_2("commitWork: HostRoot: commitHydratedContainer")
                    end
                end
                return
            elseif p_u_363.tag == v_u_28 then
                return
            elseif p_u_363.tag == v_u_29 then
                commitSuspenseComponent(p_u_363)
                attachSuspenseRetryListeners(p_u_363)
            else
                if p_u_363.tag == v_u_34 then
                    v_u_2("commitWork: SuspenseListComponent")
                else
                    if p_u_363.tag == v_u_31 then
                        return
                    end
                    if p_u_363.tag == v_u_38 or p_u_363.tag == v_u_39 then
                        v_u_244(p_u_363, p_u_363.memoizedState ~= nil)
                        return
                    end
                end
                v_u_55(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
            end
        end
        if v_u_16 and v_u_17 then
            local v373 = p_u_363.mode
            local v374 = v_u_69
            if bit32.band(v373, v374) ~= 0 then
                local v377, v378 = xpcall(function()
                    v_u_64()
                    local v375 = v_u_100
                    local v376 = v_u_99
                    v_u_141(bit32.bor(v375, v376), p_u_363, p_u_363.return_)
                end, v_u_56)
                v_u_66(p_u_363)
                if not v377 then
                    error(v378)
                    return
                end
                ::l12::
                return
            end
        end
        local v379 = v_u_100
        local v380 = v_u_99
        v_u_141(bit32.bor(v379, v380), p_u_363, p_u_363.return_)
        goto l12
    end,
    ["commitAttachRef"] = commitAttachRef,
    ["commitDetachRef"] = commitDetachRef,
    ["commitPassiveUnmount"] = function(p381)
        if p381.tag == v_u_21 or (p381.tag == v_u_22 or (p381.tag == v_u_33 or p381.tag == v_u_37)) then
            if v_u_16 and v_u_17 then
                local v382 = p381.mode
                local v383 = v_u_69
                if bit32.band(v382, v383) ~= 0 then
                    v_u_67()
                    local v384 = v_u_101
                    local v385 = v_u_99
                    v_u_141(bit32.bor(v384, v385), p381, p381.return_)
                    v_u_65(p381)
                    return
                end
            end
            local v386 = v_u_101
            local v387 = v_u_99
            v_u_141(bit32.bor(v386, v387), p381, p381.return_)
        end
    end,
    ["commitPassiveUnmountInsideDeletedTree"] = function(p388, p389)
        if p388.tag == v_u_21 or (p388.tag == v_u_22 or (p388.tag == v_u_33 or p388.tag == v_u_37)) then
            if v_u_16 and v_u_17 then
                local v390 = p388.mode
                local v391 = v_u_69
                if bit32.band(v390, v391) ~= 0 then
                    v_u_67()
                    v_u_141(v_u_101, p388, p389)
                    v_u_65(p388)
                    return
                end
            end
            v_u_141(v_u_101, p388, p389)
        end
    end,
    ["commitPassiveMount"] = function(p392, p393)
        if p393.tag == v_u_21 or (p393.tag == v_u_22 or (p393.tag == v_u_33 or p393.tag == v_u_37)) then
            if v_u_16 and v_u_17 then
                local v394 = p393.mode
                local v395 = v_u_69
                if bit32.band(v394, v395) ~= 0 then
                    v_u_67()
                    local v396 = v_u_101
                    local v397 = v_u_99
                    local v398, v399 = xpcall(v_u_152, v_u_56, bit32.bor(v396, v397), p393)
                    v_u_65(p393)
                    if not v398 then
                        error(v399)
                        return
                    end
                    ::l11::
                    return
                end
            end
            local v400 = v_u_101
            local v401 = v_u_99
            v_u_152(bit32.bor(v400, v401), p393)
            return
        else
            if p393.tag == v_u_28 then
                commitProfilerPassiveEffect(p392, p393)
            end
            goto l11
        end
    end,
    ["invokeLayoutEffectMountInDEV"] = invokeLayoutEffectMountInDEV,
    ["invokeLayoutEffectUnmountInDEV"] = invokeLayoutEffectUnmountInDEV,
    ["invokePassiveEffectMountInDEV"] = invokePassiveEffectMountInDEV,
    ["invokePassiveEffectUnmountInDEV"] = invokePassiveEffectUnmountInDEV,
    ["isSuspenseBoundaryBeingHidden"] = isSuspenseBoundaryBeingHidden,
    ["recursivelyCommitLayoutEffects"] = v_u_200
}