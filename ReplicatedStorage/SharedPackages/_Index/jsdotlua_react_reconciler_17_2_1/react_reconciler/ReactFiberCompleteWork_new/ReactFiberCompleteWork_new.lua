--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberCompleteWork.new (ModuleScript)

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v_u_2 = v1.OffscreenLane
local v3 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local v_u_4 = require(script.Parent:WaitForChild("ReactMutableSource.new")).resetWorkInProgressVersions
local v5 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_6 = v5.IndeterminateComponent
local v_u_7 = v5.FunctionComponent
local v_u_8 = v5.ClassComponent
local v_u_9 = v5.HostRoot
local v_u_10 = v5.HostComponent
local v_u_11 = v5.HostText
local v_u_12 = v5.HostPortal
local v_u_13 = v5.ContextProvider
local v_u_14 = v5.ContextConsumer
local v_u_15 = v5.ForwardRef
local v_u_16 = v5.Fragment
local v_u_17 = v5.Mode
local v_u_18 = v5.Profiler
local v_u_19 = v5.SuspenseComponent
local v_u_20 = v5.SuspenseListComponent
local v_u_21 = v5.MemoComponent
local v_u_22 = v5.SimpleMemoComponent
local v_u_23 = v5.LazyComponent
local v_u_24 = v5.IncompleteClassComponent
local v_u_25 = v5.FundamentalComponent
local v_u_26 = v5.ScopeComponent
local v_u_27 = v5.Block
local v_u_28 = v5.OffscreenComponent
local v_u_29 = v5.LegacyHiddenComponent
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v30 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local v_u_31 = v30.NoMode
local v_u_32 = v30.ConcurrentMode
local v_u_33 = v30.BlockingMode
local v_u_34 = v30.ProfileMode
local v35 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_36 = v35.Ref
local v_u_37 = v35.Update
local v_u_38 = v35.Callback
local v_u_39 = v35.Passive
local v_u_40 = v35.Deletion
local v_u_41 = v35.NoFlags
local v_u_42 = v35.DidCapture
local v_u_43 = v35.Snapshot
local v_u_44 = v35.MutationMask
local v_u_45 = v35.LayoutMask
local v_u_46 = v35.PassiveMask
local v_u_47 = v35.StaticMask
local v_u_48 = v35.PerformedWork
local v_u_49 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_50 = v3.createInstance
local v_u_51 = v3.createTextInstance
local v_u_52 = v3.appendInitialChild
local v_u_53 = v3.finalizeInitialChildren
local v_u_54 = v3.prepareUpdate
local v_u_55 = v3.supportsMutation
local v_u_56 = v3.supportsPersistence
local v_u_57 = v3.createContainerChildSet
local v_u_58 = v3.finalizeContainerChildren
local v_u_59 = v3.preparePortalMount
local v60 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local v_u_61 = v60.getRootHostContainer
local v_u_62 = v60.popHostContext
local v_u_63 = v60.getHostContext
local v_u_64 = v60.popHostContainer
local v65 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
local v_u_66 = v65.popSuspenseContext
local v_u_67 = v65.suspenseStackCursor
local v_u_68 = v65.InvisibleParentSuspenseContext
local v_u_69 = v65.hasSuspenseContext
local v70 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local v_u_71 = v70.isContextProvider
local v_u_72 = v70.popContext
local v_u_73 = v70.popTopLevelContextObject
local v_u_74 = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).popProvider
local v75 = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new"))
local v_u_76 = v75.prepareToHydrateHostSuspenseInstance
local v_u_77 = v75.popHydrationState
local v_u_78 = v75.resetHydrationState
local v_u_79 = v75.prepareToHydrateHostInstance
local v_u_80 = v75.prepareToHydrateHostTextInstance
local v81 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_82 = v81.enableSchedulerTracing
local v_u_83 = v81.enableSuspenseCallback
local v_u_84 = v81.enableSuspenseServerRenderer
local v_u_85 = v81.enableFundamentalAPI
local v_u_86 = v81.enableProfilerTimer
local v_u_87 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local v_u_88 = v_u_87.popRenderLanes
local v_u_89 = v_u_87.markSpawnedWork
local v_u_90 = v_u_87.renderDidSuspend
local v_u_91 = v_u_87.renderDidSuspendDelayIfPossible
local v_u_92 = v1.NoLanes
local v_u_93 = v1.includesSomeLane
local v_u_94 = v1.mergeLanes
local v_u_95 = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).transferActualDuration
local function v_u_104(p96, p97)
    local v98
    if p96 == nil then
        v98 = false
    else
        v98 = p96.child == p97.child
    end
    if v98 then
        return true
    end
    local v99 = p97.child
    while v99 ~= nil do
        local v100 = v99.flags
        local v101 = v_u_44
        if bit32.band(v100, v101) ~= v_u_41 then
            return false
        end
        local v102 = v99.subtreeFlags
        local v103 = v_u_44
        if bit32.band(v102, v103) ~= v_u_41 then
            return false
        end
        v99 = v99.sibling
    end
    return true
