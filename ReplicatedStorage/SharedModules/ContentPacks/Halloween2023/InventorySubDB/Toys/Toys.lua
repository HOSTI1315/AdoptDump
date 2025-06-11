--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Bandage Propeller",
    ["image"] = "rbxassetid://14782612816",
    ["rarity"] = "common",
    ["cost"] = 850,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Halloween2023BandagePropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.halloween_2023_bandage_propeller = v3
local v4 = {
    ["name"] = "Candy Skewer",
    ["image"] = "rbxassetid://14824513406",
    ["rarity"] = "ultra_rare",
    ["cost"] = 6500,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Halloween2023CandySkewer",
    ["tool"] = "PogoTool"
}
v2.halloween_2023_candy_skewer = v4
local v5 = {
    ["name"] = "Full Moon Flying Disc",
    ["image"] = "rbxassetid://14782617368",
    ["rarity"] = "common",
    ["cost"] = 250,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Halloween2023FullMoonFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.halloween_2023_full_moon_flying_disc = v5
local v6 = {
    ["name"] = "Jack-O-Lantern Light",
    ["image"] = "rbxassetid://14782618072",
    ["rarity"] = "rare",
    ["cost"] = 950,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Halloween2023JackOLanternLight",
    ["preserve_model_welds"] = true,
    ["tool"] = "GenericConstraintsTool"
}
v2.halloween_2023_jack_o_lantern_light = v6
local v7 = {
    ["name"] = "Pumpkin Kitty Plushie",
    ["image"] = "rbxassetid://14782619631",
    ["rarity"] = "uncommon",
    ["cost"] = 750,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Halloween2023PumpkinKittyPlushie",
    ["tool"] = "GenericTool"
}
v2.halloween_2023_pumpkin_kitty_plushie = v7
local v8 = {
    ["name"] = "Spellbook Throw Toy",
    ["image"] = "rbxassetid://14782631313",
    ["rarity"] = "rare",
    ["cost"] = 1000,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Halloween2023SpellbookThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.halloween_2023_spellbook_throw_toy = v8
local v9 = {
    ["name"] = "Vampire Chew Toy",
    ["image"] = "rbxassetid://14782629872",
    ["rarity"] = "ultra_rare",
    ["cost"] = 7000,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Halloween2023VampireChewToy",
    ["tool"] = "ChewToyTool"
}
v2.halloween_2023_vampire_chew_toy = v9
local v10 = {
    ["name"] = "Vampire Skull Rattle",
    ["image"] = "rbxassetid://14782630331",
    ["rarity"] = "uncommon",
    ["cost"] = 700,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Halloween2023VampireSkullRattle",
    ["tool"] = "GenericTool"
}
v2.halloween_2023_vampire_skull_rattle = v10
return v1(v2)