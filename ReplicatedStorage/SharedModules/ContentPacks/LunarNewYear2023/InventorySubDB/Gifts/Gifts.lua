--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2023.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Moon Bear Box",
    ["image"] = "rbxassetid://11758575195",
    ["rarity"] = "legendary",
    ["cost"] = 300,
    ["currency_id"] = "lanterns_2023",
    ["anims"] = {
        ["box_opening"] = { "MoonBearBoxOpen1", "MoonBearBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "LNY2023MoonBearBox",
    ["tool"] = "MoonBearBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.lny_2023_moon_bear_box = v3
return v1(v2)