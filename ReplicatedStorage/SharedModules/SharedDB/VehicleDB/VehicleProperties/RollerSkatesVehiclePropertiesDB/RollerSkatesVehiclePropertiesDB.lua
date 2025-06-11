--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties.RollerSkatesVehiclePropertiesDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ContentPackHelper")
local v2 = {}
local v3 = {
    ["model_name"] = "ButterflyRollerSkates",
    ["ground_offset"] = 0.4,
    ["max_speed"] = 35,
    ["skate_models"] = {
        ["left"] = "ButterflyRollerSkateSingle",
        ["right"] = "ButterflyRollerSkateSingle"
    },
    ["turn_rate"] = 130,
    ["turn_rate_touch"] = 600
}
v2.butterfly_roller_skates = v3
local v4 = {
    ["model_name"] = "GiftRefreshMarch2022BatSkates",
    ["ground_offset"] = 0.45,
    ["max_speed"] = 30,
    ["skate_models"] = {
        ["left"] = "GiftRefreshMarch2022BatSkateSingle",
        ["right"] = "GiftRefreshMarch2022BatSkateSingle"
    },
    ["turn_rate"] = 140,
    ["turn_rate_touch"] = 700
}
v2.gift_refresh_2022_bat_roller_skates = v4
local v5 = {
    ["model_name"] = "GiftRefreshNovember2022SoapySkates",
    ["ground_offset"] = 0.45,
    ["max_speed"] = 30,
    ["skate_models"] = {
        ["left"] = "GiftRefreshNovember2022SoapySkateSingle",
        ["right"] = "GiftRefreshNovember2022SoapySkateSingle"
    },
    ["turn_rate"] = 140,
    ["turn_rate_touch"] = 700
}
v2.gift_refresh_2022_soapy_skates = v5
local v6 = {
    ["model_name"] = "GiftHat2023NeonRollerSkates",
    ["ground_offset"] = 0.4,
    ["max_speed"] = 35,
    ["skate_models"] = {
        ["left"] = "GiftHat2023NeonRollerSkatesSingle",
        ["right"] = "GiftHat2023NeonRollerSkatesSingle"
    },
    ["turn_rate"] = 130,
    ["turn_rate_touch"] = 600
}
v2.gifthat_2023_neon_skates = v6
local v7 = {
    ["model_name"] = "PlantPoweredRollerSkates",
    ["ground_offset"] = 0.4,
    ["max_speed"] = 35,
    ["skate_models"] = {
        ["left"] = "PlantPoweredRollerSkatesSingle",
        ["right"] = "PlantPoweredRollerSkatesSingle"
    },
    ["turn_rate"] = 130,
    ["turn_rate_touch"] = 600
}
v2.plant_powered_roller_skates = v7
local v8 = {
    ["model_name"] = "RocketSkates",
    ["ground_offset"] = 0.4,
    ["max_speed"] = 45,
    ["skate_models"] = {
        ["left"] = "RocketSkatesSingle",
        ["right"] = "RocketSkatesSingle"
    },
    ["turn_rate"] = 130,
    ["turn_rate_touch"] = 600
}
v2.rocket_skates = v8
local v9 = {
    ["model_name"] = "RollerSkates",
    ["ground_offset"] = 0.45,
    ["max_speed"] = 30,
    ["skate_models"] = {
        ["left"] = "RollerSkatesSingle",
        ["right"] = "RollerSkatesSingle"
    },
    ["turn_rate"] = 140,
    ["turn_rate_touch"] = 700
}
v2.roller_skates = v9
local v10 = {
    ["model_name"] = "StandardRollerSkates",
    ["ground_offset"] = 0.4,
    ["max_speed"] = 35,
    ["skate_models"] = {
        ["left"] = "StandardRollerSkateSingle",
        ["right"] = "StandardRollerSkateSingle"
    },
    ["turn_rate"] = 130,
    ["turn_rate_touch"] = 600
}
v2.standard_roller_skates = v10
local v11 = {
    ["model_name"] = "Winter2021ElfIceSkates",
    ["ground_offset"] = 0.45,
    ["max_speed"] = 30,
    ["skate_models"] = {
        ["left"] = "Winter2021ElfIceSkateSingle",
        ["right"] = "Winter2021ElfIceSkateSingle"
    },
    ["turn_rate"] = 140,
    ["turn_rate_touch"] = 700
}
v2.winter_2021_green_elf_ice_skates = v11
local v12 = {
    ["model_name"] = "Winter2022StrawberryShortcakeSkates",
    ["ground_offset"] = 0.45,
    ["max_speed"] = 30,
    ["skate_models"] = {
        ["left"] = "Winter2022StrawberryShortcakeSkateSingle",
        ["right"] = "Winter2022StrawberryShortcakeSkateSingle"
    },
    ["turn_rate"] = 140,
    ["turn_rate_touch"] = 700
}
v2.winter_2022_strawberry_shortcake_skates = v12
v1.merge("VehicleProperties", {
    ["roller_skates"] = v2
}, true)
for _, v13 in v2 do
    v13.vehicle_type = "roller_skates"
    v13.movement_animations = {
        ["backward"] = "IceSkatingBackward",
        ["brake"] = "RollerSkatingBrake",
        ["coast"] = "RollerSkatingCoast",
        ["forward"] = "RollerSkatingForward",
        ["idle"] = "RollerSkatingIdle",
        ["jump"] = "RollerSkatingJump",
        ["jump_backwards"] = "IceSkatingJumpBackwards",
        ["turning_left"] = "RollerSkatingLeft",
        ["turning_right"] = "RollerSkatingRight",
        ["falling"] = "IceSkatingFalling",
        ["falling_backwards"] = "IceSkatingFallingBackwards"
    }
end
return v2