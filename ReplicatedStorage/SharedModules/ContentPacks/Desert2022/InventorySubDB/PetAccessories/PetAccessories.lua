--// ReplicatedStorage.SharedModules.ContentPacks.Desert2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["desert_2022_crown"] = {
        ["name"] = "Gold Crown with Sapphire",
        ["image"] = "rbxassetid://8524077827",
        ["rarity"] = "rare",
        ["cost"] = 600,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["liveops_map_type_required_for_purchase"] = "Desert",
        ["model_handle"] = "Desert2022Crown"
    },
    ["desert_2022_horus_monocle"] = {
        ["name"] = "Eye of Horus Monocle",
        ["image"] = "rbxassetid://8524074043",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["liveops_map_type_required_for_purchase"] = "Desert",
        ["model_handle"] = "Desert2022HorusMonocle"
    },
    ["desert_2022_lotus_earrings"] = {
        ["name"] = "Lotus Earrings",
        ["image"] = "rbxassetid://8524077609",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["liveops_map_type_required_for_purchase"] = "Desert",
        ["model_handle"] = "Desert2022LotusEarrings"
    },
    ["desert_2022_nemes_headdress"] = {
        ["name"] = "Nemes",
        ["image"] = "rbxassetid://8524077356",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1850,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["liveops_map_type_required_for_purchase"] = "Desert",
        ["model_handle"] = "Desert2022NemesHeaddress"
    },
    ["desert_2022_pyramids_badge"] = {
        ["name"] = "Pyramids Badge",
        ["image"] = "rbxassetid://8524078109",
        ["rarity"] = "common",
        ["cost"] = 50,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["liveops_map_type_required_for_purchase"] = "Desert",
        ["model_handle"] = "Desert2022PyramidsBadge"
    },
    ["desert_2022_sun_wings"] = {
        ["name"] = "Sun Wings",
        ["image"] = "rbxassetid://8566811650",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1600,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["liveops_map_type_required_for_purchase"] = "Desert",
        ["model_handle"] = "Desert2022SunWings"
    },
    ["desert_2022_wesekh_necklace"] = {
        ["name"] = "Wesekh",
        ["image"] = "rbxassetid://8524073517",
        ["rarity"] = "rare",
        ["cost"] = 550,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["liveops_map_type_required_for_purchase"] = "Desert",
        ["model_handle"] = "Desert2022WesekhNecklace"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)