--// ReplicatedStorage.SharedModules.ContentPacks.UGCRefresh2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["ugc_refresh_2023_shadow_dragon_skateboard"] = {
        ["name"] = "Shadow Dragon Skateboard",
        ["image"] = "rbxassetid://13752203748",
        ["rarity"] = "common",
        ["donatable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)