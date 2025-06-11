--// ReplicatedStorage.SharedModules.ContentPacks.Fall2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["fall_2022_harvest_truck"] = {
        ["name"] = "Harvest Truck",
        ["image"] = "rbxassetid://9973767611",
        ["rarity"] = "ultra_rare",
        ["cost"] = 2500,
        ["liveops_map_type_required_for_purchase"] = "Fall"
    },
    ["fall_2022_tractor"] = {
        ["name"] = "Tractor",
        ["image"] = "rbxassetid://9973768669",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3500,
        ["liveops_map_type_required_for_purchase"] = "Fall"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)