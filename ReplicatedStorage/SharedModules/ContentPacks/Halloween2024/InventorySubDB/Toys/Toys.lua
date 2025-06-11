--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Witch Claw Grapple",
    ["image"] = "rbxassetid://125948281754691",
    ["rarity"] = "ultra_rare",
    ["cost"] = 7400,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Halloween2024WitchClawGrapple",
    ["tool"] = "GrapplingHookTool"
}
v2.halloween_2024_witch_claw_grapple = v3
local v4 = {
    ["name"] = "Abyss Propeller",
    ["image"] = "rbxassetid://89897992276884",
    ["rarity"] = "legendary",
    ["cost"] = 13000,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Halloween2024AbyssPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.halloween_2024_abyss_propeller = v4
local v5 = {
    ["name"] = "Jack O\'Bounce Pogo Stick",
    ["image"] = "rbxassetid://107913286254891",
    ["rarity"] = "uncommon",
    ["cost"] = 1900,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Halloween2024JackOBouncePogo",
    ["tool"] = "PogoTool"
}
v2.halloween_2024_jack_o_bounce_pogo = v5
local v6 = {
    ["name"] = "Ghost Finder Rattle",
    ["image"] = "rbxassetid://132396670273996",
    ["rarity"] = "rare",
    ["cost"] = 3700,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Halloween2024GhostFinderRattle",
    ["tool"] = "GenericTool"
}
v2.halloween_2024_ghost_finder_rattle = v6
local v7 = {
    ["name"] = "Grim Scythe",
    ["image"] = "rbxassetid://135678668432369",
    ["rarity"] = "rare",
    ["cost"] = 6000,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "BaseballBatHold",
        ["use"] = "BaseballBatSwing"
    },
    ["model_handle"] = "Halloween2024GrimScythe",
    ["tool"] = "GenericTool"
}
v2.halloween_2024_grim_scythe = v7
local v8 = {
    ["name"] = "Spirit Chew Toy",
    ["image"] = "rbxassetid://131521063745022",
    ["rarity"] = "uncommon",
    ["cost"] = 900,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Halloween2024SpiritChewToy",
    ["tool"] = "ChewToyTool"
}
v2.halloween_2024_spirit_chew_toy = v8
local v9 = {
    ["name"] = "Bear Head Plush",
    ["image"] = "rbxassetid://129090837902970",
    ["rarity"] = "common",
    ["cost"] = 450,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Halloween2024BearHeadPlush",
    ["tool"] = "GenericTool"
}
v2.halloween_2024_bear_head_plush = v9
local v10 = {
    ["name"] = "Netzooka",
    ["image"] = "rbxassetid://103085631877031",
    ["rarity"] = "legendary",
    ["cost"] = 18000,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "NetzookaHold"
    },
    ["model_handle"] = "Halloween2024Netzooka",
    ["tool"] = "NetzookaTool"
}
v2.halloween_2024_netzooka = v10
return v1(v2)