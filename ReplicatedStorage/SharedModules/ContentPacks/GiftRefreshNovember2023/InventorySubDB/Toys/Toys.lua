--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshNovember2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Ice Pogo Stick",
    ["image"] = "rbxassetid://15175286239",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "GiftRefreshNovember2023IcePogoStick",
    ["tool"] = "PogoTool"
}
v2.gifthat_refresh_2023_ice_pogo_stick = v3
local v4 = {
    ["name"] = "Love Perfume",
    ["image"] = "rbxassetid://15175286320",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GiftRefreshNovember2023LovePerfume",
    ["tool"] = "ThrowToyTool"
}
v2.gifthat_refresh_2023_love_perfume = v4
local v5 = {
    ["name"] = "Magic Scroll Chew Toy",
    ["image"] = "rbxassetid://15175286385",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "GiftRefreshNovember2023MagicScrollChewToy",
    ["tool"] = "ChewToyTool"
}
v2.gifthat_refresh_2023_magic_scroll_chew_toy = v5
local v6 = {
    ["name"] = "Magic Staff Light",
    ["image"] = "rbxassetid://15175286479",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2023MagicStaffLight",
    ["tool"] = "GenericTool"
}
v2.gifthat_refresh_2023_magic_staff_light = v6
local v7 = {
    ["name"] = "Nature\'s Crossbow",
    ["image"] = "rbxassetid://15175286547",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2023NaturesCrossbow",
    ["tool"] = "GrapplingHookTool"
}
v2.gifthat_refresh_2023_natures_crossbow = v7
local v8 = {
    ["name"] = "Olympian Rattle",
    ["image"] = "rbxassetid://15175286609",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "GiftRefreshNovember2023OlympianRattle",
    ["tool"] = "GenericTool"
}
v2.gifthat_refresh_2023_olympian_rattle = v8
local v9 = {
    ["name"] = "Ray Gun Leash",
    ["image"] = "rbxassetid://15175549003",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "LaserLeash",
    ["model_handle"] = "GiftRefreshNovember2023RayGunLeash",
    ["tool"] = "PetLeash"
}
v2.gifthat_refresh_2023_ray_gun_leash = v9
local v10 = {
    ["name"] = "Robo Balloon",
    ["image"] = "rbxassetid://15175549104",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2023RoboBalloon",
    ["tool"] = "BalloonTool"
}
v2.gifthat_refresh_2023_robo_balloon = v10
local v11 = {
    ["name"] = "Robo Plush",
    ["image"] = "rbxassetid://15175549160",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "GiftRefreshNovember2023RoboPlush",
    ["tool"] = "GenericTool"
}
v2.gifthat_refresh_2023_robo_plush = v11
local v12 = {
    ["name"] = "Water Drop Plush",
    ["image"] = "rbxassetid://15175741365",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "GiftRefreshNovember2023WaterDropPlush",
    ["tool"] = "GenericTool"
}
v2.gifthat_refresh_2023_water_drop_plush = v12
local v13 = {
    ["name"] = "Winged Flying Disc",
    ["image"] = "rbxassetid://15175741535",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GiftRefreshNovember2023WingedFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.gifthat_refresh_2023_winged_flying_disc = v13
local v14 = {
    ["name"] = "Witch Propeller",
    ["image"] = "rbxassetid://15175741615",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2023WitchPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.gifthat_refresh_2023_witch_propeller = v14
return v1(v2)