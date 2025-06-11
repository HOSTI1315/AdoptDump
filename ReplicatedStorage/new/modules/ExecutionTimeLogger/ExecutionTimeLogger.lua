--// ReplicatedStorage.new.modules.ExecutionTimeLogger (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = {}
local v_u_3 = {}
local v_u_4 = {}
local v_u_5 = 0
local v_u_6 = nil
function v_u_2.start(p_u_7)
    if v_u_3[p_u_7] then
        warn((("[ExecutionTimeLogger] log for %* already exists; overwriting"):format(p_u_7)))
    end
    if not v_u_6 or coroutine.status(v_u_6) == "dead" then
        v_u_5 = v_u_5 + 1
        v_u_6 = task.defer(function()
            if v_u_6 == coroutine.running() then
                v_u_6 = nil
            end
        end)
    end
    v_u_3[p_u_7] = {
        ["name"] = p_u_7,
        ["step"] = v_u_5,
        ["timer_start"] = os.clock()
    }
    v_u_4[p_u_7] = v_u_3[p_u_7]
    task.defer(function()
        if v_u_3[p_u_7].timer_yielded == nil then
            v_u_3[p_u_7].timer_timeout = os.clock()
            v_u_4[p_u_7] = nil
        end
    end)
    task.spawn(function()
        task.wait()
        if v_u_3[p_u_7].timer_yielded == nil then
            v_u_4[p_u_7] = nil
            v_u_2.print_timeouts()
            v_u_2.print_first_yield(0.016666666666666666)
            v_u_2.report_to_stash(0.016666666666666666)
        end
    end)
end
function v_u_2.get_active_name()
    local v8 = nil
    for _, v9 in v_u_4 do
        if v9.timer_yielded == nil and (not v8 or v9.timer_start > v8.timer_start) then
            v8 = v9
        end
    end
    if v8 then
        v8 = v8.name
    end
    return v8
end
function v_u_2.checkpoint_yielded(p10)
    if v_u_3[p10] then
        v_u_3[p10].timer_yielded = os.clock()
        v_u_4[p10] = nil
    else
        warn((("[ExecutionTimeLogger] Tried to checkpoint_yielded, but log for %* does not exist"):format(p10)))
    end
end
function v_u_2.build_first_yield_log(p11)
    local v12 = {}
    local v13 = p11 or 0
    local v14 = 10
    for v15, v16 in v_u_3 do
        local v17 = v16.timer_yielded or v16.timer_timeout
        if v17 then
            if not v12[v16.step] then
                v12[v16.step] = {
                    ["step"] = v16.step,
                    ["lines"] = {},
                    ["total_time"] = 0,
                    ["others_time"] = 0,
                    ["others_count"] = 0
                }
            end
            local v18 = v17 - v16.timer_start
            local v19 = v12[v16.step]
            v19.total_time = v19.total_time + v18
            if v13 <= v18 then
                local v20 = #v15
                v14 = math.max(v14, v20)
                local v21 = v12[v16.step].lines
                table.insert(v21, {
                    ["name"] = v15,
                    ["time"] = v18
                })
            else
                local v22 = v12[v16.step]
                v22.others_time = v22.others_time + v18
                local v23 = v12[v16.step]
                v23.others_count = v23.others_count + 1
            end
        end
    end
    local v24 = {}
    for _, v25 in v12 do
        table.sort(v25.lines, function(p26, p27)
            return p26.time > p27.time
        end)
        local v28 = v25.lines
        local v29 = {
            ["name"] = ("%* others"):format(v25.others_count),
            ["time"] = v25.others_time
        }
        table.insert(v28, v29)
        table.insert(v24, v25)
    end
    table.sort(v24, function(p30, p31)
        return p30.step < p31.step
    end)
    local v32 = {}
    for _, v33 in v24 do
        local v34 = ("Scheduler step %*:  %*"):format(v33.step, (string.format("%.3f", v33.total_time)))
        table.insert(v32, v34)
        local v35 = 0
        for _, v36 in v33.lines do
            v35 = v35 + v36.time
            local v37 = string.format
            local v38 = ("  %%-%*s  +%%6.3f   = %%6.3f"):format(v14)
            local v39 = v36.name
            local v40 = v36.time
            table.insert(v32, v37(v38, v39, v40, v35))
        end
    end
    return ("Execution step-time log (>= %*):\n    %*"):format(string.format("%.3f", v13 or 0), (table.concat(v32, "\n    ")))
end
function v_u_2.print_first_yield(p41)
    if not v_u_1:IsClient() then
        local v42 = v_u_2.build_first_yield_log(p41)
        print(v42)
    end
end
function v_u_2.build_timeout_log()
    local v43 = {}
    for v44, v45 in v_u_3 do
        if v45.timer_yielded == nil then
            if v45.timer_timeout then
                local v46 = v45.timer_timeout - v45.timer_start
                local v47 = string.format
                table.insert(v43, v47("%-40s %6.3f", v44, v46))
            else
                table.insert(v43, v44)
            end
        end
    end
    return ("Execution timeout log:\n    %*"):format((table.concat(v43, "\n    ")))
end
function v_u_2.print_timeouts()
    if not v_u_1:IsClient() then
        local v48 = v_u_2.build_timeout_log()
        print(v48)
    end
end
function v_u_2.report_to_stash(p49)
    if not v_u_1:IsClient() then
        local v50 = v_u_2.build_timeout_log()
        local v51 = v_u_2.build_first_yield_log(p49)
        require(game.ServerScriptService.ServerPackages.Stash):into("errorlog"):log("ExecutionTimeLogger", {
            ["error_message"] = ("%*\n%*"):format(v50, v51)
        })
    end
end
return v_u_2