end
local v_u_105 = nil
local v_u_106 = nil
local v_u_107 = nil
local v_u_108
if v_u_55 then
    v_u_106 = function(p109, p110, p111, p112, p113)
        local v114 = p109.memoizedProps
        if v114 ~= p112 then
            local v115 = v_u_54(p110.stateNode, p111, v114, p112, p113, (v_u_63()))
            p110.updateQueue = v115
            if v115 then
                local v116 = p110.flags
                local v117 = v_u_37
                p110.flags = bit32.bor(v116, v117)
            end
        end
    end
    v_u_105 = function(p118, p119, _, _)
        local v120 = p119.child
        while true do
            while true do
                if v120 == nil then
                    return
                end
                if v120.tag == v_u_10 or v120.tag == v_u_11 then
                    break
                end
                if v_u_85 and v120.tag == v_u_25 then
                    v_u_52(p118, v120.stateNode.instance)
                    goto l6
                end
                if v120.tag == v_u_12 or v120.child == nil then
                    goto l6
                end
                v120.child.return_ = v120
                v120 = v120.child
            end
            v_u_52(p118, v120.stateNode)
            ::l6::
            if v120 == p119 then
                return
            end
            while v120.sibling == nil do
                if v120.return_ == nil or v120.return_ == p119 then
                    return
                end
                v120 = v120.return_
            end
            v120.sibling.return_ = v120.return_
            v120 = v120.sibling
        end
    end
    v_u_107 = function(_, p121, p122, p123)
        if p122 ~= p123 then
            local v124 = p121.flags
            local v125 = v_u_37
            p121.flags = bit32.bor(v124, v125)
        end
    end
    v_u_108 = function(_, _) end
elseif v_u_56 then
    v_u_105 = function(_, _, _, _)
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildren"))
        error("FIXME (roblox): appendAllChildren is unimplemented", 2)
    end
    v_u_108 = function(p126, p127)
        local v128 = p127.stateNode
        if not v_u_104(p126, p127) then
            local v129 = v128.containerInfo
            local v130 = v_u_57(v129)
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
            error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
            v128.pendingChildren = v130
            local v131 = p127.flags
            local v132 = v_u_37
            p127.flags = bit32.bor(v131, v132)
            v_u_58(v129, v130)
        end
    end
else
    v_u_108 = function(_, _) end
