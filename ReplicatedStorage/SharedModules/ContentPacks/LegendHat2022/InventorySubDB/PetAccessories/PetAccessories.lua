--// ReplicatedStorage.SharedModules.ContentPacks.LegendHat2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {
    ["legend_hat_2022_angler_fish_light"] = {
        ["name"] = "Angler Fish Light",
        ["image"] = "rbxassetid://9368229416",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHat2022AnglerFishLight"
    },
    ["legend_hat_2022_back_taco"] = {
        ["name"] = "Back Taco",
        ["image"] = "rbxassetid://9360305349",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022BackTaco"
    },
    ["legend_hat_2022_battle_axe"] = {
        ["name"] = "Battle Axe",
        ["image"] = "rbxassetid://9368998187",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022BattleAxe"
    },
    ["legend_hat_2022_bionic_arms"] = {
        ["name"] = "Bionic Arms",
        ["image"] = "rbxassetid://9368995092",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022BionicArms"
    },
    ["legend_hat_2022_cactus_friend_hat"] = {
        ["name"] = "Cactus Friend Hat",
        ["image"] = "rbxassetid://9360315193",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHat2022CactusFriendHat"
    },
    ["legend_hat_2022_carrot_on_a_stick"] = {
        ["name"] = "Carrot On A Stick",
        ["image"] = "rbxassetid://9368003901",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHat2022CarrotOnAStick"
    },
    ["legend_hat_2022_clan_banner"] = {
        ["name"] = "Clan Banner",
        ["image"] = "rbxassetid://9369006077",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022ClanBanner"
    },
    ["legend_hat_2022_cool_quad_skates"] = {
        ["name"] = "Cool Quad Skates",
        ["image"] = "rbxassetid://9367964148",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "LegendHat2022CoolQuadSkates"
    },
    ["legend_hat_2022_cowboy_boots"] = {
        ["name"] = "Cowboy Boots",
        ["image"] = "rbxassetid://9367930360",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "LegendHat2022CowboyBoots"
    },
    ["legend_hat_2022_cowboy_saddle"] = {
        ["name"] = "Cowboy Saddle",
        ["image"] = "rbxassetid://9366524261",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022CowboySaddle"
    },
    ["legend_hat_2022_crayon_mohawk"] = {
        ["name"] = "Crayon Mohawk",
        ["image"] = "rbxassetid://9366461855",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHat2022CrayonMohawk"
    },
    ["legend_hat_2022_crystal_necklace"] = {
        ["name"] = "Crystal Necklace",
        ["image"] = "rbxassetid://9369005643",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "LegendHat2022CrystalNecklace"
    },
    ["legend_hat_2022_dueling_swords"] = {
        ["name"] = "Dueling Swords",
        ["image"] = "rbxassetid://9368995832",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022DuelingSwords"
    },
    ["legend_hat_2022_fantasy_blade"] = {
        ["name"] = "Fantasy Blade",
        ["image"] = "rbxassetid://9368033214",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022FantasyBlade"
    },
    ["legend_hat_2022_flower_aura"] = {
        ["name"] = "Flower Aura",
        ["image"] = "rbxassetid://9360325782",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHat2022FlowerAura"
    },
    ["legend_hat_2022_gold_coin_monocle"] = {
        ["name"] = "Gold Coin Monocle",
        ["image"] = "rbxassetid://9369006606",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "LegendHat2022GoldCoinMonocle"
    },
    ["legend_hat_2022_googly_eye_glasses"] = {
        ["name"] = "Googly Eye Glasses",
        ["image"] = "rbxassetid://9360404101",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "LegendHat2022GooglyEyeGlasses"
    },
    ["legend_hat_2022_guitar_case"] = {
        ["name"] = "Guitar Case",
        ["image"] = "rbxassetid://9368173797",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022GuitarCase"
    },
    ["legend_hat_2022_honey_jar"] = {
        ["name"] = "Honey Jar",
        ["image"] = "rbxassetid://9368247050",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHat2022HoneyJar"
    },
    ["legend_hat_2022_large_bow"] = {
        ["name"] = "Large Bow",
        ["image"] = "rbxassetid://9366509438",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHat2022LargeBow"
    },
    ["legend_hat_2022_leaf_sprout_hat"] = {
        ["name"] = "Leaf Sprout Hat",
        ["image"] = "rbxassetid://9360046919",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LegendHat2022LeafSproutHat"
    },
    ["legend_hat_2022_life_preserver"] = {
        ["name"] = "Life Preserver",
        ["image"] = "rbxassetid://9369092295",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022LifePreserver"
    },
    ["legend_hat_2022_magical_staff"] = {
        ["name"] = "Magical Staff",
        ["image"] = "rbxassetid://9368995526",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022MagicalStaff"
    },
    ["legend_hat_2022_modern_jetpack"] = {
        ["name"] = "Modern Jetpack",
        ["image"] = "rbxassetid://9368049302",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LegendHat2022ModernJetpack"
    }
}
local v3 = {
    ["name"] = "Nest of Eggs",
    ["image"] = "rbxassetid://9369009391",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022NestofEggs"
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "NestEggJitter"
    }
}
__set_list(v4, 1, {v5})
v3.static_effects = v4
v2.legend_hat_2022_nest_of_eggs = v3
v2.legend_hat_2022_puddleducks_hood = {
    ["name"] = "Puddleducks Hood",
    ["image"] = "rbxassetid://9368198913",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022PuddleducksHood"
}
v2.legend_hat_2022_rainbow_bucket_hat = {
    ["name"] = "Rainbow Bucket Hat",
    ["image"] = "rbxassetid://9369014280",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022RainbowBucketHat"
}
local v6 = {
    ["name"] = "Rainbow Maker",
    ["image"] = "rbxassetid://9375735773",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHat2022RainbowMaker"
}
local v7 = {}
local v8 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "RainbowMakerGearRotation"
    }
}
__set_list(v7, 1, {v8})
v6.static_effects = v7
v2.legend_hat_2022_rainbow_maker = v6
v2.legend_hat_2022_ronin_hat = {
    ["name"] = "Ronin Hat",
    ["image"] = "rbxassetid://9369009779",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022RoninHat"
}
v2.legend_hat_2022_sack_of_cash = {
    ["name"] = "Sack of Cash",
    ["image"] = "rbxassetid://9369007451",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHat2022SackofCash"
}
v2.legend_hat_2022_sandwich_hat = {
    ["name"] = "Sandwich Hat",
    ["image"] = "rbxassetid://9360288719",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022SandwichHat"
}
v2.legend_hat_2022_saucepan_hat = {
    ["name"] = "Saucepan Hat",
    ["image"] = "rbxassetid://9368998837",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022SaucepanHat"
}
v2.legend_hat_2022_spikey_hair_wig = {
    ["name"] = "Spikey Hair Wig",
    ["image"] = "rbxassetid://9368158311",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022SpikeyHairWig"
}
v2.legend_hat_2022_ten_gallon_hat = {
    ["name"] = "Ten Gallon Hat",
    ["image"] = "rbxassetid://9369006371",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022TenGallonHat"
}
v2.legend_hat_2022_tiny_wings = {
    ["name"] = "Tiny Wings",
    ["image"] = "rbxassetid://9368999557",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHat2022TinyWings"
}
local v9 = {
    ["name"] = "Toaster Hat",
    ["image"] = "rbxassetid://9360434794",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022ToasterHat"
}
local v10 = {}
local v11 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "ToasterToastSpring"
    }
}
__set_list(v10, 1, {v11})
v9.static_effects = v10
v2.legend_hat_2022_toaster_hat = v9
v2.legend_hat_2022_tool_box = {
    ["name"] = "Tool Box",
    ["image"] = "rbxassetid://9368069093",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHat2022ToolBox"
}
v2.legend_hat_2022_tropical_flower = {
    ["name"] = "Tropical Flower",
    ["image"] = "rbxassetid://9368013361",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LegendHat2022TropicalFlower"
}
v2.legend_hat_2022_unicorn_horn = {
    ["name"] = "Unicorn Horn",
    ["image"] = "rbxassetid://9360701042",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LegendHat2022UnicornHorn"
}
v2.legend_hat_2022_victorian_collar = {
    ["name"] = "Victorial Collar",
    ["image"] = "rbxassetid://9360540410",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "LegendHat2022VictorianCollar"
}
return v1(v2)