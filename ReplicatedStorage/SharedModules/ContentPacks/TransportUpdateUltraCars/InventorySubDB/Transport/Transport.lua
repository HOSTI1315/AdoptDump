--// ReplicatedStorage.SharedModules.ContentPacks.TransportUpdateUltraCars.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["bubble_car"] = {
        ["name"] = "Bubble Car",
        ["image"] = "rbxassetid://7165481985",
        ["rarity"] = "legendary"
    },
    ["magical_girl_car"] = {
        ["name"] = "Magical Girl Car",
        ["image"] = "rbxassetid://7165482478",
        ["rarity"] = "legendary"
    },
    ["wing_trunk_car"] = {
        ["name"] = "Wing Trunk Car",
        ["image"] = "rbxassetid://7165482807",
        ["rarity"] = "legendary"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)