end
local function v_u_176(p133)
    local v134
    if p133.alternate == nil then
        v134 = false
    else
        v134 = p133.alternate.child == p133.child
    end
    local v135 = v_u_92
    local v136 = v_u_41
    if v134 then
        if v_u_86 then
            local v137 = p133.mode
            local v138 = v_u_34
            if bit32.band(v137, v138) ~= v_u_31 then
                local v139 = p133.selfBaseDuration
                local v140 = p133.child
                while v140 ~= nil do
                    v135 = v_u_94(v135, v_u_94(v140.lanes, v140.childLanes))
                    local v141 = v140.subtreeFlags
                    local v142 = v_u_47
                    local v143 = bit32.band(v141, v142)
                    local v144 = bit32.bor(v136, v143)
                    local v145 = v140.flags
                    local v146 = v_u_47
                    local v147 = bit32.band(v145, v146)
                    v136 = bit32.bor(v144, v147)
                    v139 = v139 + v140.treeBaseDuration
                    v140 = v140.sibling
                end
                p133.treeBaseDuration = v139
                ::l23::
                local v148 = p133.subtreeFlags
                p133.subtreeFlags = bit32.bor(v148, v136)
                goto l16
            end
        end
        local v149 = p133.child
        while v149 ~= nil do
            local v150 = v149.lanes
            local v151 = v149.childLanes
            local v152 = bit32.bor(v150, v151)
            v135 = bit32.bor(v135, v152)
            local v153 = v149.subtreeFlags
            local v154 = v_u_47
            local v155 = bit32.band(v153, v154)
            local v156 = bit32.bor(v136, v155)
            local v157 = v149.flags
            local v158 = v_u_47
            local v159 = bit32.band(v157, v158)
            v136 = bit32.bor(v156, v159)
            v149.return_ = p133
            v149 = v149.sibling
        end
        goto l23
    end
    if v_u_86 then
        local v160 = p133.mode
        local v161 = v_u_34
        if bit32.band(v160, v161) ~= v_u_31 then
            local v162 = p133.actualDuration
            local v163 = p133.selfBaseDuration
            local v164 = p133.child
            while v164 ~= nil do
                v135 = v_u_94(v135, v_u_94(v164.lanes, v164.childLanes))
                local v165 = v164.subtreeFlags
                local v166 = bit32.bor(v136, v165)
                local v167 = v164.flags
                v136 = bit32.bor(v166, v167)
                v162 = v162 + v164.actualDuration
                v163 = v163 + v164.treeBaseDuration
                v164 = v164.sibling
            end
            p133.actualDuration = v162
            p133.treeBaseDuration = v163
            ::l13::
            local v168 = p133.subtreeFlags
            p133.subtreeFlags = bit32.bor(v168, v136)
            ::l16::
            p133.childLanes = v135
            return v134
        end
    end
    local v169 = p133.child
    while v169 ~= nil do
        local v170 = v169.lanes
        local v171 = v169.childLanes
        local v172 = bit32.bor(v170, v171)
        v135 = bit32.bor(v135, v172)
        local v173 = v169.subtreeFlags
        local v174 = bit32.bor(v136, v173)
        local v175 = v169.flags
        v136 = bit32.bor(v174, v175)
        v169.return_ = p133
        v169 = v169.sibling
    end
    goto l13
