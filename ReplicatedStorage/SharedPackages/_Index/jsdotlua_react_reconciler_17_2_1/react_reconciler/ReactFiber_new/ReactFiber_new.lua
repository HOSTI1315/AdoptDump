--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiber.new (ModuleScript)

local v_u_1 = _G.__DEV__
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_3 = v2.Object
local v_u_4 = v2.Array
local v_u_5 = v2.util.inspect
local v_u_6 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v7 = require(script.Parent:WaitForChild("ReactRootTags"))
local v8 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v9 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local v10 = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local v_u_11 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_12 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableProfilerTimer
local v13 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_14 = v13.NoFlags
local v_u_15 = v13.Placement
local v_u_16 = v13.StaticMask
local v_u_17 = v7.ConcurrentRoot
local v_u_18 = v7.BlockingRoot
local v_u_19 = v8.IndeterminateComponent
local v_u_20 = v8.ClassComponent
local v_u_21 = v8.HostRoot
local v_u_22 = v8.HostComponent
local v_u_23 = v8.HostText
local v_u_24 = v8.HostPortal
local v_u_25 = v8.ForwardRef
local v_u_26 = v8.Fragment
local v_u_27 = v8.Mode
local v_u_28 = v8.ContextProvider
local v_u_29 = v8.ContextConsumer
local v_u_30 = v8.Profiler
local v_u_31 = v8.SuspenseComponent
local v_u_32 = v8.SuspenseListComponent
local v_u_33 = v8.DehydratedFragment
local v_u_34 = v8.FunctionComponent
local v_u_35 = v8.MemoComponent
local v_u_36 = v8.SimpleMemoComponent
local v_u_37 = v8.LazyComponent
local v_u_38 = v8.FundamentalComponent
local _ = v8.ScopeComponent
local v_u_39 = v8.OffscreenComponent
local v_u_40 = v8.LegacyHiddenComponent
local v_u_41 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_42 = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new")).isDevToolsPresent
local v43 = require(script.Parent:WaitForChild("ReactFiberHotReloading.new"))
local v_u_44 = v43.resolveClassForHotReloading
local v_u_45 = v43.resolveFunctionForHotReloading
local v_u_46 = v43.resolveForwardRefForHotReloading
local v_u_47 = v10.NoLanes
local v_u_48 = v9.NoMode
local v_u_49 = v9.ConcurrentMode
local v_u_50 = v9.DebugTracingMode
local v_u_51 = v9.ProfileMode
local v_u_52 = v9.StrictMode
local v_u_53 = v9.BlockingMode
local v54 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v_u_55 = v54.REACT_FORWARD_REF_TYPE
local v_u_56 = v54.REACT_FRAGMENT_TYPE
local v_u_57 = v54.REACT_ELEMENT_TYPE
local v_u_58 = v54.REACT_DEBUG_TRACING_MODE_TYPE
local v_u_59 = v54.REACT_STRICT_MODE_TYPE
local v_u_60 = v54.REACT_PROFILER_TYPE
local v_u_61 = v54.REACT_PROVIDER_TYPE
local v_u_62 = v54.REACT_CONTEXT_TYPE
local v_u_63 = v54.REACT_SUSPENSE_TYPE
local v_u_64 = v54.REACT_SUSPENSE_LIST_TYPE
local v_u_65 = v54.REACT_MEMO_TYPE
local v_u_66 = v54.REACT_LAZY_TYPE
local v_u_67 = v54.REACT_OFFSCREEN_TYPE
local v_u_68 = v54.REACT_LEGACY_HIDDEN_TYPE
local v_u_69 = nil
local v_u_70 = nil
local v_u_71 = nil
local v_u_72 = nil
local v_u_73 = nil
local v_u_74 = 1
local function v_u_84(p75, p76, p77, p78, p79, p80, p81, p82)
    local v83 = {
        ["tag"] = p75,
        ["key"] = p77,
        ["elementType"] = p79,
        ["type"] = p80,
        ["stateNode"] = p81,
        ["index"] = 1,
        ["pendingProps"] = p76,
        ["mode"] = p78,
        ["flags"] = v_u_14,
        ["subtreeFlags"] = v_u_14,
        ["lanes"] = p82 or v_u_47,
        ["childLanes"] = v_u_47
    }
    if v_u_12 then
        v83.actualDuration = 0
        v83.actualStartTime = -1
        v83.selfBaseDuration = 0
        v83.treeBaseDuration = 0
    end
    if v_u_1 then
        v83._debugID = v_u_74
        v_u_74 = v_u_74 + 1
        v83._debugSource = nil
        v83._debugOwner = nil
        v83._debugNeedsRemount = false
        v83._debugHookTypes = nil
    end
    return v83
