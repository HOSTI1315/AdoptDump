--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties.PlaneVehiclePropertiesDB (ModuleScript)

local v1 = {
    ["halloween_2022_headless_horsemans_biplane"] = {
        ["model_name"] = "Halloween2022HeadlessHorsemansBiplane",
        ["climb_speed"] = 20,
        ["descent_speed"] = 60,
        ["flap_control_callback_name"] = "biplane_callback",
        ["flat_speed"] = 20,
        ["max_pitch"] = 0.7853981633974483,
        ["max_roll"] = 0.3490658503988659,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.05,
        ["yaw_speed"] = 1.0471975511965976
    },
    ["racing_monoplane"] = {
        ["model_name"] = "RacingMonoplane",
        ["climb_speed"] = 20,
        ["descent_speed"] = 60,
        ["flap_control_callback_name"] = "default_control_callback",
        ["flat_speed"] = 20,
        ["max_pitch"] = 0.7853981633974483,
        ["max_roll"] = 0.3490658503988659,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.05,
        ["yaw_speed"] = 1.0471975511965976
    },
    ["vehicle_shop_2022_plane"] = {
        ["model_name"] = "VehicleShop2022Plane",
        ["climb_speed"] = 20,
        ["descent_speed"] = 60,
        ["flap_control_callback_name"] = "default_control_callback",
        ["flat_speed"] = 20,
        ["max_pitch"] = 0.7853981633974483,
        ["max_roll"] = 0.3490658503988659,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.05,
        ["yaw_speed"] = 1.0471975511965976
    },
    ["winter_2021_flying_sleigh"] = {
        ["model_name"] = "Winter2021FlyingSleigh",
        ["climb_speed"] = 20,
        ["descent_speed"] = 60,
        ["display_vehicle_type"] = "sleigh",
        ["flap_control_callback_name"] = "no_flaps_callback",
        ["flat_speed"] = 20,
        ["max_pitch"] = 0.7853981633974483,
        ["max_roll"] = 0.3490658503988659,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.05,
        ["yaw_speed"] = 1.0471975511965976
    },
    ["winter_2022_gingerbread_sleigh"] = {
        ["model_name"] = "Winter2022GingerbreadSleigh",
        ["climb_speed"] = 20,
        ["descent_speed"] = 60,
        ["display_vehicle_type"] = "sleigh",
        ["flap_control_callback_name"] = "no_flaps_callback",
        ["flat_speed"] = 20,
        ["max_pitch"] = 0.7853981633974483,
        ["max_roll"] = 0.3490658503988659,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.05,
        ["yaw_speed"] = 1.0471975511965976
    }
}
require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ContentPackHelper").merge("VehicleProperties", {
    ["planes"] = v1
}, true)
for _, v2 in v1 do
    v2.uses_follow_camera = true
    v2.vehicle_type = "plane"
end
return v1