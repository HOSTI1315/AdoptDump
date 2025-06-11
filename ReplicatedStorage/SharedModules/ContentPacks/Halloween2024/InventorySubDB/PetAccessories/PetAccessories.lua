--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["halloween_2024_monster_friend_hat"] = {
        ["name"] = "Monster Friend Hat",
        ["image"] = "rbxassetid://72390714477662",
        ["rarity"] = "uncommon",
        ["cost"] = 1300,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2024MonsterFriendHat"
    },
    ["halloween_2024_fang_necklace"] = {
        ["name"] = "Fang Necklace",
        ["image"] = "rbxassetid://135014054760226",
        ["rarity"] = "common",
        ["cost"] = 550,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Halloween2024FangNecklace"
    },
    ["halloween_2024_slime_shades"] = {
        ["name"] = "Slime Shades",
        ["image"] = "rbxassetid://87038855018049",
        ["rarity"] = "common",
        ["cost"] = 750,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Halloween2024SlimeShades"
    },
    ["halloween_2024_gothic_horns"] = {
        ["name"] = "Gothic Horns",
        ["image"] = "rbxassetid://123804963684735",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3900,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2024GothicHorns"
    },
    ["halloween_2024_web_cape"] = {
        ["name"] = "Web Cape",
        ["image"] = "rbxassetid://138530622182587",
        ["rarity"] = "rare",
        ["cost"] = 2600,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Halloween2024WebCape"
    },
    ["halloween_2024_sorcerer_hat"] = {
        ["name"] = "Sorcerer Hat",
        ["image"] = "rbxassetid://133689919653264",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4400,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2024SorcererHat"
    },
    ["halloween_2024_witch_nose"] = {
        ["name"] = "Witch Nose",
        ["image"] = "rbxassetid://122699216242080",
        ["rarity"] = "uncommon",
        ["cost"] = 1050,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Halloween2024WitchNose"
    },
    ["halloween_2024_sorcerer_wand"] = {
        ["name"] = "Sorcerer Wand",
        ["image"] = "rbxassetid://126442437340912",
        ["rarity"] = "rare",
        ["cost"] = 2450,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Halloween2024SorcererWand"
    },
    ["halloween_2024_midnight_wings"] = {
        ["name"] = "Midnight Wings",
        ["image"] = "rbxassetid://106741438742319",
        ["rarity"] = "ultra_rare",
        ["cost"] = 38000,
        ["currency_id"] = "candy_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapLarge",
        ["flying_scale"] = 1.2,
        ["model_handle"] = "Halloween2024MidnightWings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)