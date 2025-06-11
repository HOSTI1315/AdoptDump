--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactChildFiber.new (ModuleScript)

local v_u_1 = _G.__DEV__
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v3 = v2.Array
local v_u_4 = v2.Error
local v_u_5 = require(script.Parent.Parent:WaitForChild("shared")).console
local v_u_6 = require(script.Parent.Parent:WaitForChild("shared")).describeError
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("react"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberLane"))
local v_u_7 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v8 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_9 = v8.Placement
local v_u_10 = v8.Deletion
local v11 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v_u_12 = v11.getIteratorFn
local v_u_13 = v11.REACT_ELEMENT_TYPE
local v_u_14 = v11.REACT_FRAGMENT_TYPE
local v_u_15 = v11.REACT_PORTAL_TYPE
local v_u_16 = v11.REACT_LAZY_TYPE
local v_u_17 = v11.REACT_BLOCK_TYPE
local v18 = require(script.Parent:WaitForChild("ReactWorkTags"))
local _ = v18.FunctionComponent
local _ = v18.ClassComponent
local v_u_19 = v18.HostText
local v_u_20 = v18.HostPortal
local _ = v18.ForwardRef
local v_u_21 = v18.Fragment
local _ = v18.SimpleMemoComponent
local v_u_22 = v18.Block
local v_u_23 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v24 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local v_u_25 = v24.enableLazyElements
local v_u_26 = v24.enableBlocksAPI
local v27 = require(script.Parent:WaitForChild("ReactFiber.new"))
local v_u_28 = v27.createWorkInProgress
local v_u_29 = v27.resetWorkInProgress
local v_u_30 = v27.createFiberFromElement
local v_u_31 = v27.createFiberFromFragment
local v_u_32 = v27.createFiberFromText
local v_u_33 = v27.createFiberFromPortal
local v34 = {}
local v_u_35, v_u_36, v_u_37
if v_u_1 then
    v_u_35 = false
    local v_u_38 = {}
    v_u_36 = function(p39, p40)
        if p39 == nil or type(p39) ~= "table" then
            return
        elseif p39._store and (not p39._store.validated and p39.key == nil) then
            local v41 = v_u_23
            local v42
            if p39._store == nil then
                v42 = false
            else
                local v43 = p39._store
                v42 = type(v43) == "table"
            end
            v41(v42, "React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue.")
            p39._store.validated = true
            local v44 = v_u_7(p40.type) or "Component"
            if not v_u_38[v44] then
                v_u_38[v44] = true
                v_u_5.error("Each child in a list should have a unique \"key\" prop. See https://reactjs.org/link/warning-keys for more information.")
            end
        else
            return
        end
    end
    v_u_37 = {}
else
    v_u_37 = nil
    v_u_35 = nil
    v_u_36 = function(_, _) end
end
local v_u_45 = v3.isArray
function coerceRef(p46, _, p47)
    local v48 = p47.ref
    if v48 ~= nil and type(v48) == "string" then
        if not p47._owner or (not p47._self or p47._owner.stateNode == p47._self) then
            local v49 = v_u_1 and (v_u_7(p46.type) or "Component") or "<enable __DEV__ mode for component names>"
            error(v_u_4.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", v49, (tostring(v48)))))
        end
        if not p47._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.")
        end
    end
    return v48
end
function resolveLazyType(p50)
    local v51 = p50._payload
    local v52 = p50._init
    local v53, v54 = xpcall(v52, v_u_6, v51)
    if v53 then
        return v54
    else
        return p50
    end
end
local function v318(p_u_55)
    local function v_u_58(_, p56)
        local v57 = {}
        while p56 ~= nil do
            if p56.key == nil then
                v57[p56.index] = p56
            else
                v57[p56.key] = p56
            end
            p56 = p56.sibling
        end
        return v57
    end
    local function v_u_67(p59, p60, p61, p62)
        if p60 ~= nil then
            if p60.elementType == p61.type then
                local v63 = v_u_28(p60, p61.props)
                v63.index = 1
                v63.sibling = nil
                v63.ref = coerceRef(p59, p60, p61)
                v63.return_ = p59
                if v_u_1 then
                    v63._debugSource = p61._source
                    v63._debugOwner = p61._owner
                end
                return v63
            end
            if v_u_26 and p60.tag == v_u_22 then
                local v64 = p61.type
                if type(v64) == "table" and v64["$$typeof"] == v_u_16 then
                    v64 = resolveLazyType(v64)
                end
                if v64["$$typeof"] == v_u_17 and v64._render == p60.type._render then
                    local v65 = v_u_28(p60, p61.props)
                    v65.index = 1
                    v65.sibling = nil
                    v65.return_ = p59
                    v65.type = v64
                    if v_u_1 then
                        v65._debugSource = p61._source
                        v65._debugOwner = p61._owner
                    end
                    return v65
                end
            end
        end
        local v66 = v_u_30(p61, p59.mode, p62)
        v66.ref = coerceRef(p59, p60, p61)
        v66.return_ = p59
        return v66
    end
    local function v_u_74(p68, p69, p70, p71)
        if p69 == nil or (p69.tag ~= v_u_20 or (p69.stateNode.containerInfo ~= p70.containerInfo or p69.stateNode.implementation ~= p70.implementation)) then
            local v72 = v_u_33(p70, p68.mode, p71)
            v72.return_ = p68
            return v72
        end
        local v73 = v_u_28(p69, p70.children or {})
        v73.index = 1
        v73.sibling = nil
        v73.return_ = p68
        return v73
    end
    local function v_u_88(p75, p76, p77, p78)
        if p76 == nil then
            return nil
        end
        local v79 = type(p76)
        if v79 ~= "table" then
            if v79 ~= "string" and v79 ~= "number" then
                if v_u_1 and (v79 == "function" and v_u_1) then
                    local v80 = v_u_7(p75.type) or "Component"
                    if not v_u_37[v80] then
                        v_u_37[v80] = true
                        v_u_5.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                    end
                end
                return nil
            end
            local v81 = v_u_32(tostring(p76), p75.mode, p77)
            v81.return_ = p75
            return v81
        end
        if p76.key == nil then
            local v82 = type(p78)
            if v82 == "string" or v82 == "number" then
                p76.key = p78
            elseif v82 == "table" then
                p76.key = tostring(p78)
            end
        end
        local v83 = p76["$$typeof"]
        if v83 == v_u_13 then
            local v84 = v_u_30(p76, p75.mode, p77)
            v84.ref = coerceRef(p75, nil, p76)
            v84.return_ = p75
            return v84
        end
        if v83 == v_u_15 then
            local v85 = v_u_33(p76, p75.mode, p77)
            v85.return_ = p75
            return v85
        end
        if v83 == v_u_16 and v_u_25 then
            local v86 = p76._payload
            return v_u_88(p75, p76._init(v86), p77)
        end
        local v87 = v_u_31(p76, p75.mode, p77, nil)
        v87.return_ = p75
        return v87
    end
    local function v_u_108(p89, p90, p91, p92, p93)
        if p91 == nil then
            return nil
        else
            local v94
            if p90 == nil then
                v94 = nil
            else
                v94 = p90.key
            end
            local v95 = type(p91)
            if v95 == "table" then
                if p91.key == nil then
                    local v96 = type(p93)
                    if v96 == "string" or v96 == "number" then
                        p91.key = p93
                    elseif v96 == "table" then
                        p91.key = tostring(p93)
                    end
                end
                local v97 = p91["$$typeof"]
                if v97 == v_u_13 then
                    if p91.key ~= v94 then
                        return nil
                    end
                    if p91.type ~= v_u_14 then
                        return v_u_67(p89, p90, p91, p92)
                    end
                    local v98 = p91.props.children
                    if p90 == nil or p90.tag ~= v_u_21 then
                        local v99 = v_u_31(v98, p89.mode, p92, v94)
                        v99.return_ = p89
                        return v99
                    end
                    local v100 = v_u_28(p90, v98)
                    v100.index = 1
                    v100.sibling = nil
                    v100.return_ = p89
                    return v100
                elseif v97 == v_u_15 then
                    if p91.key == v94 then
                        return v_u_74(p89, p90, p91, p92)
                    else
                        return nil
                    end
                else
                    if v97 == v_u_16 and v_u_25 then
                        local v101 = p91._payload
                        return v_u_108(p89, p90, p91._init(v101), p92)
                    end
                    if v94 ~= nil then
                        return nil
                    end
                    if p90 == nil or p90.tag ~= v_u_21 then
                        local v102 = v_u_31(p91, p89.mode, p92, nil)
                        v102.return_ = p89
                        return v102
                    end
                    local v103 = v_u_28(p90, p91)
                    v103.index = 1
                    v103.sibling = nil
                    v103.return_ = p89
                    return v103
                end
            else
                if v95 ~= "string" and v95 ~= "number" then
                    if v_u_1 and (v95 == "function" and v_u_1) then
                        local v104 = v_u_7(p89.type) or "Component"
                        if not v_u_37[v104] then
                            v_u_37[v104] = true
                            v_u_5.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                        end
                    end
                    return nil
                end
                if v94 ~= nil then
                    return nil
                end
                local v105 = tostring(p91)
                if p90 == nil or p90.tag ~= v_u_19 then
                    local v106 = v_u_32(v105, p89.mode, p92)
                    v106.return_ = p89
                    return v106
                end
                local v107 = v_u_28(p90, v105)
                v107.index = 1
                v107.sibling = nil
                v107.return_ = p89
                return v107
            end
        end
    end
    local function v_u_132(p109, p110, p111, p112, p113, p114)
        if p112 == nil then
            return nil
        end
        local v115 = type(p112)
        if v115 ~= "table" then
            if v115 ~= "string" and v115 ~= "number" then
                if v_u_1 and (v115 == "function" and v_u_1) then
                    local v116 = v_u_7(p110.type) or "Component"
                    if not v_u_37[v116] then
                        v_u_37[v116] = true
                        v_u_5.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                    end
                end
                return nil
            end
            local v117 = p109[p111] or nil
            local v118 = tostring(p112)
            if v117 == nil or v117.tag ~= v_u_19 then
                local v119 = v_u_32(v118, p110.mode, p113)
                v119.return_ = p110
                return v119
            end
            local v120 = v_u_28(v117, v118)
            v120.index = 1
            v120.sibling = nil
            v120.return_ = p110
            return v120
        end
        if p112.key == nil then
            local v121 = type(p114)
            if v121 == "string" or v121 == "number" then
                p112.key = p114
            elseif v121 == "table" then
                p112.key = tostring(p114)
            end
        end
        local v122 = p112["$$typeof"]
        if v122 ~= v_u_13 then
            if v122 == v_u_15 then
                if p112.key ~= nil then
                    p111 = p112.key
                end
                return v_u_74(p110, p109[p111], p112, p113)
            end
            if v122 == v_u_16 and v_u_25 then
                local v123 = p112._payload
                return v_u_132(p109, p110, p111, p112._init(v123), p113)
            end
            local v124 = p109[p111]
            if v124 == nil or v124.tag ~= v_u_21 then
                local v125 = v_u_31(p112, p110.mode, p113, nil)
                v125.return_ = p110
                return v125
            end
            local v126 = v_u_28(v124, p112)
            v126.index = 1
            v126.sibling = nil
            v126.return_ = p110
            return v126
        end
        if p112.key ~= nil then
            p111 = p112.key
        end
        local v127 = p109[p111]
        if p112.type ~= v_u_14 then
            return v_u_67(p110, v127, p112, p113)
        end
        local v128 = p112.props.children
        local v129 = p112.key
        if v127 == nil or v127.tag ~= v_u_21 then
            local v130 = v_u_31(v128, p110.mode, p113, v129)
            v130.return_ = p110
            return v130
        end
        local v131 = v_u_28(v127, v128)
        v131.index = 1
        v131.sibling = nil
        v131.return_ = p110
        return v131
    end
    local function v_u_139(p133, p134, p135)
        if v_u_1 then
            if p133 == nil or type(p133) ~= "table" then
                return p134
            end
            local v136 = p133["$$typeof"]
            if v136 == v_u_13 or v136 == v_u_15 then
                v_u_36(p133, p135)
                local v137 = p133.key
                if type(v137) == "string" then
                    if p134 == nil then
                        return {
                            [v137] = true
                        }
                    elseif p134[v137] then
                        v_u_5.error("Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted \226\128\148 the behavior is unsupported and could change in a future version.", v137)
                        return p134
                    else
                        p134[v137] = true
                        return p134
                    end
                else
                    return p134
                end
            end
            if v136 == v_u_16 and v_u_25 then
                local v138 = p133._payload
                v_u_139(p133._init(v138), p134, p135)
            end
        end
        return p134
    end
    local function v_u_187(p140, p141, p142, p143)
        if v_u_1 then
            local v144 = nil
            for _, v145 in p142 do
                v144 = v_u_139(v145, v144, p140)
            end
        end
        local v146 = #p142
        local v147 = 1
        local v148 = nil
        local v149 = nil
        local v150 = 1
        local v151
        while true do
            if p141 == nil or v147 > v146 then
                v151 = p141
                break
            end
            if v147 < p141.index then
                v151 = p141
                p141 = nil
            else
                v151 = p141.sibling
            end
            local v152 = p142[v147]
            local v153
            if v152 == nil or (type(v152) ~= "table" or v152["$$typeof"] == nil) then
                v153 = v_u_108(p140, p141, v152, p143)
            else
                v153 = v_u_108(p140, p141, v152, p143, v147)
            end
            if v153 == nil then
                if p141 ~= nil then
                    v151 = p141
                end
                break
            end
            if p_u_55 and (p141 and (v153.alternate == nil and p_u_55)) then
                local v154 = p140.deletions
                if v154 == nil then
                    p140.deletions = { p141 }
                    local v155 = p140.flags
                    local v156 = v_u_10
                    p140.flags = bit32.bor(v155, v156)
                else
                    table.insert(v154, p141)
                end
            end
            v153.index = v147
            if p_u_55 then
                local v157 = v153.alternate
                if v157 == nil then
                    local v158 = v153.flags
                    local v159 = v_u_9
                    v153.flags = bit32.bor(v158, v159)
                else
                    local v160 = v157.index
                    if v160 < v150 then
                        local v161 = v153.flags
                        local v162 = v_u_9
                        v153.flags = bit32.bor(v161, v162)
                    else
                        v150 = v160
                    end
                end
            end
            if v148 == nil then
                v149 = v153
            else
                v148.sibling = v153
            end
            v147 = v147 + 1
            v148 = v153
            p141 = v151
        end
        if v146 < v147 then
            if not p_u_55 then
                return v149
            end
            while v151 ~= nil do
                if p_u_55 then
                    local v163 = p140.deletions
                    if v163 == nil then
                        p140.deletions = { v151 }
                        local v164 = p140.flags
                        local v165 = v_u_10
                        p140.flags = bit32.bor(v164, v165)
                    else
                        table.insert(v163, v151)
                    end
                end
                v151 = v151.sibling
            end
            return v149
        end
        if v151 == nil then
            while v147 <= v146 do
                local v166 = p142[v147]
                local v167
                if v166 == nil or (type(v166) ~= "table" or v166["$$typeof"] == nil) then
                    v167 = v_u_88(p140, v166, p143)
                else
                    v167 = v_u_88(p140, v166, p143, v147)
                end
                if v167 == nil then
                    v147 = v147 + 1
                    v167 = v148
                else
                    v167.index = v147
                    if p_u_55 then
                        local v168 = v167.alternate
                        if v168 == nil then
                            local v169 = v167.flags
                            local v170 = v_u_9
                            v167.flags = bit32.bor(v169, v170)
                        else
                            local v171 = v168.index
                            if v171 < v150 then
                                local v172 = v167.flags
                                local v173 = v_u_9
                                v167.flags = bit32.bor(v172, v173)
                            else
                                v150 = v171
                            end
                        end
                    end
                    if v148 == nil then
                        v149 = v167
                    else
                        v148.sibling = v167
                    end
                    v147 = v147 + 1
                end
                v148 = v167
            end
            return v149
        end
        local v174 = v_u_58(p140, v151)
        while v147 <= v146 do
            local v175 = v_u_132(v174, p140, v147, p142[v147], p143, v147)
            if v175 == nil then
                v175 = v148
            else
                if p_u_55 and v175.alternate ~= nil then
                    local v176
                    if v175.key == nil then
                        v176 = v147
                    else
                        v176 = v175.key
                    end
                    v174[v176] = nil
                end
                v175.index = v147
                if p_u_55 then
                    local v177 = v175.alternate
                    if v177 == nil then
                        local v178 = v175.flags
                        local v179 = v_u_9
                        v175.flags = bit32.bor(v178, v179)
                    else
                        local v180 = v177.index
                        if v180 < v150 then
                            local v181 = v175.flags
                            local v182 = v_u_9
                            v175.flags = bit32.bor(v181, v182)
                        else
                            v150 = v180
                        end
                    end
                end
                if v148 == nil then
                    v149 = v175
                else
                    v148.sibling = v175
                end
            end
            v147 = v147 + 1
            v148 = v175
        end
        if p_u_55 then
            for _, v183 in v174 do
                if p_u_55 then
                    local v184 = p140.deletions
                    if v184 == nil then
                        p140.deletions = { v183 }
                        local v185 = p140.flags
                        local v186 = v_u_10
                        p140.flags = bit32.bor(v185, v186)
                    else
                        table.insert(v184, v183)
                    end
                end
            end
        end
        return v149
    end
    local function v_u_235(p188, p189, p190, p191, p192)
        if v_u_1 then
            if p190.entries == p192 then
                if not v_u_35 then
                    v_u_5.error("Using Maps as children is not supported. Use an array of keyed ReactElements instead.")
                end
                v_u_35 = true
            end
            local v193 = p192(p190)
            if v193 then
                local v194 = v193.next()
                local v195 = nil
                while not v194.done do
                    v194 = v193.next()
                    v195 = v_u_139(v194.value, v195, p188)
                end
            end
        end
        local v196 = p192(p190)
        local v197 = v196.next()
        local v198 = 1
        local v199 = nil
        local v200 = 1
        local v201 = nil
        local v202
        while true do
            if p189 == nil or v197.done then
                v202 = p189
                break
            end
            if v198 < p189.index then
                v202 = p189
                p189 = nil
            else
                v202 = p189.sibling
            end
            local v203 = v_u_108(p188, p189, v197.value, p191, v197.key)
            if v203 == nil then
                if p189 ~= nil then
                    v202 = p189
                end
                break
            end
            if p_u_55 and (p189 and (v203.alternate == nil and p_u_55)) then
                local v204 = p188.deletions
                if v204 == nil then
                    p188.deletions = { p189 }
                    local v205 = p188.flags
                    local v206 = v_u_10
                    p188.flags = bit32.bor(v205, v206)
                else
                    table.insert(v204, p189)
                end
            end
            v203.index = v198
            if p_u_55 then
                local v207 = v203.alternate
                if v207 == nil then
                    local v208 = v203.flags
                    local v209 = v_u_9
                    v203.flags = bit32.bor(v208, v209)
                else
                    local v210 = v207.index
                    if v210 < v200 then
                        local v211 = v203.flags
                        local v212 = v_u_9
                        v203.flags = bit32.bor(v211, v212)
                    else
                        v200 = v210
                    end
                end
            end
            if v201 == nil then
                v199 = v203
            else
                v201.sibling = v203
            end
            v198 = v198 + 1
            v197 = v196.next()
            v201 = v203
            p189 = v202
        end
        if v197.done then
            if not p_u_55 then
                return v199
            end
            while v202 ~= nil do
                if p_u_55 then
                    local v213 = p188.deletions
                    if v213 == nil then
                        p188.deletions = { v202 }
                        local v214 = p188.flags
                        local v215 = v_u_10
                        p188.flags = bit32.bor(v214, v215)
                    else
                        table.insert(v213, v202)
                    end
                end
                v202 = v202.sibling
            end
            return v199
        end
        if v202 == nil then
            while not v197.done do
                local v216 = v_u_88(p188, v197.value, p191, v197.key)
                if v216 == nil then
                    v198 = v198 + 1
                    v197 = v196.next()
                    v216 = v201
                else
                    v216.index = v198
                    if p_u_55 then
                        local v217 = v216.alternate
                        if v217 == nil then
                            local v218 = v216.flags
                            local v219 = v_u_9
                            v216.flags = bit32.bor(v218, v219)
                        else
                            local v220 = v217.index
                            if v220 < v200 then
                                local v221 = v216.flags
                                local v222 = v_u_9
                                v216.flags = bit32.bor(v221, v222)
                            else
                                v200 = v220
                            end
                        end
                    end
                    if v201 == nil then
                        v199 = v216
                    else
                        v201.sibling = v216
                    end
                    v198 = v198 + 1
                    v197 = v196.next()
                end
                v201 = v216
            end
            return v199
        end
        local v223 = nil
        while not v197.done do
            v223 = v223 or v_u_58(p188, v202)
            local v224 = v_u_132(v223, p188, v198, v197.value, p191, v197.key)
            if v224 == nil then
                v224 = v201
            else
                if p_u_55 and v224.alternate ~= nil then
                    if v224.key == nil then
                        v223[v198] = nil
                    else
                        v223[v224.key] = nil
                    end
                end
                v224.index = v198
                if p_u_55 then
                    local v225 = v224.alternate
                    if v225 == nil then
                        local v226 = v224.flags
                        local v227 = v_u_9
                        v224.flags = bit32.bor(v226, v227)
                    else
                        local v228 = v225.index
                        if v228 < v200 then
                            local v229 = v224.flags
                            local v230 = v_u_9
                            v224.flags = bit32.bor(v229, v230)
                        else
                            v200 = v228
                        end
                    end
                end
                if v201 == nil then
                    v199 = v224
                else
                    v201.sibling = v224
                end
            end
            v198 = v198 + 1
            v197 = v196.next()
            v201 = v224
        end
        if p_u_55 then
            for _, v231 in v223 do
                if p_u_55 then
                    local v232 = p188.deletions
                    if v232 == nil then
                        p188.deletions = { v231 }
                        local v233 = p188.flags
                        local v234 = v_u_10
                        p188.flags = bit32.bor(v233, v234)
                    else
                        table.insert(v232, v231)
                    end
                end
            end
        end
        return v199
    end
    local function v_u_249(p236, p237, p238, p239)
        if p237 == nil or p237.tag ~= v_u_19 then
            if p_u_55 then
                while p237 ~= nil do
                    if p_u_55 then
                        local v240 = p236.deletions
                        if v240 == nil then
                            p236.deletions = { p237 }
                            local v241 = p236.flags
                            local v242 = v_u_10
                            p236.flags = bit32.bor(v241, v242)
                        else
                            table.insert(v240, p237)
                        end
                    end
                    p237 = p237.sibling
                end
            end
            local v243 = v_u_32(p238, p236.mode, p239)
            v243.return_ = p236
            return v243
        end
        local v244 = p237.sibling
        if p_u_55 then
            while v244 ~= nil do
                if p_u_55 then
                    local v245 = p236.deletions
                    if v245 == nil then
                        p236.deletions = { v244 }
                        local v246 = p236.flags
                        local v247 = v_u_10
                        p236.flags = bit32.bor(v246, v247)
                    else
                        table.insert(v245, v244)
                    end
                end
                v244 = v244.sibling
            end
        end
        local v248 = v_u_28(p237, p238)
        v248.index = 1
        v248.sibling = nil
        v248.return_ = p236
        return v248
    end
    local function v_u_274(p250, p251, p252, p253)
        local v254 = p252.key
        local v255 = p251
        while p251 ~= nil do
            if p251.key == v254 then
                if p251.tag == v_u_21 then
                    if p252.type == v_u_14 then
                        local v256 = p251.sibling
                        if p_u_55 then
                            while v256 ~= nil do
                                if p_u_55 then
                                    local v257 = p250.deletions
                                    if v257 == nil then
                                        p250.deletions = { v256 }
                                        local v258 = p250.flags
                                        local v259 = v_u_10
                                        p250.flags = bit32.bor(v258, v259)
                                    else
                                        table.insert(v257, v256)
                                    end
                                end
                                v256 = v256.sibling
                            end
                        end
                        local v260 = v_u_28(p251, p252.props.children)
                        v260.index = 1
                        v260.sibling = nil
                        v260.return_ = p250
                        if v_u_1 then
                            v260._debugSource = p252._source
                            v260._debugOwner = p252._owner
                        end
                        return v260
                    end
                elseif p251.elementType == p252.type then
                    local v261 = p251.sibling
                    if p_u_55 then
                        while v261 ~= nil do
                            if p_u_55 then
                                local v262 = p250.deletions
                                if v262 == nil then
                                    p250.deletions = { v261 }
                                    local v263 = p250.flags
                                    local v264 = v_u_10
                                    p250.flags = bit32.bor(v263, v264)
                                else
                                    table.insert(v262, v261)
                                end
                            end
                            v261 = v261.sibling
                        end
                    end
                    local v265 = v_u_28(p251, p252.props)
                    v265.index = 1
                    v265.sibling = nil
                    v265.ref = coerceRef(p250, p251, p252)
                    v265.return_ = p250
                    if v_u_1 then
                        v265._debugSource = p252._source
                        v265._debugOwner = p252._owner
                    end
                    return v265
                end
                if p_u_55 then
                    while p251 ~= nil do
                        if p_u_55 then
                            local v266 = p250.deletions
                            if v266 == nil then
                                p250.deletions = { p251 }
                                local v267 = p250.flags
                                local v268 = v_u_10
                                p250.flags = bit32.bor(v267, v268)
                            else
                                table.insert(v266, p251)
                            end
                        end
                        p251 = p251.sibling
                    end
                end
                break
            end
            if p_u_55 then
                local v269 = p250.deletions
                if v269 == nil then
                    p250.deletions = { p251 }
                    local v270 = p250.flags
                    local v271 = v_u_10
                    p250.flags = bit32.bor(v270, v271)
                else
                    table.insert(v269, p251)
                end
            end
            p251 = p251.sibling
        end
        if p252.type == v_u_14 then
            local v272 = v_u_31(p252.props.children, p250.mode, p253, p252.key)
            v272.return_ = p250
            return v272
        end
        local v273 = v_u_30(p252, p250.mode, p253)
        v273.ref = coerceRef(p250, v255, p252)
        v273.return_ = p250
        return v273
    end
    local function v_u_292(p275, p276, p277, p278)
        local v279 = p277.key
        while p276 ~= nil do
            if p276.key == v279 then
                if p276.tag == v_u_20 and (p276.stateNode.containerInfo == p277.containerInfo and p276.stateNode.implementation == p277.implementation) then
                    local v280 = p276.sibling
                    if p_u_55 then
                        while v280 ~= nil do
                            if p_u_55 then
                                local v281 = p275.deletions
                                if v281 == nil then
                                    p275.deletions = { v280 }
                                    local v282 = p275.flags
                                    local v283 = v_u_10
                                    p275.flags = bit32.bor(v282, v283)
                                else
                                    table.insert(v281, v280)
                                end
                            end
                            v280 = v280.sibling
                        end
                    end
                    local v284 = v_u_28(p276, p277.children or {})
                    v284.index = 1
                    v284.sibling = nil
                    v284.return_ = p275
                    return v284
                end
                if p_u_55 then
                    while p276 ~= nil do
                        if p_u_55 then
                            local v285 = p275.deletions
                            if v285 == nil then
                                p275.deletions = { p276 }
                                local v286 = p275.flags
                                local v287 = v_u_10
                                p275.flags = bit32.bor(v286, v287)
                            else
                                table.insert(v285, p276)
                            end
                        end
                        p276 = p276.sibling
                    end
                end
                break
            end
            if p_u_55 then
                local v288 = p275.deletions
                if v288 == nil then
                    p275.deletions = { p276 }
                    local v289 = p275.flags
                    local v290 = v_u_10
                    p275.flags = bit32.bor(v289, v290)
                else
                    table.insert(v288, p276)
                end
            end
            p276 = p276.sibling
        end
        local v291 = v_u_33(p277, p275.mode, p278)
        v291.return_ = p275
        return v291
    end
    local function v_u_317(p293, p294, p295, p296)
        local v297 = type(p295)
        local v298
        if p295 == nil or (v297 ~= "table" or p295.type ~= v_u_14) then
            v298 = false
        else
            v298 = p295.key == nil
        end
        if v298 then
            p295 = p295.props.children
            v297 = type(p295)
        end
        local v299 = v_u_45(p295)
        local v300
        if p295 == nil or v297 ~= "table" then
            v300 = false
        else
            v300 = not v299
        end
        if v300 then
            local v301 = p295["$$typeof"]
            if v301 == v_u_13 then
                local v302 = v_u_274(p293, p294, p295, p296)
                if p_u_55 and v302.alternate == nil then
                    local v303 = v302.flags
                    local v304 = v_u_9
                    v302.flags = bit32.bor(v303, v304)
                end
                return v302
            end
            if v301 == v_u_15 then
                local v305 = v_u_292(p293, p294, p295, p296)
                if p_u_55 and v305.alternate == nil then
                    local v306 = v305.flags
                    local v307 = v_u_9
                    v305.flags = bit32.bor(v306, v307)
                end
                return v305
            end
            if v301 == v_u_16 and v_u_25 then
                local v308 = p295._payload
                return v_u_317(p293, p294, p295._init(v308), p296)
            end
        else
            if v299 then
                return v_u_187(p293, p294, p295, p296)
            end
            if v297 == "string" or v297 == "number" then
                local v309 = v_u_249(p293, p294, tostring(p295), p296)
                if p_u_55 and v309.alternate == nil then
                    local v310 = v309.flags
                    local v311 = v_u_9
                    v309.flags = bit32.bor(v310, v311)
                end
                return v309
            end
        end
        local v312 = v_u_12(p295)
        if v312 then
            return v_u_235(p293, p294, p295, p296, v312)
        end
        if v_u_1 and (v297 == "function" and v_u_1) then
            local v313 = v_u_7(p293.type) or "Component"
            if not v_u_37[v313] then
                v_u_37[v313] = true
                v_u_5.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
            end
        end
        local _ = p295 == nil
        if not p_u_55 then
            return nil
        end
        while p294 ~= nil do
            if p_u_55 then
                local v314 = p293.deletions
                if v314 == nil then
                    p293.deletions = { p294 }
                    local v315 = p293.flags
                    local v316 = v_u_10
                    p293.flags = bit32.bor(v315, v316)
                else
                    table.insert(v314, p294)
                end
            end
            p294 = p294.sibling
        end
        return nil
    end
    return v_u_317
end
v34.reconcileChildFibers = v318(true)
v34.mountChildFibers = v318(false)
function v34.cloneChildFibers(_, p319)
    if p319.child ~= nil then
        local v320 = p319.child
        local v321 = v_u_28(v320, v320.pendingProps)
        p319.child = v321
        v321.return_ = p319
        while v320.sibling ~= nil do
            v320 = v320.sibling
            v321.sibling = v_u_28(v320, v320.pendingProps)
            v321 = v321.sibling
            v321.return_ = p319
        end
        v321.sibling = nil
    end
end
function v34.resetChildFibers(p322, p323)
    local v324 = p322.child
    while v324 ~= nil do
        v_u_29(v324, p323)
        v324 = v324.sibling
    end
end
return v34