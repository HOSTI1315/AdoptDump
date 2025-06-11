--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["lunar_2024_hanbok"] = {
        ["name"] = "Hanbok",
        ["image"] = "rbxassetid://16169395911",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Lunar2024Hanbok"
    },
    ["lunar_2024_rainbow_dragon_hat"] = {
        ["name"] = "Rainbow Dragon Hat",
        ["image"] = "rbxassetid://16356679152",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Lunar2024DragonHat"
    },
    ["lunar_2024_rice_cake_hat"] = {
        ["name"] = "Rice Cake Hat",
        ["image"] = "rbxassetid://16169398432",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Lunar2024RiceCakeHat"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)