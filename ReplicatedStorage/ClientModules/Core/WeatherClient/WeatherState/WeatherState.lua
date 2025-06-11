--// ReplicatedStorage.ClientModules.Core.WeatherClient.WeatherState (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("TableUtil")
local v_u_3 = v1("WeatherDB")
local v4 = {}
local v_u_5 = {}
v_u_5.__index = v_u_5
function v4.new(p6)
    local v7 = v_u_5
    local v8 = setmetatable({}, v7)
    v8.stack = p6 and v_u_2.deep_copy(p6.stack) or {}
    return v8
end
function v_u_5.change_weather(p9, p10, p11)
    p9.stack[p10] = p11
end
function v_u_5.get_time_of_day(p12)
    return (p12.stack[1] and p12.stack[1].id or "DAY") == "NIGHT" and "NIGHT" or "DAY"
end
function v_u_5.get_music(p13)
    local v14 = p13:get_time_of_day()
    local v15 = 0
    local v16 = nil
    for v17, v18 in pairs(p13.stack) do
        if v15 <= v17 then
            if v18.music then
                v16 = v18.music
                v15 = v17
            elseif v18.day_music and v14 == "DAY" then
                v16 = v18.day_music
                v15 = v17
            elseif v18.night_music and v14 == "NIGHT" then
                v16 = v18.night_music
                v15 = v17
            end
        end
    end
    return v16
end
function v_u_5.get_highest_priority_weather(p19)
    local v20 = v_u_3.DAY
    local v21 = 0
    for v22, v23 in pairs(p19.stack) do
        if v21 <= v22 then
            v20 = v23
            v21 = v22
        end
    end
    return v20
end
return v4