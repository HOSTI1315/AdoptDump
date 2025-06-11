--// ReplicatedStorage.SharedModules.ContentPacks.VehicleShop2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["vehicle_shop_2022_bicycle"] = {
        ["name"] = "Bicycle",
        ["image"] = "rbxassetid://8859231299",
        ["rarity"] = "common",
        ["cost"] = 75,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_family_car"] = {
        ["name"] = "Family Car",
        ["image"] = "rbxassetid://9108506670",
        ["rarity"] = "uncommon",
        ["cost"] = 900,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_gyrocopter"] = {
        ["name"] = "Gyrocopter",
        ["image"] = "rbxassetid://8925104785",
        ["rarity"] = "legendary",
        ["colorable"] = true
    },
    ["vehicle_shop_2022_helicopter"] = {
        ["name"] = "Classic Helicopter",
        ["image"] = "rbxassetid://8859231666",
        ["rarity"] = "common",
        ["cost"] = 3500,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_jet_boat"] = {
        ["name"] = "Classic Boat",
        ["image"] = "rbxassetid://8860682054",
        ["rarity"] = "common",
        ["cost"] = 2750,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_motorbike"] = {
        ["name"] = "Motorbike",
        ["image"] = "rbxassetid://8859231811",
        ["rarity"] = "common",
        ["cost"] = 400,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_offroader"] = {
        ["name"] = "Off-Road Car",
        ["image"] = "rbxassetid://9108506795",
        ["rarity"] = "rare",
        ["cost"] = 1200,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_open_top_speeder"] = {
        ["name"] = "Open Top Speeder",
        ["image"] = "rbxassetid://9108506884",
        ["rarity"] = "uncommon",
        ["cost"] = 1800,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_plane"] = {
        ["name"] = "Classic Airplane",
        ["image"] = "rbxassetid://8859231943",
        ["rarity"] = "common",
        ["cost"] = 4000,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_sports_bike"] = {
        ["name"] = "Sports Bike",
        ["image"] = "rbxassetid://9108507006",
        ["rarity"] = "uncommon",
        ["cost"] = 700,
        ["colorable"] = true
    },
    ["vehicle_shop_2022_tandem_bike"] = {
        ["name"] = "Tandem Bicycle",
        ["image"] = "rbxassetid://8859232022",
        ["rarity"] = "common",
        ["cost"] = 300,
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)