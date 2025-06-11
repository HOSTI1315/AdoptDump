--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Sunrise Hang Glider",
    ["image"] = "rbxassetid://134240805752314",
    ["rarity"] = "rare",
    ["cost"] = 35000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Spring2025DefaultParaglider",
    ["tool"] = "ParagliderTool"
}
v2.spring_2025_default_paraglider = v3
local v4 = {
    ["name"] = "Cherry Blossom Hang Glider",
    ["image"] = "rbxassetid://102447427788529",
    ["rarity"] = "legendary",
    ["cost"] = 90000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Spring2025PinkParaglider",
    ["tool"] = "ParagliderTool"
}
v2.spring_2025_pink_paraglider = v4
local v5 = {
    ["name"] = "Wing Hang Glider",
    ["image"] = "rbxassetid://128726801045655",
    ["rarity"] = "ultra_rare",
    ["cost"] = 55000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Spring2025BlueParaglider",
    ["tool"] = "ParagliderTool"
}
v2.spring_2025_blue_paraglider = v5
local v6 = {
    ["name"] = "Mech Flying Disc",
    ["image"] = "rbxassetid://111241442318928",
    ["rarity"] = "common",
    ["cost"] = 600,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Spring2025MechFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.spring_2025_mech_flying_disc = v6
local v7 = {
    ["name"] = "Taiyaki Chew Toy",
    ["image"] = "rbxassetid://98149531804769",
    ["rarity"] = "uncommon",
    ["cost"] = 1700,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Spring2025TaiyakiChewToy",
    ["tool"] = "ChewToyTool"
}
v2.spring_2025_taiyaki_chew_toy = v7
local v8 = {
    ["name"] = "Blossom Propeller",
    ["image"] = "rbxassetid://130035978714834",
    ["rarity"] = "rare",
    ["cost"] = 5500,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Spring2025BlossomPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.spring_2025_blossom_propeller = v8
local v9 = {
    ["name"] = "Magic Girl Grappling Hook",
    ["image"] = "rbxassetid://96347509933386",
    ["rarity"] = "rare",
    ["cost"] = 3700,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Spring2025MagicalGirlGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.spring_2025_magical_girl_grappling_hook = v9
local v10 = {
    ["image"] = "rbxassetid://122955181030271",
    ["tool"] = "PlaceableTool",
    ["model_handle"] = "Spring2025DanceArcadeStand",
    ["rarity"] = "ultra_rare",
    ["name"] = "Dance Arcade Stand",
    ["placeable_type"] = "placeable_furniture",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    }
}
v2.spring_2025_dance_arcade_stand = v10
return v1(v2)