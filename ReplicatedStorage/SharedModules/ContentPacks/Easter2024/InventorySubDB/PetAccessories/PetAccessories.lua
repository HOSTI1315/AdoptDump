--// ReplicatedStorage.SharedModules.ContentPacks.Easter2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["easter_2024_egg_friends_backpack"] = {
        ["name"] = "Easter Egg Friends",
        ["image"] = "rbxassetid://16646135282",
        ["rarity"] = "rare",
        ["cost"] = 2200,
        ["currency_id"] = "eggs_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Easter2024EggFriendsBackpack"
    },
    ["easter_2024_flower_bunny_clip"] = {
        ["name"] = "Flower Bunny Clip",
        ["image"] = "rbxassetid://16646136431",
        ["rarity"] = "common",
        ["cost"] = 500,
        ["currency_id"] = "eggs_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Easter2024FlowerBunnyClip"
    },
    ["easter_2024_flower_hair"] = {
        ["name"] = "Flower Hair",
        ["image"] = "rbxassetid://16646135827",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4700,
        ["currency_id"] = "eggs_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Easter2024FlowerHair"
    },
    ["easter_2024_cupcake_sprinkle_wings"] = {
        ["name"] = "Cupcake Sprinkle Wings",
        ["image"] = "rbxassetid://16736801775",
        ["rarity"] = "ultra_rare",
        ["cost"] = 35000,
        ["currency_id"] = "eggs_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "Easter2024CupcakeSprinkleWingsFlap",
        ["model_handle"] = "Easter2024CupcakeSprinkleWings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)