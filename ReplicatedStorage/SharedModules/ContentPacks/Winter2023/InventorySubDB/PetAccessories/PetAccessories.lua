--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["winter_2023_2024_glasses"] = {
        ["name"] = "2024 Glasses",
        ["image"] = "rbxassetid://15556144750",
        ["rarity"] = "common",
        ["cost"] = 2024,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Winter20232024Glasses"
    },
    ["winter_2023_candy_cane_wings"] = {
        ["name"] = "Candy Cane Wings",
        ["image"] = "rbxassetid://15548167053",
        ["rarity"] = "uncommon",
        ["cost"] = 12000,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "Winter2023CandyCaneWingsFlap",
        ["model_handle"] = "Winter2023CandyCaneWings"
    },
    ["winter_2023_christmas_boots"] = {
        ["name"] = "Christmas Boots",
        ["image"] = "rbxassetid://15416630323",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Winter2023ChristmasBoots"
    },
    ["winter_2023_christmas_tree_earrings"] = {
        ["name"] = "Christmas Tree Earrings",
        ["image"] = "rbxassetid://15309159602",
        ["rarity"] = "common",
        ["cost"] = 500,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Winter2023ChristmasTreeEarrings"
    },
    ["winter_2023_elf_bandana"] = {
        ["name"] = "Elf Bandana",
        ["image"] = "rbxassetid://15545430128",
        ["rarity"] = "rare",
        ["cost"] = 2250,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Winter2023ElfBandana"
    },
    ["winter_2023_festive_beard"] = {
        ["name"] = "Festive Beard",
        ["image"] = "rbxassetid://15545421313",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4000,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Winter2023FestiveBeard"
    },
    ["winter_2023_festive_light_crown"] = {
        ["name"] = "Festive Light Crown",
        ["image"] = "rbxassetid://15545437322",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4200,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2023FestiveLightCrown"
    },
    ["winter_2023_gingerbread_wings"] = {
        ["name"] = "Gingerbread Wings",
        ["image"] = "rbxassetid://15491262406",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "Winter2023GingerbreadWingsFlap",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Winter2023GingerbreadWings"
    },
    ["winter_2023_holly_crown"] = {
        ["name"] = "Holly Crown",
        ["image"] = "rbxassetid://15309161429",
        ["rarity"] = "uncommon",
        ["cost"] = 1300,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2023HollyCrown"
    },
    ["winter_2023_hot_cocoa_hat"] = {
        ["name"] = "Hot Cocoa Hat",
        ["image"] = "rbxassetid://15491926450",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2023HotCocoaHat"
    },
    ["winter_2023_marshmallow_friend"] = {
        ["name"] = "Marshmallow Friend",
        ["image"] = "rbxassetid://15485859430",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2023MarshmallowFriend"
    },
    ["winter_2023_poinsettia_hair_clip"] = {
        ["name"] = "Poinsettia Hair Clip",
        ["image"] = "rbxassetid://15309163684",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2023PoinsettiaHairClip"
    },
    ["winter_2023_reindeer_hood"] = {
        ["name"] = "Reindeer Hood",
        ["image"] = "rbxassetid://15309165949",
        ["rarity"] = "rare",
        ["cost"] = 2000,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2023ReindeerHood"
    },
    ["winter_2023_sleigh_earrings"] = {
        ["name"] = "Sleigh Earrings",
        ["image"] = "rbxassetid://15545403779",
        ["rarity"] = "uncommon",
        ["cost"] = 1200,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Winter2023SleighEarrings"
    },
    ["winter_2023_ugly_christmas_cape"] = {
        ["name"] = "Ugly Holiday Cape",
        ["image"] = "rbxassetid://15309167928",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4900,
        ["currency_id"] = "gingerbread_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Winter2023UglyChristmasCape"
    },
    ["winter_2023_wreath_necklace"] = {
        ["name"] = "Wreath Necklace",
        ["image"] = "rbxassetid://15416633193",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Winter2023WreathNecklace"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)