--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {
    ["halloween_2024_enchanted_broomstick"] = {
        ["model_name"] = "Halloween2024EnchantedBroomstick",
        ["acceleration"] = 50,
        ["lift_speed"] = 40,
        ["max_speed"] = 40,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.3490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 2,
        ["wobble_reduction"] = 0.005
    }
}
v1.helicopters = v2
local v3 = {
    ["halloween_2024_rift_rider"] = {
        ["model_name"] = "Halloween2024RiftRider",
        ["max_speed"] = 45,
        ["turn_angle"] = 40,
        ["lean_angle"] = 20,
        ["acceleration"] = 30,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false
    }
}
v1.wheeled = v3
return v1