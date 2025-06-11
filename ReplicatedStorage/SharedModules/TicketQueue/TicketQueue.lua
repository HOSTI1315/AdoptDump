--// ReplicatedStorage.SharedModules.TicketQueue (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Signal")
local v3 = v1("Class")
local v_u_4 = v1("package:Promise")
local v5 = v3("TicketQueue")
function v5.__init(p6)
    p6.ticket_count = 0
    p6.completed_ticket = 0
    p6.ticket_completed_signal = v_u_2.new()
end
function v5._queue_ticket(p_u_7, p_u_8)
    return v_u_4.race({ v_u_4.new(function(p9)
            if p_u_7:is_ticket_active(p_u_8) then
                p9()
            end
        end), v_u_4.fromEvent(p_u_7.ticket_completed_signal, function(p10)
            return p10 + 1 == p_u_8
        end) })
end
function v5.is_ticket_active(p11, p12)
    return p11.completed_ticket + 1 == p12
end
function v5.queue(p_u_13, p14)
    p_u_13.ticket_count = p_u_13.ticket_count + 1
    local v_u_15 = p_u_13.ticket_count
    local v_u_16 = p_u_13:_queue_ticket(v_u_15):andThen(p14)
    v_u_4.try(function()
        v_u_16:await()
        p_u_13.completed_ticket = v_u_15
        p_u_13.ticket_completed_signal:Fire(v_u_15)
    end)
    return v_u_16, v_u_15
end
return v5