--// ReplicatedStorage.SharedModules.ContentPacks.Easter2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Carrot Bushel",
    ["image"] = "rbxassetid://16646136866",
    ["rarity"] = "common",
    ["cost"] = 350,
    ["currency_id"] = "eggs_2024",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Easter2024CarrotBushelChewToy",
    ["tool"] = "ChewToyTool"
}
v2.easter_2024_carrot_bushel_chew_toy = v3
local v4 = {
    ["name"] = "Carrot Lamb Plush",
    ["image"] = "rbxassetid://16646137186",
    ["rarity"] = "uncommon",
    ["cost"] = 1700,
    ["currency_id"] = "eggs_2024",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Easter2024LambCarrotPlushie",
    ["tool"] = "GenericTool"
}
v2.easter_2024_lamb_carrot_plushie = v4
local v5 = {
    ["name"] = "Easter Chick Rattle",
    ["image"] = "rbxassetid://16646137538",
    ["rarity"] = "rare",
    ["cost"] = 3200,
    ["currency_id"] = "eggs_2024",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Easter2024ChickRattle",
    ["tool"] = "GenericTool"
}
v2.easter_2024_easter_chick_rattle = v5
local v6 = {
    ["image"] = "rbxassetid://16568964263",
    ["tool"] = "PlaceableTool",
    ["model_handle"] = "Easter2024ClassicTradeStand",
    ["rarity"] = "ultra_rare",
    ["name"] = "Classic Trade Stand",
    ["placeable_type"] = "trade_stand",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    }
}
v2.easter_2024_classic_trade_stand = v6
return v1(v2)