--// ReplicatedStorage.SharedModules.ContentPacks.Snow2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["snow_2022_snow_plow"] = {
        ["name"] = "Snow Plow",
        ["image"] = "rbxassetid://9342853829",
        ["rarity"] = "ultra_rare",
        ["colorable"] = true,
        ["cost"] = 3000,
        ["liveops_map_type_required_for_purchase"] = "Snow"
    },
    ["snow_2022_tundra_exploration_machine"] = {
        ["name"] = "Tundra Exploration Machine",
        ["image"] = "rbxassetid://9343367876",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3000,
        ["liveops_map_type_required_for_purchase"] = "Snow"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)