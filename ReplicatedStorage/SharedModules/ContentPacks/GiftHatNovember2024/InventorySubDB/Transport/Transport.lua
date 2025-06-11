--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatNovember2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["gifthat_november_2024_dolphin_cruiser"] = {
        ["name"] = "Dolphin Cruiser",
        ["image"] = "rbxassetid://91600542114637",
        ["rarity"] = "legendary"
    },
    ["gifthat_november_2024_winged_skates"] = {
        ["name"] = "Winged Skates",
        ["image"] = "rbxassetid://97410662922646",
        ["rarity"] = "ultra_rare",
        ["is_roller_skates"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)