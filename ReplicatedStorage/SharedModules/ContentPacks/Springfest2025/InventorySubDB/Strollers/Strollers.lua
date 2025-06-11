--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["spring_2025_soy_sauce_stroller"] = {
        ["name"] = "Soy Sauce Stroller",
        ["image"] = "rbxassetid://101245923760732",
        ["rarity"] = "uncommon",
        ["cost"] = 10000,
        ["currency_id"] = "cherry_blossoms_2025",
        ["model_handle"] = "Spring2025SoySauceStroller",
        ["tool"] = "StrollerTool"
    },
    ["spring_2025_takoyaki_stroller"] = {
        ["name"] = "Takoyaki Stroller",
        ["image"] = "rbxassetid://107177769510773",
        ["rarity"] = "rare",
        ["cost"] = 17500,
        ["currency_id"] = "cherry_blossoms_2025",
        ["model_handle"] = "Spring2025TakoyakiStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)