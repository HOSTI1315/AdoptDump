--// ReplicatedStorage.SharedModules.ContentPacks.Soccer2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["soccer_2024_soccer_car"] = {
        ["name"] = "Soccer Car",
        ["image"] = "rbxassetid://18317746614",
        ["rarity"] = "rare",
        ["cost"] = 1500,
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)