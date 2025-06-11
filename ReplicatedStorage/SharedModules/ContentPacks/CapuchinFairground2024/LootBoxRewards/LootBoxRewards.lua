--// ReplicatedStorage.SharedModules.ContentPacks.CapuchinFairground2024.LootBoxRewards (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("LootBoxRewardsHelper")
local v2 = {
    {
        ["kind"] = "capuchin_2024_cool_sunglasses",
        ["category"] = "pet_accessories"
    },
    {
        ["kind"] = "capuchin_2024_tutu",
        ["category"] = "pet_accessories"
    },
    {
        ["kind"] = "capuchin_2024_handcuffs",
        ["category"] = "toys"
    },
    {
        ["kind"] = "capuchin_2024_compass",
        ["category"] = "toys"
    },
    {
        ["kind"] = "capuchin_2024_seal_pogo",
        ["category"] = "toys"
    },
    {
        ["kind"] = "capuchin_2024_tophat_flying_disc",
        ["category"] = "toys"
    },
    {
        ["kind"] = "capuchin_2024_whip_grappling_hook",
        ["category"] = "toys"
    },
    {
        ["kind"] = "capuchin_2024_peanut_friend_chew_toy",
        ["category"] = "toys"
    },
    {
        ["kind"] = "capuchin_2024_peanut_balloon",
        ["category"] = "toys"
    },
    {
        ["kind"] = "capuchin_2024_fire_ring_propeller",
        ["category"] = "toys"
    },
    {
        ["kind"] = "capuchin_2024_circus_ball_skates",
        ["category"] = "transport"
    },
    {
        ["kind"] = "capuchin_2024_hot_air_balloon",
        ["category"] = "transport"
    },
    {
        ["kind"] = "capuchin_2024_royal_capuchin_monkey",
        ["category"] = "pets"
    }
}
local v3 = {}
local v4 = {
    ["public"] = true,
    ["exchangeable"] = false,
    ["possible_loot"] = v1.group_loot_chances_by_rarity({
        ["common"] = 0.45,
        ["uncommon"] = 0.3,
        ["rare"] = 0.15,
        ["ultra_rare"] = 0.095,
        ["legendary"] = 0.005
    }, v2)
}
v3.capuchin_2024_standard_box = v4
local v5 = {
    ["public"] = true,
    ["exchangeable"] = false,
    ["possible_loot"] = v1.group_loot_chances_by_rarity({
        ["common"] = 0,
        ["uncommon"] = 0,
        ["rare"] = 0.5,
        ["ultra_rare"] = 0.4,
        ["legendary"] = 0.1
    }, v2)
}
v3.capuchin_2024_premium_box = v5
return v3