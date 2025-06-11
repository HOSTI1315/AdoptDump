--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2023.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["halloween_2023_floating_hand_stroller"] = {
        ["name"] = "Floating Hand Stroller",
        ["image"] = "rbxassetid://14978700942",
        ["rarity"] = "legendary",
        ["cost"] = 47000,
        ["currency_id"] = "candy_2023",
        ["model_handle"] = "Halloween2023FloatingHandStroller",
        ["tool"] = "StrollerTool"
    },
    ["halloween_2023_spikey_chariot_stroller"] = {
        ["name"] = "Spikey Chariot Stroller",
        ["image"] = "rbxassetid://14959925632",
        ["rarity"] = "rare",
        ["cost"] = 7000,
        ["currency_id"] = "candy_2023",
        ["model_handle"] = "Halloween2023SpikeyChariotStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)