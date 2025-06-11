--// ReplicatedStorage.SharedModules.ContentPacks.CozyCabin2021.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["cozy_2021_snowmobile"] = {
        ["name"] = "Snowmobile",
        ["image"] = "rbxassetid://8203695278",
        ["rarity"] = "legendary"
    },
    ["cozy_2021_zamboni"] = {
        ["name"] = "Zamboni",
        ["image"] = "rbxassetid://8243269978",
        ["rarity"] = "ultra_rare",
        ["cost"] = 2500,
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)