end
function _shouldConstruct(p85)
    local v86
    if type(p85) == "function" then
        v86 = false
    else
        v86 = p85.isReactComponent and true or false
    end
    return v86
end
local function v_u_103(p87, p88, p89, p90, p91, p92)
    local v93 = v_u_19
    local v94 = type(p87)
    local v95
    if v94 == "function" then
        if v_u_1 then
            v95 = v_u_45(p87)
        else
            v95 = p87
        end
    elseif v94 == "table" and p87.isReactComponent then
        v93 = v_u_20
        if v_u_1 then
            v95 = v_u_44(p87)
        else
            v95 = p87
        end
    elseif v94 == "string" then
        v93 = v_u_22
        v95 = p87
    else
        if p87 == v_u_56 then
            return v_u_70(p89.children, p91, p92, p88)
        end
        if p87 == v_u_58 then
            v93 = v_u_27
            local v96 = v_u_50
            p91 = bit32.bor(p91, v96)
            v95 = p87
        elseif p87 == v_u_59 then
            v93 = v_u_27
            local v97 = v_u_52
            p91 = bit32.bor(p91, v97)
            v95 = p87
        else
            if p87 == v_u_60 then
                return v_u_69(p89, p91, p92, p88)
            end
            if p87 == v_u_63 then
                return v_u_71(p89, p91, p92, p88)
            end
            if p87 == v_u_67 then
                return v_u_72(p89, p91, p92, p88)
            end
            if p87 == v_u_68 then
                return v_u_73(p89, p91, p92, p88)
            end
            local v98 = false
            local v99
            if v94 == "table" then
                v99 = p87["$$typeof"]
                if v99 == v_u_61 then
                    v93 = v_u_28
                    v95 = p87
                    v98 = true
                elseif v99 == v_u_62 then
                    v93 = v_u_29
                    v95 = p87
                    v98 = true
                elseif v99 == v_u_55 then
                    v93 = v_u_25
                    if v_u_1 then
                        v95 = v_u_46(p87)
                    else
                        v95 = p87
                    end
                    v98 = true
                elseif v99 == v_u_65 then
                    v93 = v_u_35
                    v95 = p87
                    v98 = true
                elseif v99 == v_u_66 then
                    v93 = v_u_37
                    v98 = true
                    v95 = nil
                else
                    v95 = p87
                end
            else
                v95 = p87
                v99 = nil
            end
            if not v98 then
                local v100 = ""
                if v_u_1 then
                    if p87 == nil or v94 == "table" and #v_u_3.keys(p87) == 0 then
                        v100 = v100 .. " You likely forgot to export your component from the file it\'s defined in, or you might have mixed up default and named imports."
                    elseif p87 ~= nil and v94 == "table" then
                        v100 = v100 .. "\n" .. v_u_5(p87)
                    end
                    local v101
                    if p90 then
                        v101 = v_u_41(p90.type)
                    else
                        v101 = nil
                    end
                    if v101 == nil or v101 == "" then
                        if p90 then
                            v100 = v100 .. "\n" .. v_u_5(p90)
                        end
                    else
                        v100 = v100 .. "\n\nCheck the render method of `" .. v101 .. "`."
                    end
                end
                if p87 == nil then
                    v94 = "nil"
                elseif v_u_4.isArray(p87) then
                    v94 = "array"
                elseif v94 == "table" and v99 == v_u_57 then
                    v94 = string.format("<%s />", v_u_41(p87.type) or "Unknown")
                    v100 = " Did you accidentally export a JSX literal or Element instead of a component?"
                end
                v_u_11(false, "Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v94, v100)
            end
        end
    end
    local v102 = v_u_84(v93, p89, p88, p91, p87, v95, nil, p92)
    if v_u_1 then
        v102._debugOwner = p90
    end
    return v102
end
v_u_70 = function(p104, p105, p106, p107)
    return v_u_84(v_u_26, p104, p107, p105, nil, nil, nil, p106)
end
v_u_69 = function(p108, p109, p110, p111)
    if v_u_1 then
        local v112 = p108.id
        if typeof(v112) ~= "string" then
            v_u_6.error("Profiler must specify an \"id\" as a prop")
        end
    end
    local v113 = v_u_51
    return v_u_84(v_u_30, p108, p111, bit32.bor(p109, v113), v_u_60, v_u_60, v_u_12 and {
        ["effectDuration"] = 0,
        ["passiveEffectDuration"] = 0
    } or nil, p110)
end
v_u_71 = function(p114, p115, p116, p117)
    return v_u_84(v_u_31, p114, p117, p115, v_u_63, v_u_63, nil, p116)
end
v_u_72 = function(p118, p119, p120, p121)
    local v122 = v_u_84
    local v123 = v_u_39
    local v124 = v_u_67
    local v125
    if v_u_1 then
        v125 = v_u_67
    else
        v125 = nil
    end
    return v122(v123, p118, p121, p119, v124, v125, nil, p120)
end
v_u_73 = function(p126, p127, p128, p129)
    local v130 = v_u_84
    local v131 = v_u_40
    local v132 = v_u_68
    local v133
    if v_u_1 then
        v133 = v_u_68
    else
        v133 = nil
    end
    return v130(v131, p126, p129, p127, v132, v133, nil, p128)
end
return {
    ["isSimpleFunctionComponent"] = function(p134)
        return type(p134) == "function"
    end,
    ["resolveLazyComponentTag"] = function(p135)
        local v136 = typeof(p135)
        if v136 == "function" then
            return v_u_34
        end
        if v136 == "table" then
            if p135.isReactComponent then
                return v_u_20
            end
            local v137 = p135["$$typeof"]
            if v137 == v_u_55 then
                return v_u_25
            end
            if v137 == v_u_65 then
                return v_u_35
            end
        end
        return v_u_19
    end,
    ["createWorkInProgress"] = function(p138, p139)
        local v140 = p138.alternate
        if v140 == nil then
            v140 = v_u_84(p138.tag, p139, p138.key, p138.mode, p138.elementType, p138.type, p138.stateNode)
            if v_u_1 then
                v140._debugID = p138._debugID
                v140._debugSource = p138._debugSource
                v140._debugOwner = p138._debugOwner
                v140._debugHookTypes = p138._debugHookTypes
            end
            v140.alternate = p138
            p138.alternate = v140
        else
            v140.pendingProps = p139
            v140.type = p138.type
            v140.flags = v_u_14
            v140.subtreeFlags = v_u_14
            v140.deletions = nil
            if v_u_12 then
                v140.actualDuration = 0
                v140.actualStartTime = -1
            end
        end
        local v141 = p138.flags
        local v142 = v_u_16
        v140.flags = bit32.band(v141, v142)
        v140.childLanes = p138.childLanes
        v140.lanes = p138.lanes
        v140.child = p138.child
        v140.memoizedProps = p138.memoizedProps
        v140.memoizedState = p138.memoizedState
        v140.updateQueue = p138.updateQueue
        local v143 = p138.dependencies
        if v143 == nil then
            v140.dependencies = nil
        else
            v140.dependencies = {
                ["lanes"] = v143.lanes,
                ["firstContext"] = v143.firstContext
            }
        end
        v140.sibling = p138.sibling
        v140.index = p138.index
        v140.ref = p138.ref
        if v_u_12 then
            v140.selfBaseDuration = p138.selfBaseDuration
            v140.treeBaseDuration = p138.treeBaseDuration
        end
        if v_u_1 then
            v140._debugNeedsRemount = p138._debugNeedsRemount
            if v140.tag == v_u_19 or (v140.tag == v_u_34 or v140.tag == v_u_36) then
                v140.type = v_u_45(p138.type)
                return v140
            end
            if v140.tag == v_u_20 then
                v140.type = v_u_44(p138.type)
                return v140
            end
            if v140.tag == v_u_25 then
                v140.type = v_u_46(p138.type)
            end
        end
        return v140
    end,
    ["resetWorkInProgress"] = function(p144, p145)
        local v146 = p144.flags
        local v147 = v_u_16
        local v148 = v_u_15
        local v149 = bit32.bor(v147, v148)
        p144.flags = bit32.band(v146, v149)
        local v150 = p144.alternate
        if v150 == nil then
            p144.childLanes = v_u_47
            p144.lanes = p145
            p144.child = nil
            p144.subtreeFlags = v_u_14
            p144.memoizedProps = nil
            p144.memoizedState = nil
            p144.updateQueue = nil
            p144.dependencies = nil
            p144.stateNode = nil
            if v_u_12 then
                p144.selfBaseDuration = 0
                p144.treeBaseDuration = 0
                return p144
            end
        else
            p144.childLanes = v150.childLanes
            p144.lanes = v150.lanes
            p144.child = v150.child
            p144.subtreeFlags = v150.subtreeFlags
            p144.deletions = nil
            p144.memoizedProps = v150.memoizedProps
            p144.memoizedState = v150.memoizedState
            p144.updateQueue = v150.updateQueue
            p144.type = v150.type
            local v151 = v150.dependencies
            if v151 == nil then
                p144.dependencies = nil
            else
                p144.dependencies = {
                    ["lanes"] = v151.lanes,
                    ["firstContext"] = v151.firstContext
                }
            end
            if v_u_12 then
                p144.selfBaseDuration = v150.selfBaseDuration
                p144.treeBaseDuration = v150.treeBaseDuration
            end
        end
        return p144
    end,
    ["createHostRootFiber"] = function(p152)
        local v153
        if p152 == v_u_17 then
            local v154 = v_u_49
            local v155 = v_u_53
            local v156 = v_u_52
            v153 = bit32.bor(v154, v155, v156)
        elseif p152 == v_u_18 then
            local v157 = v_u_53
            local v158 = v_u_52
            v153 = bit32.bor(v157, v158)
        else
            v153 = v_u_48
        end
        if v_u_12 and v_u_42() then
            local v159 = v_u_51
            v153 = bit32.bor(v153, v159)
        end
        return v_u_84(v_u_21, nil, nil, v153)
    end,
    ["createFiberFromTypeAndProps"] = v_u_103,
    ["createFiberFromElement"] = function(p160, p161, p162)
        local v163
        if v_u_1 then
            v163 = p160._owner
        else
            v163 = nil
        end
        local v164 = v_u_103(p160.type, p160.key, p160.props, v163, p161, p162)
        if v_u_1 then
            v164._debugSource = p160._source
            v164._debugOwner = p160._owner
        end
        return v164
    end,
    ["createFiberFromFragment"] = v_u_70,
    ["createFiberFromFundamental"] = function(p165, p166, p167, p168, p169)
        return v_u_84(v_u_38, p166, p169, p167, p165, p165, nil, p168)
    end,
    ["createFiberFromSuspense"] = v_u_71,
    ["createFiberFromSuspenseList"] = function(p170, p171, p172, p173)
        local v174 = v_u_84
        local v175 = v_u_32
        local v176 = v_u_64
        local v177
        if v_u_1 then
            v177 = v_u_64
        else
            v177 = nil
        end
        return v174(v175, p170, p173, p171, v176, v177, nil, p172)
    end,
    ["createFiberFromOffscreen"] = v_u_72,
    ["createFiberFromLegacyHidden"] = v_u_73,
    ["createFiberFromText"] = function(p178, p179, p180)
        return v_u_84(v_u_23, p178, nil, p179, nil, nil, nil, p180)
    end,
    ["createFiberFromHostInstanceForDeletion"] = function()
        return v_u_84(v_u_22, nil, nil, v_u_48, "DELETED", "DELETED")
    end,
    ["createFiberFromDehydratedFragment"] = function(p181)
        return v_u_84(v_u_33, nil, nil, v_u_48, nil, nil, p181)
    end,
    ["createFiberFromPortal"] = function(p182, p183, p184)
        return v_u_84(v_u_24, p182.children == nil and {} or p182.children, p182.key, p183, nil, nil, {
            ["containerInfo"] = p182.containerInfo,
            ["pendingChildren"] = nil,
            ["implementation"] = p182.implementation
        }, p184)
    end,
    ["assignFiberPropertiesInDEV"] = function(p185, p186)
        if p185 == nil then
            p185 = v_u_84(v_u_19, nil, nil, v_u_48)
        end
        p185.tag = p186.tag
        p185.key = p186.key
        p185.elementType = p186.elementType
        p185.type = p186.type
        p185.stateNode = p186.stateNode
        p185.return_ = p186.return_
        p185.child = p186.child
        p185.sibling = p186.sibling
        p185.index = p186.index
        p185.ref = p186.ref
        p185.pendingProps = p186.pendingProps
        p185.memoizedProps = p186.memoizedProps
        p185.updateQueue = p186.updateQueue
        p185.memoizedState = p186.memoizedState
        p185.dependencies = p186.dependencies
        p185.mode = p186.mode
        p185.flags = p186.flags
        p185.subtreeFlags = p186.subtreeFlags
        p185.deletions = p186.deletions
        p185.lanes = p186.lanes
        p185.childLanes = p186.childLanes
        p185.alternate = p186.alternate
        if v_u_12 then
            p185.actualDuration = p186.actualDuration
            p185.actualStartTime = p186.actualStartTime
            p185.selfBaseDuration = p186.selfBaseDuration
            p185.treeBaseDuration = p186.treeBaseDuration
        end
        p185._debugID = p186._debugID
        p185._debugSource = p186._debugSource
        p185._debugOwner = p186._debugOwner
        p185._debugNeedsRemount = p186._debugNeedsRemount
        p185._debugHookTypes = p186._debugHookTypes
        return p185
    end
}