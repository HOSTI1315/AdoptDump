--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2021.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["halloween_2021_axe_guitar"] = {
        ["name"] = "Halloween Black Axe Guitar Accessory",
        ["image"] = "rbxassetid://7719374429",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1200,
        ["currency_id"] = "candy_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Hall2021AxeGuitar"
    },
    ["halloween_2021_candy_corn_earrings"] = {
        ["name"] = "Halloween Orange Candy Corn Earrings",
        ["image"] = "rbxassetid://7719374641",
        ["rarity"] = "uncommon",
        ["cost"] = 285,
        ["currency_id"] = "candy_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Hall2021CandyCornEarrings"
    },
    ["halloween_2021_cauldron_hat"] = {
        ["name"] = "Halloween Black Cauldron Hat",
        ["image"] = "rbxassetid://7719374717",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["currency_id"] = "candy_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Hall2021CauldronHat"
    },
    ["halloween_2021_evil_barrel_backpack"] = {
        ["name"] = "Halloween Evil Barrel Backpack",
        ["image"] = "rbxassetid://7719378486",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["currency_id"] = "candy_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Hall2021EvilBarrelBackpack"
    },
    ["halloween_2021_gravestone_backpack"] = {
        ["name"] = "Halloween Grey Gravestone Backpack",
        ["image"] = "rbxassetid://7719382751",
        ["rarity"] = "uncommon",
        ["cost"] = 430,
        ["currency_id"] = "candy_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Hall2021GravestoneBackpack"
    },
    ["halloween_2021_pumpkin_friend"] = {
        ["name"] = "Halloween Orange Pumpkin Friend Hat",
        ["image"] = "rbxassetid://7719382672",
        ["rarity"] = "rare",
        ["cost"] = 660,
        ["currency_id"] = "candy_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Hall2021PumpkinFriend"
    },
    ["halloween_2021_skull_hat"] = {
        ["name"] = "Halloween White Skull Hat",
        ["image"] = "rbxassetid://7719378399",
        ["rarity"] = "rare",
        ["cost"] = 375,
        ["currency_id"] = "candy_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Hall2021SkullHat"
    },
    ["halloween_2021_zombie_bat_wings"] = {
        ["name"] = "Halloween Green Zombie Bat Wings",
        ["image"] = "rbxassetid://7719382308",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1500,
        ["currency_id"] = "candy_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Hall2021ZombieBatWings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)