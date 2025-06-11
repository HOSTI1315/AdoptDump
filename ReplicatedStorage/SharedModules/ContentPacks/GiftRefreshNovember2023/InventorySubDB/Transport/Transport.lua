--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshNovember2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["gift_refresh_2023_bee_shuttle"] = {
        ["name"] = "Bee Shuttle",
        ["image"] = "rbxassetid://15154401459",
        ["rarity"] = "legendary",
        ["colorable"] = true
    },
    ["gift_refresh_2023_robo_unicycle"] = {
        ["name"] = "Robo Unicycle",
        ["image"] = "rbxassetid://15175549243",
        ["rarity"] = "ultra_rare"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)