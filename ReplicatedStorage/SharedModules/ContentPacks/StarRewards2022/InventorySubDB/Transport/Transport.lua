--// ReplicatedStorage.SharedModules.ContentPacks.StarRewards2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["star_rewards_2022_emperor_chariot"] = {
        ["name"] = "Emperor\'s Chariot",
        ["image"] = "rbxassetid://10224002323",
        ["rarity"] = "legendary"
    },
    ["star_rewards_2022_flower_car"] = {
        ["name"] = "Orchid Racer",
        ["image"] = "rbxassetid://10202931873",
        ["rarity"] = "ultra_rare"
    },
    ["star_rewards_2022_hovercraft"] = {
        ["name"] = "Hovercraft",
        ["image"] = "rbxassetid://10202932215",
        ["rarity"] = "ultra_rare"
    },
    ["star_rewards_2022_planet_car"] = {
        ["name"] = "Planetary Core Car",
        ["image"] = "rbxassetid://10224209770",
        ["rarity"] = "ultra_rare"
    },
    ["star_rewards_2022_wagon"] = {
        ["name"] = "Medieval Wagon",
        ["image"] = "rbxassetid://10203332627",
        ["rarity"] = "rare",
        ["cost"] = 800
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)