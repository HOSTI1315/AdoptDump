--// ReplicatedStorage.SharedModules.ContentPacks.Valentines2025.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["valentines_2025_heart_heels"] = {
        ["name"] = "Heart Heels",
        ["image"] = "rbxassetid://131229013622546",
        ["rarity"] = "common",
        ["cost"] = 400,
        ["currency_id"] = "cupid_hearts_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Valentines2025HeartHeels"
    },
    ["valentines_2025_heart_bow"] = {
        ["name"] = "Heart Bow",
        ["image"] = "rbxassetid://77542210810606",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1200,
        ["currency_id"] = "cupid_hearts_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "default",
        ["model_handle"] = "Valentines2025HeartBow"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)