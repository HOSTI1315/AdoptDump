--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberLane (ModuleScript)

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
local v2 = require(script.Parent:WaitForChild("ReactFiberSchedulerPriorities.roblox"))
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v_u_4 = v2.ImmediatePriority
local v_u_5 = v2.UserBlockingPriority
local v_u_6 = v2.NormalPriority
local v_u_7 = v2.LowPriority
local v_u_8 = v2.IdlePriority
local v_u_9 = v2.NoPriority
local v10 = {
    ["SyncLanePriority"] = 15,
    ["SyncBatchedLanePriority"] = 14,
    ["InputDiscreteLanePriority"] = 12,
    ["InputContinuousLanePriority"] = 10,
    ["DefaultLanePriority"] = 8,
    ["TransitionPriority"] = 6,
    ["NoLanePriority"] = 0,
    ["NoLanes"] = 0,
    ["NoLane"] = 0,
    ["SyncLane"] = 1,
    ["SyncBatchedLane"] = 2,
    ["InputDiscreteHydrationLane"] = 4,
    ["DefaultHydrationLane"] = 256,
    ["DefaultLanes"] = 3584,
    ["RetryLanes"] = 62914560,
    ["SomeRetryLane"] = 33554432,
    ["SelectiveHydrationLane"] = 67108864,
    ["IdleHydrationLane"] = 134217728,
    ["OffscreenLane"] = 1073741824,
    ["NoTimestamp"] = -1
}
local v_u_11 = v10.NoLanePriority
function v10.getCurrentUpdateLanePriority()
    return v_u_11
end
function v10.setCurrentUpdateLanePriority(p12)
    v_u_11 = p12
end
local v_u_13 = v10.DefaultLanePriority
local function v_u_21(p14)
    if bit32.band(1, p14) ~= 0 then
        v_u_13 = 15
        return 1
    end
    if bit32.band(2, p14) ~= 0 then
        v_u_13 = 14
        return 2
    end
    if bit32.band(4, p14) ~= 0 then
        v_u_13 = 13
        return 4
    end
    local v15 = bit32.band(24, p14)
    if v15 ~= 0 then
        v_u_13 = 12
        return v15
    end
    if bit32.band(p14, 32) ~= 0 then
        v_u_13 = 11
        return 32
    end
    local v16 = bit32.band(192, p14)
    if v16 ~= 0 then
        v_u_13 = 10
        return v16
    end
    if bit32.band(p14, 256) ~= 0 then
        v_u_13 = 9
        return 256
    end
    local v17 = bit32.band(3584, p14)
    if v17 ~= 0 then
        v_u_13 = 8
        return v17
    end
    if bit32.band(p14, 4096) ~= 0 then
        v_u_13 = 7
        return 4096
    end
    local v18 = bit32.band(4186112, p14)
    if v18 ~= 0 then
        v_u_13 = 6
        return v18
    end
    local v19 = bit32.band(62914560, p14)
    if v19 ~= 0 then
        v_u_13 = 5
        return v19
    end
    if bit32.band(p14, 67108864) ~= 0 then
        v_u_13 = 4
        return 67108864
    end
    if bit32.band(p14, 134217728) ~= 0 then
        v_u_13 = 3
        return 134217728
    end
    local v20 = bit32.band(805306368, p14)
    if v20 ~= 0 then
        v_u_13 = 2
        return v20
    end
    if bit32.band(1073741824, p14) ~= 0 then
        v_u_13 = 1
        return 1073741824
    end
    if _G.__DEV__ then
        v_u_1.error("Should have found matching lanes. This is a bug in React.")
    end
    v_u_13 = 8
    return p14
end
function v10.schedulerPriorityToLanePriority(p22)
    return p22 == v_u_4 and 15 or (p22 == v_u_5 and 10 or ((p22 == v_u_6 or p22 == v_u_7) and 8 or (p22 == v_u_8 and 2 or 0)))
end
function v10.lanePriorityToSchedulerPriority(p23)
    if p23 == 15 or p23 == 14 then
        return v_u_4
    end
    if p23 == 13 or (p23 == 12 or (p23 == 11 or p23 == 10)) then
        return v_u_5
    end
    if p23 == 9 or (p23 == 8 or (p23 == 7 or (p23 == 6 or (p23 == 4 or p23 == 5)))) then
        return v_u_6
    end
    if p23 == 3 or (p23 == 2 or p23 == 1) then
        return v_u_8
    end
    if p23 == 0 then
        return v_u_9
    end
    v_u_3(false, "Invalid update priority: %s. This is a bug in React.", p23)
    error("unreachable")
