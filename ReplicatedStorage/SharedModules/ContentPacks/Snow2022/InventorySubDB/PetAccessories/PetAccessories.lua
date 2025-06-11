--// ReplicatedStorage.SharedModules.ContentPacks.Snow2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["snow_2022_cosy_snow_hat"] = {
        ["name"] = "Cosy Snow Hat",
        ["image"] = "rbxassetid://9378757742",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1850,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["liveops_map_type_required_for_purchase"] = "Snow",
        ["model_handle"] = "Snow2022CosySnowHat"
    },
    ["snow_2022_cosy_snow_scarf"] = {
        ["name"] = "Cosy Snow Scarf",
        ["image"] = "rbxassetid://9350692331",
        ["rarity"] = "rare",
        ["cost"] = 550,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["liveops_map_type_required_for_purchase"] = "Snow",
        ["model_handle"] = "Snow2022CosySnowScarf"
    },
    ["snow_2022_fluffy_earmuffs"] = {
        ["name"] = "Fluffy Earmuffs",
        ["image"] = "rbxassetid://9378757423",
        ["rarity"] = "rare",
        ["cost"] = 600,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["liveops_map_type_required_for_purchase"] = "Snow",
        ["model_handle"] = "Snow2022FluffyEarmuffs"
    },
    ["snow_2022_snow_cloud_wings"] = {
        ["name"] = "Snow Cloud Wings",
        ["image"] = "rbxassetid://9350659128",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1600,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["liveops_map_type_required_for_purchase"] = "Snow",
        ["model_handle"] = "Snow2022SnowCloudWings"
    },
    ["snow_2022_snowflake_badge"] = {
        ["name"] = "Snowflake Badge",
        ["image"] = "rbxassetid://9350707696",
        ["rarity"] = "common",
        ["cost"] = 50,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["liveops_map_type_required_for_purchase"] = "Snow",
        ["model_handle"] = "Snow2022SnowflakeBadge"
    },
    ["snow_2022_snowflake_earrings"] = {
        ["name"] = "Snowflake Earrings",
        ["image"] = "rbxassetid://9350629908",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["liveops_map_type_required_for_purchase"] = "Snow",
        ["model_handle"] = "Snow2022SnowflakeEarrings"
    },
    ["snow_2022_tundra_explorer_goggles"] = {
        ["name"] = "Tundra Explorer Goggles",
        ["image"] = "rbxassetid://9350643765",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["liveops_map_type_required_for_purchase"] = "Snow",
        ["model_handle"] = "Snow2022TundraExplorerGoggles"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)