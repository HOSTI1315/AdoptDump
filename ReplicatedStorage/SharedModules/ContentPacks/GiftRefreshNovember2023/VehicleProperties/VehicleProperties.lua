--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshNovember2023.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {
    ["gift_refresh_2023_robo_unicycle"] = {
        ["model_name"] = "GiftRefreshNovember2023RoboUnicycle",
        ["max_speed"] = 30,
        ["turn_angle"] = 15,
        ["lean_angle"] = 20,
        ["acceleration"] = 30,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = true
    }
}
v1.wheeled = v2
local v3 = {
    ["gift_refresh_2023_bee_shuttle"] = {
        ["model_name"] = "GiftRefreshNovember2023BeeShuttle",
        ["max_speed"] = 45,
        ["lean_angle"] = 2,
        ["turn_rate"] = 120,
        ["turn_rate_touch"] = 600,
        ["moving_hover_offset"] = 0.5,
        ["idle_hover_offset"] = 0.5,
        ["idle_hover_frequency"] = 1,
        ["idle_hover_lean_factor"] = 0.5
    }
}
v1.hoverboards = v3
return v1