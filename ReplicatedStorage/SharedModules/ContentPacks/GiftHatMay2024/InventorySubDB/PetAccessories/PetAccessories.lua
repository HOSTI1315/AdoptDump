--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatMay2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {
    ["gifthat_may_2024_clown_wig"] = {
        ["name"] = "Clown Wig",
        ["image"] = "rbxassetid://17272832375",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftHat2024ClownWig",
        ["tags"] = { "GiftHatMay2024ChestItem" }
    },
    ["gifthat_may_2024_exposed_brain"] = {
        ["name"] = "Exposed Brain",
        ["image"] = "rbxassetid://17273023035",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftHat2024ExposedBrain",
        ["tags"] = { "GiftHatMay2024ChestItem" }
    }
}
local v3 = {
    ["name"] = "Venus Flytrap Hat",
    ["image"] = "rbxassetid://17323207087",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2024VenusFlytrapHat",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHat2024VenusFlytrapHatIdle"
    }
}
__set_list(v4, 1, {v5})
v3.static_effects = v4
v2.gifthat_may_2024_venus_flytrap_hat = v3
local v6 = {
    ["name"] = "Dancing Tube Hat",
    ["image"] = "rbxassetid://17323205797",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2024DancingTubeHat",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
local v7 = {}
local v8 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHat2024DancingTubeHatIdle"
    }
}
__set_list(v7, 1, {v8})
v6.static_effects = v7
v2.gifthat_may_2024_dancing_tube_hat = v6
v2.gifthat_may_2024_african_bead_necklace = {
    ["name"] = "African Bead Necklace",
    ["image"] = "rbxassetid://17323279638",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftHat2024AfricanBeadNecklace",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_chinese_tea_tray = {
    ["name"] = "Chinese Tea Tray",
    ["image"] = "rbxassetid://17323327970",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2024ChineseTeaTray",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_doggy_door_face = {
    ["name"] = "Doggy Door Face",
    ["image"] = "rbxassetid://17323517962",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2024DoggyDoorFace",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_viking_helmet = {
    ["name"] = "Viking Helmet",
    ["image"] = "rbxassetid://17333790925",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2024VikingHelmet",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
local v9 = {
    ["name"] = "Ferris Wheel Hat",
    ["image"] = "rbxassetid://17333854854",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2024FerrisWheelHat",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
local v10 = {}
local v11 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHat2024FerrisWheelHatIdle"
    }
}
__set_list(v10, 1, {v11})
v9.static_effects = v10
v2.gifthat_may_2024_ferris_wheel_hat = v9
v2.gifthat_may_2024_brick_pile = {
    ["name"] = "Brick Pile",
    ["image"] = "rbxassetid://17333900010",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2024BrickPile",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_sheriffs_badge = {
    ["name"] = "Sheriff\'s Badge",
    ["image"] = "rbxassetid://17333987686",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "GiftHat2024SheriffsBadge",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_angry_eyebrows = {
    ["name"] = "Angry Eyebrows",
    ["image"] = "rbxassetid://17334078774",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHat2024AngryEyebrows",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_viking_beard = {
    ["name"] = "Viking Beard",
    ["image"] = "rbxassetid://17334133352",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHat2024VikingBeard",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_silly_duck_hat = {
    ["name"] = "Silly Duck Hat",
    ["image"] = "rbxassetid://17334176400",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2024SillyDuckHat",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
local v12 = {
    ["name"] = "Steampunk Clock Hat",
    ["image"] = "rbxassetid://17334285866",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2024SteampunkClockHat",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
local v13 = {}
local v14 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHat2024SteampunkClockHatIdle"
    }
}
__set_list(v13, 1, {v14})
v12.static_effects = v13
v2.gifthat_may_2024_steampunk_clock_hat = v12
v2.gifthat_may_2024_half_skirt = {
    ["name"] = "Half Skirt",
    ["image"] = "rbxassetid://17334309931",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2024HalfSkirt",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_monstera_plant_pot = {
    ["name"] = "Monstera Plant Pot",
    ["image"] = "rbxassetid://17334324065",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2024MonsteraPlantPot",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_cd_stack = {
    ["name"] = "CD Stack",
    ["image"] = "rbxassetid://17334345208",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2024CDStack",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_human_feet_shoes = {
    ["name"] = "Human Feet Shoes",
    ["image"] = "rbxassetid://17338247916",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHat2024HumanFeetShoes",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_long_fringe = {
    ["name"] = "Long Bangs",
    ["image"] = "rbxassetid://17338366562",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2024LongFringe",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_castle_tower = {
    ["name"] = "Castle Tower",
    ["image"] = "rbxassetid://17354982813",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2024CastleTower",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_fossil_isle_pickaxe = {
    ["name"] = "Fossil Isle Pickaxe",
    ["image"] = "rbxassetid://17354997385",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2024FossilIslePickaxe",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_bucket_shoes = {
    ["name"] = "Bucket Shoes",
    ["image"] = "rbxassetid://17355012145",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHat2024BucketShoes",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_duck_feet = {
    ["name"] = "Duck Feet",
    ["image"] = "rbxassetid://17355039276",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHat2024DuckFeet",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_snack_and_beverage_carrier = {
    ["name"] = "Snack and Beverage Carrier",
    ["image"] = "rbxassetid://17355096219",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "GiftHat2024SnackAndBeverageCarrier",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_springy_heart = {
    ["name"] = "Springy Heart",
    ["image"] = "rbxassetid://17355112187",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "GiftHat2024SpringyHeart",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_chest_monster = {
    ["name"] = "Chest Monster",
    ["image"] = "rbxassetid://17355126352",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "GiftHat2024ChestMonster",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_solar_system_necklace = {
    ["name"] = "Solar System Necklace",
    ["image"] = "rbxassetid://17355139006",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftHat202SolarSystemNecklace",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_walrus_tusks = {
    ["name"] = "Walrus Tusks",
    ["image"] = "rbxassetid://17355157179",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHat2024WalrusTusks",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_unfortunate_eyelashes = {
    ["name"] = "Unfortunate Eyelashes",
    ["image"] = "rbxassetid://17355175210",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHat2024UnfortunateEyelashes",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_nose_goop = {
    ["name"] = "Nose Goop",
    ["image"] = "rbxassetid://17355186365",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHat2024NoseGoop",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
v2.gifthat_may_2024_honey_bee_collar = {
    ["name"] = "Honey Bee Collar",
    ["image"] = "rbxassetid://17355201499",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftHat2024HoneyBeeCollar",
    ["tags"] = { "GiftHatMay2024ChestItem" }
}
return v1(v2)