--// ReplicatedStorage.SharedModules.Game.CloudValueSchedule (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("TimeZoneHelper")
local v_u_3 = v1("LiveOpsTime")
local v_u_4 = v1("CloudValues")
local v_u_5 = v1("Signal")
local v6 = v1("Class")
local v_u_7 = v1("Maid")
local v8 = v6("CloudValueSchedule")
function v8.__init(p_u_9, p10)
    p_u_9.refresh_maid = v_u_7.new()
    p_u_9.on_start = v_u_5.new()
    p_u_9.on_end = v_u_5.new()
    p_u_9.on_cancel = v_u_5.new()
    p_u_9.schedule_name = p10
    p_u_9.active_events = {}
    p_u_9:refresh_schedule()
    v_u_4:onChange(function()
        p_u_9:refresh_schedule()
    end)
end
function v8.connect_on_start(p11, p12)
    return p11.on_start:connect(p12)
end
function v8.connect_on_end(p13, p14)
    return p13.on_end:connect(p14)
end
function v8.connect_on_cancel(p15, p16)
    return p15.on_cancel:connect(p16)
end
function v8.start_event(p17, p18, p19, p20, p21)
    p17.active_events[p18] = true
    p17.on_start:fire(p19, p20, p21)
end
function v8.end_event(p22, p23, p24)
    p22.active_events[p23] = nil
    p22.on_end:fire(p24)
end
function v8.cancel_event(p25, p26, p27)
    p25.active_events[p26] = nil
    p25.on_cancel:fire(p27)
end
function v8.get_timestamp(p28, p29)
    local v30 = v_u_4:getValue(p28.schedule_name, "timezone")
    return v_u_2.from_timezone_datetime(v30, p29.year, p29.month, p29.day, p29.hour, p29.minute).UnixTimestamp
end
function v8.refresh_schedule(p_u_31)
    p_u_31.refresh_maid:DoCleaning()
    local v32 = v_u_4:getValue(p_u_31.schedule_name, "schedule")
    local v33 = v_u_3.now()
    local v34 = {}
    for v35, v36 in v32 do
        local v_u_37 = p_u_31:get_timestamp(v36.start_time)
        local v38 = v36.duration
        local v_u_39 = tostring(v_u_37) .. "_" .. tostring(v38)
        local v40 = not v34[v_u_39]
        assert(v40, ("CloudValueSchedule entry %d\'s start_time and duration can\'t be identical to another entry\'s."):format(v35))
        v34[v_u_39] = true
        local v_u_41 = v_u_37 + v38
        local v_u_42 = v36.values or {}
        if v33 < v_u_37 then
            local v_u_43 = v_u_3.delay_until(v_u_37):andThen(function()
                if v_u_41 > v_u_3.now() then
                    p_u_31:start_event(v_u_39, v_u_42, v_u_37, v_u_41)
                end
            end)
            p_u_31.refresh_maid:GiveTask(function()
                v_u_43:cancel()
            end)
            local v_u_44 = v_u_3.delay_until(v_u_41):andThen(function()
                if p_u_31.active_events[v_u_39] then
                    p_u_31:end_event(v_u_39, v_u_42)
                end
            end)
            p_u_31.refresh_maid:GiveTask(function()
                v_u_44:cancel()
            end)
        elseif v_u_41 <= v33 then
            if p_u_31.active_events[v_u_39] then
                p_u_31:cancel_event(v_u_39, v_u_42)
            end
        elseif not p_u_31.active_events[v_u_39] then
            p_u_31:start_event(v_u_39, v_u_42, v_u_37, v_u_41)
        end
    end
end
function v8.destroy(p45)
    p45.on_start:destroy()
    p45.on_end:destroy()
    p45.on_cancel:destroy()
    p45.refresh_maid:DoCleaning()
end
return v8