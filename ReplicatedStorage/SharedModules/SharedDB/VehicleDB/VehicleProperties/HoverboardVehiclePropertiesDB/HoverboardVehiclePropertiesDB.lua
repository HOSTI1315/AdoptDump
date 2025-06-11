--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties.HoverboardVehiclePropertiesDB (ModuleScript)

local v1 = {
    ["hoverboard"] = {
        ["model_name"] = "Hoverboard",
        ["animation"] = "Snowboard",
        ["idle_hover_frequency"] = 2,
        ["idle_hover_offset"] = 0.5,
        ["lean_angle"] = 12,
        ["max_speed"] = 40,
        ["moving_hover_offset"] = 0.5,
        ["turn_rate"] = 120,
        ["turn_rate_touch"] = 600
    },
    ["hovercar"] = {
        ["model_name"] = "Hovercar",
        ["idle_hover_frequency"] = 1,
        ["idle_hover_offset"] = 2,
        ["lean_angle"] = 6,
        ["max_speed"] = 45,
        ["moving_hover_offset"] = 1.5,
        ["turn_rate"] = 120,
        ["turn_rate_touch"] = 600
    },
    ["imagination_box"] = {
        ["model_name"] = "ImaginationBox",
        ["idle_hover_frequency"] = 2.5,
        ["idle_hover_offset"] = 1.5,
        ["lean_angle"] = 6,
        ["max_speed"] = 37,
        ["moving_hover_offset"] = 1,
        ["turn_rate"] = 100,
        ["turn_rate_touch"] = 600
    },
    ["lny_2023_crescent_moon"] = {
        ["model_name"] = "LNY2023CrescentMoon",
        ["idle_hover_frequency"] = 2,
        ["idle_hover_offset"] = 2.5,
        ["lean_angle"] = 10,
        ["max_speed"] = 45,
        ["moving_hover_offset"] = 1,
        ["turn_rate"] = 130,
        ["turn_rate_touch"] = 600
    },
    ["pride_2022_rainbow_trail_magic_carpet"] = {
        ["model_name"] = "Pride2022RainbowTrailMagicCarpet",
        ["animation"] = "Snowboard",
        ["idle_hover_frequency"] = 2,
        ["idle_hover_offset"] = 0.5,
        ["lean_angle"] = 12,
        ["max_speed"] = 40,
        ["moving_hover_offset"] = 0.5,
        ["turn_rate"] = 120,
        ["turn_rate_touch"] = 600
    },
    ["santa_sleigh"] = {
        ["model_name"] = "SantaSleigh",
        ["idle_hover_frequency"] = 2,
        ["idle_hover_offset"] = 1.5,
        ["lean_angle"] = 6,
        ["max_speed"] = 40,
        ["moving_hover_offset"] = 1,
        ["turn_rate"] = 120,
        ["turn_rate_touch"] = 600
    },
    ["star_rewards_2022_hovercraft"] = {
        ["model_name"] = "StarRewards2022Hovercraft",
        ["idle_hover_offset"] = 0,
        ["lean_angle"] = 2,
        ["max_speed"] = 50,
        ["moving_hover_offset"] = 0.2,
        ["turn_rate"] = 120,
        ["turn_rate_touch"] = 600
    },
    ["star_rewards_2022_planet_car"] = {
        ["model_name"] = "StarRewards2022PlanetCar",
        ["idle_hover_frequency"] = 1.5,
        ["idle_hover_offset"] = 2,
        ["lean_angle"] = 15,
        ["max_speed"] = 45,
        ["moving_hover_offset"] = 1.5,
        ["turn_rate"] = 130,
        ["turn_rate_touch"] = 600
    },
    ["winter_2024_chairlift"] = {
        ["model_name"] = "Winter2024Chairlift",
        ["idle_hover_frequency"] = 2,
        ["idle_hover_offset"] = 1.5,
        ["lean_angle"] = 6,
        ["max_speed"] = 40,
        ["moving_hover_offset"] = 1,
        ["turn_rate"] = 120,
        ["turn_rate_touch"] = 600
    }
}
require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ContentPackHelper").merge("VehicleProperties", {
    ["hoverboards"] = v1
}, true)
for _, v2 in v1 do
    v2.vehicle_type = "hoverboard"
end
return v1