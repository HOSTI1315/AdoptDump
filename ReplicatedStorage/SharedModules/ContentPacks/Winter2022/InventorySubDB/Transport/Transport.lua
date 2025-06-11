--// ReplicatedStorage.SharedModules.ContentPacks.Winter2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["winter_2022_candy_snowmobile"] = {
        ["name"] = "Candy Snowmobile",
        ["image"] = "rbxassetid://11697121962",
        ["rarity"] = "rare",
        ["cost"] = 30000,
        ["currency_id"] = "gingerbread_2022"
    },
    ["winter_2022_giant_snowball"] = {
        ["name"] = "Giant Snowball",
        ["image"] = "rbxassetid://11574949668",
        ["rarity"] = "ultra_rare",
        ["cost"] = 60000,
        ["currency_id"] = "gingerbread_2022"
    },
    ["winter_2022_gingerbread_sleigh"] = {
        ["name"] = "Gingerbread Sleigh",
        ["image"] = "rbxassetid://11764928443",
        ["rarity"] = "legendary",
        ["cost"] = 100000,
        ["currency_id"] = "gingerbread_2022"
    },
    ["winter_2022_husky_drawn_sled"] = {
        ["name"] = "Husky Sled",
        ["image"] = "rbxassetid://11706055135",
        ["rarity"] = "ultra_rare",
        ["colorable"] = true
    },
    ["winter_2022_ice_breaker_ship"] = {
        ["name"] = "Icebreaker Ship",
        ["image"] = "rbxassetid://11466900358",
        ["rarity"] = "uncommon",
        ["cost"] = 15000,
        ["currency_id"] = "gingerbread_2022"
    },
    ["winter_2022_ice_plane"] = {
        ["name"] = "Ice Plane",
        ["image"] = "rbxassetid://11768005537",
        ["rarity"] = "legendary",
        ["colorable"] = true,
        ["cost"] = 75000,
        ["currency_id"] = "gingerbread_2022"
    },
    ["winter_2022_snowblower_toboggan"] = {
        ["name"] = "Snowblower Toboggan",
        ["image"] = "rbxassetid://11706157454",
        ["rarity"] = "ultra_rare",
        ["cost"] = 50000,
        ["currency_id"] = "gingerbread_2022"
    },
    ["winter_2022_strawberry_shortcake_skates"] = {
        ["name"] = "Strawberry Shortcake Skates",
        ["image"] = "rbxassetid://11582939967",
        ["rarity"] = "rare",
        ["is_roller_skates"] = true
    },
    ["winter_2022_strawberry_shortcake_unicycle"] = {
        ["name"] = "Strawberry Shortcake Unicycle",
        ["image"] = "rbxassetid://11582928541",
        ["rarity"] = "uncommon"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)