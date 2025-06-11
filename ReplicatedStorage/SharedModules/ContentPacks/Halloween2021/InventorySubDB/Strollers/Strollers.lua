--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2021.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["halloween_2021_witch_hat_stroller"] = {
        ["name"] = "Halloween Black Witch Hat Stroller",
        ["image"] = "rbxassetid://7782684030",
        ["rarity"] = "rare",
        ["cost"] = 350,
        ["currency_id"] = "candy_2021",
        ["model_handle"] = "WitchHatStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)