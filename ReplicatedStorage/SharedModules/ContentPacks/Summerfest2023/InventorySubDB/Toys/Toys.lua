--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Flipflop Throw Toy",
    ["image"] = "rbxassetid://13607586911",
    ["rarity"] = "common",
    ["cost"] = 300,
    ["currency_id"] = "beachballs_2023",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Summerfest2023FlipFlopThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.summerfest_2023_flip_flop_throw_toy = v3
local v4 = {
    ["name"] = "Lemonade Chew Toy",
    ["image"] = "rbxassetid://13607586144",
    ["rarity"] = "uncommon",
    ["cost"] = 500,
    ["currency_id"] = "beachballs_2023",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Summerfest2023LemonadeChewToy",
    ["tool"] = "ChewToyTool"
}
v2.summerfest_2023_lemonade_chew_toy = v4
local v5 = {
    ["name"] = "Pineapple Plush",
    ["image"] = "rbxassetid://13607585808",
    ["rarity"] = "ultra_rare",
    ["cost"] = 7500,
    ["currency_id"] = "beachballs_2023",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Summerfest2023PineapplePlush",
    ["tool"] = "GenericTool"
}
v2.summerfest_2023_pineapple_plush = v5
local v6 = {
    ["name"] = "Pinwheel Propeller",
    ["image"] = "rbxassetid://13607585388",
    ["rarity"] = "ultra_rare",
    ["cost"] = 5000,
    ["currency_id"] = "beachballs_2023",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Summerfest2023PinwheelPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "Summerfest2023PinWheelPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.summerfest_2023_pinwheel_propeller = v6
local v7 = {
    ["name"] = "Sandcastle Rattle",
    ["image"] = "rbxassetid://13607584892",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["currency_id"] = "beachballs_2023",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Summerfest2023SandCastleRattle",
    ["tool"] = "GenericTool"
}
v2.summerfest_2023_sand_castle_rattle = v7
local v8 = {
    ["name"] = "Ship Wheel Flying Disc",
    ["image"] = "rbxassetid://13607584079",
    ["rarity"] = "rare",
    ["cost"] = 2250,
    ["currency_id"] = "beachballs_2023",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Summerfest2023ShipWheelFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.summerfest_2023_ship_wheel_flying_disc = v8
local v9 = {
    ["name"] = "Ukulele",
    ["image"] = "rbxassetid://13607584490",
    ["rarity"] = "legendary",
    ["cost"] = 10000,
    ["currency_id"] = "beachballs_2023",
    ["anims"] = {
        ["hold"] = "Summerfest2023UkuleleHold",
        ["use"] = "Summerfest2023UkulelePlay"
    },
    ["model_handle"] = "Summerfest2023Ukulele",
    ["sounds"] = {
        "Ukulele1",
        "Ukulele2",
        "Ukulele3",
        "Ukulele4"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.summerfest_2023_ukulele = v9
return v1(v2)