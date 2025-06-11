--// ReplicatedStorage.SharedModules.SingleActionBuffer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Signal")
local v3 = v1("Class")
local v_u_4 = v1("package:Promise")
local v5 = v3("SingleActionBuffer")
function v5.__init(p_u_6)
    p_u_6.running = false
    p_u_6.deferred_action = nil
    p_u_6.running_action = nil
    p_u_6.action_completed_signal = v_u_2.new()
    p_u_6.action_completed_signal:Connect(function()
        if p_u_6.deferred_action then
            p_u_6:_run_action(p_u_6.deferred_action)
        end
    end)
end
function v5._run_action(p_u_7, p8)
    p_u_7.running = true
    p_u_7.deferred_action = nil
    p_u_7.running_action = v_u_4.try(p8):finally(function()
        p_u_7.running = false
        p_u_7.running_action = nil
        p_u_7.action_completed_signal:Fire()
    end)
end
function v5.run(p9, p10)
    if p9.running then
        p9.deferred_action = p10
    else
        p9:_run_action(p10)
    end
end
function v5.clear(p11)
    p11.deferred_action = nil
    if p11.running_action then
        p11.running_action:cancel()
    end
end
return v5