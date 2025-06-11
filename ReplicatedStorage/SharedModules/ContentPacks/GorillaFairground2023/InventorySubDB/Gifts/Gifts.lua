--// ReplicatedStorage.SharedModules.ContentPacks.GorillaFairground2023.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Premium Gorilla Box",
    ["image"] = "rbxassetid://12566139449",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["box_opening"] = { "GorillaFair2023PremiumBoxOpen1", "GorillaFair2023PremiumBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["custom_tooltip_description"] = "Each Premium Gorilla box contains:\n90% Gorilla\n10% Albino Gorilla\n\n2x fairground items",
    ["model_handle"] = "GorillaFair2023PremiumGorillaBox",
    ["tool"] = "GorillaBoxTool",
    ["use_existing_rewards"] = {
        {
            ["count"] = 2,
            ["kind"] = "gorilla_fair_2023_premium_items"
        },
        {
            ["count"] = 1,
            ["kind"] = "gorilla_fair_2023_premium_gorillas"
        }
    }
}
v2.gorilla_fair_2023_premium_box = v3
local v4 = {
    ["name"] = "Standard Gorilla Box",
    ["image"] = "rbxassetid://12566139593",
    ["rarity"] = "rare",
    ["cost"] = 600,
    ["anims"] = {
        ["box_opening"] = { "GorillaFair2023StandardBoxOpen1", "GorillaFair2023StandardBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["custom_tooltip_description"] = "Each Gorilla box contains:\n\n1x Gorilla\n2x fairground items",
    ["model_handle"] = "GorillaFair2023StandardGorillaBox",
    ["tool"] = "GorillaBoxTool",
    ["use_existing_rewards"] = {
        {
            ["count"] = 2,
            ["kind"] = "gorilla_fair_2023_standard_items"
        },
        {
            ["count"] = 1,
            ["kind"] = "gorilla_fair_2023_standard_gorillas"
        }
    }
}
v2.gorilla_fair_2023_standard_box = v4
return v1(v2)