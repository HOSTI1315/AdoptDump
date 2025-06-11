--// ReplicatedStorage.SharedModules.ContentPacks.CapuchinFairground2024.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {}
local v3 = {
    ["model_name"] = "Capuchin2024CircusBallSkates",
    ["ground_offset"] = 0.43,
    ["max_speed"] = 35,
    ["skate_models"] = {
        ["left"] = "Capuchin2024CircusBallSkateSingle",
        ["right"] = "Capuchin2024CircusBallSkateSingle"
    },
    ["turn_rate"] = 130,
    ["turn_rate_touch"] = 600
}
v2.capuchin_2024_circus_ball_skates = v3
v1.roller_skates = v2
local v4 = {
    ["capuchin_2024_hot_air_balloon"] = {
        ["model_name"] = "Capuchin2024HotAirBalloon",
        ["acceleration"] = 5,
        ["lift_speed"] = 14,
        ["max_speed"] = 17,
        ["passenger_camera_clip"] = true,
        ["tilt_angle"] = 0.03490658503988659,
        ["turn_torque"] = 10,
        ["wobble_frequency"] = 0.5,
        ["wobble_reduction"] = 0.005
    }
}
v1.helicopters = v4
return v1