--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties.MiscVehiclePropertiesDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ContentPackHelper")
local v2 = {
    ["chiprac_2023_super_jetpack"] = {
        ["model_name"] = "ChipRac2023SuperJetpack",
        ["uses_follow_camera"] = false,
        ["vehicle_type"] = "jetpack",
        ["acceleration"] = 80,
        ["animation"] = "Standing",
        ["lift_speed"] = 40,
        ["max_speed"] = 40,
        ["tilt_angle"] = 0.6981317007977318,
        ["turn_torque"] = 20,
        ["wobble_frequency"] = 4,
        ["wobble_reduction"] = 0.005
    }
}
local v3 = {
    ["model_name"] = "Safari2023CheetahMount",
    ["uses_follow_camera"] = false,
    ["vehicle_type"] = "mount",
    ["animation"] = "PlayerRidingPet",
    ["vehicle_render_effects"] = { "mount_animate" },
    ["eyes"] = { "Eyes_Geo" },
    ["idle_flair_animations"] = { "Safari2023CheetahMountIdle2" },
    ["idle_max_wait"] = 10,
    ["idle_min_wait"] = 3,
    ["max_lean"] = 30,
    ["mount_animations"] = {
        ["fall"] = "Safari2023CheetahMountFall",
        ["idle"] = "Safari2023CheetahMountIdle",
        ["run"] = "Safari2023CheetahMountRun",
        ["swim"] = "Safari2023CheetahMountSwim"
    },
    ["swim_speed"] = 20,
    ["swim_y_offset"] = 0.8,
    ["walk_speed"] = 30
}
v2.safari_2023_cheetah_mount = v3
local v4 = {
    ["model_name"] = "IceSkates",
    ["vehicle_type"] = "ice_skates",
    ["ground_offset"] = 0.33,
    ["max_speed"] = 35,
    ["movement_animations"] = {
        ["backward"] = "IceSkatingBackward",
        ["brake"] = "IceSkatingBrake",
        ["coast"] = "IceSkatingCoast",
        ["forward"] = "IceSkatingForward",
        ["idle"] = "IceSkatingIdle",
        ["jump"] = "IceSkatingJump",
        ["jump_backwards"] = "IceSkatingJumpBackwards",
        ["turning_left"] = "IceSkatingLeft",
        ["turning_right"] = "IceSkatingRight",
        ["stumble"] = "IceSkatingStumble",
        ["falling"] = "IceSkatingFalling",
        ["falling_backwards"] = "IceSkatingFallingBackwards"
    },
    ["skate_models"] = {
        ["left"] = "IceSkatesSingle",
        ["right"] = "IceSkatesSingle"
    },
    ["turn_rate"] = 150,
    ["turn_rate_touch"] = 720
}
v2.ice_skates = v4
v2.mystery_machine = {
    ["model_name"] = nil,
    ["vehicle_type"] = "wheeled",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 30
}
v1.merge("VehicleProperties", {
    ["misc"] = v2
}, true)
return v2