--// ReplicatedStorage.SharedModules.TimerAction (ModuleScript)

local v1 = {}
local v_u_2 = {}
v_u_2.__index = v_u_2
function v1.new()
    local v3 = v_u_2
    local v4 = setmetatable({}, v3)
    v4.next_restart_id = 0
    return v4
end
function v_u_2.restart(p_u_5, p6, p_u_7)
    p_u_5.next_restart_id = p_u_5.next_restart_id + 1
    local v_u_8 = p_u_5.next_restart_id
    delay(p6, function()
        if p_u_5.next_restart_id == v_u_8 then
            p_u_7()
        end
    end)
end
function v_u_2.stop(p9)
    p9.next_restart_id = p9.next_restart_id + 1
end
return v1