--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {
    ["summerfest_2024_classic_american_car"] = {
        ["model_name"] = "Summerfest2024ClassicAmericanCar",
        ["max_speed"] = 45,
        ["turn_angle"] = 30,
        ["acceleration"] = 35,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20
    },
    ["summerfest_2024_summer_spectacle"] = {
        ["model_name"] = "Summerfest2024SummerSpectacle",
        ["acceleration"] = 40,
        ["drift_slowdown"] = 30,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20,
        ["max_speed"] = 35,
        ["turn_angle"] = 39
    }
}
v1.wheeled = v2
return v1