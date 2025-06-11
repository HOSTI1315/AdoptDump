--// ReplicatedStorage.SharedModules.ContentPacks.GiftHat2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["gifthat_2023_celestial_carrier"] = {
        ["name"] = "Celestial Carrier",
        ["image"] = "rbxassetid://13078260154",
        ["rarity"] = "legendary"
    },
    ["gifthat_2023_modern_unicycle"] = {
        ["name"] = "Modern Unicycle",
        ["image"] = "rbxassetid://13078899783",
        ["rarity"] = "ultra_rare"
    },
    ["gifthat_2023_neon_skates"] = {
        ["name"] = "Neon Skates",
        ["image"] = "rbxassetid://13078900263",
        ["rarity"] = "common",
        ["is_roller_skates"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)