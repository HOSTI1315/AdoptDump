--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshSeptember2021.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Cactus Grappling Hook",
    ["image"] = "rbxassetid://7368034072",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "CactusGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.cactus_grappling_hook = v3
local v4 = {
    ["name"] = "Cactus Plushie Chew Toy",
    ["image"] = "rbxassetid://7368033660",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "CactusPlushieChewToy",
    ["tool"] = "ChewToyTool"
}
v2.cactus_plushie_chew_toy = v4
local v5 = {
    ["name"] = "Daisy Flying Disc",
    ["image"] = "rbxassetid://7369010789",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "DaisyFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.daisy_flying_disc = v5
local v6 = {
    ["name"] = "Galaxy Flying Disc",
    ["image"] = "rbxassetid://7368042262",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GalaxyFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.galaxy_flying_disc = v6
local v7 = {
    ["name"] = "Galaxy Propeller",
    ["image"] = "rbxassetid://7368042855",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GalaxyPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "PropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.galaxy_propeller = v7
local v8 = {
    ["name"] = "Magical Princess Chew Toy",
    ["image"] = "rbxassetid://7368054221",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "MagicalPrincessChewToy",
    ["tool"] = "ChewToyTool"
}
v2.magical_princess_chew_toy = v8
local v9 = {
    ["name"] = "Magical Princess Leash",
    ["image"] = "rbxassetid://7368044702",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "MagicalPrincessLeash",
    ["model_handle"] = "MagicalPrincessLeash",
    ["tool"] = "PetLeash"
}
v2.magical_princess_leash = v9
local v10 = {
    ["name"] = "Pink Cat Balloon",
    ["image"] = "rbxassetid://7368034465",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "PinkCatBalloon",
    ["tool"] = "BalloonTool"
}
v2.pink_cat_balloon = v10
local v11 = {
    ["name"] = "Rocket Grappling Hook",
    ["image"] = "rbxassetid://7368049810",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "RocketGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.rocket_grappling_hook = v11
local v12 = {
    ["name"] = "Rose Pogo",
    ["image"] = "rbxassetid://7368039757",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "RosePogo",
    ["tool"] = "PogoTool"
}
v2.rose_pogo = v12
local v13 = {
    ["name"] = "Satellite Balloon",
    ["image"] = "rbxassetid://7368052016",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "SatelliteBalloon",
    ["tool"] = "BalloonTool"
}
v2.satellite_balloon = v13
local v14 = {
    ["name"] = "Venus Fly Trap Rattle",
    ["image"] = "rbxassetid://7368054540",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "VenusFlyTrapRattle",
    ["tool"] = "GenericTool"
}
v2.venus_fly_trap_rattle = v14
return v1(v2)