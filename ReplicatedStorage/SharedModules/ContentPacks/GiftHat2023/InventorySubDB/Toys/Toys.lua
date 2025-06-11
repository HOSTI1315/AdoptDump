--// ReplicatedStorage.SharedModules.ContentPacks.GiftHat2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Bumblebee Grappling Hook",
    ["image"] = "rbxassetid://13078894755",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "GiftHat2023BumblebeeGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.gifthat_2023_bumblebee_grappling_hook = v3
local v4 = {
    ["name"] = "Bumblebee Pogo Stick",
    ["image"] = "rbxassetid://13078895147",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "GiftHat2023BumblebeePogoStick",
    ["tool"] = "PogoTool"
}
v2.gifthat_2023_bumblebee_pogo_stick = v4
local v5 = {
    ["name"] = "Celestial Balloon",
    ["image"] = "rbxassetid://13078895655",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftHat2023CelestialBalloon",
    ["tool"] = "BalloonTool"
}
v2.gifthat_2023_celestial_balloon = v5
local v6 = {
    ["name"] = "Celestial Propeller",
    ["image"] = "rbxassetid://13078896460",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftHat2023CelestialPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.gifthat_2023_celestial_propeller = v6
local v7 = {
    ["name"] = "Harp Grappling Hook",
    ["image"] = "rbxassetid://13078897700",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "GiftHat2023HarpGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.gifthat_2023_harp_grappling_hook = v7
local v8 = {
    ["name"] = "Leek Chew Toy",
    ["image"] = "rbxassetid://13078898385",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GiftHat2023LeekChewToy",
    ["tool"] = "ChewToyTool"
}
v2.gifthat_2023_leek_chew_toy = v8
local v9 = {
    ["name"] = "Love Envelope Balloon",
    ["image"] = "rbxassetid://13078898747",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftHat2023LoveEnvelopeBalloon",
    ["tool"] = "BalloonTool"
}
v2.gifthat_2023_love_envelope_balloon = v9
local v10 = {
    ["name"] = "Mermaid Rattle",
    ["image"] = "rbxassetid://13078899091",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "GiftHat2023MermaidRattle",
    ["tool"] = "GenericTool"
}
v2.gifthat_2023_mermaid_rattle = v10
local v11 = {
    ["name"] = "Pancake Throwing Disc",
    ["image"] = "rbxassetid://13078902734",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GiftHat2023PancakeThrowingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.gifthat_2023_pancake_throwing_disc = v11
local v12 = {
    ["name"] = "Succulent Plush",
    ["image"] = "rbxassetid://13078903195",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "GiftHat2023SucculentPlush",
    ["tool"] = "GenericTool"
}
v2.gifthat_2023_succulent_plush = v12
return v1(v2)