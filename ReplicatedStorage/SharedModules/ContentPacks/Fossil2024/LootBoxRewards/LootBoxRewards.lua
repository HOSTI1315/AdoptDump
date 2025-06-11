--// ReplicatedStorage.SharedModules.ContentPacks.Fossil2024.LootBoxRewards (ModuleScript)

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
            ["kind"] = "fossil_2024_tasmanian_tiger_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_ground_sloth_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_brachiosaurus_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_copper_pickaxe_misc",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_trex_rattle",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_trex_throw_toy",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_stegosaurus_throw_toy",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_long_neck_throw_toy",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_triceratops_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_stegosaurus_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_glyptodon_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_velociraptor_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_iron_pickaxe_misc",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_amber_bone",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_woolly_mammoth_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_dilophosaurus_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_pterodactyl_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_ankylosaurus_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_diamond_pickaxe_misc",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_sabertooth_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_deinonychus_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_elasmosaurus_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_dodo_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_trex_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "fossil_2024_dimorphodon_pet",
            ["category"] = "stickers"
        }
    })
}
v1.fossil_2024_fossil_sticker_pack = v2
return v1