--// ReplicatedStorage.SharedModules.ContentPacks.LegendHatSept2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {
    ["legend_hat_sept_2022_aviator_hat"] = {
        ["name"] = "Aviator Hat",
        ["image"] = "rbxassetid://10967182331",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHatSept2022AviatorHat",
        ["tags"] = { "LegendHatsept2022ChestItem" }
    },
    ["legend_hat_sept_2022_bamboo_bindle"] = {
        ["name"] = "Bamboo Bindle",
        ["image"] = "rbxassetid://10967378577",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHatSept2022BambooBindle",
        ["tags"] = { "LegendHatsept2022ChestItem" }
    },
    ["legend_hat_sept_2022_banana_hat"] = {
        ["name"] = "Banana Hat",
        ["image"] = "rbxassetid://10968112829",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHatSept2022BananaHat",
        ["tags"] = { "LegendHatsept2022ChestItem" }
    },
    ["legend_hat_sept_2022_bear_hood"] = {
        ["name"] = "Bear Hood",
        ["image"] = "rbxassetid://10967189294",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHatSept2022BearHood",
        ["tags"] = { "LegendHatsept2022ChestItem" }
    },
    ["legend_hat_sept_2022_bolero_hat"] = {
        ["name"] = "Bolero Hat",
        ["image"] = "rbxassetid://10967348737",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHatSept2022BoleroHat",
        ["tags"] = { "LegendHatsept2022ChestItem" }
    },
    ["legend_hat_sept_2022_boxing_glove_necklace"] = {
        ["name"] = "Boxing Glove Necklace",
        ["image"] = "rbxassetid://10967363437",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "LegendHatSept2022BoxingGloveNecklace",
        ["tags"] = { "LegendHatsept2022ChestItem" }
    }
}
local v3 = {
    ["name"] = "Brain Jar",
    ["image"] = "rbxassetid://10978734976",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022BrainJar"
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "BrainJarIdle"
    }
}
__set_list(v4, 1, {v5})
v3.static_effects = v4
v3.tags = { "LegendHatsept2022ChestItem" }
v2.legend_hat_sept_2022_brain_jar = v3
v2.legend_hat_sept_2022_brim_beanie = {
    ["name"] = "Brim Beanie",
    ["image"] = "rbxassetid://10967349734",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022BrimBeanie",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_bumblebee_hat = {
    ["name"] = "Bumblebee Hat",
    ["image"] = "rbxassetid://10968113133",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022BumblebeeHat",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_bunny_straw_hat = {
    ["name"] = "Bunny Straw Hat",
    ["image"] = "rbxassetid://10968113436",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022BunnyStrawHat",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
local v6 = {
    ["name"] = "Chimney Hat",
    ["image"] = "rbxassetid://10978736046",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022ChimneyHat"
}
local v7 = {}
local v8 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "ChimneyHatIdle"
    }
}
__set_list(v7, 1, {v8})
v6.static_effects = v7
v6.tags = { "LegendHatsept2022ChestItem" }
v2.legend_hat_sept_2022_chimney_hat = v6
v2.legend_hat_sept_2022_curved_bow = {
    ["name"] = "Curved Bow",
    ["image"] = "rbxassetid://10967381207",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHatSept2022CurvedBow",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_flower_power_earrings = {
    ["name"] = "Flower Power Earrings",
    ["image"] = "rbxassetid://10968114237",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["equip_type"] = "earrings",
    ["model_handle"] = "LegendHatSept2022FlowerPowerEarrings",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_footwrap_shoes = {
    ["name"] = "Footwrap Shoes",
    ["image"] = "rbxassetid://10967385701",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "LegendHatSept2022FootwrapShoes",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_funky_disco_boots = {
    ["name"] = "Funky Disco Boots",
    ["image"] = "rbxassetid://10968113963",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "LegendHatSept2022FunkyDiscoBoots",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_fur_collared_cape = {
    ["name"] = "Fur Collared Cape",
    ["image"] = "rbxassetid://10967372759",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHatSept2022FurCollaredCape",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_glass_slippers = {
    ["name"] = "Glass Slippers",
    ["image"] = "rbxassetid://10967400043",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "LegendHatSept2022GlassSlippers",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_hair_buns = {
    ["name"] = "Hair Buns",
    ["image"] = "rbxassetid://10967338150",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022HairBuns",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_heart_hat = {
    ["name"] = "Heart Hat",
    ["image"] = "rbxassetid://10967346088",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022HeartHat",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_jester_hat = {
    ["name"] = "Jester Hat",
    ["image"] = "rbxassetid://10967343243",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022JesterHat",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_knight_helmet = {
    ["name"] = "Knight Helmet",
    ["image"] = "rbxassetid://10967191794",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022KnightHelmet",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_leaf_hat = {
    ["name"] = "Leaf Hat",
    ["image"] = "rbxassetid://10967353532",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022LeafHat",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
local v9 = {
    ["name"] = "Lightbulb Hat",
    ["image"] = "rbxassetid://10978735677",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022LightbulbHat"
}
local v10 = {}
local v11 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "LightbulbHatIdle"
    }
}
__set_list(v10, 1, {v11})
v9.static_effects = v10
v9.tags = { "LegendHatsept2022ChestItem" }
v2.legend_hat_sept_2022_lightbulb_hat = v9
v2.legend_hat_sept_2022_money_hat = {
    ["name"] = "Money Hat",
    ["image"] = "rbxassetid://10978734509",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022MoneyHat",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_paper_bag_hat = {
    ["name"] = "Paper Bag Hat",
    ["image"] = "rbxassetid://10967344589",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022PaperBagHat",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_pink_trainer_shoes = {
    ["name"] = "Pink Trainer Shoes",
    ["image"] = "rbxassetid://10967387644",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "LegendHatSept2022PinkTrainerShoes",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_puffer_jacket = {
    ["name"] = "Puffer Jacket",
    ["image"] = "rbxassetid://10967369916",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHatSept2022PufferJacket",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_rubber_ducks = {
    ["name"] = "Rubber Ducks",
    ["image"] = "rbxassetid://10967382431",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHatSept2022RubberDucks",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_skater_helmet = {
    ["name"] = "Skater Helmet",
    ["image"] = "rbxassetid://10967198661",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022SkaterHelmet",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_skull_toy = {
    ["name"] = "Skull Toy",
    ["image"] = "rbxassetid://10967376960",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHatSept2022SkullToy",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_snorkel_set = {
    ["name"] = "Snorkel Set",
    ["image"] = "rbxassetid://10967362371",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "LegendHatSept2022SnorkelSet",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_sock_hat = {
    ["name"] = "Sock Hat",
    ["image"] = "rbxassetid://10967186040",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022SockHat",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_space_helmet = {
    ["name"] = "Space Helmet",
    ["image"] = "rbxassetid://10967347427",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022SpaceHelmet",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_stethoscope = {
    ["name"] = "Stethoscope",
    ["image"] = "rbxassetid://10967364467",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "LegendHatSept2022Stethoscope",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_viking_shield = {
    ["name"] = "Viking Shield",
    ["image"] = "rbxassetid://10967375750",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHatSept2022VikingShield",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_vr_goggles = {
    ["name"] = "VR Goggles",
    ["image"] = "rbxassetid://10967360788",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "LegendHatSept2022VRGoggles",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_walkie_talkie = {
    ["name"] = "Walkie Talkie",
    ["image"] = "rbxassetid://10967365483",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "LegendHatSept2022WalkieTalkie",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_winged_cap = {
    ["name"] = "Winged Cap",
    ["image"] = "rbxassetid://10967350969",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHatSept2022WingedCap",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_writing_brush = {
    ["name"] = "Writing Brush",
    ["image"] = "rbxassetid://10967380008",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHatSept2022WritingBrush",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
v2.legend_hat_sept_2022_yarn_ball_toy = {
    ["name"] = "Yarn Ball Toy",
    ["image"] = "rbxassetid://10967366542",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHatSept2022YarnBallToy",
    ["tags"] = { "LegendHatsept2022ChestItem" }
}
return v1(v2)