--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties.ScooterVehiclePropertiesDB (ModuleScript)

local v1 = {
    ["adopt_me_scooter_boy"] = {
        ["model_name"] = "AdoptMeScooterBoy"
    },
    ["adopt_me_scooter_girl"] = {
        ["model_name"] = "AdoptMeScooterGirl"
    },
    ["black_scooter"] = {
        ["model_name"] = "BlackScooter"
    },
    ["blue_scooter"] = {
        ["model_name"] = "BlueScooter"
    },
    ["cupcake_scooter"] = {
        ["model_name"] = "CupcakeScooter"
    },
    ["doge_scooter"] = {
        ["model_name"] = "DogeScooter"
    },
    ["duck_scooter"] = {
        ["model_name"] = "DuckScooter"
    },
    ["emoji_scooter"] = {
        ["model_name"] = "EmojiScooter"
    },
    ["glass_scooter"] = {
        ["model_name"] = "GlassScooter"
    },
    ["gold_scooter"] = {
        ["model_name"] = "GoldScooter"
    },
    ["ice_scooter"] = {
        ["model_name"] = "IceScooter"
    },
    ["neon_black_scooter"] = {
        ["model_name"] = "NeonBlackScooter"
    },
    ["neon_blue_scooter"] = {
        ["model_name"] = "NeonBlueScooter"
    },
    ["neon_green_scooter"] = {
        ["model_name"] = "NeonGreenScooter"
    },
    ["neon_orange_scooter"] = {
        ["model_name"] = "NeonOrangeScooter"
    },
    ["neon_pink_scooter"] = {
        ["model_name"] = "NeonPinkScooter"
    },
    ["neon_red_scooter"] = {
        ["model_name"] = "NeonRedScooter"
    },
    ["neon_white_scooter"] = {
        ["model_name"] = "NeonWhiteScooter"
    },
    ["pink_scooter"] = {
        ["model_name"] = "PinkScooter"
    },
    ["white_scooter"] = {
        ["model_name"] = "WhiteScooter"
    },
    ["wood_scooter"] = {
        ["model_name"] = "WoodScooter"
    }
}
require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ContentPackHelper").merge("VehicleProperties", {
    ["scooters"] = v1
}, true)
local v2 = {
    ["max_speed"] = 35,
    ["turn_angle"] = 14,
    ["lean_angle"] = 15,
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["animation"] = "ScooterRide"
}
for _, v3 in v1 do
    for v4, v5 in v2 do
        if v3[v4] == nil then
            v3[v4] = v5
        end
    end
    v3.vehicle_type = "wheeled"
end
return v1