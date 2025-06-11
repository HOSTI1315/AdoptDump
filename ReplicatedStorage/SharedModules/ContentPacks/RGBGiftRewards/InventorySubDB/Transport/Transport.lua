--// ReplicatedStorage.SharedModules.ContentPacks.RGBGiftRewards.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["rgb_monster_truck"] = {
        ["name"] = "RGB Monster Truck",
        ["image"] = "rbxassetid://8481992442",
        ["rarity"] = "ultra_rare"
    },
    ["rgb_ufo"] = {
        ["name"] = "RGB UFO",
        ["image"] = "rbxassetid://8481992324",
        ["rarity"] = "ultra_rare"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)