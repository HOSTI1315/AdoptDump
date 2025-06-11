--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["winter_2023_candy_camper"] = {
        ["name"] = "Candy Camper",
        ["image"] = "rbxassetid://15491098940",
        ["rarity"] = "ultra_rare"
    },
    ["winter_2023_festive_wreath_cruiser"] = {
        ["name"] = "Festive Wreath Cruiser",
        ["image"] = "rbxassetid://15491629610",
        ["rarity"] = "uncommon",
        ["colorable"] = true,
        ["cost"] = 14000,
        ["currency_id"] = "gingerbread_2023"
    },
    ["winter_2023_firework_cycle"] = {
        ["name"] = "Firework Cycle",
        ["image"] = "rbxassetid://15563909829",
        ["rarity"] = "legendary",
        ["colorable"] = true,
        ["cost"] = 99000,
        ["currency_id"] = "gingerbread_2023"
    },
    ["winter_2023_gingerbread_stunt_plane"] = {
        ["name"] = "Gingerbread Stunt Plane",
        ["image"] = "rbxassetid://15548120382",
        ["rarity"] = "rare",
        ["cost"] = 37000,
        ["currency_id"] = "gingerbread_2023"
    },
    ["winter_2023_snow_globetrotter"] = {
        ["name"] = "Snow Globetrotter",
        ["image"] = "rbxassetid://15362081332",
        ["rarity"] = "ultra_rare",
        ["cost"] = 75000,
        ["currency_id"] = "gingerbread_2023"
    },
    ["winter_2023_waffle_wagon"] = {
        ["name"] = "Waffle Wagon",
        ["image"] = "rbxassetid://15485467913",
        ["rarity"] = "rare"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)