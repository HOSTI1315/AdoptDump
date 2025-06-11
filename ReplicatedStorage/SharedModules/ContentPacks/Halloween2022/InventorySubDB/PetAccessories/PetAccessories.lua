--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["halloween_2022_bat_backpack"] = {
        ["name"] = "Bat Backpack",
        ["image"] = "rbxassetid://10920062040",
        ["rarity"] = "ultra_rare",
        ["cost"] = 5280,
        ["currency_id"] = "candy_2022",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Halloween2022BatBackpack"
    },
    ["halloween_2022_bat_lollipop_earrings"] = {
        ["name"] = "Bat Candy Earrings",
        ["image"] = "rbxassetid://10920062165",
        ["rarity"] = "common",
        ["cost"] = 300,
        ["currency_id"] = "candy_2022",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Halloween2022BatLolliEarrings"
    },
    ["halloween_2022_candy_corn_hat"] = {
        ["name"] = "Candy Corn Hat",
        ["image"] = "rbxassetid://10920062226",
        ["rarity"] = "common",
        ["cost"] = 450,
        ["currency_id"] = "candy_2022",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2022CandyCornHat"
    },
    ["halloween_2022_crescent_moon_ornament"] = {
        ["name"] = "Crescent Moon Head Ornament",
        ["image"] = "rbxassetid://10920062293",
        ["rarity"] = "legendary",
        ["cost"] = 10000,
        ["currency_id"] = "candy_2022",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2022CrescentMoonOrnament"
    },
    ["halloween_2022_ghost_hat"] = {
        ["name"] = "Ghost Hat",
        ["image"] = "rbxassetid://10920062389",
        ["rarity"] = "rare",
        ["cost"] = 1500,
        ["currency_id"] = "candy_2022",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2022GhostHat"
    },
    ["halloween_2022_ghost_kitty_backpack"] = {
        ["name"] = "Ghost Kitty Backpack",
        ["image"] = "rbxassetid://10920062531",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4320,
        ["currency_id"] = "candy_2022",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Halloween2022GhostKittyBackpack"
    },
    ["halloween_2022_mule_baskets"] = {
        ["name"] = "Mule Baskets",
        ["image"] = "rbxassetid://11181333367",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Halloween2022MuleBaskets"
    },
    ["halloween_2022_planchette_hair_clip"] = {
        ["name"] = "Planchette Hair Clip",
        ["image"] = "rbxassetid://10920073069",
        ["rarity"] = "rare",
        ["cost"] = 2500,
        ["currency_id"] = "candy_2022",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2022PlanchetteHairClip"
    },
    ["halloween_2022_spider_web_crown"] = {
        ["name"] = "Spider Web Crown",
        ["image"] = "rbxassetid://10920073227",
        ["rarity"] = "uncommon",
        ["cost"] = 850,
        ["currency_id"] = "candy_2022",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2022SpiderWebCrown"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)