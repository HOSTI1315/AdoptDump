--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Xmas Carousel Propeller",
    ["image"] = "rbxassetid://15355332019",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2023CarouselPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.winter_2023_carousel_propeller = v3
local v4 = {
    ["name"] = "Celebration Firework Launcher",
    ["image"] = "rbxassetid://15683891193",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "UnicornPlushHug"
    },
    ["model_handle"] = "Winter2023CelebrationFireworkLauncher",
    ["tool"] = "FireworkLauncherTool"
}
v2.winter_2023_celebration_firework_launcher = v4
local v5 = {
    ["name"] = "Xmas Tree Rattle",
    ["image"] = "rbxassetid://15319012748",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Winter2023ChristmasTreeRattle",
    ["tool"] = "GenericTool"
}
v2.winter_2023_christmas_tree_rattle = v5
local v6 = {
    ["name"] = "Cork Gun Grapple",
    ["image"] = "rbxassetid://15347978728",
    ["rarity"] = "rare",
    ["cost"] = 4900,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Winter2023CorkGunGrapple",
    ["tool"] = "GrapplingHookTool"
}
v2.winter_2023_cork_gun_grapple = v6
local v7 = {
    ["name"] = "Frostclaw Plush",
    ["image"] = "rbxassetid://15347988184",
    ["rarity"] = "legendary",
    ["cost"] = 9000,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Winter2023FrostclawPlush",
    ["tool"] = "GenericTool"
}
v2.winter_2023_frostclaw_plush = v7
local v8 = {
    ["name"] = "Hot Cocoa Stand",
    ["image"] = "rbxassetid://15546183894",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2023HotCocoaStand",
    ["placeable_type"] = "refreshment",
    ["tool"] = "PlaceableTool"
}
v2.winter_2023_hot_cocoa_stand = v8
local v9 = {
    ["name"] = "Ornament Balloon",
    ["image"] = "rbxassetid://15347951010",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2023OrnamentBalloon",
    ["tool"] = "BalloonTool"
}
v2.winter_2023_ornament_balloon = v9
v2.winter_2023_santa_throne = {
    ["name"] = "Santa Throne",
    ["image"] = "rbxassetid://15549052408",
    ["rarity"] = "legendary",
    ["cost"] = 25000,
    ["currency_id"] = "gingerbread_2023",
    ["model_handle"] = "Winter2023SantaThrone",
    ["placeable_type"] = "toy_furniture",
    ["tool"] = "PlaceableTool"
}
local v10 = {
    ["name"] = "Snowflake Propeller",
    ["image"] = "rbxassetid://15303228735",
    ["rarity"] = "ultra_rare",
    ["cost"] = 6000,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2023SnowflakePropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.winter_2023_snowflake_propeller = v10
local v11 = {
    ["name"] = "Star Throwing Disc",
    ["image"] = "rbxassetid://15355331227",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2023StarThrowingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.winter_2023_star_throwing_disc = v11
local v12 = {
    ["name"] = "Toy Sword",
    ["image"] = "rbxassetid://15348065956",
    ["rarity"] = "ultra_rare",
    ["cost"] = 6800,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["hold"] = "BaseballBatHold",
        ["use"] = "BaseballBatSwing"
    },
    ["model_handle"] = "Winter2023ToySword",
    ["tool"] = "GenericTool"
}
v2.winter_2023_toy_sword = v12
local v13 = {
    ["name"] = "Winter Lantern",
    ["image"] = "rbxassetid://15303038754",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Winter2023WinterLantern",
    ["preserve_model_welds"] = true,
    ["tool"] = "GenericConstraintsTool"
}
v2.winter_2023_winter_lantern = v13
local v14 = {
    ["name"] = "Wooden Sword",
    ["image"] = "rbxassetid://15303034716",
    ["rarity"] = "uncommon",
    ["cost"] = 850,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["hold"] = "BaseballBatHold",
        ["use"] = "BaseballBatSwing"
    },
    ["model_handle"] = "Winter2023WoodenSword",
    ["tool"] = "GenericTool"
}
v2.winter_2023_wooden_sword = v14
local v15 = {
    ["name"] = "Wrapping Paper Throw Toy",
    ["image"] = "rbxassetid://15303037135",
    ["rarity"] = "common",
    ["cost"] = 300,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2023WrappingPaperThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.winter_2023_wrapping_paper_throw_toy = v15
local v16 = {
    ["name"] = "Yule Log Chew Toy",
    ["image"] = "rbxassetid://15348020150",
    ["rarity"] = "common",
    ["cost"] = 450,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Winter2023YuleLogChewToy",
    ["tool"] = "ChewToyTool"
}
v2.winter_2023_yule_log_chew_toy = v16
local v17 = {
    ["name"] = "Yule Log Pogo Stick",
    ["image"] = "rbxassetid://15303039986",
    ["rarity"] = "rare",
    ["cost"] = 4700,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Winter2023YuleLogPogoStick",
    ["tool"] = "PogoTool"
}
v2.winter_2023_yule_log_pogo_stick = v17
return v1(v2)