--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["lny_2023_crescent_moon"] = {
        ["name"] = "Crescent Moon Car",
        ["image"] = "rbxassetid://11758583286",
        ["rarity"] = "legendary",
        ["cost"] = 10500
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)