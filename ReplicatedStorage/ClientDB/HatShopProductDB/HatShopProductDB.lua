--// ReplicatedStorage.ClientDB.HatShopProductDB (ModuleScript)

local v1 = {
    ["heros_costume"] = {
        ["is_in_hatshop_rotation"] = true,
        ["accessory_ids_to_show"] = { "adventurers_hood", "adventurers_sword", "black_scarf" }
    },
    ["pirates_costume"] = {
        ["is_in_hatshop_rotation"] = true,
        ["accessory_ids_to_show"] = {
            "pirate_hat_and_friend",
            "eyepatch",
            "respectful_mustache",
            "ruff",
            "cutlass"
        }
    },
    ["royal_butterfly_bundle"] = {
        ["is_in_hatshop_rotation"] = true,
        ["accessory_ids_to_show"] = {
            "pink_butterfly_wings",
            "gold_circle_glasses",
            "pink_hightops",
            "gold_tiara"
        }
    }
}
return v1