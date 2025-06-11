--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.Glider.RenderUpdateScheduler (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Fsys).load
local v3 = v2("Class")
local v_u_4 = v2("Maid")
local v5 = v3("RenderUpdateScheduler")
function v5.__init(p6)
    p6.update_schedule = {}
    p6.maid = v_u_4.new()
end
function v5.start_update_scheduler(p_u_7)
    if not p_u_7.started then
        p_u_7.started = true
        p_u_7.maid:GiveTask(game:GetService("RunService").Heartbeat:Connect(function(p8)
            for v9, v10 in p_u_7.update_schedule do
                local v11 = v10.interval
                if v11 then
                    v11 = v10.current
                end
                assert(v11, ("Bad schedule was provided for %q"):format(v9))
                if tick() - v10.current > v10.interval then
                    v10.current = tick()
                    if v10.on_update then
                        v10.on_update(p8)
                    end
                end
            end
        end))
    end
end
function v5.register_in_scheduler(p12, p_u_13, p_u_14)
    local v15 = p_u_14.interval
    assert(v15, ("%q schedule is not formatted correctly, please provide an interval time."):format(p_u_13))
    p_u_14.current = tick()
    if p_u_14.priority then
        game:GetService("RunService"):BindToRenderStep(p_u_13, p_u_14.priority, function(p16)
            if tick() - p_u_14.current > p_u_14.interval then
                p_u_14.current = tick()
                if p_u_14.on_update then
                    p_u_14.on_update(p16)
                end
            end
        end)
        p12.maid:GiveTask(function()
            game:GetService("RunService"):UnbindFromRenderStep(p_u_13)
        end)
    else
        p12.update_schedule[p_u_13] = p_u_14
    end
end
function v5.unregister_schedule(p17, p18)
    if p17.update_schedule[p18] then
        p17.update_schedule[p18] = nil
    else
        game:GetService("RunService"):UnbindFromRenderStep(p18)
    end
end
function v5.cleanup(p19)
    p19.started = nil
    p19.update_schedule = {}
    p19.maid:DoCleaning()
end
return v5