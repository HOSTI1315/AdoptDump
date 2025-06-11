--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2025.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["lunar_2025_knot_earrings"] = {
        ["name"] = "Lunar New Year Knot Earrings",
        ["image"] = "rbxassetid://84573156645959",
        ["rarity"] = "rare",
        ["cost"] = 5,
        ["currency_id"] = "stars_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Lunar2025KnotEarrings"
    },
    ["lunar_2025_dancing_lion_mask"] = {
        ["name"] = "Dancing Lion Mask",
        ["image"] = "rbxassetid://100500442110133",
        ["rarity"] = "rare",
        ["cost"] = 5,
        ["currency_id"] = "stars_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Lunar2025DancingLionMask"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)