--// ReplicatedStorage.SharedModules.ContentPacks.CapuchinFairground2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Seal Pogo",
    ["image"] = "rbxassetid://16727836449",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Capuchin2024SealPogo",
    ["tool"] = "PogoTool"
}
v2.capuchin_2024_seal_pogo = v3
local v4 = {
    ["name"] = "Illusionary Throw Hat",
    ["image"] = "rbxassetid://16728086257",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Capuchin2024TophatFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.capuchin_2024_tophat_flying_disc = v4
local v5 = {
    ["name"] = "Compass",
    ["image"] = "rbxassetid://16791707587",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Capuchin2024Compass",
    ["tool"] = "FlyingDiscTool"
}
v2.capuchin_2024_compass = v5
local v6 = {
    ["name"] = "Whip Grappling Hook",
    ["image"] = "rbxassetid://16810539256",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Capuchin2024WhipGrapplingHook",
    ["tool"] = "WhipGrapplingHookTool"
}
v2.capuchin_2024_whip_grappling_hook = v6
v2.capuchin_2024_peanut_friend_chew_toy = {
    ["name"] = "Peanut Friend Chewtoy",
    ["image"] = "rbxassetid://16811188867",
    ["rarity"] = "common",
    ["model_handle"] = "Capuchin2024PeanutFriendChewToy",
    ["tool"] = "ChewToyTool"
}
local v7 = {
    ["name"] = "Peanut Balloon",
    ["image"] = "rbxassetid://16811190920",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Capuchin2024PeanutBalloon",
    ["tool"] = "BalloonTool"
}
v2.capuchin_2024_peanut_balloon = v7
local v8 = {
    ["name"] = "Fire Ring Propeller",
    ["image"] = "rbxassetid://16820841168",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Capuchin2024FireRingPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.capuchin_2024_fire_ring_propeller = v8
local v9 = {
    ["name"] = "Toy Handcuffs",
    ["image"] = "rbxassetid://16821196269",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Capuchin2024Handcuffs",
    ["tool"] = "ChewToyTool"
}
v2.capuchin_2024_handcuffs = v9
return v1(v2)