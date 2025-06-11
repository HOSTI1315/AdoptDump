--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["lny_2023_coin_bag"] = {
        ["name"] = "Lucky Coin Backpack",
        ["image"] = "rbxassetid://11758574652",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LNY2023LuckyCoinBag"
    },
    ["lny_2023_coin_necklace"] = {
        ["name"] = "Lucky Coin Necklace",
        ["image"] = "rbxassetid://11758574769",
        ["rarity"] = "rare",
        ["cost"] = 600,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "LNY2023LuckyCoinNecklace"
    },
    ["lny_2023_dumpling_friend"] = {
        ["name"] = "Dumpling Friend Hat",
        ["image"] = "rbxassetid://11758569963",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1200,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LNY2023DumplingFriend"
    },
    ["lny_2023_earring"] = {
        ["name"] = "Lantern Earrings",
        ["image"] = "rbxassetid://11758574564",
        ["rarity"] = "uncommon",
        ["cost"] = 310,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "LNY2023LanternEarring"
    },
    ["lny_2023_shoes"] = {
        ["name"] = "Red Lunar New Year Slippers",
        ["image"] = "rbxassetid://11758575109",
        ["rarity"] = "rare",
        ["cost"] = 800,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "LNY2023Shoe"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)