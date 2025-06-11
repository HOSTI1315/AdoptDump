--// ReplicatedStorage.SharedModules.DelayedUpdateBuffer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")
local v_u_2 = game:GetService("RunService")
local v3 = v1("DelayedUpdateBuffer")
function v3.__init(p4)
    p4.current_buffer_ids = {}
    p4.next_id = 0
end
function v3._claim_ticket(p5, p6)
    local v7 = debug.traceback(nil, 2)
    p5.next_id = p5.next_id + 1
    local v8 = p5.next_id
    p5.current_buffer_ids[p6 or "DEFAULT"] = v8
    return v8, v7
end
function v3._run_method(p9, p10, p_u_11, p12, p13)
    if p10 == p9.current_buffer_ids[p12 or "DEFAULT"] then
        p9.current_buffer_ids[p12 or "DEFAULT"] = nil
        xpcall(p13, function(p14)
            warn((("DelayedUpdateBuffer.delay failed:\n%*\n%*\n...\n%*"):format(p14, debug.traceback(nil, 2), p_u_11)))
        end)
    end
end
function v3.delay(p_u_15, p_u_16, p_u_17)
    local v_u_18, v_u_19 = p_u_15:_claim_ticket(p_u_16)
    task.spawn(function()
        v_u_2.Stepped:wait()
        p_u_15:_run_method(v_u_18, v_u_19, p_u_16, p_u_17)
    end)
end
function v3.defer(p_u_20, p_u_21, p_u_22)
    local v_u_23, v_u_24 = p_u_20:_claim_ticket(p_u_21)
    task.defer(function()
        p_u_20:_run_method(v_u_23, v_u_24, p_u_21, p_u_22)
    end)
end
function v3.wait_for_current_tasks(p25)
    local v26 = table.clone(p25.current_buffer_ids)
    while true do
        local v27 = true
        for v28, v29 in v26 do
            if v29 == p25.current_buffer_ids[v28] then
                v27 = false
            end
        end
        if v27 then
            return
        end
        v_u_2.Stepped:wait()
    end
end
return v3