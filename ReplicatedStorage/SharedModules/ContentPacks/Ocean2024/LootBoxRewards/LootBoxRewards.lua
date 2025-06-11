--// ReplicatedStorage.SharedModules.ContentPacks.Ocean2024.LootBoxRewards (ModuleScript)

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
            ["kind"] = "ocean_2024_urchin_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_stringray_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_cranky_coin_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_treasure_chest_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_crab_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_dolphin_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_dracula_fish_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_mahi_mahi_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_narwhal_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_sea_angel_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_wishing_well_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_white_sand_dollar_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_jellyfish_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_clownfish_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_lionfish_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_rare_chest_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_kraken_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_octopus_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_shark_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "ocean_2024_nautilus_sticker",
            ["category"] = "stickers"
        }
    })
}
v1.ocean_2024_ocean_sticker_pack = v2
return v1