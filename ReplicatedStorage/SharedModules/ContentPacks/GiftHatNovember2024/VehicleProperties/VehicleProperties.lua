--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatNovember2024.VehicleProperties (ModuleScript)

local v1 = {}
local v2 = {
    ["gifthat_november_2024_dolphin_cruiser"] = {
        ["model_name"] = "GiftHatNov2024DolphinCruiser",
        ["max_speed"] = 35,
        ["turn_angle"] = 35,
        ["lean_angle"] = 20,
        ["acceleration"] = 25,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false
    }
}
v1.wheeled = v2
local v3 = {}
local v4 = {
    ["model_name"] = "GiftHatNov2024WingedSkates",
    ["ground_offset"] = 0.58,
    ["max_speed"] = 42,
    ["skate_models"] = {
        ["left"] = "GiftHatNov2024WingedSkatesSingle",
        ["right"] = "GiftHatNov2024WingedSkatesSingle"
    },
    ["turn_rate"] = 130,
    ["turn_rate_touch"] = 600
}
v3.gifthat_november_2024_winged_skates = v4
v1.roller_skates = v3
return v1