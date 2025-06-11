--// ReplicatedStorage.SharedModules.ContentPacks.GibbonFairground2025.LootBoxRewards (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.SharedPackages.Sift)
local v3 = require(game.ReplicatedStorage.Fsys).load
local v4 = v3("LootBoxRewardsHelper")
local v_u_5 = v3("KindDB")
local v7 = v2.Dictionary.map({
    "gibbon_2025_cinnamon_roasted_almonds",
    "gibbon_2025_bunting_leash",
    "gibbon_2025_bubble_wand",
    "gibbon_2025_circus_tent_propeller",
    "gibbon_2025_paper_plane_throw_toy",
    "gibbon_2025_ring_of_fire_throwing_disc",
    "gibbon_2025_whistle_necklace",
    "gibbon_2025_fire_hose_scarf",
    "gibbon_2025_teacup_vehicle",
    "gibbon_2025_folded_paper_wings",
    "gibbon_2025_pluboneium_chew_toy",
    "gibbon_2025_influencer_gibbon",
    "gibbon_2025_hero_mask"
}, function(p6)
    return {
        ["kind"] = p6,
        ["category"] = v_u_5[p6].category
    }
end)
local v8 = {}
local v9 = {
    ["public"] = true,
    ["exchangeable"] = false,
    ["possible_loot"] = v4.group_loot_chances_by_rarity({
        ["common"] = 0.45,
        ["uncommon"] = 0.3,
        ["rare"] = 0.15,
        ["ultra_rare"] = 0.095,
        ["legendary"] = 0.005
    }, v7)
}
v8.gibbon_2025_standard_box = v9
local v10 = {
    ["public"] = true,
    ["exchangeable"] = false,
    ["possible_loot"] = v4.group_loot_chances_by_rarity({
        ["common"] = 0,
        ["uncommon"] = 0,
        ["rare"] = 0.5,
        ["ultra_rare"] = 0.4,
        ["legendary"] = 0.1
    }, v7)
}
v8.gibbon_2025_premium_box = v10
return v8