--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshNovember2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {
    ["gift_refresh_2023_ar_headset"] = {
        ["name"] = "AR Headset",
        ["image"] = "rbxassetid://15173369334",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "GiftRefreshNovember2023ARHeadset",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_bear_cap"] = {
        ["name"] = "Bear Cap",
        ["image"] = "rbxassetid://15173369395",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023BearCap",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_bear_keychain"] = {
        ["name"] = "Bear Keychain",
        ["image"] = "rbxassetid://15173369480",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "GiftRefreshNovember2023BearKeychain",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_burger_boots"] = {
        ["name"] = "Burger Boots",
        ["image"] = "rbxassetid://15173369665",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "GiftRefreshNovember2023BurgerBoots",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_card_reader"] = {
        ["name"] = "Card Reader",
        ["image"] = "rbxassetid://15173369740",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftRefreshNovember2023CardReader",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_carrot_headphones"] = {
        ["name"] = "Carrot Headphones",
        ["image"] = "rbxassetid://15173437574",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023CarrotHeadphones",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_combat_target_dummy"] = {
        ["name"] = "Combat Target Dummy",
        ["image"] = "rbxassetid://15173437668",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023CombatTargetDummy",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_fairy_bell_necklace"] = {
        ["name"] = "Fairy Bell Necklace",
        ["image"] = "rbxassetid://15295363608",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "GiftRefreshNovember2023FairyBellNecklace",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_feather_boa"] = {
        ["name"] = "Feather Boa",
        ["image"] = "rbxassetid://15173369587",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "GiftRefreshNovember2023FeatherBoa",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_fishbone_badge"] = {
        ["name"] = "Fishbone Badge",
        ["image"] = "rbxassetid://15173437836",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "GiftRefreshNovember2023FishboneBadge",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_foragers_reward"] = {
        ["name"] = "Foragers Reward",
        ["image"] = "rbxassetid://15173437918",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "GiftRefreshNovember2023ForagersReward",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_fragile_box"] = {
        ["name"] = "Fragile Box",
        ["image"] = "rbxassetid://15173437987",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftRefreshNovember2023FragileBox",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_frigid_hat"] = {
        ["name"] = "Frigid Hat",
        ["image"] = "rbxassetid://15173505069",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023FrigidHat",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_giraffe_bucket_hat"] = {
        ["name"] = "Giraffe Bucket Hat",
        ["image"] = "rbxassetid://15173505130",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023GiraffeBucketHat",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_golden_circlet"] = {
        ["name"] = "Golden Circlet",
        ["image"] = "rbxassetid://15173505212",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023GoldenCirclet",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_heart_bucket_hat"] = {
        ["name"] = "Heart Bucket Hat",
        ["image"] = "rbxassetid://15173505276",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023HeartBucketHat",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_heart_ribbon"] = {
        ["name"] = "Heart Ribbon",
        ["image"] = "rbxassetid://15173505354",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "GiftRefreshNovember2023HeartRibbon",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_hourglass"] = {
        ["name"] = "Hourglass",
        ["image"] = "rbxassetid://15173505431",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftRefreshNovember2023Hourglass",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_joystick_controller"] = {
        ["name"] = "Joystick Controller",
        ["image"] = "rbxassetid://15173576784",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023JoystickController",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_katana_set"] = {
        ["name"] = "Katana Set",
        ["image"] = "rbxassetid://15173576855",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftRefreshNovember2023KatanaSet",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_lace_heart_backpack"] = {
        ["name"] = "Lace Heart Backpack",
        ["image"] = "rbxassetid://15173576945",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftRefreshNovember2023LaceHeartBackpack",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_laced_yellow_heels"] = {
        ["name"] = "Laced Yellow Heels",
        ["image"] = "rbxassetid://15173577140",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "GiftRefreshNovember2023LacedYellowHeels",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_lava_lamp_hat"] = {
        ["name"] = "Lava Lamp Hat",
        ["image"] = "rbxassetid://15172559230",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftRefreshNovember2023LavaLampHat",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    },
    ["gift_refresh_2023_monstera_leaf_cape"] = {
        ["name"] = "Monstera Leaf Cape",
        ["image"] = "rbxassetid://15173577207",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftRefreshNovember2023MonsteraLeafCape",
        ["tags"] = { "GiftRefresh2023ChestItem" }
    }
}
local v3 = {
    ["name"] = "Music Box Hat",
    ["image"] = "rbxassetid://15172649265",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023MusicBoxHat"
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "MusicBoxHatSpin"
    }
}
__set_list(v4, 1, {v5})
v3.static_effects = v4
v3.tags = { "GiftRefresh2023ChestItem" }
v2.gift_refresh_2023_music_box_hat = v3
v2.gift_refresh_2023_pancake_stack = {
    ["name"] = "Pancake Stack",
    ["image"] = "rbxassetid://15173577280",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023PancakeStack",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_rain_cloud_hat = {
    ["name"] = "Rain Cloud Hat",
    ["image"] = "rbxassetid://15172649318",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023RainCloudHat",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_royal_crown_pillow = {
    ["name"] = "Royal Crown Pillow",
    ["image"] = "rbxassetid://15173664296",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftRefreshNovember2023RoyalCrownPillow",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_safety_pin_beanie = {
    ["name"] = "Safety Pin Beanie",
    ["image"] = "rbxassetid://15173664349",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023SafetyPinBeanie",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_sausage_link = {
    ["name"] = "Sausage Link",
    ["image"] = "rbxassetid://15173664418",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftRefreshNovember2023SausageLink",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_shovel = {
    ["name"] = "Shovel",
    ["image"] = "rbxassetid://15173664481",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftRefreshNovember2023Shovel",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_sock_shoes = {
    ["name"] = "Sock Shoes",
    ["image"] = "rbxassetid://15173664545",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftRefreshNovember2023SockShoes",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_spikey_goggles = {
    ["name"] = "Spikey Goggles",
    ["image"] = "rbxassetid://15173664689",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftRefreshNovember2023SpikeyGoggles",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_star_barrette = {
    ["name"] = "Star Barrette",
    ["image"] = "rbxassetid://15173683100",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023StarBarrette",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_stitched_up_beanie = {
    ["name"] = "Stitched Up Beanie",
    ["image"] = "rbxassetid://15173683170",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023StitchedUpBeanie",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_waterfall_hat = {
    ["name"] = "Waterfall Hat",
    ["image"] = "rbxassetid://15172649353",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023WaterfallHat",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_welders_mask = {
    ["name"] = "Welder\'s Mask",
    ["image"] = "rbxassetid://15173683219",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023WeldersMask",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_winged_cap = {
    ["name"] = "Winged Cap",
    ["image"] = "rbxassetid://15173683278",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftRefreshNovember2023WingedCap",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_winged_heels = {
    ["name"] = "Winged Heels",
    ["image"] = "rbxassetid://15173683360",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftRefreshNovember2023WingedHeels",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
v2.gift_refresh_2023_winged_necklace = {
    ["name"] = "Winged Necklace",
    ["image"] = "rbxassetid://15173683441",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftRefreshNovember2023WingedNecklace",
    ["tags"] = { "GiftRefresh2023ChestItem" }
}
return v1(v2)