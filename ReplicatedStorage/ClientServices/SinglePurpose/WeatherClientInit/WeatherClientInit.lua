--// ReplicatedStorage.ClientServices.SinglePurpose.WeatherClientInit (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("WeatherClient")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("WeatherDB")
return {
    ["init"] = function()
        local v5 = v_u_3.get("WeatherAPI/GetWeather"):InvokeServer()
        v_u_2.change_weather(1, v_u_4[v5], true)
        v_u_3.get_event("WeatherAPI/WeatherUpdated").OnClientEvent:connect(function(p6)
            v_u_2.change_weather(1, v_u_4[p6])
        end)
    end
}