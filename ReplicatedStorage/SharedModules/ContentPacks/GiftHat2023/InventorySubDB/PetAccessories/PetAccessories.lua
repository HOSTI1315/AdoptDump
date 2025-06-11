--// ReplicatedStorage.SharedModules.ContentPacks.GiftHat2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {
    ["gifthat_2023_balloon_dog"] = {
        ["name"] = "Balloon Dog",
        ["image"] = "rbxassetid://13071036718",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftHat2023BalloonDog",
        ["tags"] = { "GiftHat2023ChestItem" }
    },
    ["gifthat_2023_bell_flower_hat"] = {
        ["name"] = "Bell Flower Hat",
        ["image"] = "rbxassetid://13071022519",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftHat2023BellFlowerHat",
        ["tags"] = { "GiftHat2023ChestItem" }
    },
    ["gifthat_2023_bone_booties"] = {
        ["name"] = "Bone Booties",
        ["image"] = "rbxassetid://13079490334",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "GiftHat2023BoneBooties",
        ["tags"] = { "GiftHat2023ChestItem" }
    },
    ["gifthat_2023_bready_necklace"] = {
        ["name"] = "Bready Necklace",
        ["image"] = "rbxassetid://13071000128",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "GiftHat2023BreadyNecklace",
        ["tags"] = { "GiftHat2023ChestItem" }
    },
    ["gifthat_2023_butter_knife"] = {
        ["name"] = "Butter Knife",
        ["image"] = "rbxassetid://13070993341",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftHat2023ButterKnife",
        ["tags"] = { "GiftHat2023ChestItem" }
    },
    ["gifthat_2023_buttoned_front"] = {
        ["name"] = "Buttoned Front",
        ["image"] = "rbxassetid://13071015719",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "GiftHat2023ButtonedFront",
        ["tags"] = { "GiftHat2023ChestItem" }
    },
    ["gifthat_2023_cheese_hat"] = {
        ["name"] = "Cheese Hat",
        ["image"] = "rbxassetid://13071025449",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GiftHat2023CheeseHat",
        ["tags"] = { "GiftHat2023ChestItem" }
    },
    ["gifthat_2023_claw_grabber"] = {
        ["name"] = "Claw Grabber",
        ["image"] = "rbxassetid://13071041497",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GiftHat2023ClawGrabber",
        ["tags"] = { "GiftHat2023ChestItem" }
    }
}
local v3 = {
    ["name"] = "Copter Cap",
    ["image"] = "rbxassetid://13078246348",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023CopterCap"
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHat2023CopterCapSpin"
    }
}
__set_list(v4, 1, {v5})
v3.static_effects = v4
v3.tags = { "GiftHat2023ChestItem" }
v2.gifthat_2023_copter_cap = v3
v2.gifthat_2023_cyborg_eye = {
    ["name"] = "Cyborg Eye",
    ["image"] = "rbxassetid://13070991434",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHat2023CyborgEye",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_dino_hood = {
    ["name"] = "Dino Hood",
    ["image"] = "rbxassetid://13071020236",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023DinoHood",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_fancy_footwear = {
    ["name"] = "Fancy Footwear",
    ["image"] = "rbxassetid://13079488913",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHat2023FancyFootwear",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_fire_axe = {
    ["name"] = "Fire Axe",
    ["image"] = "rbxassetid://13071047157",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2023FireAxe",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_fire_hydrant = {
    ["name"] = "Fire Hydrant",
    ["image"] = "rbxassetid://13071045895",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2023FireHydrant",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_flower_cloche = {
    ["name"] = "Flower Cloche",
    ["image"] = "rbxassetid://13071035710",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023FlowerCloche",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_flower_heels = {
    ["name"] = "Flower Heels",
    ["image"] = "rbxassetid://13079488177",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHat2023FlowerHeels",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_flower_lapel = {
    ["name"] = "Flower Lapel",
    ["image"] = "rbxassetid://13071004701",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "GiftHat2023FlowerLapel",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_football_helmet = {
    ["name"] = "Football Helmet",
    ["image"] = "rbxassetid://13071019432",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023FootballHelmet",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_formal_big_bow_hat = {
    ["name"] = "Formal Big Bow Hat",
    ["image"] = "rbxassetid://13071034874",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023FormalBigBowHat",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_fox_eared_beret = {
    ["name"] = "Fox Ear Beret",
    ["image"] = "rbxassetid://13071033516",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023FoxEaredBeret",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_gemstone_band = {
    ["name"] = "Gemstone Band",
    ["image"] = "rbxassetid://13070999163",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftHat2023GemstoneBand",
    ["tags"] = { "GiftHat2023ChestItem" }
}
local v6 = {
    ["name"] = "Golden Hair",
    ["image"] = "rbxassetid://13078249179",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023GoldenHair"
}
local v7 = {}
local v8 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHat2023GoldenHairIdle"
    }
}
__set_list(v7, 1, {v8})
v6.static_effects = v7
v6.tags = { "GiftHat2023ChestItem" }
v2.gifthat_2023_golden_hair = v6
v2.gifthat_2023_heavy_anvil = {
    ["name"] = "Heavy Anvil",
    ["image"] = "rbxassetid://13071039483",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2023HeavyAnvil",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_living_wizard_hat = {
    ["name"] = "Living Wizard Hat",
    ["image"] = "rbxassetid://13071017021",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023LivingWizardHat",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_mailbox_hat = {
    ["name"] = "Mailbox Hat",
    ["image"] = "rbxassetid://13071024125",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023MailboxHat",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_nap_mask = {
    ["name"] = "Nap Mask",
    ["image"] = "rbxassetid://13070990049",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHat2023NapMask",
    ["tags"] = { "GiftHat2023ChestItem" }
}
local v9 = {
    ["name"] = "Personal Controller",
    ["image"] = "rbxassetid://13078246756",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023PersonalController"
}
local v10 = {}
local v11 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHat2023PersonalControllerIdle"
    }
}
__set_list(v10, 1, {v11})
v9.static_effects = v10
v9.tags = { "GiftHat2023ChestItem" }
v2.gifthat_2023_personal_controller = v9
v2.gifthat_2023_plunger_hat = {
    ["name"] = "Plunger Hat",
    ["image"] = "rbxassetid://13071026354",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023PlungerHat",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_potion_necklace = {
    ["name"] = "Potion Necklace",
    ["image"] = "rbxassetid://13071003714",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftHat2023PotionNecklace",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_regal_collar = {
    ["name"] = "Regal Collar",
    ["image"] = "rbxassetid://13071009226",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "GiftHat2023RegalCollar",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_robotic_runners = {
    ["name"] = "Robotic Runners",
    ["image"] = "rbxassetid://13079492629",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHat2023RoboticRunners",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_safety_scissors = {
    ["name"] = "Safety Scissors",
    ["image"] = "rbxassetid://13071049284",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2023SafetyScissors",
    ["tags"] = { "GiftHat2023ChestItem" }
}
local v12 = {
    ["name"] = "Satellite Spinner",
    ["image"] = "rbxassetid://13078247838",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023SatelliteSpinner"
}
local v13 = {}
local v14 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHat2023SatelliteSpinnerSpin"
    }
}
__set_list(v13, 1, {v14})
v12.static_effects = v13
v12.tags = { "GiftHat2023ChestItem" }
v2.gifthat_2023_satellite_spinner = v12
v2.gifthat_2023_spray_can = {
    ["name"] = "Spray Can",
    ["image"] = "rbxassetid://13071006805",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "GiftHat2023SprayCan",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_sticky_stick = {
    ["name"] = "Sticky Stick",
    ["image"] = "rbxassetid://13071048393",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2023StickyStick",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_thimble_cap = {
    ["name"] = "Thimble Cap",
    ["image"] = "rbxassetid://13071021002",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023ThimbleCap",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_triangle_shades = {
    ["name"] = "Triangle Shades",
    ["image"] = "rbxassetid://13070988912",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHat2023TriangleShades",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_two_toned_fedora = {
    ["name"] = "Two-toned Fedora",
    ["image"] = "rbxassetid://13071050060",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHat2023TwoTonedFedora",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_water_can = {
    ["name"] = "Water Can",
    ["image"] = "rbxassetid://13071038260",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHat2023WaterCan",
    ["tags"] = { "GiftHat2023ChestItem" }
}
v2.gifthat_2023_winged_medal = {
    ["name"] = "Winged Medal",
    ["image"] = "rbxassetid://13071012371",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "GiftHat2023WingedMedal",
    ["tags"] = { "GiftHat2023ChestItem" }
}
return v1(v2)