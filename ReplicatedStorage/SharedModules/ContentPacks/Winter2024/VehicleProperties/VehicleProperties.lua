--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {
    ["winter_2024_trusty_sled"] = {
        ["model_name"] = "Winter2024TrustySled",
        ["max_speed"] = 45,
        ["turn_angle"] = 30,
        ["acceleration"] = 35,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20
    },
    ["winter_2024_hot_rod_sleigh"] = {
        ["model_name"] = "Winter2024HotRodSleigh",
        ["max_speed"] = 55,
        ["turn_angle"] = 38,
        ["acceleration"] = 35,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20
    },
    ["winter_2024_festive_wagon"] = {
        ["model_name"] = "Winter2024FestiveWagon",
        ["max_speed"] = 55,
        ["turn_angle"] = 38,
        ["acceleration"] = 35,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20
    }
}
v1.wheeled = v2
local v3 = {
    ["winter_2024_shooting_star_vehicle"] = {
        ["model_name"] = "Winter2024ShootingStarVehicle",
        ["acceleration"] = 50,
        ["lift_speed"] = 40,
        ["max_speed"] = 40,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.3490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.005,
        ["animation"] = "Snowboard"
    }
}
v1.helicopters = v3
return v1