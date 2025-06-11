--// ReplicatedStorage.SharedModules.ContentPacks.Easter2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["easter_2022_spring_bunny_feet"] = {
        ["name"] = "Spring Bunny Feet",
        ["image"] = "rbxassetid://9296773851",
        ["rarity"] = "common",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Easter2022SpringBunnyFeet"
    },
    ["easter_2022_spring_bunny_hood"] = {
        ["name"] = "Spring Bunny Hood",
        ["image"] = "rbxassetid://9296738042",
        ["rarity"] = "rare",
        ["cost"] = 1500,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Easter2022SpringBunnyHood"
    },
    ["easter_2022_spring_bunny_nose"] = {
        ["name"] = "Spring Bunny Nose",
        ["image"] = "rbxassetid://9296761727",
        ["rarity"] = "uncommon",
        ["cost"] = 1000,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Easter2022SpringBunnyNose"
    },
    ["easter_2022_three_egg_basket"] = {
        ["name"] = "Three Egg Basket",
        ["image"] = "rbxassetid://9296837676",
        ["rarity"] = "rare",
        ["cost"] = 1750,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Easter2022ThreeEggBasket"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)