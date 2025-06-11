--// ReplicatedStorage.SharedModules.ContentPacks.CapuchinFairground2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Premium Capuchin Box",
    ["image"] = "rbxassetid://16745080680",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["box_opening"] = { "Capuchin2024PremiumBoxOpen" },
        ["hold"] = "HoldingBaby"
    },
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["model_handle"] = "Capuchin2024PremiumBox",
    ["tool"] = "CapuchinBoxTool",
    ["use_existing_rewards"] = {
        {
            ["count"] = 2,
            ["kind"] = "capuchin_2024_premium_box"
        }
    }
}
v2.capuchin_2024_premium_box = v3
local v4 = {
    ["name"] = "Standard Capuchin Box",
    ["image"] = "rbxassetid://16745083599",
    ["rarity"] = "rare",
    ["cost"] = 300,
    ["anims"] = {
        ["box_opening"] = { "Capuchin2024StandardBoxOpen" },
        ["hold"] = "HoldingBaby"
    },
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["model_handle"] = "Capuchin2024StandardBox",
    ["tool"] = "CapuchinBoxTool",
    ["use_existing_rewards"] = {
        {
            ["count"] = 2,
            ["kind"] = "capuchin_2024_standard_box"
        }
    }
}
v2.capuchin_2024_standard_box = v4
return v1(v2)