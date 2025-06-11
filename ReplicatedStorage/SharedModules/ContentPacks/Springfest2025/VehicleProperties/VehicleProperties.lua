--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {
    ["spring_2025_flying_cloud"] = {
        ["model_name"] = "Spring2025FlyingCloud",
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
v1.helicopters = v2
local v3 = {
    ["spring_2025_powerbike"] = {
        ["model_name"] = "Spring2025Powerbike",
        ["acceleration"] = 70,
        ["animation"] = "BikeHandleHold",
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 20,
        ["max_speed"] = 50,
        ["turn_angle"] = 22
    }
}
v1.wheeled = v3
return v1