end
local v_u_24 = nil
local v_u_25 = nil
function v10.getNextLanes(p26, p27)
    local v28 = p26.pendingLanes
    if v28 == 0 then
        v_u_13 = 0
        return 0
    end
    local v29 = 0
    local v30 = 0
    local v31 = p26.expiredLanes
    local v32 = p26.suspendedLanes
    local v33 = p26.pingedLanes
    if v31 == 0 then
        local v34 = bit32.band(v28, 134217727)
        if v34 == 0 then
            local v35 = bit32.bnot(v32)
            local v36 = bit32.band(v28, v35)
            if v36 == 0 then
                if v33 ~= 0 then
                    v29 = v_u_21(v33)
                    v30 = v_u_13
                end
            else
                v29 = v_u_21(v36)
                v30 = v_u_13
            end
        else
            local v37 = bit32.bnot(v32)
            local v38 = bit32.band(v34, v37)
            if v38 == 0 then
                local v39 = bit32.band(v34, v33)
                if v39 ~= 0 then
                    v29 = v_u_21(v39)
                    v30 = v_u_13
                end
            else
                v29 = v_u_21(v38)
                v30 = v_u_13
            end
        end
    else
        v_u_13 = 15
        v29 = v31
        v30 = 15
    end
    if v29 == 0 then
        return 0
    end
    local v40 = v_u_25(v29)
    local v41 = bit32.lshift(v40, 1) - 1
    local v42 = bit32.band(v28, v41)
    if p27 ~= 0 and (p27 ~= v42 and bit32.band(p27, v32) == 0) then
        v_u_21(p27)
        if v30 <= v_u_13 then
            return p27
        end
        v_u_13 = v30
    end
    local v43 = p26.entangledLanes
    if v43 ~= 0 then
        local v44 = p26.entanglements
        local v45 = bit32.band(v42, v43)
        while v45 > 0 do
            local v46 = v_u_24(v45)
            local v47 = bit32.lshift(1, v46)
            local v48 = v44[v46]
            v42 = bit32.bor(v42, v48)
            local v49 = bit32.bnot(v47)
            v45 = bit32.band(v45, v49)
        end
    end
    return v42
end
function v10.getMostRecentEventTime(p50, p51)
    local v52 = p50.eventTimes
    local v53 = -1
    while p51 > 0 do
        local v54 = v_u_24(p51)
        local v55 = bit32.lshift(1, v54)
        local v56 = v52[v54]
        if v53 >= v56 then
            v56 = v53
        end
        local v57 = bit32.bnot(v55)
        p51 = bit32.band(p51, v57)
        v53 = v56
    end
    return v53
end
function v10.computeExpirationTime(p58, p59)
    v_u_21(p58)
    local v60 = v_u_13
    if v60 >= 10 then
        return p59 + 250
    else
        return v60 < 6 and -1 or p59 + 5000
    end
end
function v10.markStarvedLanesAsExpired(p61, p62)
    local v63 = p61.pendingLanes
    local v64 = p61.suspendedLanes
    local v65 = p61.pingedLanes
    local v66 = p61.expirationTimes
    while v63 > 0 do
        local v67 = v_u_24(v63)
        local v68 = bit32.lshift(1, v67)
        local v69 = v66[v67]
        if v69 == -1 then
            if bit32.band(v68, v64) == 0 or bit32.band(v68, v65) ~= 0 then
                v_u_21(v68)
                local v70 = v_u_13
                local v71
                if v70 >= 10 then
                    v71 = p62 + 250
                else
                    v71 = v70 < 6 and -1 or p62 + 5000
                end
                v66[v67] = v71
            end
        elseif v69 <= p62 then
            local v72 = p61.expiredLanes
            p61.expiredLanes = bit32.bor(v72, v68)
        end
        local v73 = bit32.bnot(v68)
        v63 = bit32.band(v63, v73)
    end
end
function v10.getHighestPriorityPendingLanes(p74)
    return v_u_21(p74.pendingLanes)
end
function v10.getLanesToRetrySynchronouslyOnError(p75)
    local v76 = p75.pendingLanes
    local v77 = bit32.band(v76, 3221225471)
    return v77 == 0 and (bit32.band(v77, 1073741824) == 0 and 0 or 1073741824) or v77
end
function v10.returnNextLanesPriority()
    return v_u_13
end
function v10.includesNonIdleWork(p78)
    return bit32.band(p78, 134217727) ~= 0
end
function v10.includesOnlyRetries(p79)
    return bit32.band(p79, 62914560) == p79
