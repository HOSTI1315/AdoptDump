--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshSeptember2021.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["magical_princess_unicycle"] = {
        ["name"] = "Magical Princess Unicycle",
        ["image"] = "rbxassetid://7368045552",
        ["rarity"] = "ultra_rare"
    },
    ["plant_powered_roller_skates"] = {
        ["name"] = "Plant Powered Roller Skates",
        ["image"] = "rbxassetid://7368040075",
        ["rarity"] = "ultra_rare",
        ["is_roller_skates"] = true
    },
    ["rocket_skates"] = {
        ["name"] = "Rocket Skates",
        ["image"] = "rbxassetid://7368052482",
        ["rarity"] = "rare",
        ["is_roller_skates"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)