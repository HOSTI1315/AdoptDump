--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatNovember2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {}
local v3 = {
    ["name"] = "Kraken Hat",
    ["image"] = "rbxassetid://99439955624402",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024KrakenHat",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHatNov2024KrakenHatIdle"
    }
}
__set_list(v4, 1, {v5})
v3.static_effects = v4
v2.gifthat_november_2024_kraken_hat = v3
local v6 = {
    ["name"] = "Nature\'s Crown",
    ["image"] = "rbxassetid://84953101527317",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024NaturesCrown",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
local v7 = {}
local v8 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHatNov2024NaturesCrownIdle"
    }
}
__set_list(v7, 1, {v8})
v6.static_effects = v7
v2.gifthat_november_2024_natures_crown = v6
local v9 = {
    ["name"] = "Fishbowl Hat",
    ["image"] = "rbxassetid://119342780779828",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024FishbowlHat",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
local v10 = {}
local v11 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GiftHatNov2024FishbowlHatIdle"
    }
}
__set_list(v10, 1, {v11})
v9.static_effects = v10
v2.gifthat_november_2024_fishbowl_hat = v9
v2.gifthat_november_2024_rocket_ship_hat = {
    ["name"] = "Rocket Ship Hat",
    ["image"] = "rbxassetid://97776469811340",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024RocketShipHat",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_balloon_flower_hat = {
    ["name"] = "Balloon Flower Hat",
    ["image"] = "rbxassetid://116589324843330",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024BalloonFlowerHat",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_cactus_bat = {
    ["name"] = "Cactus Bat",
    ["image"] = "rbxassetid://139450983800168",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHatNov2024CactusBat",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_flower_drop_earrings = {
    ["name"] = "Flower Drop Earrings",
    ["image"] = "rbxassetid://126699424662711",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["equip_type"] = "earrings",
    ["model_handle"] = "GiftHatNov2024FlowerDropEarrings",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_gothic_necklace = {
    ["name"] = "Gothic Necklace",
    ["image"] = "rbxassetid://94172390320898",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftHatNov2024GothicNecklace",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_microphone = {
    ["name"] = "Microphone",
    ["image"] = "rbxassetid://96376333666236",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "GiftHatNov2024Microphone",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_radish_friend = {
    ["name"] = "Radish Friend",
    ["image"] = "rbxassetid://86627559614561",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024RadishFriend",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_shooting_star_glasses = {
    ["name"] = "Shooting Star Glasses",
    ["image"] = "rbxassetid://77789452407181",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHatNov2024ShootingStarGlasses",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_star_hoodie = {
    ["name"] = "Star Hoodie",
    ["image"] = "rbxassetid://70377817844130",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024StarHoodie",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_orange_hat = {
    ["name"] = "Orange Hat",
    ["image"] = "rbxassetid://116822003695851",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024OrangeHat",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_ice_cream_heels = {
    ["name"] = "Ice Cream Heels",
    ["image"] = "rbxassetid://109786508830895",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHatNov2024IceCreamHeels",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_strawberry_shortcake_bat_dragon_backpack = {
    ["name"] = "Strawberry Shortcake Bat Dragon Backpack",
    ["image"] = "rbxassetid://74312838483771",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHatNov2024StrawberryShortcakeBatDragonBackpack",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_dog_backpack = {
    ["name"] = "Dog Backpack",
    ["image"] = "rbxassetid://122315783140602",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHatNov2024DogBackpack",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_sky_wings = {
    ["name"] = "Sky Wings",
    ["image"] = "rbxassetid://70880419909582",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHatNov2024SkyWings",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_bush_backpack = {
    ["name"] = "Bush Backpack",
    ["image"] = "rbxassetid://134121995862317",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHatNov2024BushBackpack",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_constellation_cape = {
    ["name"] = "Constellation Cape",
    ["image"] = "rbxassetid://112681740531605",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "GiftHatNov2024ConstellationCape",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_mystic_wing_crown = {
    ["name"] = "Mystic Wing Crown",
    ["image"] = "rbxassetid://137145239086515",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024MysticWingCrown",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_fortune_teller_hood = {
    ["name"] = "Fortune Teller Hood",
    ["image"] = "rbxassetid://112895629516349",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024FortuneTellerHood",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_jailers_keys = {
    ["name"] = "Jailer\'s Keys",
    ["image"] = "rbxassetid://74890761495620",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "GiftHatNov2024JailersKeys",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_love_letter = {
    ["name"] = "Love Letter",
    ["image"] = "rbxassetid://99452904317587",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "GiftHatNov2024LoveLetter",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_raven_collar = {
    ["name"] = "Raven Collar",
    ["image"] = "rbxassetid://75119349835856",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftHatNov2024RavenCollar",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_raven_hood = {
    ["name"] = "Raven Hood",
    ["image"] = "rbxassetid://111569475496107",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024RavenHood",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_steel_toe_heel = {
    ["name"] = "Steel Toe Heel",
    ["image"] = "rbxassetid://78440323431524",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHatNov2024SteelToeHeel",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_stylish_neckerchief = {
    ["name"] = "Stylish Neckerchief",
    ["image"] = "rbxassetid://129117148948477",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "GiftHatNov2024StylishNeckerchief",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_butterfly_headphones = {
    ["name"] = "Butterfly Headphones",
    ["image"] = "rbxassetid://82130621481260",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024ButterflyHeadphones",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_tv_hood = {
    ["name"] = "TV Hood",
    ["image"] = "rbxassetid://138131238833309",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024TVHood",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_heart_eyepatch = {
    ["name"] = "Heart Eyepatch",
    ["image"] = "rbxassetid://103638794600750",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHatNov2024HeartEyepatch",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_cherry_blossom_glasses = {
    ["name"] = "Cherry Blossom Glasses",
    ["image"] = "rbxassetid://105588976767567",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "GiftHatNov2024CherryBlossomGlasses",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_ponytail = {
    ["name"] = "Ponytail",
    ["image"] = "rbxassetid://96535079316136",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GiftHatNov2024Ponytail",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_flower_scarf = {
    ["name"] = "Flower Scarf",
    ["image"] = "rbxassetid://71863723765711",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "GiftHatNov2024FlowerScarf",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_bow_shoes = {
    ["name"] = "Bow Shoes",
    ["image"] = "rbxassetid://134378128233330",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHatNov2024BowShoes",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_watermelon_shoes = {
    ["name"] = "Watermelon Shoes",
    ["image"] = "rbxassetid://84147603083852",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "GiftHatNov2024WatermelonShoes",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
v2.gifthat_november_2024_grape_earrings = {
    ["name"] = "Grape Earrings",
    ["image"] = "rbxassetid://99084786961369",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["equip_type"] = "earrings",
    ["model_handle"] = "GiftHatNov2024GrapeEarrings",
    ["tags"] = { "GiftHatNov2024ChestItem" }
}
return v1(v2)