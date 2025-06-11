--// ReplicatedStorage.SharedModules.ContentPacks.CampingShop2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["camping_2023_camper_van"] = {
        ["name"] = "Camping Van",
        ["image"] = "rbxassetid://12281884547",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3000,
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)