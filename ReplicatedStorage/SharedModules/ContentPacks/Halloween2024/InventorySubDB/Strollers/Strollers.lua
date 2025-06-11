--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["halloween_2024_web_stroller"] = {
        ["name"] = "Web Stroller",
        ["image"] = "rbxassetid://136346370485119",
        ["rarity"] = "ultra_rare",
        ["cost"] = 25000,
        ["currency_id"] = "candy_2024",
        ["model_handle"] = "Halloween2024WebStroller",
        ["tool"] = "StrollerTool"
    },
    ["halloween_2024_potion_stroller"] = {
        ["name"] = "Potion Stroller",
        ["image"] = "rbxassetid://94315106097504",
        ["rarity"] = "uncommon",
        ["cost"] = 9000,
        ["currency_id"] = "candy_2024",
        ["model_handle"] = "Halloween2024PotionStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)