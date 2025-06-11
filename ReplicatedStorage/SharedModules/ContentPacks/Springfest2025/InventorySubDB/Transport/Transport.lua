--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["spring_2025_flying_cloud"] = {
        ["name"] = "Flying Cloud",
        ["image"] = "rbxassetid://104454568767242",
        ["rarity"] = "ultra_rare"
    },
    ["spring_2025_powerbike"] = {
        ["name"] = "Powerbike",
        ["image"] = "rbxassetid://139356144521219",
        ["rarity"] = "ultra_rare",
        ["currency_id"] = "cherry_blossoms_2025",
        ["cost"] = 60000,
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)