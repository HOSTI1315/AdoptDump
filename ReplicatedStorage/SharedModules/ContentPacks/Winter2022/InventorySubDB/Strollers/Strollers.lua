--// ReplicatedStorage.SharedModules.ContentPacks.Winter2022.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["winter_2022_strawberry_stroller"] = {
        ["name"] = "Strawberry Stroller",
        ["image"] = "rbxassetid://11582934938",
        ["rarity"] = "rare",
        ["model_handle"] = "Winter2022StrawberryStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)