end
function v10.includesOnlyTransitions(p80)
    return bit32.band(p80, 4186112) == p80
end
local v_u_81 = nil
local function v_u_98(p82, p83)
    if p82 ~= 0 then
        if p82 == 15 then
            return 1
        end
        if p82 == 14 then
            return 2
        end
        if p82 == 12 then
            local v84 = v_u_81
            local v85 = bit32.bnot(p83)
            local v86 = v84((bit32.band(24, v85)))
            if v86 == 0 then
                return v_u_98(10, p83)
            else
                return v86
            end
        end
        if p82 == 10 then
            local v87 = v_u_81
            local v88 = bit32.bnot(p83)
            local v89 = v87((bit32.band(192, v88)))
            if v89 == 0 then
                return v_u_98(8, p83)
            else
                return v89
            end
        end
        if p82 == 8 then
            local v90 = v_u_81
            local v91 = bit32.bnot(p83)
            local v92 = v90((bit32.band(3584, v91)))
            if v92 == 0 then
                local v93 = v_u_81
                local v94 = bit32.bnot(p83)
                v92 = v93((bit32.band(4186112, v94)))
                if v92 == 0 then
                    v92 = v_u_81(3584)
                end
            end
            return v92
        end
        if p82 ~= 6 and (p82 ~= 5 and p82 == 2) then
            local v95 = v_u_81
            local v96 = bit32.bnot(p83)
            local v97 = v95((bit32.band(805306368, v96)))
            if v97 == 0 then
                v97 = v_u_81(805306368)
            end
            return v97
        end
    end
    v_u_3(false, "Invalid update priority: %s. This is a bug in React.", p82)
    error("unreachable")
end
v10.findUpdateLane = v_u_98
function v10.findTransitionLane(p99, p100)
    local v101 = v_u_81
    local v102 = bit32.bnot(p100)
    local v103 = v101((bit32.band(4186112, v102)))
    if v103 == 0 then
        local v104 = v_u_81
        local v105 = bit32.bnot(p99)
        v103 = v104((bit32.band(4186112, v105)))
        if v103 == 0 then
            v103 = v_u_81(4186112)
        end
    end
    return v103
end
function v10.findRetryLane(p106)
    local v107 = v_u_81
    local v108 = bit32.bnot(p106)
    local v109 = v107((bit32.band(62914560, v108)))
    if v109 == 0 then
        v109 = v_u_81(62914560)
    end
    return v109
end
v_u_25 = function(p110)
    local v111 = 31 - bit32.countlz(p110)
    return v111 < 0 and 0 or bit32.lshift(1, v111)
end
v_u_81 = function(p112)
    local v113 = -p112
    return bit32.band(p112, v113)
end
v10.pickArbitraryLane = v_u_81
v_u_24 = function(p114)
    return 31 - bit32.countlz(p114)
end
function v10.includesSomeLane(p115, p116)
    return bit32.band(p115, p116) ~= 0
end
function v10.isSubsetOfLanes(p117, p118)
    return bit32.band(p117, p118) == p118
end
function v10.mergeLanes(p119, p120)
    return bit32.bor(p119, p120)
end
function v10.removeLanes(p121, p122)
    local v123 = bit32.bnot(p122)
    return bit32.band(p121, v123)
end
function v10.laneToLanes(p124)
    return p124
end
function v10.higherPriorityLane(p125, p126)
    if p125 == 0 or p126 == 0 then
        if p125 == 0 then
            return p126
        else
            return p125
        end
    elseif p125 < p126 then
        return p125
    else
        return p126
    end
end
function v10.higherLanePriority(p127, p128)
    if p127 == 0 or p128 >= p127 then
        return p128
    else
        return p127
    end
end
function v10.createLaneMap(p129)
    return {
        [0] = p129,
        [1] = p129,
        [2] = p129,
        [3] = p129,
        [4] = p129,
        [5] = p129,
        [6] = p129,
        [7] = p129,
        [8] = p129,
        [9] = p129,
        [10] = p129,
        [11] = p129,
        [12] = p129,
        [13] = p129,
        [14] = p129,
        [15] = p129,
        [16] = p129,
        [17] = p129,
        [18] = p129,
        [19] = p129,
        [20] = p129,
        [21] = p129,
        [22] = p129,
        [23] = p129,
        [24] = p129,
        [25] = p129,
        [26] = p129,
        [27] = p129,
        [28] = p129,
        [29] = p129,
        [30] = p129,
        [31] = p129
    }
