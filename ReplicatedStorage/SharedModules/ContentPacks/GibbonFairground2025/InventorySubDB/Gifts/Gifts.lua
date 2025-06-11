--// ReplicatedStorage.SharedModules.ContentPacks.GibbonFairground2025.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Premium Gibbon Box",
    ["image"] = "rbxassetid://115099445797711",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["box_opening"] = { "Gibbon2025PremiumBoxOpen" },
        ["hold"] = "HoldingBaby"
    },
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["model_handle"] = "Gibbon2025PremiumBox",
    ["tool"] = "CapuchinBoxTool",
    ["use_existing_rewards"] = {
        {
            ["count"] = 2,
            ["kind"] = "gibbon_2025_premium_box"
        }
    }
}
v2.gibbon_2025_premium_box = v3
local v4 = {
    ["name"] = "Standard Gibbon Box",
    ["image"] = "rbxassetid://76888663416205",
    ["rarity"] = "rare",
    ["cost"] = 300,
    ["anims"] = {
        ["box_opening"] = { "Gibbon2025StandardBoxOpen" },
        ["hold"] = "HoldingBaby"
    },
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["model_handle"] = "Gibbon2025StandardBox",
    ["tool"] = "CapuchinBoxTool",
    ["use_existing_rewards"] = {
        {
            ["count"] = 2,
            ["kind"] = "gibbon_2025_standard_box"
        }
    }
}
v2.gibbon_2025_standard_box = v4
return v1(v2)