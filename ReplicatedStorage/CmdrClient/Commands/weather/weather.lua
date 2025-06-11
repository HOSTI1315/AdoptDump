--// ReplicatedStorage.CmdrClient.Commands.weather (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("WeatherDB")
local v_u_3 = { "None" }
for v4 in pairs(v2) do
    table.insert(v_u_3, v4)
end
return {
    ["Name"] = "weather",
    ["Aliases"] = {},
    ["Description"] = "Set weather",
    ["Group"] = "Debug",
    ["Args"] = { function(p5)
            return {
                ["Type"] = p5.Cmdr.Util.MakeEnumType("weather", v_u_3),
                ["Name"] = "Weather",
                ["Description"] = "Weather"
            }
        end },
    ["ClientRun"] = function(_, p6)
        local v7 = v_u_1("WeatherClient")
        if p6 == "None" then
            v7.remove_lighting(99, true)
            return "Weather reset"
        else
            v7.add_interior_lighting(99, p6, true)
            return "Weather changed"
        end
    end
}