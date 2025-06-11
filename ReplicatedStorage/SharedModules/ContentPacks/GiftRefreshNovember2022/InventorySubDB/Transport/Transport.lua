--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshNovember2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["gift_refresh_2022_ancient_unicycle"] = {
        ["name"] = "Ancient Unicycle",
        ["image"] = "rbxassetid://10905638416",
        ["rarity"] = "ultra_rare"
    },
    ["gift_refresh_2022_dapper_friend_carrier"] = {
        ["name"] = "Dapper Friend Carrier",
        ["image"] = "rbxassetid://10919870588",
        ["rarity"] = "legendary",
        ["colorable"] = true
    },
    ["gift_refresh_2022_hot_tub_muscle_car"] = {
        ["name"] = "Hot Tub Muscle Car",
        ["image"] = "rbxassetid://10967588257",
        ["rarity"] = "legendary",
        ["colorable"] = true
    },
    ["gift_refresh_2022_soapy_skates"] = {
        ["name"] = "Soapy Skates",
        ["image"] = "rbxassetid://10905207734",
        ["rarity"] = "common",
        ["is_roller_skates"] = true
    },
    ["gift_refresh_2022_unstable_triangle_car"] = {
        ["name"] = "Unstable Triangle Car",
        ["image"] = "rbxassetid://10913434990",
        ["rarity"] = "ultra_rare",
        ["colorable"] = true,
        ["cost"] = 2500
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)