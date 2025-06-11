--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties.HelicopterVehiclePropertiesDB (ModuleScript)

local v1 = {
    ["fossil_paw_helicopter"] = {
        ["model_name"] = "FossilPawHelicopter",
        ["acceleration"] = 30,
        ["lift_speed"] = 40,
        ["max_speed"] = 30,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.3490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.005
    },
    ["rgb_ufo"] = {
        ["model_name"] = "RGBUFO",
        ["acceleration"] = 30,
        ["already_welded"] = true,
        ["vehicle_render_effects"] = { "rgb_animate" },
        ["lift_speed"] = 40,
        ["max_speed"] = 30,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.3490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 0,
        ["wobble_reduction"] = 0
    },
    ["springfest_2023_rabbit_helicopter"] = {
        ["model_name"] = "Springfest2023RabbitHelicopter",
        ["acceleration"] = 30,
        ["lift_speed"] = 40,
        ["max_speed"] = 30,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.3490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.005
    },
    ["vehicle_shop_2022_gyrocopter"] = {
        ["model_name"] = "VehicleShop2022Gyrocopter",
        ["acceleration"] = 30,
        ["lift_speed"] = 40,
        ["max_speed"] = 30,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.3490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.005
    },
    ["vehicle_shop_2022_helicopter"] = {
        ["model_name"] = "VehicleShop2022Helicopter",
        ["acceleration"] = 30,
        ["lift_speed"] = 40,
        ["max_speed"] = 30,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.3490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.005
    },
    ["winter_2021_toy_rescue_helicopter"] = {
        ["model_name"] = "Winter2021ToyRescueHelicopter",
        ["acceleration"] = 30,
        ["lift_speed"] = 40,
        ["max_speed"] = 30,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.3490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.005
    }
}
require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ContentPackHelper").merge("VehicleProperties", {
    ["helicopters"] = v1
}, true)
for _, v2 in v1 do
    v2.uses_follow_camera = false
    v2.vehicle_type = "helicopter"
end
return v1