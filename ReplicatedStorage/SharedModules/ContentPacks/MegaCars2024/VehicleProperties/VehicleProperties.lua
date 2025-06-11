--// ReplicatedStorage.SharedModules.ContentPacks.MegaCars2024.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {
    ["mega_cars_2024_regal_roller"] = {
        ["model_name"] = "MegaCars2024RegalRoller",
        ["max_speed"] = 60,
        ["turn_angle"] = 35,
        ["lean_angle"] = 20,
        ["acceleration"] = 80,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false
    },
    ["mega_cars_2024_street_racer"] = {
        ["model_name"] = "MegaCars2024StreetRacer",
        ["max_speed"] = 60,
        ["turn_angle"] = 35,
        ["lean_angle"] = 20,
        ["acceleration"] = 80,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false
    },
    ["mega_cars_2024_cupids_buggy"] = {
        ["model_name"] = "MegaCars2024CupidsBuggy",
        ["max_speed"] = 60,
        ["turn_angle"] = 35,
        ["lean_angle"] = 20,
        ["acceleration"] = 80,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false
    }
}
v1.wheeled = v2
return v1