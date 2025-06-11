--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["winter_2024_chairlift"] = {
        ["name"] = "Chairlift",
        ["image"] = "rbxassetid://130190081707517",
        ["rarity"] = "rare",
        ["cost"] = 45000,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_trusty_sled"] = {
        ["name"] = "Trusty Sled",
        ["image"] = "rbxassetid://114666872514744",
        ["rarity"] = "uncommon"
    },
    ["winter_2024_hot_rod_sleigh"] = {
        ["name"] = "Hot Rod Sleigh",
        ["image"] = "rbxassetid://73170907686642",
        ["rarity"] = "ultra_rare",
        ["colorable"] = false
    },
    ["winter_2024_shooting_star_vehicle"] = {
        ["name"] = "Shooting Star Board",
        ["image"] = "rbxassetid://108219743234121",
        ["rarity"] = "ultra_rare"
    },
    ["winter_2024_festive_wagon"] = {
        ["name"] = "Festive Wagon",
        ["image"] = "rbxassetid://76858348895432",
        ["rarity"] = "rare",
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)