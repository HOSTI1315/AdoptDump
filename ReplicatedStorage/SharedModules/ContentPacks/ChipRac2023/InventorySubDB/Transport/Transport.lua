--// ReplicatedStorage.SharedModules.ContentPacks.ChipRac2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["chiprac_2023_super_jetpack"] = {
        ["name"] = "Super Jetpack",
        ["image"] = "rbxassetid://14465252948",
        ["rarity"] = "ultra_rare",
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)