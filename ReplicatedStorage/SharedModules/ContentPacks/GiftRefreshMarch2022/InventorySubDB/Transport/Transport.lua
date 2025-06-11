--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshMarch2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["gift_refresh_2022_bat_roller_skates"] = {
        ["name"] = "Bat Face Roller Skates",
        ["image"] = "rbxassetid://8978760422",
        ["rarity"] = "uncommon",
        ["is_roller_skates"] = true
    },
    ["gift_refresh_2022_dirt_bike_unicycle"] = {
        ["name"] = "Dirt Bike Unicycle",
        ["image"] = "rbxassetid://8978760559",
        ["rarity"] = "ultra_rare"
    },
    ["gift_refresh_2022_stagecoach"] = {
        ["name"] = "Horse And Carriage",
        ["image"] = "rbxassetid://9037078630",
        ["rarity"] = "legendary"
    },
    ["gift_refresh_2022_wizard_caravan"] = {
        ["name"] = "Wizard Caravan",
        ["image"] = "rbxassetid://8979306571",
        ["rarity"] = "legendary"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)