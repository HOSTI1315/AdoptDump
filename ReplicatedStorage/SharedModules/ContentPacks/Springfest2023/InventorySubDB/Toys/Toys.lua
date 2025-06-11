--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Fern Propeller",
    ["image"] = "rbxassetid://12792507460",
    ["rarity"] = "legendary",
    ["cost"] = 9000,
    ["currency_id"] = "eggs_2023",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Springfest2023FernPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.springfest_2023_fern_propeller = v3
local v4 = {
    ["name"] = "Flower Cloud Plush",
    ["image"] = "rbxassetid://12719593587",
    ["rarity"] = "rare",
    ["cost"] = 1400,
    ["currency_id"] = "eggs_2023",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Springfest2023FlowerCloudPlush",
    ["tool"] = "GenericTool"
}
v2.springfest_2023_flower_cloud_plush = v4
local v5 = {
    ["name"] = "Honey Dipper Rattle",
    ["image"] = "rbxassetid://12719595230",
    ["rarity"] = "ultra_rare",
    ["cost"] = 5000,
    ["currency_id"] = "eggs_2023",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Springfest2023HoneyDipperRattle",
    ["tool"] = "GenericTool"
}
v2.springfest_2023_honey_dipper_rattle = v5
local v6 = {
    ["name"] = "Kite Balloon",
    ["image"] = "rbxassetid://12719588780",
    ["rarity"] = "rare",
    ["cost"] = 2000,
    ["currency_id"] = "eggs_2023",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Springfest2023KiteBalloon",
    ["tool"] = "BalloonTool"
}
v2.springfest_2023_kite_balloon = v6
local v7 = {
    ["name"] = "Mushroom Flying Disc",
    ["image"] = "rbxassetid://12719592498",
    ["rarity"] = "common",
    ["cost"] = 400,
    ["currency_id"] = "eggs_2023",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Springfest2023MushroomFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.springfest_2023_mushroom_flying_disc = v7
local v8 = {
    ["name"] = "Sprout Pogo Stick",
    ["image"] = "rbxassetid://12792508280",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1000,
    ["currency_id"] = "eggs_2023",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Springfest2023SproutPogoStick",
    ["tool"] = "PogoTool"
}
v2.springfest_2023_sprout_pogo_stick = v8
local v9 = {
    ["name"] = "Water Pail Leash",
    ["image"] = "rbxassetid://12719589267",
    ["rarity"] = "uncommon",
    ["cost"] = 600,
    ["currency_id"] = "eggs_2023",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "Leash",
    ["model_handle"] = "Springfest2023WaterPailLeash",
    ["tool"] = "PetLeash"
}
v2.springfest_2023_water_pail_leash = v9
return v1(v2)