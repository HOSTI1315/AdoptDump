--// ReplicatedStorage.SharedModules.ContentPacks.RGBGiftRewards.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["rgb_collar"] = {
        ["name"] = "RGB Collar",
        ["image"] = "rbxassetid://8151013360",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "RGBCollar"
    },
    ["rgb_headset"] = {
        ["name"] = "RGB Headset",
        ["image"] = "rbxassetid://8151013513",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "RGBHeadset"
    },
    ["rgb_laptop"] = {
        ["name"] = "RGB Laptop",
        ["image"] = "rbxassetid://8151013663",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "RGBLaptop"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)