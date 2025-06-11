--// ReplicatedStorage.SharedModules.ContentPacks.Birthday2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["birthday_2022_badge"] = {
        ["name"] = "2022 Birthday 5 Badge",
        ["image"] = "rbxassetid://10323182195",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Birthday20225Badge"
    },
    ["birthday_2022_birthday_cake"] = {
        ["name"] = "2022 Birthday Cake",
        ["image"] = "rbxassetid://10323180811",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1000,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Birthday2022Cake"
    },
    ["birthday_2022_confetti_cannon"] = {
        ["name"] = "2022 Birthday Confetti Cannon",
        ["image"] = "rbxassetid://10323178213",
        ["rarity"] = "legendary",
        ["cost"] = 2500,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Birthday2022ConfettiCannon"
    },
    ["birthday_2022_confetti_drape"] = {
        ["name"] = "2022 Birthday Confetti Drape",
        ["image"] = "rbxassetid://10323176929",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Birthday2022ConfettiDrape"
    },
    ["birthday_2022_cupcake_shoes"] = {
        ["name"] = "2022 Birthday Cupcake Shoes",
        ["image"] = "rbxassetid://10323175861",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1250,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Birthday2022CupcakeShoes"
    },
    ["birthday_2022_party_hat"] = {
        ["name"] = "2022 Birthday Party Hat",
        ["image"] = "rbxassetid://10323173912",
        ["rarity"] = "rare",
        ["cost"] = 800,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Birthday2022PartyHat"
    },
    ["birthday_2022_party_horn"] = {
        ["name"] = "2022 Birthday Party Horn",
        ["image"] = "rbxassetid://10323171410",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Birthday2022PartyHorn"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)