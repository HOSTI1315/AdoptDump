--// ReplicatedStorage.SharedModules.ContentPacks.GibbonFairground2025.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["gibbon_2025_teacup_vehicle"] = {
        ["name"] = "Spinning Teacup Vehicle",
        ["image"] = "rbxassetid://85653045704706",
        ["rarity"] = "ultra_rare"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)