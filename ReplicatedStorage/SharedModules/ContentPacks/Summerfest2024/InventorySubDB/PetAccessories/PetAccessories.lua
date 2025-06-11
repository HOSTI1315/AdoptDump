--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["summerfest_2024_target_board"] = {
        ["name"] = "Target Board",
        ["image"] = "rbxassetid://17650326869",
        ["rarity"] = "uncommon",
        ["cost"] = 950,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Summerfest2024TargetBoard"
    },
    ["summerfest_2024_knockdown_cans"] = {
        ["name"] = "Knockdown Cans",
        ["image"] = "rbxassetid://17650322816",
        ["rarity"] = "common",
        ["cost"] = 500,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Summerfest2024KnockdownCans"
    },
    ["summerfest_2024_magic_hat_face"] = {
        ["name"] = "Magic Hat Face",
        ["image"] = "rbxassetid://17650324205",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["cost"] = 1550,
        ["currency_id"] = "tickets_2024",
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Summerfest2024MagicHatFace"
    },
    ["summerfest_2024_strongperson_barbell"] = {
        ["name"] = "Strongperson Barbell",
        ["image"] = "rbxassetid://17650326102",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3100,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Summerfest2024StrongpersonBarbell"
    },
    ["summerfest_2024_shooting_star_earrings"] = {
        ["name"] = "Shooting Star Earrings",
        ["image"] = "rbxassetid://17650325245",
        ["rarity"] = "uncommon",
        ["cost"] = 1000,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Summerfest2024ShootingStarEarrings"
    },
    ["summerfest_2024_corndog_mustache"] = {
        ["name"] = "Corndog Mustache",
        ["image"] = "rbxassetid://17650318215",
        ["rarity"] = "rare",
        ["cost"] = 1750,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Summerfest2024CorndogMustache"
    },
    ["summerfest_2024_pretzel_eye_patch"] = {
        ["name"] = "Pretzel Eye Patch",
        ["image"] = "rbxassetid://17823247924",
        ["rarity"] = "common",
        ["cost"] = 400,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Summerfest2024PretzelEyePatch"
    },
    ["summerfest_2024_peace_shades"] = {
        ["name"] = "Peace Shades",
        ["image"] = "rbxassetid://17823248522",
        ["rarity"] = "uncommon",
        ["cost"] = 1100,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Summerfest2024PeaceShades"
    },
    ["summerfest_2024_cotton_candy_hat"] = {
        ["name"] = "Cotton Candy Hat",
        ["image"] = "rbxassetid://17823249271",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4300,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Summerfest2024CottonCandyHat"
    },
    ["summerfest_2024_sticky_hand_earrings"] = {
        ["name"] = "Sticky Hand Earrings",
        ["image"] = "rbxassetid://17823247135",
        ["rarity"] = "rare",
        ["cost"] = 1600,
        ["currency_id"] = "tickets_2024",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Summerfest2024StickyHandEarrings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)