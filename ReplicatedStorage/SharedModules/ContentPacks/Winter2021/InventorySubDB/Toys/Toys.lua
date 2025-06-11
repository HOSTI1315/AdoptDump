--// ReplicatedStorage.SharedModules.ContentPacks.Winter2021.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Icicle Pogo Stick",
    ["image"] = "rbxassetid://7975097372",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Winter2021IciclePogoStick",
    ["tool"] = "PogoTool"
}
v2.winter_2021_blue_icicle_pogo = v3
local v4 = {
    ["name"] = "Figgy Pudding Chew Toy",
    ["image"] = "rbxassetid://8008049197",
    ["rarity"] = "common",
    ["cost"] = 7500,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2021FiggyPuddingChewToy",
    ["tool"] = "ChewToyTool"
}
v2.winter_2021_brown_figgy_pudding_chew_toy = v4
local v5 = {
    ["name"] = "Gingerbread Heart Flying Disc",
    ["image"] = "rbxassetid://8008049788",
    ["rarity"] = "uncommon",
    ["cost"] = 11500,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2021GingerbreadHeartFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2021_brown_gingerbread_heart_flying_disc = v5
local v6 = {
    ["name"] = "Gingerbread House Throw Toy",
    ["image"] = "rbxassetid://7975097749",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2021GingerbreadHouseThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.winter_2021_brown_gingerbread_house_throw_toy = v6
local v7 = {
    ["name"] = "Festive Snow Globe Rattle",
    ["image"] = "rbxassetid://8008049278",
    ["rarity"] = "uncommon",
    ["cost"] = 9500,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Winter2021SnowGlobeRattle",
    ["tool"] = "GenericTool"
}
v2.winter_2021_brown_snow_globe_rattle = v7
local v8 = {
    ["name"] = "Pickle Elf Chew Toy",
    ["image"] = "rbxassetid://7975080387",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2021ElfPickleChewToy",
    ["tool"] = "ChewToyTool"
}
v2.winter_2021_green_elf_pickle_chew_toy = v8
local v9 = {
    ["name"] = "Festive Holly Propeller",
    ["image"] = "rbxassetid://8008049350",
    ["rarity"] = "rare",
    ["cost"] = 26000,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2021HollyPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.winter_2021_green_holly_propeller = v9
local v10 = {
    ["name"] = "Festive Bells Balloon",
    ["image"] = "rbxassetid://8008049417",
    ["rarity"] = "rare",
    ["cost"] = 24500,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2021BellBalloon",
    ["tool"] = "BalloonTool"
}
v2.winter_2021_red_bell_balloon = v10
local v11 = {
    ["name"] = "Candy Cane Grappling Hook",
    ["image"] = "rbxassetid://7975080183",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Winter2021CandyCaneGrapple",
    ["tool"] = "GrapplingHookTool"
}
v2.winter_2021_red_candy_cane_grapple = v11
local v12 = {
    ["name"] = "Gingerbread Face Flying Disc",
    ["image"] = "rbxassetid://7975097220",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2021GingerbreadFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2021_red_gingerbread_flying_disc = v12
local v13 = {
    ["name"] = "Poinsettia Leash",
    ["image"] = "rbxassetid://8008049477",
    ["rarity"] = "common",
    ["cost"] = 6000,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "MagicalPrincessLeash",
    ["model_handle"] = "Winter2021PoinsettiaLeash",
    ["tool"] = "PetLeash"
}
v2.winter_2021_red_poinsettia_leash = v13
local v14 = {
    ["name"] = "Gift Stack Pogo Stick",
    ["image"] = "rbxassetid://8008049559",
    ["rarity"] = "rare",
    ["cost"] = 17500,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Winter2021PresentPogoStick",
    ["tool"] = "PogoTool"
}
v2.winter_2021_red_present_pogo = v14
local v15 = {
    ["name"] = "Sleigh Bell Throw Toy",
    ["image"] = "rbxassetid://8008049691",
    ["rarity"] = "uncommon",
    ["cost"] = 13000,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2021SleighBellThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.winter_2021_red_sleigh_bell_throw_toy = v15
return v1(v2)