--// ReplicatedStorage.SharedModules.ContentPacks.Amtruck2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["amtruck_2024_canine_cruiser"] = {
        ["name"] = "Canine Cruiser",
        ["image"] = "rbxassetid://110528422084135",
        ["rarity"] = "legendary",
        ["donatable"] = false
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)