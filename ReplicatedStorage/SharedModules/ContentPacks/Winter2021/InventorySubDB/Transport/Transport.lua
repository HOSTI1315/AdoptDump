--// ReplicatedStorage.SharedModules.ContentPacks.Winter2021.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["winter_2021_festive_deliveries_present_truck"] = {
        ["name"] = "Festive Deliveries Present Truck",
        ["image"] = "rbxassetid://8080952782",
        ["rarity"] = "ultra_rare",
        ["cost"] = 100000,
        ["currency_id"] = "gingerbread_2021"
    },
    ["winter_2021_flying_sleigh"] = {
        ["name"] = "Festive Deliveries Sleigh",
        ["image"] = "rbxassetid://8190703270",
        ["rarity"] = "legendary",
        ["cost"] = 45000,
        ["currency_id"] = "gingerbread_2021"
    },
    ["winter_2021_green_elf_ice_skates"] = {
        ["name"] = "Festive Ice Skates",
        ["image"] = "rbxassetid://7975097837",
        ["rarity"] = "rare",
        ["is_roller_skates"] = true
    },
    ["winter_2021_toy_rescue_helicopter"] = {
        ["name"] = "Toy Rescue Helicopter",
        ["image"] = "rbxassetid://8190703329",
        ["rarity"] = "legendary"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)