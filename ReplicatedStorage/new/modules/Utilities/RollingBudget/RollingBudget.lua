--// ReplicatedStorage.new.modules.Utilities.RollingBudget (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_2 = require(script.Parent.Parent.LegacyLoad)("LiveOpsTime")
local v_u_3 = {}
v_u_3.__index = v_u_3
v_u_3.ClassName = "RollingBudget"
function v_u_3.new(p4, p5)
    local v6 = {
        ["max_budget"] = p4.max_budget,
        ["time_period"] = p4.time_period,
        ["_events"] = {}
    }
    local v7 = v_u_3
    local v8 = setmetatable(v6, v7)
    if p5 then
        for _, v9 in p5.events do
            v8:_add_event(v9.reward, v9.timestamp)
        end
        v8:_filter_events()
        v8:_sort_events()
    end
    return v8
end
function v_u_3.mark_changed(p10)
    if p10.store_slot then
        p10.store_slot:push_update()
    end
end
function v_u_3._filter_events(p11)
    local v_u_12 = v_u_2.now() - p11.time_period
    p11._events = v_u_1.List.filter(p11._events, function(p13)
        return v_u_12 < p13.timestamp
    end)
end
function v_u_3._sort_events(p14)
    table.sort(p14._events, function(p15, p16)
        if p15.timestamp == p16.timestamp then
            return p15.reward < p16.reward
        else
            return p15.timestamp < p16.timestamp
        end
    end)
end
function v_u_3._add_event(p17, p18, p19)
    local v20 = p17._events
    local v21 = {
        ["timestamp"] = p19 or v_u_2.now(),
        ["reward"] = p18
    }
    table.insert(v20, v21)
    p17:mark_changed()
end
function v_u_3.get_next_earn_time(p22)
    p22:_filter_events()
    local v23 = p22._events[1]
    if v23 and p22:get_remaining_budget() == 0 then
        return v23.timestamp + p22.time_period
    else
        return nil
    end
end
function v_u_3.get_remaining_budget(p24)
    p24:_filter_events()
    local v25 = p24.max_budget
    for _, v26 in p24._events do
        v25 = v25 - v26.reward
    end
    return math.max(0, v25)
end
function v_u_3.apply_budget(p27, p28)
    local v29 = p27:get_remaining_budget()
    if v29 == 0 then
        return 0
    end
    local v30 = math.min(p28, v29)
    p27:_add_event(v30)
    return v30
end
function v_u_3.serialize_for_save(p31)
    p31:_filter_events()
    return {
        ["events"] = p31._events
    }
end
function v_u_3.serialize_for_client_replication(p32)
    return {
        ["next_earn_time"] = p32:get_next_earn_time()
    }
end
return v_u_3