--// ReplicatedStorage.SharedPackages._Index.jsdotlua_scheduler@17.2.1.scheduler.Scheduler (ModuleScript)

return function(p1)
    local v_u_2 = require(script.Parent.Parent:WaitForChild("shared")).describeError
    local v3 = require(script.Parent:WaitForChild("SchedulerFeatureFlags"))
    local v_u_4 = v3.enableSchedulerDebugging
    local v_u_5 = v3.enableProfiling
    local v6 = p1 or require(script.Parent:WaitForChild("SchedulerHostConfig"))
    local v_u_7 = v6.requestHostCallback
    local v_u_8 = v6.requestHostTimeout
    local v_u_9 = v6.cancelHostTimeout
    local v_u_10 = v6.shouldYieldToHost
    local v_u_11 = v6.getCurrentTime
    local v12 = v6.forceFrameRate
    local v13 = v6.requestPaint
    local v_u_14 = nil
    local v_u_15 = nil
    local v_u_16 = nil
    v_u_15 = function(p17, p18, p19)
        while true do
            local v20 = p19 / 2
            local v21 = math.floor(v20)
            local v22 = p17[v21]
            if v22 == nil or v_u_14(v22, p18) <= 0 then
                break
            end
            p17[v21] = p18
            p17[p19] = v22
            p19 = v21
        end
    end
    v_u_16 = function(p23, p24, p25)
        local v26 = #p23
        while p25 < v26 do
            local v27 = p25 * 2
            local v28 = p23[v27]
            local v29 = v27 + 1
            local v30 = p23[v29]
            if v28 == nil or v_u_14(v28, p24) >= 0 then
                if v30 == nil or v_u_14(v30, p24) >= 0 then
                    return
                end
                p23[p25] = v30
                p23[v29] = p24
            elseif v30 == nil or v_u_14(v30, v28) >= 0 then
                p23[p25] = v28
                p23[v27] = p24
                v29 = v27
            else
                p23[p25] = v30
                p23[v29] = p24
            end
            p25 = v29
        end
    end
    v_u_14 = function(p31, p32)
        local v33 = p31.sortIndex - p32.sortIndex
        if v33 == 0 then
            return p31.id - p32.id
        else
            return v33
        end
    end
    local v34 = require(script.Parent:WaitForChild("SchedulerPriorities"))
    local v_u_35 = v34.ImmediatePriority
    local v_u_36 = v34.UserBlockingPriority
    local v_u_37 = v34.NormalPriority
    local v_u_38 = v34.LowPriority
    local v_u_39 = v34.IdlePriority
    local v40 = require(script.Parent:WaitForChild("SchedulerProfiling"))
    local v_u_41 = v40.markTaskRun
    local v_u_42 = v40.markTaskYield
    local v_u_43 = v40.markTaskCompleted
    local v_u_44 = v40.markTaskCanceled
    local v_u_45 = v40.markTaskErrored
    local v_u_46 = v40.markSchedulerSuspended
    local v_u_47 = v40.markSchedulerUnsuspended
    local v_u_48 = v40.markTaskStart
    local v49 = v40.stopLoggingProfilingEvents
    local v50 = v40.startLoggingProfilingEvents
    local v_u_51 = {}
    local v_u_52 = {}
    local v_u_53 = 1
    local v_u_54 = false
    local v_u_55 = nil
    local v_u_56 = v_u_37
    local v_u_57 = false
    local v_u_58 = false
    local v_u_59 = false
    local v_u_60 = nil
    local v_u_61 = nil
    local function v_u_72(p62)
        local v63 = v_u_52[1]
        while v63 ~= nil do
            if v63.callback == nil then
                local v64 = v_u_52
                local v65 = v64[1]
                if v65 ~= nil then
                    local v66 = v64[#v64]
                    v64[#v64] = nil
                    if v66 ~= v65 then
                        v64[1] = v66
                        v_u_16(v64, v66, 1)
                    end
                end
            else
                if v63.startTime > p62 then
                    return
                end
                local v67 = v_u_52
                local v68 = v67[1]
                if v68 ~= nil then
                    local v69 = v67[#v67]
                    v67[#v67] = nil
                    if v69 ~= v68 then
                        v67[1] = v69
                        v_u_16(v67, v69, 1)
                    end
                end
                v63.sortIndex = v63.expirationTime
                local v70 = v_u_51
                local v71 = #v70 + 1
                v70[v71] = v63
                v_u_15(v70, v63, v71)
                if v_u_5 then
                    v_u_48(v63, p62)
                    v63.isQueued = true
                end
            end
            v63 = v_u_52[1]
        end
    end
    local function v_u_75(p73)
        v_u_59 = false
        v_u_72(p73)
        if not v_u_58 then
            if v_u_51[1] ~= nil then
                v_u_58 = true
                v_u_7(v_u_60)
                return
            end
            local v74 = v_u_52[1]
            if v74 ~= nil then
                v_u_8(v_u_75, v74.startTime - p73)
            end
        end
    end
    v_u_60 = function(p76, p77)
        if v_u_5 then
            v_u_47(p77)
        end
        v_u_58 = false
        if v_u_59 then
            v_u_59 = false
            v_u_9()
        end
        v_u_57 = true
        local v78 = v_u_56
        local v79, v80
        if _G.__YOLO__ then
            v79 = v_u_61(p76, p77)
            v80 = true
        elseif v_u_5 then
            v80, v79 = xpcall(v_u_61, v_u_2, p76, p77)
            if not v80 and v_u_55 ~= nil then
                v_u_45(v_u_55, (v_u_11()))
                v_u_55.isQueued = false
            end
        else
            v79 = v_u_61(p76, p77)
            v80 = true
        end
        v_u_55 = nil
        v_u_56 = v78
        v_u_57 = false
        if v_u_5 then
            v_u_46((v_u_11()))
        end
        if not v80 then
            error(v79)
        end
        return v79
    end
    v_u_61 = function(p81, p82)
        v_u_72(p82)
        v_u_55 = v_u_51[1]
        while v_u_55 ~= nil and not (v_u_4 and v_u_54) and (p82 >= v_u_55.expirationTime or p81 and not v_u_10()) do
            local v83 = v_u_55.callback
            if typeof(v83) == "function" then
                v_u_55.callback = nil
                v_u_56 = v_u_55.priorityLevel
                local v84 = v_u_55.expirationTime <= p82
                v_u_41(v_u_55, p82)
                local v85 = v83(v84)
                p82 = v_u_11()
                if typeof(v85) == "function" then
                    v_u_55.callback = v85
                    v_u_42(v_u_55, p82)
                else
                    if v_u_5 then
                        v_u_43(v_u_55, p82)
                        v_u_55.isQueued = false
                    end
                    if v_u_55 == v_u_51[1] then
                        local v86 = v_u_51
                        local v87 = v86[1]
                        if v87 ~= nil then
                            local v88 = v86[#v86]
                            v86[#v86] = nil
                            if v88 ~= v87 then
                                v86[1] = v88
                                v_u_16(v86, v88, 1)
                            end
                        end
                    end
                end
                v_u_72(p82)
            else
                local v89 = v_u_51
                local v90 = v89[1]
                if v90 ~= nil then
                    local v91 = v89[#v89]
                    v89[#v89] = nil
                    if v91 ~= v90 then
                        v89[1] = v91
                        v_u_16(v89, v91, 1)
                    end
                end
            end
            v_u_55 = v_u_51[1]
        end
        if v_u_55 ~= nil then
            return true
        end
        local v92 = v_u_52[1]
        if v92 ~= nil then
            v_u_8(v_u_75, v92.startTime - p82)
        end
        return false
    end
    return {
        ["unstable_ImmediatePriority"] = v_u_35,
        ["unstable_UserBlockingPriority"] = v_u_36,
        ["unstable_NormalPriority"] = v_u_37,
        ["unstable_IdlePriority"] = v_u_39,
        ["unstable_LowPriority"] = v_u_38,
        ["unstable_runWithPriority"] = function(p93, p94)
            if p93 ~= v_u_35 and (p93 ~= v_u_36 and (p93 ~= v_u_37 and (p93 ~= v_u_38 and p93 ~= v_u_39))) then
                p93 = v_u_37
            end
            local v95 = v_u_56
            v_u_56 = p93
            local v96, v97
            if _G.__YOLO__ then
                v96 = p94()
                v97 = true
            else
                v97, v96 = xpcall(p94, v_u_2)
            end
            v_u_56 = v95
            if not v97 then
                error(v96)
            end
            return v96
        end,
        ["unstable_next"] = function(p98)
            local v99
            if v_u_56 == v_u_35 or (v_u_56 == v_u_36 or v_u_56 == v_u_37) then
                v99 = v_u_37
            else
                v99 = v_u_56
            end
            local v100 = v_u_56
            v_u_56 = v99
            local v101, v102
            if _G.__YOLO__ then
                v101 = p98()
                v102 = true
            else
                v102, v101 = xpcall(p98, v_u_2)
            end
            v_u_56 = v100
            if not v102 then
                error(v101)
            end
            return v101
        end,
        ["unstable_scheduleCallback"] = function(p103, p104, p105)
            local v106 = v_u_11()
            local v107
            if typeof(p105) == "table" then
                local v108 = p105.delay
                if typeof(v108) == "number" and v108 > 0 then
                    v107 = v106 + v108
                else
                    v107 = v106
                end
            else
                v107 = v106
            end
            local v109 = v107 + (p103 == v_u_35 and -1 or (p103 == v_u_36 and 250 or (p103 == v_u_39 and 1073741823 or (p103 == v_u_38 and 10000 or 5000))))
            local v110 = {
                ["id"] = v_u_53,
                ["callback"] = p104,
                ["priorityLevel"] = p103,
                ["startTime"] = v107,
                ["expirationTime"] = v109,
                ["sortIndex"] = -1
            }
            v_u_53 = v_u_53 + 1
            if v_u_5 then
                v110.isQueued = false
            end
            if v106 < v107 then
                v110.sortIndex = v107
                local v111 = v_u_52
                local v112 = #v111 + 1
                v111[v112] = v110
                v_u_15(v111, v110, v112)
                if #v_u_51 == 0 and v110 == v_u_52[1] then
                    if v_u_59 then
                        v_u_9()
                    else
                        v_u_59 = true
                    end
                    v_u_8(v_u_75, v107 - v106)
                    return v110
                end
            else
                v110.sortIndex = v109
                local v113 = v_u_51
                local v114 = #v113 + 1
                v113[v114] = v110
                v_u_15(v113, v110, v114)
                if v_u_5 then
                    v_u_48(v110, v106)
                    v110.isQueued = true
                end
                if not (v_u_58 or v_u_57) then
                    v_u_58 = true
                    v_u_7(v_u_60)
                end
            end
            return v110
        end,
        ["unstable_cancelCallback"] = function(p115)
            if v_u_5 and p115.isQueued then
                v_u_44(p115, (v_u_11()))
                p115.isQueued = false
            end
            p115.callback = nil
        end,
        ["unstable_wrapCallback"] = function(p_u_116)
            local v_u_117 = v_u_56
            return function(...)
                local v118 = v_u_56
                v_u_56 = v_u_117
                local v119, v120
                if _G.__YOLO__ then
                    v119 = p_u_116(...)
                    v120 = true
                else
                    v120, v119 = xpcall(p_u_116, v_u_2, ...)
                end
                v_u_56 = v118
                if not v120 then
                    error(v119)
                end
                return v119
            end
        end,
        ["unstable_getCurrentPriorityLevel"] = function()
            return v_u_56
        end,
        ["unstable_shouldYield"] = v_u_10,
        ["unstable_requestPaint"] = v13,
        ["unstable_continueExecution"] = function()
            v_u_54 = false
            if not (v_u_58 or v_u_57) then
                v_u_58 = true
                v_u_7(v_u_60)
            end
        end,
        ["unstable_pauseExecution"] = function()
            v_u_54 = true
        end,
        ["unstable_getFirstCallbackNode"] = function()
            return v_u_51[1]
        end,
        ["unstable_now"] = v_u_11,
        ["unstable_forceFrameRate"] = v12,
        ["unstable_Profiling"] = v_u_5 and {
            ["startLoggingProfilingEvents"] = v50,
            ["stopLoggingProfilingEvents"] = v49
        } or nil
    }
end