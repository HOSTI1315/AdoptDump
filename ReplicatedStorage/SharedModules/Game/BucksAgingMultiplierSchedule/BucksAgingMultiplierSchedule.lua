--// ReplicatedStorage.SharedModules.Game.BucksAgingMultiplierSchedule (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("TimeZoneHelper")
local v_u_3 = v1("LiveOpsTime")
local v_u_4 = v1("CloudValues")
local v5 = v1("Signal")
local v6 = v1("Maid")
local v7 = {}
local v_u_8 = v5.new()
local v_u_9 = v6.new()
local function v_u_17(p10)
    for _, v11 in v_u_4:getValue("bucks_aging_multiplier_schedule", "schedule") do
        local v12 = v11.start_time
        local v13 = v_u_4:getValue("bucks_aging_multiplier_schedule", "timezone")
        local v14 = v_u_2.from_timezone_datetime(v13, v12.year, v12.month, v12.day, v12.hour, v12.minute).UnixTimestamp
        local v15 = v11.expiration_time
        local v16 = v_u_4:getValue("bucks_aging_multiplier_schedule", "timezone")
        p10(v11, v14, v_u_2.from_timezone_datetime(v16, v15.year, v15.month, v15.day, v15.hour, v15.minute).UnixTimestamp)
    end
end
function v7.get_multipliers(p18)
    local v_u_19 = p18 or v_u_3.now()
    local v_u_20 = nil
    v_u_17(function(p21, p22, p23)
        if v_u_20 then
            return
        elseif p23 < v_u_19 then
            return
        elseif v_u_19 >= p22 then
            v_u_20 = {
                ["bucks"] = p21.bucks_multiplier,
                ["aging"] = p21.aging_multiplier,
                ["start"] = p22,
                ["expiration"] = p23
            }
        end
    end)
    return v_u_20 or {
        ["bucks"] = 1,
        ["aging"] = 1
    }
end
function v7.connect_to_multiplier_changed_signal(p24)
    return v_u_8:connect(p24)
end
local function v_u_33()
    v_u_9:DoCleaning()
    local v_u_25 = v_u_3.now()
    local function v_u_29(p26, p_u_27)
        local v_u_28 = v_u_3.delay_until(p26):andThen(function()
            v_u_8:fire(p_u_27)
        end)
        v_u_9:GiveTask(function()
            v_u_28:cancel()
        end)
    end
    v_u_17(function(p30, p31, p32)
        if p32 < v_u_25 then
            return
        else
            v_u_29(p32, {
                ["bucks"] = 1,
                ["aging"] = 1
            })
            if p31 >= v_u_25 then
                v_u_29(p31, {
                    ["bucks"] = p30.bucks_multiplier,
                    ["aging"] = p30.aging_multiplier,
                    ["start"] = p31,
                    ["expiration"] = p32
                })
            end
        end
    end)
end
v_u_33()
v_u_4:onChange(function()
    v_u_33()
end)
return v7