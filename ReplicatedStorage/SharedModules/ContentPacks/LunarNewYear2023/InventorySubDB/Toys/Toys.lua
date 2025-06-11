--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Lucky Coin Flying Disc",
    ["image"] = "rbxassetid://11758574860",
    ["rarity"] = "uncommon",
    ["cost"] = 400,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "LNY2023LuckyCoinThrowingDisk",
    ["tool"] = "FlyingDiscTool"
}
v2.lny_2023_coin_flying_disc = v3
local v4 = {
    ["name"] = "Eclipse Balloon",
    ["image"] = "rbxassetid://11758570187",
    ["rarity"] = "uncommon",
    ["cost"] = 400,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "LNY2023EclipseBalloon",
    ["tool"] = "BalloonTool"
}
v2.lny_2023_eclipse_balloon = v4
local v5 = {
    ["name"] = "Lunar New Year Leash",
    ["image"] = "rbxassetid://11758574983",
    ["rarity"] = "rare",
    ["cost"] = 700,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "MagicalPrincessLeash",
    ["model_handle"] = "LNY2023LunarNewYearLeash",
    ["tool"] = "PetLeash"
}
v2.lny_2023_leash = v5
v2.lny_2023_placeable_lantern = {
    ["name"] = "Lunar Lantern",
    ["image"] = "rbxassetid://11758575849",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1800,
    ["model_handle"] = "LNY2023PlaceableLantern",
    ["placeable_type"] = "toy_furniture",
    ["tool"] = "PlaceableTool"
}
return v1(v2)