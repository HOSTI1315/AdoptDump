--// ReplicatedStorage.SharedModules.ContentPacks.Lures2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["lures_2023_flame_crown"] = {
        ["name"] = "Flame Crown",
        ["image"] = "rbxassetid://14454447181",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Lures2023FlameCrown"
    },
    ["lures_2023_flame_glasses"] = {
        ["name"] = "Flame Glasses",
        ["image"] = "rbxassetid://14454446377",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Lures2023FlameGlasses"
    },
    ["lures_2023_magma_greatsword"] = {
        ["name"] = "Magma Greatsword",
        ["image"] = "rbxassetid://14454445768",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Lures2023MagmaGreatsword"
    },
    ["lures_2023_volcano_hat"] = {
        ["name"] = "Volcano Hat",
        ["image"] = "rbxassetid://14642985371",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Lures2023VolcanoHat"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)