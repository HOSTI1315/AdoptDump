--// ReplicatedStorage.SharedModules.ContentPacks.Bunker2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["bunker_2022_toxic_barrel"] = {
        ["name"] = "Toxic Barrel",
        ["image"] = "rbxassetid://12115176522",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3000
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)