--// ReplicatedStorage.SharedModules.CountdownClock (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("Utilities")
local v_u_5 = game:GetService("RunService")
local v_u_6 = os.clock
local v7 = v2("CountdownClock")
function v7.__init(p8, p9)
    p8.maid = v_u_3.new()
    p8.tick_interval = p9 or 1
end
function v7._should_tick(p10)
    local v11
    if v_u_6() - p10.last_tick_timestamp >= p10.tick_interval then
        v11 = p10.last_tick_timestamp < p10.end_timestamp
    else
        v11 = false
    end
    return v11
end
function v7._tick(p12)
    local v13 = p12.last_tick_timestamp + p12.tick_interval
    local v14 = p12.end_timestamp - v13
    local v15 = v_u_4.RoundToNearestMultiple(v14, p12.tick_interval)
    p12.last_tick_timestamp = v13
    if v15 >= 0 then
        p12.on_tick_callback(v15)
    end
end
function v7._reset(p16)
    p16.end_timestamp = 0
    if p16.heartbeat_connection then
        p16.heartbeat_connection:disconnect()
        p16.heartbeat_connection = nil
    end
end
function v7.start(p_u_17)
    p_u_17:_reset()
    p_u_17.end_timestamp = v_u_6() + p_u_17.duration
    p_u_17.last_tick_timestamp = v_u_6() - p_u_17.tick_interval
    p_u_17:_tick()
    p_u_17.heartbeat_connection = v_u_5.Heartbeat:Connect(function()
        local v18 = p_u_17.heartbeat_connection
        assert(v18)
        while p_u_17:_should_tick() do
            p_u_17:_tick()
        end
        if v_u_6() > p_u_17.end_timestamp then
            p_u_17:_finish(true)
        end
    end)
end
function v7.is_going(p19)
    return v_u_6() < (p19.end_timestamp or 0)
end
function v7.get_remaining_time(p20)
    local v21 = p20.end_timestamp - v_u_6()
    return math.max(0, v21)
end
function v7._finish(p22, p23)
    if p22.on_countdown_stopped_callback then
        p22.on_countdown_stopped_callback(p23)
    end
    p22:_reset()
end
function v7.stop(p24)
    p24:_finish(false)
end
function v7.set_tick_interval(p25, p26)
    p25.tick_interval = p26
end
function v7.set_duration(p27, p28)
    local v29 = not p27:is_going()
    assert(v29, "Clock needs to be stopped when setting duration.")
    p27.duration = p28
end
function v7.on_tick(p30, p31)
    local v32 = not p30.on_tick_callback
    assert(v32, "CountdownClock currently doesn\'t support multiple on_tick callbacks")
    p30.on_tick_callback = p31
end
function v7.on_stopped(p33, p34)
    local v35 = not p33.on_countdown_stopped_callback
    assert(v35, "CountdownClock currently doesn\'t support multiple on_countdown_ended callbacks")
    p33.on_countdown_stopped_callback = p34
end
function v7.destroy(p36)
    p36.maid:Destroy()
end
return v7