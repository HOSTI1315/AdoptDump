--// ReplicatedStorage.SharedModules.ContentPacks.Pride2024.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = false,
    ["possible_loot"] = require(game.ReplicatedStorage.Fsys).load("LootBoxRewardsHelper").group_loot_chances_by_rarity({
        ["rare"] = 1
    }, {
        {
            ["kind"] = "pride_2024_lesbian_cat_snake_alliance_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_gay_snake_in_a_boot_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_omnisex_pegasus_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_ace_goose_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_pan_parrot_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_bi_dodo_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_non_beenary_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_trans_glyptodon_barv_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_happy_pride_zebra_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_intersex_ringed_octopus_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_agender_rat_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_genderqueer_seahorse_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_demisexual_bat_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_gender_fluid_ghost_dog_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "pride_2024_aromatic_trex_pet",
            ["category"] = "stickers"
        }
    })
}
v1.pride_2024_sticker_pack = v2
return v1