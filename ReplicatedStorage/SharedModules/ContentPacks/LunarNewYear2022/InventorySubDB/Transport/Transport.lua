--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["lny_2022_dragon_train"] = {
        ["name"] = "Dragon Train",
        ["image"] = "rbxassetid://8665606953",
        ["rarity"] = "legendary",
        ["cost"] = 10500,
        ["is_train"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)