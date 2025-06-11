--// ReplicatedStorage.SharedModules.ContentPacks.Influencer2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["influencer_2022_supercar"] = {
        ["name"] = "Street Racer",
        ["image"] = "rbxassetid://10619155042",
        ["rarity"] = "legendary",
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)