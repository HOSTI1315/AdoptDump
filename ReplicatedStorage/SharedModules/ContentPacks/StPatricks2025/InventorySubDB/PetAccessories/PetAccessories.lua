--// ReplicatedStorage.SharedModules.ContentPacks.StPatricks2025.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["st_patricks_2025_leprechaun_shoes"] = {
        ["name"] = "Leprechaun Shoes",
        ["image"] = "rbxassetid://89719948941101",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "StPatricks2025LeprechaunShoes"
    },
    ["st_patricks_2025_leprechaun_jacket"] = {
        ["name"] = "Leprechaun Jacket",
        ["image"] = "rbxassetid://74674972532363",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "StPatricks2025LeprechaunJacket"
    },
    ["st_patricks_2025_leprechaun_tophat"] = {
        ["name"] = "Leprechaun Tophat",
        ["image"] = "rbxassetid://114973913885840",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "StPatricks2025LeprechaunHat"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)