--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = false,
    ["possible_loot"] = require(game.ReplicatedStorage.Fsys).load("LootBoxRewardsHelper").group_loot_chances_by_rarity({
        ["common"] = 0.4,
        ["uncommon"] = 0.25,
        ["rare"] = 0.17,
        ["ultra_rare"] = 0.14,
        ["legendary"] = 0.04
    }, {
        {
            ["kind"] = "summerfest_2024_castle_hermit_crab_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_kid_goat_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_shark_puppy_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_balloon_unicorn_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_lobster_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_flying_fish_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_pirate_hermit_crab_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_mini_pig_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_blue_betta_fish_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_pink_betta_fish_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_tortuga_de_la_isla_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_punk_pony_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_orange_betta_fish_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_corn_doggo_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_hot_doggo_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_cow_calf_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_hermit_crab_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_many_mackerel_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_arctic_tern_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_leviathan_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_show_pony_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_majestic_pony_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_pretty_pony_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_ice_cream_hermit_crab_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_leopard_shark_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_happy_clam_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "summerfest_2024_rodeo_bull_sticker",
            ["category"] = "stickers"
        }
    })
}
v1.summerfest_2024_state_fair_sticker_pack = v2
return v1