--// ReplicatedStorage.SharedModules.ContentPacks.Easter2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["easter_2022_egg_delivery_machine"] = {
        ["name"] = "Egg Delivery Machine",
        ["image"] = "rbxassetid://9291032374",
        ["rarity"] = "legendary",
        ["cost"] = 5000
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)