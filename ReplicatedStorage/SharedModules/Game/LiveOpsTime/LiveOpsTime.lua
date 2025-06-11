--// ReplicatedStorage.SharedModules.Game.LiveOpsTime (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("Signal")
local v_u_3 = v_u_1("ServerType")
local v_u_4 = v_u_1("SharedConstants")
local v5 = v_u_1("package:t")
local v_u_6 = v_u_1("package:Promise")
local v_u_7 = game:GetService("RunService")
local v_u_8 = {}
local v_u_9 = v5.map(v5.number, v5.callback)
local function v_u_18(p_u_10, p_u_11)
    local v_u_12 = nil
    return v_u_6.new(function(p13, p14, p15)
        while true do
            local v16 = v_u_8.now()
            if p15() then
                break
            end
            if p_u_11 then
                if v_u_12 == "delayed" or v16 == p_u_10 then
                    return p13()
                end
                if p_u_11 <= v16 then
                    return p14()
                end
            elseif p_u_10 <= v16 then
                return p13()
            end
            local v_u_17 = v_u_6.race({ v_u_6.delay(p_u_10 - v16):andThenReturn("delayed"), v_u_6.fromEvent(v_u_8.time_offset_changed_signal) })
            p15(function()
                v_u_17:cancel()
            end)
            v_u_12 = v_u_17:expect()
        end
    end)
end
local function v_u_19()
    return v_u_7:IsServer() and (v_u_1("DataM").get_global_store():get("LiveOpsTimeStartOffset") or 0) or (v_u_1("ClientData").get("LiveOpsTimeStartOffset") or 0)
end
local function v_u_26(p20, p21)
    local v22 = not v_u_3.use_production_behavior()
    assert(v22, "Cannot adjust LiveOpsTime in production!")
    local v23 = v_u_7:IsServer()
    assert(v23, "API restricted to server")
    local v24 = v_u_8.get_time_offset() < p20
    assert(v24, "Cannot reverse time! The time offset can only be set ahead of where it is currently.")
    local v25 = v_u_1("DataM").get_global_store()
    v25:set("LiveOpsTimeOffset", p20)
    if p21 then
        v25:set("LiveOpsTimeStartOffset", 0)
    end
    v_u_8.time_offset_changed_signal:Fire()
end
v_u_8.time_offset_changed_signal = v2.new()
function v_u_8.get_time_offset()
    return v_u_7:IsServer() and (v_u_1("DataM").get_global_store():get("LiveOpsTimeOffset") or 0) or (v_u_1("ClientData").get("LiveOpsTimeOffset") or 0)
end
function v_u_8.advance_by_seconds(p27)
    local v28 = v_u_7:IsServer()
    assert(v28, "API restricted to server")
    local v29 = p27 >= 0
    assert(v29, "Cannot reverse time! The time offset can only be set ahead of where it is currently.")
    v_u_26(v_u_8.get_time_offset() + p27, false)
end
function v_u_8.set_to_timestamp(p30)
    v_u_26(p30 - workspace:GetServerTimeNow(), true)
end
function v_u_8.now()
    return workspace:GetServerTimeNow() + v_u_19() + v_u_8.get_time_offset()
end
function v_u_8.get_time_until(p31)
    return p31 - v_u_8.now()
end
function v_u_8.has_happened(p32)
    return p32 <= v_u_8.now()
end
function v_u_8.is_within_timestamps(p33, p34)
    local v35 = v_u_8.has_happened(p33)
    if v35 then
        v35 = not v_u_8.has_happened(p34)
    end
    return v35
end
function v_u_8.delay(p36)
    return v_u_18(v_u_8.now() + p36, nil)
end
function v_u_8.delay_until(p37)
    return v_u_18(p37, nil)
end
function v_u_8.delay_until_with_bound(p38, p39)
    return v_u_18(p38, p39)
end
function v_u_8.delay_until_with_bound_offset(p40, p41)
    return v_u_18(p40, p40 + p41)
end
function v_u_8.delay_until_ordered(p42)
    local v43 = v_u_9
    assert(v43(p42))
    local v44 = {}
    for v45, v46 in pairs(p42) do
        table.insert(v44, {
            ["timestamp"] = v45,
            ["callback"] = v46
        })
    end
    table.sort(v44, function(p47, p48)
        return p47.timestamp < p48.timestamp
    end)
    return v_u_6.each(v44, function(p49, _)
        return v_u_8.delay_until(p49.timestamp):andThen(p49.callback)
    end)
end
function v_u_8.get_current_day_time()
    return v_u_8.now() % (v_u_4.day_length + v_u_4.night_length)
end
function v_u_8.get_current_day_start_time()
    local v50 = v_u_8.get_current_day_time()
    return v_u_8.now() - v50
end
function v_u_8.get_current_day_start_time_seconds()
    local v51 = v_u_8.get_current_day_start_time()
    return math.round(v51)
end
function v_u_8.get_is_day()
    return v_u_8.get_current_day_time() < v_u_4.day_length
end
function v_u_8.get_next_day_timestamp()
    return v_u_8.get_current_day_start_time() + v_u_4.day_length + v_u_4.night_length
end
function v_u_8.get_next_time_change_timestamp()
    local v52 = v_u_8.get_is_day()
    local v53 = v_u_8.get_current_day_start_time()
    local v54 = v53 + v_u_4.day_length + v_u_4.night_length
    local v55 = v53 + v_u_4.day_length
    if v52 then
        v54 = v55 or v54
    end
    return v54
end
function v_u_8.init()
    if v_u_7:IsClient() then
        v_u_1("ClientData").register_callback("LiveOpsTimeOffset", function()
            v_u_8.time_offset_changed_signal:Fire()
        end)
    else
        v_u_1("DataM").get_global_store():set("LiveOpsTimeStartOffset", 0)
    end
end
return v_u_8