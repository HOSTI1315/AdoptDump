--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["halloween_2022_headless_horsemans_biplane"] = {
        ["name"] = "Headless Horseman\'s Biplane",
        ["image"] = "rbxassetid://11119263404",
        ["rarity"] = "legendary",
        ["cost"] = 63000,
        ["currency_id"] = "candy_2022"
    },
    ["halloween_2022_knife_throwing_board"] = {
        ["name"] = "Throwing Knife Target",
        ["image"] = "rbxassetid://10920073281",
        ["rarity"] = "rare",
        ["cost"] = 15500,
        ["currency_id"] = "candy_2022"
    },
    ["halloween_2022_shadow_rider_bike"] = {
        ["name"] = "Shadow Rider",
        ["image"] = "rbxassetid://10920073157",
        ["rarity"] = "legendary",
        ["cost"] = 75000,
        ["currency_id"] = "candy_2022",
        ["colorable"] = true
    },
    ["halloween_2022_unicorn_zombie_ponycycle"] = {
        ["name"] = "Unicorn Zombie Ponycycle",
        ["image"] = "rbxassetid://11125166616",
        ["rarity"] = "ultra_rare",
        ["cost"] = 23000,
        ["currency_id"] = "candy_2022"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)