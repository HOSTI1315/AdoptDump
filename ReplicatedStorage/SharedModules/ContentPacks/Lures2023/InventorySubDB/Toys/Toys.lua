--// ReplicatedStorage.SharedModules.ContentPacks.Lures2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Flame Balloon",
    ["image"] = "rbxassetid://14398232786",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Lures2023FlameBalloon",
    ["tool"] = "BalloonTool"
}
v2.lures_2023_flame_balloon = v3
local v4 = {
    ["name"] = "Flame Grappling Hook",
    ["image"] = "rbxassetid://14454464738",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Lures2023FlameGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.lures_2023_flame_grappling_hook = v4
local v5 = {
    ["name"] = "Flame Pogostick",
    ["image"] = "rbxassetid://14454465363",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Lures2023FlamePogostick",
    ["tool"] = "PogoTool"
}
v2.lures_2023_flame_pogostick = v5
local v6 = {
    ["name"] = "Magma Throwing Disc",
    ["image"] = "rbxassetid://14398231663",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Lures2023MagmaThrowingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.lures_2023_magma_throwing_disc = v6
local v7 = {
    ["name"] = "Meteor Plush",
    ["image"] = "rbxassetid://14454466019",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Lures2023MeteorPlush",
    ["tool"] = "GenericTool"
}
v2.lures_2023_meteor_plush = v7
return v1(v2)