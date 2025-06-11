--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatMay2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["gifthat_may_2024_motorized_sofa"] = {
        ["name"] = "Motorized Sofa",
        ["image"] = "rbxassetid://17323558877",
        ["rarity"] = "legendary"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)