--// ReplicatedStorage.SharedModules.ContentPacks.Desert2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["desert_2022_landsailer"] = {
        ["name"] = "Landsailer",
        ["image"] = "rbxassetid://8517689681",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3000,
        ["liveops_map_type_required_for_purchase"] = "Desert"
    },
    ["desert_2022_trireme"] = {
        ["name"] = "Trireme",
        ["image"] = "rbxassetid://8566306089",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3000,
        ["liveops_map_type_required_for_purchase"] = "Desert"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)