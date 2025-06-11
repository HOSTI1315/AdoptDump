--// ReplicatedStorage.SharedModules.ContentPacks.PiB2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["pib_2022_boots"] = {
        ["name"] = "Boots",
        ["image"] = "rbxassetid://10967650616",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "PiB2022Boots"
    },
    ["pib_2022_feather"] = {
        ["name"] = "Feather",
        ["image"] = "rbxassetid://10967650529",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "PiB2022Feather"
    },
    ["pib_2022_hat"] = {
        ["name"] = "Hat",
        ["image"] = "rbxassetid://10967650432",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "PiB2022Hat"
    },
    ["pib_2022_sword"] = {
        ["name"] = "Sword",
        ["image"] = "rbxassetid://10967650692",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "PiB2022Sword"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)