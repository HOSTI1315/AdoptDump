--// ReplicatedStorage.SharedModules.ContentPacks.Wings2022.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Standard Wing Chest",
    ["image"] = "rbxassetid://10795283934",
    ["rarity"] = "legendary",
    ["cost"] = 600,
    ["anims"] = {
        ["box_opening"] = { "Wings2022StandardBoxOpen1", "Wings2022StandardBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Wings2022BucksWingBox",
    ["tool"] = "WingBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.wings_2022_bucks_wing_chest = v3
local v4 = {
    ["name"] = "Regal Wing Chest",
    ["image"] = "rbxassetid://10795284072",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["box_opening"] = { "Wings2022RegalBoxOpen1", "Wings2022RegalBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Wings2022PremiumWingBox",
    ["tool"] = "WingBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.wings_2022_premium_wing_chest = v4
return v1(v2)