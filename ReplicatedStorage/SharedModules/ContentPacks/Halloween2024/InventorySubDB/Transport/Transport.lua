--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["halloween_2024_enchanted_broomstick"] = {
        ["name"] = "Enchanted Broomstick",
        ["image"] = "rbxassetid://75519144173200",
        ["rarity"] = "ultra_rare"
    },
    ["halloween_2024_rift_rider"] = {
        ["name"] = "Rift Rider",
        ["image"] = "rbxassetid://111386920146543",
        ["rarity"] = "rare",
        ["cost"] = 32000,
        ["currency_id"] = "candy_2024"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)