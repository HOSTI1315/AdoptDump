--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Festive Pogo",
    ["image"] = "rbxassetid://92010809553259",
    ["rarity"] = "rare",
    ["cost"] = 5400,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Winter2024FestivePogo",
    ["tool"] = "PogoTool"
}
v2.winter_2024_festive_pogo = v3
local v4 = {
    ["name"] = "Tape Measure Leash",
    ["image"] = "rbxassetid://81841380085245",
    ["rarity"] = "uncommon",
    ["cost"] = 2100,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["leash_style"] = "TapeMeasureLeash",
    ["model_handle"] = "Winter2024TapeMeasureLeash",
    ["tool"] = "PetLeash"
}
v2.winter_2024_tape_measure_leash = v4
local v5 = {
    ["name"] = "Drone Balloon",
    ["image"] = "rbxassetid://81320360091568",
    ["rarity"] = "ultra_rare",
    ["cost"] = 7600,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2024DroneBalloon",
    ["preserve_model_welds"] = true,
    ["tool"] = "GenericConstraintsTool"
}
v2.winter_2024_drone_balloon = v5
local v6 = {
    ["name"] = "Ice Wand",
    ["image"] = "rbxassetid://107890492652162",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Winter2024IceWand",
    ["tool"] = "GenericTool"
}
v2.winter_2024_ice_wand_rattle = v6
local v7 = {
    ["name"] = "Toy Sword",
    ["image"] = "rbxassetid://15348065956",
    ["rarity"] = "ultra_rare",
    ["temporary"] = true,
    ["donatable"] = false,
    ["is_hidden_from_backpack"] = true,
    ["anims"] = {
        ["hold"] = "BaseballBatHold",
        ["use"] = "BaseballBatSwing"
    },
    ["model_handle"] = "Winter2023ToySword",
    ["tool"] = "GenericTool"
}
v2.winter_2024_frostclaws_revenge_sword = v7
local v8 = {
    ["name"] = "Ice Saber",
    ["image"] = "rbxassetid://91308731842757",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "BaseballBatHold",
        ["use"] = "Winter2024IceSaberSwing"
    },
    ["model_handle"] = "Winter2024IceSaber",
    ["tool"] = "IceSaberTool"
}
v2.winter_2024_ice_saber = v8
local v9 = {
    ["name"] = "Festive Tree Throwing Disc",
    ["image"] = "rbxassetid://73746076787403",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2024FestiveTreeThrowingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2024_festive_tree_throwing_disc = v9
v2.winter_2024_bauble_throw_toy = {
    ["name"] = "Bauble Throw Toy",
    ["image"] = "rbxassetid://91468654998800",
    ["rarity"] = "rare",
    ["cost"] = 6000,
    ["currency_id"] = "gingerbread_2024",
    ["model_handle"] = "Winter2024BaubleThrowToy",
    ["tool"] = "ThrowToyTool"
}
local v10 = {
    ["name"] = "Spinning Top Flying Disc",
    ["image"] = "rbxassetid://137211085567422",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2024SpinningTopFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2024_spinning_top_flying_disc = v10
local v11 = {
    ["name"] = "Snowflake Plush",
    ["image"] = "rbxassetid://138979265070837",
    ["rarity"] = "common",
    ["cost"] = 750,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Winter2024SnowflakePlush",
    ["tool"] = "GenericTool"
}
v2.winter_2024_snowflake_plush = v11
local v12 = {
    ["name"] = "Gift Sack Pogo",
    ["image"] = "rbxassetid://113702216513207",
    ["rarity"] = "ultra_rare",
    ["cost"] = 7800,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Winter2024GiftSackPogo",
    ["tool"] = "PogoTool"
}
v2.winter_2024_gift_sack_pogo = v12
local v13 = {
    ["name"] = "Lasso Propeller",
    ["image"] = "rbxassetid://103822220379516",
    ["rarity"] = "uncommon",
    ["cost"] = 2000,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2024LassoPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.winter_2024_lasso_propeller = v13
local v14 = {
    ["name"] = "Reindeer Rattle",
    ["image"] = "rbxassetid://116037208318221",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Winter2024ReindeerRattle",
    ["tool"] = "GenericTool"
}
v2.winter_2024_reindeer_rattle = v14
return v1(v2)