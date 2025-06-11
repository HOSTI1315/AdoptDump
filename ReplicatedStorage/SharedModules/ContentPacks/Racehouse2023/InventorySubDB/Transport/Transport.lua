--// ReplicatedStorage.SharedModules.ContentPacks.Racehouse2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["racehouse_2023_gokart"] = {
        ["name"] = "Go-Kart",
        ["image"] = "rbxassetid://14056207033",
        ["rarity"] = "common",
        ["colorable"] = true,
        ["donatable"] = false,
        ["temporary"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)