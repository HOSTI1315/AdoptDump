--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {
    ["winter_2023_snow_globetrotter"] = {
        ["model_name"] = "Winter2023SnowGlobetrotter",
        ["max_speed"] = 35,
        ["turn_angle"] = 40,
        ["lean_angle"] = 20,
        ["acceleration"] = 40,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false
    },
    ["winter_2023_waffle_wagon"] = {
        ["model_name"] = "Winter2023WaffleWagon",
        ["max_speed"] = 30,
        ["turn_angle"] = 20,
        ["lean_angle"] = 20,
        ["acceleration"] = 30,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false
    },
    ["winter_2023_candy_camper"] = {
        ["model_name"] = "Winter2023CandyCamper",
        ["max_speed"] = 42,
        ["turn_angle"] = 30,
        ["lean_angle"] = 20,
        ["acceleration"] = 25,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false
    },
    ["winter_2023_festive_wreath_cruiser"] = {
        ["model_name"] = "Winter2023FestiveWreathCruiser",
        ["max_speed"] = 35,
        ["turn_angle"] = 15,
        ["lean_angle"] = 0,
        ["acceleration"] = 55,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = true
    },
    ["winter_2023_firework_cycle"] = {
        ["model_name"] = "Winter2023FireworkCycle",
        ["max_speed"] = 45,
        ["turn_angle"] = 15,
        ["lean_angle"] = 20,
        ["acceleration"] = 80,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = true,
        ["animation"] = "MotorcycleHandleHold"
    }
}
v1.wheeled = v2
local v3 = {
    ["winter_2023_gingerbread_stunt_plane"] = {
        ["model_name"] = "Winter2023GingerbreadStuntPlane",
        ["flat_speed"] = 20,
        ["climb_speed"] = 20,
        ["descent_speed"] = 60,
        ["max_roll"] = 0.3490658503988659,
        ["max_pitch"] = 0.7853981633974483,
        ["yaw_speed"] = 1.0471975511965976,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.05,
        ["flap_control_callback_name"] = "default_control_callback"
    }
}
v1.planes = v3
return v1