end
return {
    ["completeWork"] = function(p177, p178, p179)
        local v180 = p178.pendingProps
        if p178.tag == v_u_6 or (p178.tag == v_u_23 or (p178.tag == v_u_22 or (p178.tag == v_u_7 or (p178.tag == v_u_15 or (p178.tag == v_u_16 or (p178.tag == v_u_17 or (p178.tag == v_u_14 or p178.tag == v_u_21))))))) then
            v_u_176(p178)
            return nil
        end
        if p178.tag == v_u_8 then
            if v_u_71(p178.type) then
                v_u_72(p178)
            end
            v_u_176(p178)
            return nil
        end
        if p178.tag == v_u_9 then
            v_u_64(p178)
            v_u_73(p178)
            v_u_4()
            local v181 = p178.stateNode
            if v181.pendingContext then
                v181.context = v181.pendingContext
                v181.pendingContext = nil
            end
            if p177 == nil or p177.child == nil then
                if v_u_77(p178) then
                    local v182 = p178.flags
                    local v183 = v_u_37
                    p178.flags = bit32.bor(v182, v183)
                elseif not v181.hydrate then
                    local v184 = p178.flags
                    local v185 = v_u_43
                    p178.flags = bit32.bor(v184, v185)
                end
            end
            v_u_108(p177, p178)
            v_u_176(p178)
            return nil
        end
        if p178.tag == v_u_10 then
            v_u_62(p178)
            local v186 = v_u_61()
            local v187 = p178.type
            if p177 == nil or p178.stateNode == nil then
                if not v180 then
                    v_u_49(p178.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
                    v_u_176(p178)
                    return nil
                end
                local v188 = v_u_63()
                if v_u_77(p178) then
                    if v_u_79(p178, v186, v188) then
                        local v189 = p178.flags
                        local v190 = v_u_37
                        p178.flags = bit32.bor(v189, v190)
                    end
                else
                    local v191 = v_u_50(v187, v180, v186, v188, p178)
                    v_u_105(v191, p178, false, false)
                    p178.stateNode = v191
                    if v_u_53(v191, v187, v180, v186, v188) then
                        local v192 = p178.flags
                        local v193 = v_u_37
                        p178.flags = bit32.bor(v192, v193)
                    end
                end
                if p178.ref ~= nil then
                    local v194 = p178.flags
                    local v195 = v_u_36
                    p178.flags = bit32.bor(v194, v195)
                end
            else
                v_u_106(p177, p178, v187, v180, v186)
                if p177.ref ~= p178.ref then
                    local v196 = p178.flags
                    local v197 = v_u_36
                    p178.flags = bit32.bor(v196, v197)
                end
            end
            v_u_176(p178)
            return nil
        end
        if p178.tag == v_u_11 then
            if p177 and p178.stateNode ~= nil then
                v_u_107(p177, p178, p177.memoizedProps, v180)
            else
                if typeof(v180) ~= "string" then
                    v_u_49(p178.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
                end
                local v198 = v_u_61()
                local v199 = v_u_63()
                if v_u_77(p178) then
                    if v_u_80(p178) then
                        local v200 = p178.flags
                        local v201 = v_u_37
                        p178.flags = bit32.bor(v200, v201)
                    end
                else
                    p178.stateNode = v_u_51(v180, v198, v199, p178)
                end
            end
            v_u_176(p178)
            return nil
        end
        if p178.tag ~= v_u_18 then
            if p178.tag == v_u_19 then
                v_u_66(p178)
                local v202 = p178.memoizedState
                if v_u_84 and (v202 ~= nil and v202.dehydrated ~= nil) then
                    if p177 == nil then
                        v_u_49(v_u_77(p178), "A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React.")
                        v_u_76(p178)
                        if v_u_82 then
                            v_u_89(v_u_2)
                        end
                        v_u_176(p178)
                        if v_u_86 then
                            local v203 = p178.mode
                            local v204 = v_u_34
                            if bit32.band(v203, v204) ~= v_u_31 and v202 ~= nil then
                                local v205 = p178.child
                                if v205 ~= nil then
                                    p178.treeBaseDuration = v205.treeBaseDuration
                                end
                            end
                        end
                        return nil
                    end
                    v_u_78()
                    local v206 = p178.flags
                    local v207 = v_u_42
                    if bit32.band(v206, v207) == v_u_41 then
                        p178.memoizedState = nil
                    end
                    local v208 = p178.flags
                    local v209 = v_u_37
                    p178.flags = bit32.bor(v208, v209)
                    v_u_176(p178)
                    if v_u_86 then
                        local v210 = p178.mode
                        local v211 = v_u_34
                        if bit32.band(v210, v211) ~= v_u_31 and v202 ~= nil then
                            local v212 = p178.child
                            if v212 ~= nil then
                                p178.treeBaseDuration = p178.treeBaseDuration - v212.treeBaseDuration
                            end
                        end
                    end
                    return nil
                end
                local v213 = p178.flags
                local v214 = v_u_42
                if bit32.band(v213, v214) ~= v_u_41 then
                    p178.lanes = p179
                    if v_u_86 then
                        local v215 = p178.mode
                        local v216 = v_u_34
                        if bit32.band(v215, v216) ~= v_u_31 then
                            v_u_95(p178)
                        end
                    end
                    return p178
                end
                local v217 = v202 ~= nil
                local v218 = false
                if p177 == nil then
                    if p178.memoizedProps.fallback ~= nil then
                        v_u_77(p178)
                    end
                else
                    v218 = p177.memoizedState ~= nil
                end
                if v217 and not v218 then
                    local v219 = p178.mode
                    local v220 = v_u_33
                    if bit32.band(v219, v220) ~= v_u_31 then
                        local v221
                        if p177 == nil then
                            v221 = p178.memoizedProps.unstable_avoidThisFallback ~= true
                        else
                            v221 = false
                        end
                        if v221 or v_u_69(v_u_67.current, v_u_68) then
                            v_u_90()
                        else
                            v_u_91()
                        end
                    end
                end
                if v_u_56 and v217 then
                    local v222 = p178.flags
                    local v223 = v_u_37
                    p178.flags = bit32.bor(v222, v223)
                end
                if v_u_55 and (v217 or v218) then
                    local v224 = p178.flags
                    local v225 = v_u_37
                    p178.flags = bit32.bor(v224, v225)
                end
                if v_u_83 and (p178.updateQueue ~= nil and p178.memoizedProps.suspenseCallback ~= nil) then
                    local v226 = p178.flags
                    local v227 = v_u_37
                    p178.flags = bit32.bor(v226, v227)
                end
                v_u_176(p178)
                if v_u_86 then
                    local v228 = p178.mode
                    local v229 = v_u_34
                    if bit32.band(v228, v229) ~= v_u_31 and v217 then
                        local v230 = p178.child
                        if v230 ~= nil then
                            p178.treeBaseDuration = p178.treeBaseDuration - v230.treeBaseDuration
                        end
                    end
                end
                return nil
            end
            if p178.tag == v_u_12 then
                v_u_64(p178)
                v_u_108(p177, p178)
                if p177 == nil then
                    v_u_59(p178.stateNode.containerInfo)
                end
                v_u_176(p178)
                return nil
            end
            if p178.tag == v_u_13 then
                v_u_74(p178)
                v_u_176(p178)
                return nil
            end
            if p178.tag == v_u_24 then
                if v_u_71(p178.type) then
                    v_u_72(p178)
                end
                v_u_176(p178)
                return nil
            end
            if p178.tag == v_u_20 then
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"))
                error("FIXME (roblox): SuspenseListComponent is unimplemented", 2)
            elseif p178.tag == v_u_25 then
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"))
                error("FIXME (roblox): FundamentalComponent is unimplemented", 2)
            elseif p178.tag == v_u_26 then
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"))
                error("FIXME (roblox): ScopeComponent is unimplemented", 2)
            elseif p178.tag == v_u_27 then
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print("UNIMPLEMENTED ERROR: " .. tostring("Block"))
                error("FIXME (roblox): Block is unimplemented", 2)
            elseif p178.tag == v_u_28 or p178.tag == v_u_29 then
                v_u_88(p178)
                local v231 = p178.memoizedState ~= nil
                if p177 ~= nil and (p177.memoizedState ~= nil ~= v231 and v180.mode ~= "unstable-defer-without-hiding") then
                    local v232 = p178.flags
                    local v233 = v_u_37
                    p178.flags = bit32.bor(v232, v233)
                end
                if v231 and not v_u_93(v_u_87.subtreeRenderLanes, v_u_2) then
                    local v234 = p178.mode
                    local v235 = v_u_32
                    if bit32.band(v234, v235) ~= v_u_31 then
                        ::l173::
                        return nil
                    end
                end
                v_u_176(p178)
                goto l173
            end
            local v236 = v_u_49
            local v237 = p178.tag
            v236(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v237)))
            return nil
        end
        if v_u_176(p178) then
            ::l60::
            return nil
        end
        local v238 = v_u_37
        local v239 = v_u_38
        local v240 = v_u_39
        local v241 = p178.subtreeFlags
        local v242 = p178.flags
        local v243 = v_u_48
        if bit32.band(v242, v243) == v_u_41 then
            local v244 = v_u_48
            if bit32.band(v241, v244) == v_u_41 then
                v253 = v242
                ::l63::
                local v245 = v_u_45
                local v246 = v_u_40
                local v247 = bit32.bor(v245, v246)
                if bit32.band(v242, v247) == v_u_41 then
                    local v248 = v_u_45
                    local v249 = v_u_40
                    local v250 = bit32.bor(v248, v249)
                    if bit32.band(v241, v250) == v_u_41 then
                        goto l66
                    end
                end
                v253 = bit32.bor(v253, v239)
                ::l66::
                local v251 = v_u_46
                if bit32.band(v242, v251) == v_u_41 then
                    local v252 = v_u_46
                    if bit32.band(v241, v252) == v_u_41 then
                        goto l69
                    end
                end
                v253 = bit32.bor(v253, v240)
                ::l69::
                p178.flags = v253
                goto l60
            end
        end
        local v253 = bit32.bor(v242, v238)
        goto l63
    end
}