end
function v10.markRootUpdated(p130, p131, p132)
    local v133 = p130.pendingLanes
    p130.pendingLanes = bit32.bor(v133, p131)
    local v134 = p131 - 1
    local v135 = p130.suspendedLanes
    p130.suspendedLanes = bit32.band(v135, v134)
    local v136 = p130.pingedLanes
    p130.pingedLanes = bit32.band(v136, v134)
    p130.eventTimes[31 - bit32.countlz(p131)] = p132
end
function v10.markRootSuspended(p137, p138)
    local v139 = p137.suspendedLanes
    p137.suspendedLanes = bit32.bor(v139, p138)
    local v140 = p137.pingedLanes
    local v141 = bit32.bnot(p138)
    p137.pingedLanes = bit32.band(v140, v141)
    local v142 = p137.expirationTimes
    while p138 > 0 do
        local v143 = v_u_24(p138)
        local v144 = bit32.lshift(1, v143)
        v142[v143] = -1
        local v145 = bit32.bnot(v144)
        p138 = bit32.band(p138, v145)
    end
end
function v10.markRootPinged(p146, p147, _)
    local v148 = p146.pingedLanes
    local v149 = p146.suspendedLanes
    local v150 = bit32.band(v149, p147)
    p146.pingedLanes = bit32.bor(v148, v150)
end
function v10.markRootExpired(p151, p152)
    local v153 = p151.expiredLanes
    local v154 = p151.pendingLanes
    local v155 = bit32.band(p152, v154)
    p151.expiredLanes = bit32.bor(v153, v155)
end
function v10.markDiscreteUpdatesExpired(p156)
    local v157 = p156.expiredLanes
    local v158 = p156.pendingLanes
    local v159 = bit32.band(24, v158)
    p156.expiredLanes = bit32.bor(v157, v159)
end
function v10.hasDiscreteLanes(p160)
    return bit32.band(p160, 24) ~= 0
end
function v10.markRootMutableRead(p161, p162)
    local v163 = p161.mutableReadLanes
    local v164 = p161.pendingLanes
    local v165 = bit32.band(p162, v164)
    p161.mutableReadLanes = bit32.bor(v163, v165)
end
function v10.markRootFinished(p166, p167)
    local v168 = p166.pendingLanes
    local v169 = bit32.bnot(p167)
    local v170 = bit32.band(v168, v169)
    p166.pendingLanes = p167
    p166.suspendedLanes = 0
    p166.pingedLanes = 0
    local v171 = p166.expiredLanes
    p166.expiredLanes = bit32.band(v171, p167)
    local v172 = p166.mutableReadLanes
    p166.mutableReadLanes = bit32.band(v172, p167)
    local v173 = p166.entangledLanes
    p166.entangledLanes = bit32.band(v173, p167)
    local v174 = p166.entanglements
    local v175 = p166.eventTimes
    local v176 = p166.expirationTimes
    while v170 > 0 do
        local v177 = v_u_24(v170)
        local v178 = bit32.lshift(1, v177)
        v174[v177] = 0
        v175[v177] = -1
        v176[v177] = -1
        local v179 = bit32.bnot(v178)
        v170 = bit32.band(v170, v179)
    end
end
function v10.markRootEntangled(p180, p181)
    local v182 = p180.entangledLanes
    p180.entangledLanes = bit32.bor(v182, p181)
    local v183 = p180.entanglements
    local v184 = p181
    while p181 > 0 do
        local v185 = v_u_24(p181)
        local v186 = bit32.lshift(1, v185)
        local v187 = v183[v185]
        v183[v185] = bit32.bor(v187, v184)
        local v188 = bit32.bnot(v186)
        p181 = bit32.band(p181, v188)
    end
end
function v10.getBumpedLaneForHydration(p189, p190)
    v_u_21(p190)
    local v191 = v_u_13
    local v192 = nil
    if v191 == 15 or v191 == 14 then
        v192 = 0
    elseif v191 == 13 or v191 == 12 then
        v192 = 4
    elseif v191 == 11 or v191 == 10 then
        v192 = 32
    elseif v191 == 9 or v191 == 8 then
        v192 = 256
    elseif v191 == 7 or v191 == 6 or v191 == 5 then
        v192 = 4096
    elseif v191 == 4 then
        v192 = 67108864
    elseif v191 == 3 or v191 == 2 then
        v192 = 134217728
    elseif v191 == 1 or v191 == 0 then
        v192 = 0
    else
        v_u_3(false, "Invalid lane: %s. This is a bug in React.", (tostring(v192)))
    end
    local v193 = p189.suspendedLanes
    local v194 = bit32.bor(v193, p190)
    return bit32.band(v192, v194) ~= 0 and 0 or v192
end
return v10