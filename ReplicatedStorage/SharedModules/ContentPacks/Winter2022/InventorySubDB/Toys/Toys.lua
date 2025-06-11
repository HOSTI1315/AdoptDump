--// ReplicatedStorage.SharedModules.ContentPacks.Winter2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Gingerbread Balloon",
    ["image"] = "rbxassetid://11582939336",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2022GingerbreadBalloon",
    ["tool"] = "BalloonTool"
}
v2.winter_2022_gingerbread_balloon = v3
local v4 = {
    ["name"] = "Gingerbread Bear Balloon",
    ["image"] = "rbxassetid://11766625684",
    ["rarity"] = "uncommon",
    ["cost"] = 750,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2022GingerbreadBearBalloon",
    ["tool"] = "BalloonTool"
}
v2.winter_2022_gingerbread_bear_balloon = v4
local v5 = {
    ["name"] = "Gingerbread Holly Flying Disc",
    ["image"] = "rbxassetid://11583492733",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2022GingerbreadHollyFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2022_gingerbread_holly_flying_disc = v5
local v6 = {
    ["name"] = "Gingerbread Kitty Throw Toy",
    ["image"] = "rbxassetid://11582920654",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2022GingerbreadKittyThrowToy",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2022_gingerbread_kitty_throw_toy = v6
local v7 = {
    ["name"] = "Gingerbread Leash",
    ["image"] = "rbxassetid://11582923336",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "UnicornLeash",
    ["model_handle"] = "Winter2022GingerbreadLeash",
    ["tool"] = "PetLeash"
}
v2.winter_2022_gingerbread_leash = v7
local v8 = {
    ["name"] = "Gingerbread Pogo Stick",
    ["image"] = "rbxassetid://11766624720",
    ["rarity"] = "rare",
    ["cost"] = 1350,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Winter2022GingerbreadPogoStick",
    ["tool"] = "GenericTool"
}
v2.winter_2022_gingerbread_pogo_stick = v8
local v9 = {
    ["name"] = "Gingerbread Rattle",
    ["image"] = "rbxassetid://11582931459",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Winter2022GingerbreadRattle",
    ["tool"] = "GenericTool"
}
v2.winter_2022_gingerbread_rattle = v9
local v10 = {
    ["name"] = "Gingerbread Star Propeller",
    ["image"] = "rbxassetid://11766626090",
    ["rarity"] = "legendary",
    ["cost"] = 6000,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2022GingerbreadStarPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.winter_2022_gingerbread_star_propeller = v10
local v11 = {
    ["name"] = "Gingerbread Stocking Toy",
    ["image"] = "rbxassetid://11582933062",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2022GingerbreadStockingToy",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2022_gingerbread_stocking_toy = v11
local v12 = {
    ["name"] = "Gingerbread Wreath Flying Disc",
    ["image"] = "rbxassetid://11582924715",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2022GingerbreadWreathFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2022_gingerbread_wreath_flying_disc = v12
local v13 = {
    ["name"] = "Strawberry Cake Roll Flying Disc",
    ["image"] = "rbxassetid://11582938822",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2022StrawberryCakeRollFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2022_strawberry_cake_roll_flying_disc = v13
local v14 = {
    ["name"] = "Strawberry Cakeroll Plush",
    ["image"] = "rbxassetid://11582921861",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Winter2022StrawberryCakerollPlush",
    ["tool"] = "GenericTool"
}
v2.winter_2022_strawberry_cakeroll_plush = v14
local v15 = {
    ["name"] = "Strawberry Jam Rattle",
    ["image"] = "rbxassetid://11582922846",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Winter2022StrawberryJamRattle",
    ["tool"] = "GenericTool"
}
v2.winter_2022_strawberry_jam_rattle = v15
local v16 = {
    ["name"] = "Strawberry Kitty Throw Toy",
    ["image"] = "rbxassetid://11506923188",
    ["rarity"] = "uncommon",
    ["cost"] = 500,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2022StrawberryKittyThrowToy",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2022_strawberry_kitty_throw_toy = v16
local v17 = {
    ["name"] = "Strawberry Pogo Stick",
    ["image"] = "rbxassetid://11589034748",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Winter2022StrawberryPogoStick",
    ["tool"] = "PogoTool"
}
v2.winter_2022_strawberry_pogo_stick = v17
local v18 = {
    ["name"] = "Strawberry Rattle",
    ["image"] = "rbxassetid://11506918779",
    ["rarity"] = "common",
    ["cost"] = 250,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Winter2022StrawberryRattle",
    ["tool"] = "GenericTool"
}
v2.winter_2022_strawberry_rattle = v18
local v19 = {
    ["name"] = "Strawberry Sandwich Chew Toy",
    ["image"] = "rbxassetid://11506907652",
    ["rarity"] = "ultra_rare",
    ["cost"] = 5000,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2022StrawberrySandwichChewToy",
    ["tool"] = "ChewToyTool"
}
v2.winter_2022_strawberry_sandwich_chew_toy = v19
local v20 = {
    ["name"] = "Strawberry Teapot Leash",
    ["image"] = "rbxassetid://11506912964",
    ["rarity"] = "rare",
    ["cost"] = 1000,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "MagicalPrincessLeash",
    ["model_handle"] = "Winter2022StrawberryTeapotLeash",
    ["tool"] = "PetLeash"
}
v2.winter_2022_strawberry_teapot_leash = v20
local v21 = {
    ["name"] = "Strawberry Toast Flying Disc",
    ["image"] = "rbxassetid://11506922707",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2000,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2022StrawberryToastFlyingDisk",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2022_strawberry_toast_flying_disk = v21
return v1(v2)