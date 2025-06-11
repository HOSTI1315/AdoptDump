--// ReplicatedStorage.CmdrClient.Commands.getlighting (ModuleScript)

return {
    ["Name"] = "getlighting",
    ["Description"] = "Gets lighting for the current interior",
    ["Group"] = "Debug",
    ["Args"] = {},
    ["Data"] = function()
        local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
        local v2 = v1("WeatherClient")
        local v3 = v1("InteriorsM").get_current_location()
        return v2.get_weather_id(v3)
    end
}