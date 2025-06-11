--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshMarch2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Anchor Balloon",
    ["image"] = "rbxassetid://8994946511",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftRefreshMarch2022AnchorBalloon",
    ["tool"] = "BalloonTool"
}
v2.gift_refresh_2022_anchor_balloon = v3
local v4 = {
    ["name"] = "Angelic Grappling Hook",
    ["image"] = "rbxassetid://8978760198",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "GiftRefreshMarch2022AngelicGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.gift_refresh_2022_angelic_grappling_hook = v4
local v5 = {
    ["name"] = "Bat Key Pogo Stick",
    ["image"] = "rbxassetid://8978760332",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "GiftRefreshMarch2022BatKeyPogoStick",
    ["tool"] = "PogoTool"
}
v2.gift_refresh_2022_bat_key_pogostick = v5
local v6 = {
    ["name"] = "Clover Balloon",
    ["image"] = "rbxassetid://8978760492",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftRefreshMarch2022CloverBalloon",
    ["tool"] = "BalloonTool"
}
v2.gift_refresh_2022_clover_balloon = v6
local v7 = {
    ["name"] = "Eclipse Flying Disc",
    ["image"] = "rbxassetid://8978760651",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GiftRefreshMarch2022EclipseFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.gift_refresh_2022_eclipse_flying_disc = v7
local v8 = {
    ["name"] = "Fairy Rose Light Rattle",
    ["image"] = "rbxassetid://8978760750",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "GiftRefreshMarch2022FairyLightRattle",
    ["tool"] = "GenericTool"
}
v2.gift_refresh_2022_fairy_light_rattle = v8
local v9 = {
    ["name"] = "Flower Mirror Chew Toy",
    ["image"] = "rbxassetid://8978760822",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GiftRefreshMarch2022FlowerMirrorChewToy",
    ["tool"] = "ChewToyTool"
}
v2.gift_refresh_2022_flower_mirror_chew_toy = v9
local v10 = {
    ["name"] = "Mushroom Friend Plushie",
    ["image"] = "rbxassetid://8978767674",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "GiftRefreshMarch2022MushroomPlushie",
    ["tool"] = "GenericTool"
}
v2.gift_refresh_2022_mushroom_plushie = v10
local v11 = {
    ["name"] = "Drooping Orchid Propeller",
    ["image"] = "rbxassetid://8978760895",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftRefreshMarch2022FlowerPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "DandelionSpin",
    ["tool"] = "PropellerTool"
}
v2.gift_refresh_2022_orchid_propeller = v11
local v12 = {
    ["name"] = "Water Soaker Grappling Hook",
    ["image"] = "rbxassetid://8994946914",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "GiftRefreshMarch2022WaterSoakerGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.gift_refresh_2022_water_soaker_grappling_hook = v12
return v1(v2)