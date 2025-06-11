--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Airplane Propeller",
    ["image"] = "rbxassetid://4361544852",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "AirplanePropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "PropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.airplane_propeller = v3
local v4 = {
    ["name"] = "Amber Bone",
    ["image"] = "rbxassetid://5725939343",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "AmberBone",
    ["tool"] = "ThrowToyTool"
}
v2.amber_bone = v4
local v5 = {
    ["name"] = "Ammonite Flying Disc",
    ["image"] = "rbxassetid://5725939479",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "AmmoniteFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.ammonite_frisbee = v5
local v6 = {
    ["name"] = "Angelic Propeller",
    ["image"] = "rbxassetid://4797806115",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "AngelicPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "PetFlyingWingFlap",
    ["tool"] = "PropellerTool"
}
v2.angelic_propeller = v6
local v7 = {
    ["name"] = "Anna Rattle",
    ["image"] = "rbxassetid://2657671618",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "AnnaRattle",
    ["tool"] = "GenericTool"
}
v2.anna_rattle = v7
local v8 = {
    ["name"] = "Antler Chew Toy",
    ["image"] = "rbxassetid://4470748580",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "AntlerChewToy",
    ["tool"] = "ChewToyTool"
}
v2.antler_chew_toy = v8
local v9 = {
    ["name"] = "Armchair Float",
    ["image"] = "rbxassetid://6475613197",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "MassiveGiftHold"
    },
    ["floats"] = true,
    ["forward_drop_offset"] = 7,
    ["model_handle"] = "ArmchairFloat",
    ["tool"] = "FloatTool"
}
v2.armchair_float = v9
local v10 = {
    ["name"] = "Astro Ball",
    ["image"] = "rbxassetid://4712355837",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1200,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "AstroBall",
    ["tool"] = "SqueakyToyTool"
}
v2.astro_ball = v10
local v11 = {
    ["name"] = "Axe Rattle",
    ["image"] = "rbxassetid://4115251996",
    ["rarity"] = "uncommon",
    ["currency_id"] = "candy_2019",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "AxeRattle",
    ["tool"] = "GenericTool"
}
v2.axe_rattle = v11
local v12 = {
    ["name"] = "Balloon",
    ["image"] = "rbxassetid://2657667102",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Balloon",
    ["tool"] = "BalloonTool"
}
v2.balloon = v12
local v13 = {
    ["name"] = "Balloons",
    ["image"] = "rbxassetid://3009779116",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Balloons",
    ["tool"] = "BalloonTool"
}
v2.balloons = v13
local v14 = {
    ["name"] = "Banana Plush",
    ["image"] = "rbxassetid://3009779170",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "BananaPlush",
    ["tool"] = "GenericTool"
}
v2.banana_plush = v14
local v15 = {
    ["name"] = "Banana Pogo",
    ["image"] = "rbxassetid://3009779233",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "BananaPogo",
    ["tool"] = "PogoTool"
}
v2.banana_pogo = v15
local v16 = {
    ["name"] = "Banjo",
    ["image"] = "rbxassetid://4115248143",
    ["rarity"] = "uncommon",
    ["currency_id"] = "candy_2019",
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "GuitarPlay"
    },
    ["model_handle"] = "Banjo",
    ["sounds"] = {
        "Banjo1",
        "Banjo2",
        "Banjo3",
        "Banjo4",
        "Banjo5",
        "Banjo6"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.banjo = v16
local v17 = {
    ["name"] = "Bauble Balloon",
    ["image"] = "rbxassetid://4470749845",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "BaubleBalloon",
    ["tool"] = "BalloonTool"
}
v2.bauble_balloon = v17
local v18 = {
    ["name"] = "BEES! Blaster",
    ["image"] = "rbxassetid://6959275268",
    ["rarity"] = "legendary",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "UnicornPlushHug"
    },
    ["food_is_collectable"] = true,
    ["food_kind"] = "honey_candy",
    ["model_handle"] = "BeesBlaster",
    ["tool"] = "FoodCannonTool"
}
v2.bees_blaster = v18
local v19 = {
    ["name"] = "Creator Rattle (Bethink)",
    ["image"] = "rbxassetid://2408035748",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "BethinkRattle",
    ["tool"] = "GenericTool"
}
v2.bethink_rattle = v19
local v20 = {
    ["name"] = "Bone Throw Toy",
    ["image"] = "rbxassetid://3454110025",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "BoneThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.bone_throw_toy = v20
local v21 = {
    ["name"] = "Bone Xylophone",
    ["image"] = "rbxassetid://5725939682",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "SteelDrumPlay"
    },
    ["model_handle"] = "BoneXylophone",
    ["sounds"] = { "SteelDrum1", "SteelDrum2", "SteelDrum3" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.bone_xylophone = v21
local v22 = {
    ["name"] = "Bongos",
    ["image"] = "rbxassetid://3060778092",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["anims"] = {
        ["hold"] = "BongosHold",
        ["use"] = "BongosHit"
    },
    ["model_handle"] = "Bongos",
    ["sounds"] = {
        "Bongos1",
        "Bongos2",
        "Bongos3",
        "Bongos4"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.bongos = v22
local v23 = {
    ["name"] = "Boomerang Throw Toy",
    ["image"] = "rbxassetid://4361546132",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "BoomerangThrowToy",
    ["tool"] = "FlyingDiscTool"
}
v2.boomerang_throw_toy = v23
local v24 = {
    ["name"] = "Briefcase Ingredient",
    ["image"] = "rbxassetid://5061468615",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CoffeeHold"
    },
    ["model_handle"] = "BriefcaseIngredient",
    ["tool"] = "ThrowToyTool"
}
v2.briefcase_ingredient = v24
local v25 = {
    ["name"] = "Bubblegum Machine Rattle",
    ["image"] = "rbxassetid://3486907018",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "BubbleGumMachineRattle",
    ["tool"] = "GenericTool"
}
v2.bubblegum_machine_rattle = v25
local v26 = {
    ["name"] = "Bunny Plush",
    ["image"] = "rbxassetid://3082046064",
    ["rarity"] = "uncommon",
    ["currency_id"] = "eggs",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "BunnyPlush",
    ["tool"] = "GenericTool"
}
v2.bunny_plush = v26
local v27 = {
    ["name"] = "Burger Balloon",
    ["image"] = "rbxassetid://6475616306",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "BurgerBalloon",
    ["tool"] = "BalloonTool"
}
v2.burger_balloon = v27
local v28 = {
    ["name"] = "Candle",
    ["image"] = "rbxassetid://4470749083",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Candle",
    ["tool"] = "GenericTool"
}
v2.candle = v28
local v29 = {
    ["name"] = "Candy Cane Chew Toy",
    ["image"] = "rbxassetid://6061513338",
    ["rarity"] = "uncommon",
    ["cost"] = 240,
    ["currency_id"] = "gingerbread_2020",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "CandyCaneChewToy",
    ["tool"] = "ChewToyTool"
}
v2.candy_cane_chew_toy = v29
local v30 = {
    ["name"] = "Candy Cane Ornament",
    ["image"] = "rbxassetid://4508188681",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "CandyCaneOrnament",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true
}
v2.candy_cane_ornament = v30
local v31 = {
    ["name"] = "Candy Cane Pogo Stick",
    ["image"] = "rbxassetid://4470750543",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "CandyCanePogo",
    ["tool"] = "PogoTool"
}
v2.candy_cane_pogo = v31
local v32 = {
    ["name"] = "Candy Cane Throw Toy",
    ["image"] = "rbxassetid://4470750374",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "CandyCaneThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.candy_cane_throw_toy = v32
local v33 = {
    ["name"] = "Candy Cannon",
    ["image"] = "rbxassetid://6710107927",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "UnicornPlushHug"
    },
    ["food_is_collectable"] = true,
    ["food_kind"] = "candy_corn",
    ["model_handle"] = "CandyCannon",
    ["tool"] = "FoodCannonTool"
}
v2.candy_cannon = v33
local v34 = {
    ["name"] = "Carrot Rattle",
    ["image"] = "rbxassetid://3082046250",
    ["rarity"] = "uncommon",
    ["currency_id"] = "eggs",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "CarrotRattle",
    ["tool"] = "GenericTool"
}
v2.carrot_rattle = v34
local v35 = {
    ["name"] = "Cat Plush",
    ["image"] = "rbxassetid://2408035756",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "CatPlush",
    ["tool"] = "GenericTool"
}
v2.cat_plush = v35
local v36 = {
    ["name"] = "Caticorn Rattle",
    ["image"] = "rbxassetid://3009779289",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "CaticornRattle",
    ["tool"] = "GenericTool"
}
v2.caticorn_rattle = v36
local v37 = {
    ["name"] = "Celestial Leash",
    ["image"] = "rbxassetid://6475613129",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "Leash",
    ["model_handle"] = "CelestialLeash",
    ["tool"] = "PetLeash"
}
v2.celestial_leash = v37
local v38 = {
    ["name"] = "Check",
    ["image"] = "rbxassetid://1289898077",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "CheckHold"
    },
    ["model_handle"] = "Check",
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.check = v38
local v39 = {
    ["name"] = "Chew Ball",
    ["image"] = "rbxassetid://3486903287",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "ChewBall",
    ["tool"] = "ChewToyTool"
}
v2.chew_ball = v39
local v40 = {
    ["name"] = "Chick Plush",
    ["image"] = "rbxassetid://3082047003",
    ["rarity"] = "rare",
    ["currency_id"] = "eggs",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "ChickPlush",
    ["tool"] = "GenericTool"
}
v2.chick_plush = v40
local v41 = {
    ["name"] = "Chinese Lantern",
    ["image"] = "rbxassetid://1421665361",
    ["rarity"] = "uncommon",
    ["cost"] = 195,
    ["anims"] = {
        ["hold"] = "LanternHold"
    },
    ["model_handle"] = "ChineseLantern",
    ["tool"] = "ChineseLanternTool"
}
v2.chineselantern = v41
local v42 = {
    ["name"] = "Chocolate Bunny Balloon",
    ["image"] = "rbxassetid://3082046215",
    ["rarity"] = "rare",
    ["currency_id"] = "eggs",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "ChocolateBunnyBalloon",
    ["tool"] = "BalloonTool"
}
v2.chocolate_bunny_balloon = v42
local v43 = {
    ["name"] = "Christmas Cat Rattle",
    ["image"] = "rbxassetid://1257271764",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "ChristmasCatRattle" },
    ["model_handle"] = "ChristmasCatRattle",
    ["tool"] = "GenericTool"
}
v2.christmas_cat_rattle = v43
local v44 = {
    ["name"] = "Christmas Doge Rattle",
    ["image"] = "rbxassetid://1257273388",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "ChristmasDogeRattle" },
    ["model_handle"] = "ChristmasDogeRattle",
    ["tool"] = "GenericTool"
}
v2.christmas_doge_rattle = v44
local v45 = {
    ["name"] = "Christmas Ornament",
    ["image"] = "rbxassetid://4508188751",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "ChristmasOrnament",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true
}
v2.christmas_ornament = v45
local v46 = {
    ["name"] = "Christmas Star Flying Disc",
    ["image"] = "rbxassetid://4470748521",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "ChristmasStarFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.christmas_star_frisbee = v46
local v47 = {
    ["name"] = "Claw",
    ["image"] = "rbxassetid://5725939788",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Claw",
    ["tool"] = "ThrowToyTool"
}
v2.claw = v47
local v48 = {
    ["name"] = "Clown Umbrella",
    ["image"] = "rbxassetid://5057099300",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "ClownUmbrella",
    ["tool"] = "BalloonTool"
}
v2.clown_umbrella = v48
local v49 = {
    ["name"] = "Controller Balloon",
    ["image"] = "rbxassetid://6475616155",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "ControllerBalloon",
    ["tool"] = "BalloonTool"
}
v2.controller_balloon = v49
local v50 = {
    ["name"] = "Cookie Dough Plush",
    ["image"] = "rbxassetid://4470749153",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "CookieDoughPlush",
    ["tool"] = "GenericTool"
}
v2.cookie_dough_plush = v50
local v51 = {
    ["name"] = "Cookie Flying Disc",
    ["image"] = "rbxassetid://3486904466",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "CookieFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.cookie_frisbee = v51
local v52 = {
    ["name"] = "Cool Flying Disc",
    ["image"] = "rbxassetid://4710374742",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "CoolFlyingDisc",
    ["tool"] = "SqueakyToyTool"
}
v2.cool_frisbee = v52
local v53 = {
    ["name"] = "Creepy Balloon",
    ["image"] = "rbxassetid://4115248463",
    ["rarity"] = "common",
    ["currency_id"] = "candy_2019",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "CreepyBalloon",
    ["tool"] = "BalloonTool"
}
v2.creepy_balloon = v53
local v54 = {
    ["name"] = "Croc Plush",
    ["image"] = "rbxassetid://2408035767",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "CrocPlush",
    ["tool"] = "GenericTool"
}
v2.croc_plush = v54
local v55 = {
    ["name"] = "Crossbow Grappling Hook",
    ["image"] = "rbxassetid://4115248599",
    ["rarity"] = "ultra_rare",
    ["currency_id"] = "candy_2019",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "CrossbowGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.crossbow_grappling_hook = v55
local v56 = {
    ["name"] = "Crown Flying Disc",
    ["image"] = "rbxassetid://3486903618",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "CrownFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.crown_frisbee = v56
local v57 = {
    ["name"] = "Crystal Ball Rattle",
    ["image"] = "rbxassetid://5882028296",
    ["rarity"] = "uncommon",
    ["cost"] = 400,
    ["currency_id"] = "candy_2020",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "CrystalBallRattle",
    ["tool"] = "GenericTool"
}
v2.crystal_ball_rattle = v57
local v58 = {
    ["name"] = "Cymbal Ingredient",
    ["image"] = "rbxassetid://5061468734",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "CymbalIngredient",
    ["tool"] = "ThrowToyTool"
}
v2.cymbal_ingredient = v58
local v59 = {
    ["name"] = "Dandelion Propeller",
    ["image"] = "rbxassetid://4822522594",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "DandelionPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "DandelionSpin",
    ["tool"] = "PropellerTool"
}
v2.dandelion_propeller = v59
local v60 = {
    ["name"] = "Da Vinci Propeller",
    ["image"] = "rbxassetid://4797806300",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "DavinciPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "DavinciPropeller",
    ["tool"] = "PropellerTool"
}
v2.davinci_propeller = v60
local v61 = {
    ["name"] = "Reindeer Plush",
    ["image"] = "rbxassetid://2657667105",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "DeerPlush",
    ["tool"] = "GenericTool"
}
v2.deer_plush = v61
local v62 = {
    ["name"] = "Didgeridoo",
    ["image"] = "rbxassetid://4797806584",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "DidgeridooHold",
        ["use"] = "DidgeridooPlay"
    },
    ["model_handle"] = "Didgeridoo",
    ["sounds"] = { "Didgeridoo1", "Didgeridoo2", "Didgeridoo3" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.didgeridoo = v62
local v63 = {
    ["name"] = "Fossil",
    ["image"] = "rbxassetid://5722400465",
    ["rarity"] = "rare",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "DigsiteFossil",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true,
    ["tool"] = "GenericTool"
}
v2.digsite_fossil = v63
local v64 = {
    ["name"] = "Discosplosion",
    ["image"] = "rbxassetid://4712427233",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "DiscoSplosion",
    ["tool"] = "Discosplosion"
}
v2.disco_splosion = v64
local v65 = {
    ["name"] = "Rubber Dog Balloon",
    ["image"] = "rbxassetid://4361546823",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "RubberDogBalloon",
    ["tool"] = "BalloonTool"
}
v2.dog_balloon = v65
local v66 = {
    ["name"] = "Dog Food Flying Disc",
    ["image"] = "rbxassetid://3486903887",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "DogFoodFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.dog_food_frisbee = v66
local v67 = {
    ["name"] = "Dog Leash",
    ["image"] = "rbxassetid://4361545279",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "UnicornLeash",
    ["model_handle"] = "DogLeash",
    ["tool"] = "PetLeash"
}
v2.dog_leash = v67
local v68 = {
    ["name"] = "Doge Rattle",
    ["image"] = "rbxassetid://1034712972",
    ["rarity"] = "common",
    ["cost"] = 175,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "DogeRattle" },
    ["model_handle"] = "DogeRattle",
    ["tool"] = "GenericTool"
}
v2.dogerattle = v68
local v69 = {
    ["name"] = "Donut Flying Disc",
    ["image"] = "rbxassetid://3486905087",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "DonutFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.donut_frisbee = v69
local v70 = {
    ["name"] = "Donut Rattle",
    ["image"] = "rbxassetid://3009779323",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "DonutRattle",
    ["tool"] = "GenericTool"
}
v2.donut_rattle = v70
local v71 = {
    ["name"] = "Donut Throw Toy",
    ["image"] = "rbxassetid://3454109877",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "DonutThrowToy",
    ["tool"] = "FlyingDiscTool"
}
v2.donut_throw_toy = v71
local v72 = {
    ["name"] = "Dragon Balloon",
    ["image"] = "rbxassetid://3486907555",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "DragonBalloon",
    ["tool"] = "BalloonTool"
}
v2.dragon_balloon = v72
local v73 = {
    ["name"] = "Drone Propeller",
    ["image"] = "rbxassetid://4797806638",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "DronePropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "QuadPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.drone_propeller = v73
local v74 = {
    ["name"] = "Duck Balloon",
    ["image"] = "rbxassetid://3009779349",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "DuckBalloon",
    ["tool"] = "BalloonTool"
}
v2.duck_balloon = v74
local v75 = {
    ["name"] = "Duck Rattle",
    ["image"] = "rbxassetid://1034712977",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "DuckRattle" },
    ["model_handle"] = "DuckRattle",
    ["tool"] = "GenericTool"
}
v2.duckrattle = v75
local v76 = {
    ["name"] = "Dumbbell",
    ["image"] = "rbxassetid://1230188147",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "DumbbellHold",
        ["use"] = "DumbbellUse"
    },
    ["model_handle"] = "Dumbbell",
    ["temporary"] = true,
    ["tool"] = "GenericTool"
}
v2.dumbbell = v76
local v77 = {
    ["name"] = "Easter Bunny Plush",
    ["image"] = "rbxassetid://3082046102",
    ["rarity"] = "rare",
    ["currency_id"] = "eggs",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "EasterBunnyPlush",
    ["tool"] = "GenericTool"
}
v2.easter_bunny_plush = v77
local v78 = {
    ["name"] = "Egg Rattle",
    ["image"] = "rbxassetid://1555803323",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "EggRattle" },
    ["model_handle"] = "EggRattle",
    ["tool"] = "GenericTool"
}
v2.egg_rattle = v78
local v79 = {
    ["name"] = "Elephant Plush",
    ["image"] = "rbxassetid://2408051109",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "ElephantPlush",
    ["tool"] = "GenericTool"
}
v2.elephant_plush = v79
local v80 = {
    ["name"] = "Elf Ornament",
    ["image"] = "rbxassetid://4508188715",
    ["rarity"] = "rare",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "ElfOrnament",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true
}
v2.elf_ornament = v80
local v81 = {
    ["name"] = "Elf Plush",
    ["image"] = "rbxassetid://4470750254",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "ElfPlush",
    ["tool"] = "GenericTool"
}
v2.elf_plush = v81
local v82 = {
    ["name"] = "Elf Rattle",
    ["image"] = "rbxassetid://2657668953",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "ElfRattle",
    ["tool"] = "GenericTool"
}
v2.elf_rattle = v82
local v83 = {
    ["name"] = "Eyeball Rattle",
    ["image"] = "rbxassetid://5882028408",
    ["rarity"] = "common",
    ["cost"] = 250,
    ["currency_id"] = "candy_2020",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "EyeballRattle",
    ["tool"] = "GenericTool"
}
v2.eyeball_rattle = v83
local v84 = {
    ["name"] = "Fancy Balloon",
    ["image"] = "rbxassetid://2408035763",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "FancyBalloon",
    ["tool"] = "BalloonTool"
}
v2.fancy_balloon = v84
local v85 = {
    ["name"] = "Fancy Umbrella",
    ["image"] = "rbxassetid://2408052395",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "FancyUmbrella",
    ["tool"] = "BalloonTool"
}
v2.fancy_umbrella = v85
local v86 = {
    ["name"] = "Ferris Wheel Propeller",
    ["image"] = "rbxassetid://4115252678",
    ["rarity"] = "rare",
    ["currency_id"] = "candy_2019",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "FerrisPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "FerrisWheelPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.ferris_propeller = v86
local v87 = {
    ["name"] = "Flashlight",
    ["image"] = "rbxassetid://3060778243",
    ["rarity"] = "uncommon",
    ["cost"] = 30,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Flashlight",
    ["tool"] = "FlashlightTool"
}
v2.flashlight = v87
local v88 = {
    ["name"] = "Floatie Raft",
    ["image"] = "rbxassetid://3579315602",
    ["rarity"] = "common",
    ["cost"] = 75,
    ["anims"] = {
        ["hold"] = "MassiveGiftHold"
    },
    ["colorable"] = true,
    ["floats"] = true,
    ["forward_drop_offset"] = 7,
    ["model_handle"] = "FloatieRaft",
    ["tool"] = "FloatTool"
}
v2.floatie_raft = v88
local v89 = {
    ["name"] = "Floaties",
    ["image"] = "rbxassetid://3577151134",
    ["rarity"] = "common",
    ["cost"] = 50,
    ["anims"] = {
        ["hold"] = "RattleHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "Floaties",
    ["tool"] = "GenericTool"
}
v2.floaties = v89
local v90 = {
    ["name"] = "Floppy Bunny Plushie",
    ["image"] = "rbxassetid://6768660003",
    ["rarity"] = "common",
    ["cost"] = 60,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["colorable"] = true,
    ["model_handle"] = "FloppyBunnyPlush",
    ["tool"] = "GenericTool"
}
v2.floppy_bunny_plush = v90
local v91 = {
    ["name"] = "Flower Flying Disc",
    ["image"] = "rbxassetid://4825933147",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "FlowerFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.flower_frisbee = v91
local v92 = {
    ["name"] = "Flower Rattle",
    ["image"] = "rbxassetid://3009779377",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "FlowerRattle",
    ["tool"] = "GenericTool"
}
v2.flower_rattle = v92
local v93 = {
    ["name"] = "Flying Broomstick",
    ["image"] = "rbxassetid://2466291815",
    ["rarity"] = "legendary",
    ["currency_id"] = "candy",
    ["anims"] = {
        ["hold"] = "BroomstickHold",
        ["use"] = "BroomstickUse"
    },
    ["model_handle"] = "Broomstick",
    ["tool"] = "FlyingTool"
}
v2.flying_broomstick = v93
local v94 = {
    ["name"] = "Flying Saucer Disc",
    ["image"] = "rbxassetid://6475609979",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "FlyingSaucerDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.flying_saucer_disc = v94
local v95 = {
    ["name"] = "Football Throw Toy",
    ["image"] = "rbxassetid://3454109803",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "FootballThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.football_throw_toy = v95
local v96 = {
    ["name"] = "Flying Disc",
    ["image"] = "rbxassetid://3454109669",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "FlyingDiscThrowToy",
    ["tool"] = "FlyingDiscTool"
}
v2.frisbee_throw_toy = v96
local v97 = {
    ["name"] = "Flying Disc Umbrella",
    ["image"] = "rbxassetid://3486909045",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "FlyingDiscUmbrella",
    ["tool"] = "BalloonTool"
}
v2.frisbee_umbrella = v97
local v98 = {
    ["name"] = "Frostbite Grapple",
    ["image"] = "rbxassetid://4797806686",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "FrostbiteGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.frostbite_grappling_hook = v98
local v99 = {
    ["name"] = "Fun Flying Disc",
    ["image"] = "rbxassetid://4710374095",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "FunFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.fun_frisbee = v99
local v100 = {
    ["name"] = "Futuristic Grapple",
    ["image"] = "rbxassetid://4797806734",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "FuturisticGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.futuristic_grappling_hook = v100
local v101 = {
    ["name"] = "Gift Throw Toy",
    ["image"] = "rbxassetid://4470749638",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "GiftThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.gift_throw_toy = v101
local v102 = {
    ["name"] = "Glider",
    ["image"] = "rbxassetid://1310513344",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "GliderHold",
        ["use"] = "GliderUse"
    },
    ["model_handle"] = "Glider",
    ["tool"] = "FlyingTool"
}
v2.glider = v102
local v103 = {
    ["name"] = "Glyptoball",
    ["image"] = "rbxassetid://5725939871",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Glyptoball",
    ["tool"] = "ThrowToyTool"
}
v2.glyptoball = v103
local v104 = {
    ["name"] = "Grappling Hook",
    ["image"] = "rbxassetid://3142180004",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2500,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "GrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.grappling_hook = v104
local v105 = {
    ["name"] = "Griffin Propeller",
    ["image"] = "rbxassetid://3486907282",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GriffinPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "PropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.griffin_propeller = v105
local v106 = {
    ["name"] = "Guitar",
    ["image"] = "rbxassetid://3060778299",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "GuitarPlay"
    },
    ["model_handle"] = "Guitar",
    ["sounds"] = {
        "Guitar1",
        "Guitar2",
        "Guitar3",
        "Guitar4",
        "Guitar5",
        "Guitar6"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.guitar_toy = v106
local v107 = {
    ["name"] = "Heart Balloon",
    ["image"] = "rbxassetid://1419098937",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "HeartBalloon",
    ["tool"] = "BalloonTool"
}
v2.heart_balloon = v107
local v108 = {
    ["name"] = "Heart Plushie",
    ["image"] = "rbxassetid://1419099271",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["limit"] = 1,
    ["model_handle"] = "HeartPlushie",
    ["tool"] = "GenericTool"
}
v2.heart_plushie = v108
local v109 = {
    ["name"] = "Heart Rattle",
    ["image"] = "rbxassetid://2848331436",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "HeartRattle",
    ["tool"] = "GenericTool"
}
v2.heart_rattle = v109
local v110 = {
    ["name"] = "Holiday Breadstick Chew Toy",
    ["image"] = "rbxassetid://6061513259",
    ["rarity"] = "uncommon",
    ["cost"] = 400,
    ["currency_id"] = "gingerbread_2020",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "HolidayBreadstickChewToy",
    ["tool"] = "ChewToyTool"
}
v2.holiday_breadstick_chew_toy = v110
local v111 = {
    ["name"] = "Horse Plush",
    ["image"] = "rbxassetid://2657670910",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "HorsePlush",
    ["tool"] = "GenericTool"
}
v2.horse_plush = v111
local v112 = {
    ["name"] = "Hotdog Stand",
    ["image"] = "rbxassetid://3818347838",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "HotdogStand",
    ["placeable_type"] = "refreshment",
    ["tool"] = "PlaceableTool"
}
v2.hotdog_stand = v112
local v113 = {
    ["name"] = "Huggable Pillow",
    ["image"] = "rbxassetid://6475612926",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "HuggablePillow",
    ["tool"] = "GenericTool"
}
v2.huggable_pillow = v113
local v114 = {
    ["name"] = "Hugging Egg",
    ["image"] = "rbxassetid://1555807694",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "HuggingEgg",
    ["tool"] = "GenericTool"
}
v2.hugging_egg = v114
local v115 = {
    ["name"] = "Hypnotic Flying Disc",
    ["image"] = "rbxassetid://5057099667",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "HypnoticFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.hypnotic_frisbee = v115
local v116 = {
    ["name"] = "Ice Club Rattle",
    ["image"] = "rbxassetid://4470749277",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "IceClubRattle",
    ["tool"] = "GenericTool"
}
v2.ice_club_rattle = v116
local v117 = {
    ["name"] = "Ice Cream Plush",
    ["image"] = "rbxassetid://3009779419",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "IceCreamPlush",
    ["tool"] = "GenericTool"
}
v2.ice_cream_plush = v117
local v118 = {
    ["name"] = "Ice Cream Rattle",
    ["image"] = "rbxassetid://4361546643",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "IceCreamRattle",
    ["tool"] = "GenericTool"
}
v2.ice_cream_rattle = v118
local v119 = {
    ["name"] = "Ice Pick Grappling Hook",
    ["image"] = "rbxassetid://4470749342",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "IcePickGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.ice_pick_grappling_hook = v119
local v120 = {
    ["name"] = "Icicle Throw Toy",
    ["image"] = "rbxassetid://4470750043",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "IcicleThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.icicle_throw_toy = v120
local v121 = {
    ["name"] = "Inflatable Sword",
    ["image"] = "rbxassetid://2408052390",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "InflatableSword",
    ["tool"] = "GenericTool"
}
v2.inflatable_sword = v121
local v122 = {
    ["name"] = "Inner Tube",
    ["image"] = "rbxassetid://3579315773",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["anims"] = {
        ["hold"] = "InnerTubeHold"
    },
    ["colorable"] = true,
    ["floats"] = true,
    ["model_handle"] = "InnerTube",
    ["tool"] = "FloatTool"
}
v2.inner_tube = v122
local v123 = {
    ["name"] = "Jackhammer",
    ["image"] = "rbxassetid://2408051119",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Jackhammer",
    ["tool"] = "PogoTool"
}
v2.jackhammer = v123
local v124 = {
    ["name"] = "Kangaroo Pogo",
    ["image"] = "rbxassetid://3486908136",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "KangarooPogo",
    ["tool"] = "PogoTool"
}
v2.kangaroo_pogo = v124
local v125 = {
    ["name"] = "Key Chew Toy",
    ["image"] = "rbxassetid://3977263978",
    ["rarity"] = "uncommon",
    ["cost"] = 350,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "KeyChewToy",
    ["tool"] = "ChewToyTool"
}
v2.key_chew_toy = v125
local v126 = {
    ["name"] = "Lavender Bundle",
    ["image"] = "rbxassetid://4822522509",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "LavenderBundle",
    ["tool"] = "ThrowToyTool"
}
v2.lavender_bundle = v126
local v127 = {
    ["name"] = "Lazy Float",
    ["image"] = "rbxassetid://14131921285",
    ["rarity"] = "common",
    ["cost"] = 75,
    ["anims"] = {
        ["hold"] = "MassiveGiftHold"
    },
    ["colorable"] = true,
    ["floats"] = true,
    ["forward_drop_offset"] = 7,
    ["model_handle"] = "LazyFloat",
    ["tool"] = "FloatTool"
}
v2.lazy_float = v127
local v128 = {
    ["name"] = "Lead Zeppelin Balloon",
    ["image"] = "rbxassetid://4361546959",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "LeadZeppelin",
    ["tool"] = "BalloonTool"
}
v2.lead_zeppelin_balloon = v128
local v129 = {
    ["name"] = "Leash",
    ["image"] = "rbxassetid://3977263740",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["colorable"] = true,
    ["leash_style"] = "Leash",
    ["model_handle"] = "Leash",
    ["tool"] = "PetLeash"
}
v2.leash = v129
local v130 = {
    ["name"] = "Lemonade Stand",
    ["image"] = "rbxassetid://3523677453",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "LemonadeStand",
    ["placeable_type"] = "refreshment",
    ["tool"] = "PlaceableTool"
}
v2.lemonade_stand = v130
local v131 = {
    ["name"] = "Lime Slice Propeller",
    ["image"] = "rbxassetid://6475613071",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "LimeSlicePropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "DandelionSpin",
    ["tool"] = "PropellerTool"
}
v2.lime_slice_propeller = v131
local v132 = {
    ["name"] = "Llama Plush",
    ["image"] = "rbxassetid://2408051107",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "LlamaPlush",
    ["tool"] = "GenericTool"
}
v2.llama_plush = v132
local v133 = {
    ["name"] = "Long Neck Throw Toy",
    ["image"] = "rbxassetid://5725939964",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "LongNeckChewToy",
    ["tool"] = "ThrowToyTool"
}
v2.long_neck_chew_toy = v133
local v134 = {
    ["name"] = "Lunar Pogo",
    ["image"] = "rbxassetid://6240247140",
    ["rarity"] = "rare",
    ["cost"] = 400,
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "LunarPogo",
    ["tool"] = "PogoTool"
}
v2.lunar_pogo = v134
local v135 = {
    ["name"] = "Lunar Rattle",
    ["image"] = "rbxassetid://6245476450",
    ["rarity"] = "uncommon",
    ["cost"] = 150,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "LunarRattle",
    ["tool"] = "GenericTool"
}
v2.lunar_rattle = v135
local v136 = {
    ["name"] = "Magic House Door",
    ["image"] = "rbxassetid://4661940658",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "MagicHouseDoor",
    ["placeable_type"] = "magic_house_door",
    ["tool"] = "PlaceableTool"
}
v2.magic_house_door = v136
local v137 = {
    ["name"] = "Magic Wand Grappling Hook",
    ["image"] = "rbxassetid://6475613001",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "MagicWandGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.magic_wand_grappling_hook = v137
local v138 = {
    ["name"] = "Marsh Balloon",
    ["image"] = "rbxassetid://3009779472",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "MarshBalloon",
    ["tool"] = "BalloonTool"
}
v2.marsh_balloon = v138
local v139 = {
    ["name"] = "Marsh Plush",
    ["image"] = "rbxassetid://3009779496",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "MarshPlush",
    ["tool"] = "GenericTool"
}
v2.marsh_plush = v139
local v140 = {
    ["name"] = "Medieval Grapple",
    ["image"] = "rbxassetid://4797807061",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "MedievalGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.medieval_grappling_hook = v140
local v141 = {
    ["name"] = "Mermaid Float",
    ["image"] = "rbxassetid://3579315658",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["anims"] = {
        ["hold"] = "MassiveGiftHold"
    },
    ["colorable"] = true,
    ["floats"] = true,
    ["forward_drop_offset"] = 7,
    ["model_handle"] = "MermaidFloat",
    ["tool"] = "FloatTool"
}
v2.mermaid_float = v141
local v142 = {
    ["name"] = "Money Rattle",
    ["image"] = "rbxassetid://3009779519",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "MoneyTreeRattle",
    ["tool"] = "GenericTool"
}
v2.money_tree_rattle = v142
local v143 = {
    ["name"] = "Monkey Pogo",
    ["image"] = "rbxassetid://5057099190",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "MonkeyPogo",
    ["tool"] = "PogoTool"
}
v2.monkey_pogo = v143
local v144 = {
    ["name"] = "Monkey Propeller",
    ["image"] = "rbxassetid://5057099046",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "MonkeyPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.monkey_propeller = v144
local v145 = {
    ["name"] = "Mouse Chew Toy",
    ["image"] = "rbxassetid://4361545816",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "MouseChewToy",
    ["tool"] = "ChewToyTool"
}
v2.mouse_chew_toy = v145
local v146 = {
    ["name"] = "Mouse Leash",
    ["image"] = "rbxassetid://4361545423",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "UnicornLeash",
    ["model_handle"] = "MouseLeash",
    ["tool"] = "PetLeash"
}
v2.mouse_leash = v146
local v147 = {
    ["name"] = "Musical Conch",
    ["image"] = "rbxassetid://6872763349",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "DidgeridooHold",
        ["use"] = "DidgeridooPlay"
    },
    ["model_handle"] = "MusicalConch",
    ["sounds"] = { "Conch1", "Conch2" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.musical_conch = v147
local v148 = {
    ["name"] = "Founder\'s Key Throw Toy",
    ["image"] = "rbxassetid://4819884920",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "MysteryKey",
    ["tool"] = "SqueakyToyTool"
}
v2.mystery_key = v148
local v149 = {
    ["name"] = "Creator Rattle (NewFissy)",
    ["image"] = "rbxassetid://2408051082",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "NewFissyRattle",
    ["tool"] = "GenericTool"
}
v2.newfissy_rattle = v149
local v150 = {
    ["name"] = "Newspaper Chew Toy",
    ["image"] = "rbxassetid://4361545553",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "NewspaperChewToy",
    ["tool"] = "ChewToyTool"
}
v2.newspaper_chew_toy = v150
local v151 = {
    ["name"] = "Noob Balloon",
    ["image"] = "rbxassetid://2657670913",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "NoobBalloon",
    ["tool"] = "BalloonTool"
}
v2.noob_balloon = v151
local v152 = {
    ["name"] = "Octopus Plush",
    ["image"] = "rbxassetid://3009779607",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "OctopusPlush",
    ["tool"] = "GenericTool"
}
v2.octopus_plush = v152
local v153 = {
    ["name"] = "Ornament Throw Toy",
    ["image"] = "rbxassetid://4470749788",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "OrnamentThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.ornament_throw_toy = v153
local v154 = {
    ["name"] = "Panda Flying Disc",
    ["image"] = "rbxassetid://3486905369",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "PandaFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.panda_frisbee = v154
local v155 = {
    ["name"] = "Panda Pal",
    ["image"] = "rbxassetid://1425782368",
    ["rarity"] = "uncommon",
    ["cost"] = 70,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Panda",
    ["tool"] = "GenericTool"
}
v2.panda_toy = v155
local v156 = {
    ["name"] = "Party Innertube",
    ["image"] = "rbxassetid://12572768039",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["anims"] = {
        ["hold"] = "InnerTubeHold"
    },
    ["colorable"] = true,
    ["floats"] = true,
    ["model_handle"] = "PartyInnerTube",
    ["tool"] = "FloatTool"
}
v2.party_inner_tube = v156
local v157 = {
    ["name"] = "Party Mermaid Float",
    ["image"] = "rbxassetid://12572769374",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["anims"] = {
        ["hold"] = "MassiveGiftHold"
    },
    ["colorable"] = true,
    ["floats"] = true,
    ["forward_drop_offset"] = 7,
    ["model_handle"] = "PartyMermaidFloat",
    ["tool"] = "FloatTool"
}
v2.party_mermaid_float = v157
local v158 = {
    ["name"] = "Party Pizza Float",
    ["image"] = "rbxassetid://12572769951",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["anims"] = {
        ["hold"] = "MassiveGiftHold"
    },
    ["floats"] = true,
    ["forward_drop_offset"] = 12,
    ["model_handle"] = "PartyPizzaFloat",
    ["tool"] = "FloatTool"
}
v2.party_pizza_float = v158
local v159 = {
    ["name"] = "Party Pool Noodle",
    ["image"] = "rbxassetid://12572770692",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["anims"] = {
        ["hold"] = "PoolNoodleHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "PartyPoolNoodle",
    ["tool"] = "GenericTool"
}
v2.party_pool_noodle = v159
local v160 = {
    ["name"] = "Peppermint Disc",
    ["image"] = "rbxassetid://6061513175",
    ["rarity"] = "common",
    ["cost"] = 120,
    ["currency_id"] = "gingerbread_2020",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "PeppermintDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.peppermint_disc = v160
local v161 = {
    ["name"] = "Phoenix Plush",
    ["image"] = "rbxassetid://2657670921",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "PhoenixPlush",
    ["tool"] = "GenericTool"
}
v2.phoenix_plush = v161
local v162 = {
    ["name"] = "Pizza Float",
    ["image"] = "rbxassetid://3579315716",
    ["rarity"] = "rare",
    ["cost"] = 300,
    ["anims"] = {
        ["hold"] = "MassiveGiftHold"
    },
    ["floats"] = true,
    ["forward_drop_offset"] = 12,
    ["model_handle"] = "PizzaFloat",
    ["tool"] = "FloatTool"
}
v2.pizza_float = v162
local v163 = {
    ["name"] = "Plate of Food Disc",
    ["image"] = "rbxassetid://6475616071",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "PlateOfFoodDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.plate_of_food_disc = v163
local v164 = {
    ["name"] = "Plunger Grappling Hook",
    ["image"] = "rbxassetid://4361544972",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "PlungerGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.plunger_grappling_hook = v164
local v165 = {
    ["name"] = "Pogo Stick",
    ["image"] = "rbxassetid://1585764573",
    ["rarity"] = "common",
    ["cost"] = 200,
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "Pogo" },
    ["model_handle"] = "Pogo",
    ["tool"] = "PogoTool"
}
v2.pogo = v165
local v166 = {
    ["name"] = "Polar Bear Plush",
    ["image"] = "rbxassetid://2657671635",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "PolarPlush",
    ["tool"] = "GenericTool"
}
v2.polar_plush = v166
local v167 = {
    ["name"] = "Pool Noodle",
    ["image"] = "rbxassetid://3582002026",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["anims"] = {
        ["hold"] = "PoolNoodleHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "PoolNoodle",
    ["tool"] = "GenericTool"
}
v2.pool_noodle = v167
local v168 = {
    ["name"] = "Potato Chew Toy",
    ["image"] = "rbxassetid://6475610159",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "PotatoChewToy",
    ["tool"] = "ChewToyTool"
}
v2.potato_chew_toy = v168
local v169 = {
    ["name"] = "Princess Rattle",
    ["image"] = "rbxassetid://6475610093",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "PrincessRattle",
    ["tool"] = "GenericTool"
}
v2.princess_rattle = v169
local v170 = {
    ["name"] = "Propeller",
    ["image"] = "rbxassetid://3142180058",
    ["rarity"] = "rare",
    ["cost"] = 1200,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Propeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "PropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.propeller = v170
local v171 = {
    ["name"] = "Protein Bottle Rattle",
    ["image"] = "rbxassetid://4361544719",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "ProteinBottleRattle",
    ["tool"] = "GenericTool"
}
v2.protein_bottle_rattle = v171
local v172 = {
    ["name"] = "Throwing Pumpkin",
    ["image"] = "rbxassetid://4115249023",
    ["rarity"] = "uncommon",
    ["currency_id"] = "candy_2019",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "PumpkinThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.pumpkin_throw_toy = v172
local v173 = {
    ["name"] = "Pumpkin",
    ["image"] = "rbxassetid://1106651137",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["use"] = "PumpkinUse"
    },
    ["model_handle"] = "Pumpkin",
    ["tool"] = "HalloweenEventPumpkin"
}
v2.pumpkin_toy = v173
local v174 = {
    ["name"] = "Pumpkin Rattle",
    ["image"] = "rbxassetid://1106651129",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "PumpkinRattle" },
    ["model_handle"] = "PumpkinRattle",
    ["tool"] = "GenericTool"
}
v2.pumpkinrattle = v174
local v175 = {
    ["name"] = "Puppy Plush",
    ["image"] = "rbxassetid://2408051114",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "PuppyPlush",
    ["tool"] = "GenericTool"
}
v2.puppy_plush = v175
local v176 = {
    ["name"] = "Rabbit Rattle",
    ["image"] = "rbxassetid://3082046011",
    ["rarity"] = "common",
    ["currency_id"] = "eggs",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "RabbitRattle",
    ["tool"] = "GenericTool"
}
v2.rabbit_rattle = v176
local v177 = {
    ["name"] = "Rainbow Rattle",
    ["image"] = "rbxassetid://3009779565",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "RainbowRattle",
    ["tool"] = "GenericTool"
}
v2.rainbow_rattle = v177
local v178 = {
    ["name"] = "Rainbow Wand",
    ["image"] = "rbxassetid://2408055079",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "RainbowWand",
    ["tool"] = "GenericTool"
}
v2.rainbow_wand = v178
local v179 = {
    ["name"] = "Rattle",
    ["image"] = "rbxassetid://925264405",
    ["rarity"] = "common",
    ["cost"] = 50,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "Rattle" },
    ["model_handle"] = "Rattle",
    ["tool"] = "GenericTool"
}
v2.rattle = v179
local v180 = {
    ["name"] = "Raw Bone",
    ["image"] = "rbxassetid://4710373749",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "RawBone",
    ["tool"] = "FlyingDiscTool"
}
v2.raw_bone = v180
local v181 = {
    ["name"] = "Reindeer Leash",
    ["image"] = "rbxassetid://4470749750",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "UnicornLeash",
    ["model_handle"] = "ReindeerLeash",
    ["tool"] = "PetLeash"
}
v2.reindeer_leash = v181
local v182 = {
    ["name"] = "Reindeer Ornament",
    ["image"] = "rbxassetid://4508178806",
    ["rarity"] = "legendary",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "ReindeerOrnament",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true
}
v2.reindeer_ornament = v182
local v183 = {
    ["name"] = "Rib Guitar",
    ["image"] = "rbxassetid://5882028553",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1750,
    ["currency_id"] = "candy_2020",
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "RibGuitarPlay"
    },
    ["model_handle"] = "RibGuitar",
    ["sounds"] = {
        "RibGuitar1",
        "RibGuitar2",
        "RibGuitar3",
        "RibGuitar4"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.rib_guitar = v183
local v184 = {
    ["name"] = "Rocket Pogo",
    ["image"] = "rbxassetid://3009779583",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "RocketPogo",
    ["tool"] = "PogoTool"
}
v2.rocket_pogo = v184
local v185 = {
    ["name"] = "Rope Chew Toy",
    ["image"] = "rbxassetid://4361545688",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "RopeChewToy",
    ["tool"] = "ChewToyTool"
}
v2.rope_chew_toy = v185
local v186 = {
    ["name"] = "Rubber Bone Throw Toy",
    ["image"] = "rbxassetid://3454109957",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "RubberBoneThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.rubber_bone_throw_toy = v186
local v187 = {
    ["name"] = "Rubber Chicken Rattle",
    ["image"] = "rbxassetid://4361546520",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "RubberChickenRattle",
    ["tool"] = "GenericTool"
}
v2.rubber_chicken_rattle = v187
local v188 = {
    ["name"] = "Santa Leash",
    ["image"] = "rbxassetid://4470749474",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "UnicornLeash",
    ["model_handle"] = "SantaLeash",
    ["tool"] = "PetLeash"
}
v2.santa_leash = v188
local v189 = {
    ["name"] = "Santa Ornament",
    ["image"] = "rbxassetid://4508188778",
    ["rarity"] = "ultra_rare",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "SantaOrnament",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true
}
v2.santa_ornament = v189
local v190 = {
    ["name"] = "Santa Rattle",
    ["image"] = "rbxassetid://4470750189",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "SantaRattle",
    ["tool"] = "GenericTool"
}
v2.santa_rattle = v190
local v191 = {
    ["name"] = "Scroll Ingredient",
    ["image"] = "rbxassetid://5061468835",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "ScrollIngredient",
    ["tool"] = "ThrowToyTool"
}
v2.scroll_ingredient = v191
local v192 = {
    ["name"] = "Shoe Chew Toy",
    ["image"] = "rbxassetid://3977264197",
    ["rarity"] = "common",
    ["cost"] = 200,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "ShoeChewToy",
    ["tool"] = "ChewToyTool"
}
v2.shoe_chew_toy = v192
local v193 = {
    ["name"] = "Shuttle Pogo",
    ["image"] = "rbxassetid://6475612857",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "ShuttlePogo",
    ["tool"] = "PogoTool"
}
v2.shuttle_pogo = v193
local v194 = {
    ["name"] = "Skeleton Pogo Stick",
    ["image"] = "rbxassetid://4115249126",
    ["rarity"] = "uncommon",
    ["currency_id"] = "candy_2019",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "SkeletonPogo",
    ["tool"] = "PogoTool"
}
v2.skeleton_pogo = v194
local v195 = {
    ["name"] = "Skull Drum",
    ["image"] = "rbxassetid://5882028350",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1500,
    ["currency_id"] = "candy_2020",
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "SkullDrumPlay"
    },
    ["model_handle"] = "SkullDrum",
    ["sounds"] = { "SkullDrum1", "SkullDrum2", "SkullDrum3" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.skull_drum = v195
local v196 = {
    ["name"] = "Sleigh Bells Rattle",
    ["image"] = "rbxassetid://4470749413",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "SleighBellsRattle",
    ["tool"] = "GenericTool"
}
v2.sleigh_bells_rattle = v196
local v197 = {
    ["name"] = "Snowball Launcher",
    ["image"] = "rbxassetid://6059308940",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "UnicornPlushHug"
    },
    ["model_handle"] = "SnowballLauncher",
    ["tool"] = "SnowballLauncherTool"
}
v2.snowball_launcher = v197
local v198 = {
    ["name"] = "Snowflake Flying Disc",
    ["image"] = "rbxassetid://4470749970",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "SnowflakeFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.snowflake_frisbee = v198
local v199 = {
    ["name"] = "Snowflake Ornament",
    ["image"] = "rbxassetid://4508188812",
    ["rarity"] = "uncommon",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "SnowflakeOrnament",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true
}
v2.snowflake_ornament = v199
local v200 = {
    ["name"] = "Snowman Plush",
    ["image"] = "rbxassetid://2657671626",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "SnowmanPlush",
    ["tool"] = "GenericTool"
}
v2.snowman_plush = v200
local v201 = {
    ["name"] = "Snowman Rattle",
    ["image"] = "rbxassetid://4470749691",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "SnowmanRattle",
    ["tool"] = "GenericTool"
}
v2.snowman_rattle = v201
local v202 = {
    ["name"] = "Soccer Ball Throw Toy",
    ["image"] = "rbxassetid://4361546258",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "SoccerBallThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.soccer_ball_throw_toy = v202
local v203 = {
    ["name"] = "Sock Chew Toy",
    ["image"] = "rbxassetid://4470750120",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "SockChewToy",
    ["tool"] = "ChewToyTool"
}
v2.sock_chew_toy = v203
local v204 = {
    ["name"] = "Soda Chew Toy",
    ["image"] = "rbxassetid://6475609913",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "SodaChewToy",
    ["tool"] = "ChewToyTool"
}
v2.soda_chew_toy = v204
local v205 = {
    ["name"] = "Space Grappling Hook",
    ["image"] = "rbxassetid://6475613374",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "SpaceGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.space_grappling_hook = v205
local v206 = {
    ["name"] = "Sparkler",
    ["image"] = "rbxassetid://3060778416",
    ["rarity"] = "uncommon",
    ["cost"] = 20,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Sparkler",
    ["tool"] = "GenericTool"
}
v2.sparkler = v206
local v207 = {
    ["name"] = "Spider Grappling Hook",
    ["image"] = "rbxassetid://5882028477",
    ["rarity"] = "rare",
    ["cost"] = 800,
    ["currency_id"] = "candy_2020",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "SpiderGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.spider_grappling_hook = v207
local v208 = {
    ["name"] = "Spinning Propeller",
    ["image"] = "rbxassetid://6768657901",
    ["rarity"] = "rare",
    ["cost"] = 1300,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "SpinningPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "DandelionSpin",
    ["tool"] = "PropellerTool"
}
v2.spinning_propeller = v208
local v209 = {
    ["name"] = "Squeaky Bone",
    ["image"] = "rbxassetid://4710374481",
    ["rarity"] = "common",
    ["cost"] = 135,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "SqueakyBone",
    ["tool"] = "SqueakyToyTool"
}
v2.squeaky_bone = v209
local v210 = {
    ["name"] = "Squeaky Spikey",
    ["image"] = "rbxassetid://4710380777",
    ["rarity"] = "uncommon",
    ["cost"] = 275,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "SqueakySpikey",
    ["tool"] = "SqueakyToyTool"
}
v2.squeaky_spikey = v210
local v211 = {
    ["name"] = "Squid Plush",
    ["image"] = "rbxassetid://2408052387",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "SquidPlush",
    ["tool"] = "GenericTool"
}
v2.squid_plush = v211
local v212 = {
    ["name"] = "Squid Rattle",
    ["image"] = "rbxassetid://1034712976",
    ["rarity"] = "uncommon",
    ["cost"] = 425,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "SquidRattle" },
    ["model_handle"] = "SquidRattle",
    ["tool"] = "GenericTool"
}
v2.squidrattle = v212
local v213 = {
    ["name"] = "Staff Ingredient",
    ["image"] = "rbxassetid://5061468930",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "StaffIngredient",
    ["tool"] = "ThrowToyTool"
}
v2.staff_ingredient = v213
local v214 = {
    ["name"] = "Standard Grappling Hook",
    ["image"] = "rbxassetid://6768659222",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2000,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "StandardGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.standard_grappling_hook = v214
local v215 = {
    ["name"] = "Standard Pogo",
    ["image"] = "rbxassetid://6768656958",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["colorable"] = true,
    ["model_handle"] = "StandardPogo",
    ["tool"] = "PogoTool"
}
v2.standard_pogo = v215
local v216 = {
    ["name"] = "Star Ball",
    ["image"] = "rbxassetid://4710373961",
    ["rarity"] = "rare",
    ["cost"] = 450,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "StarBall",
    ["tool"] = "SqueakyToyTool"
}
v2.star_ball = v216
local v217 = {
    ["name"] = "Star Balloon",
    ["image"] = "rbxassetid://6768655734",
    ["rarity"] = "common",
    ["cost"] = 120,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "StarBalloon",
    ["tool"] = "BalloonTool"
}
v2.star_balloon = v217
local v218 = {
    ["name"] = "Star & Moon Propeller",
    ["image"] = "rbxassetid://5882029202",
    ["rarity"] = "rare",
    ["cost"] = 950,
    ["currency_id"] = "candy_2020",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "StarMoonPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "PropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.star_moon_propeller = v218
local v219 = {
    ["name"] = "Star Ornament",
    ["image"] = "rbxassetid://4508188858",
    ["rarity"] = "uncommon",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "StarOrnament",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true
}
v2.star_ornament = v219
local v220 = {
    ["name"] = "Starpower Wand",
    ["image"] = "rbxassetid://2408055085",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "StarpowerWand",
    ["tool"] = "GenericTool"
}
v2.starpower_wand = v220
local v221 = {
    ["name"] = "Steel Drum",
    ["image"] = "rbxassetid://4797807187",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "SteelDrumPlay"
    },
    ["model_handle"] = "SteelDrum",
    ["sounds"] = { "SteelDrum1", "SteelDrum2", "SteelDrum3" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.steel_drum = v221
local v222 = {
    ["name"] = "Stegosaurus Throw Toy",
    ["image"] = "rbxassetid://5725940059",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "StegosaurusChewToy",
    ["tool"] = "ThrowToyTool"
}
v2.stegosaurus_chew_toy = v222
local v223 = {
    ["name"] = "Stick Throw Toy",
    ["image"] = "rbxassetid://4361545987",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "StickThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.stick_throw_toy = v223
local v224 = {
    ["name"] = "Sun Balloon",
    ["image"] = "rbxassetid://6475609838",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "SunBalloon",
    ["tool"] = "BalloonTool"
}
v2.sun_balloon = v224
local v225 = {
    ["name"] = "Sunflower Rattle",
    ["image"] = "rbxassetid://4822522414",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "SunflowerRattle",
    ["tool"] = "GenericTool"
}
v2.sunflower_rattle = v225
local v226 = {
    ["name"] = "Tangerine Chew Toy",
    ["image"] = "rbxassetid://6245476323",
    ["rarity"] = "uncommon",
    ["cost"] = 100,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "TangerineChewToy",
    ["tool"] = "ChewToyTool"
}
v2.tangerine_chew_toy = v226
local v227 = {
    ["name"] = "Teddy Bear",
    ["image"] = "rbxassetid://8904069731",
    ["rarity"] = "common",
    ["cost"] = 50,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Teddy",
    ["tool"] = "GenericTool"
}
v2.teddybear = v227
local v228 = {
    ["name"] = "Teddy Skele",
    ["image"] = "rbxassetid://1106750542",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "TeddySkele",
    ["tool"] = "GenericTool"
}
v2.teddyskele = v228
local v229 = {
    ["name"] = "Telescope Pogo",
    ["image"] = "rbxassetid://3009779638",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "TelescopePogo",
    ["tool"] = "PogoTool"
}
v2.telescope_pogo = v229
local v230 = {
    ["name"] = "Tennis Ball",
    ["image"] = "rbxassetid://4710374217",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "TennisBall",
    ["tool"] = "SqueakyToyTool"
}
v2.tennis_ball = v230
local v231 = {
    ["name"] = "Tombstone Ghostify",
    ["image"] = "rbxassetid://2466291802",
    ["rarity"] = "rare",
    ["currency_id"] = "candy",
    ["anims"] = {
        ["hold"] = "TombstoneHold",
        ["use"] = "TombstoneUse"
    },
    ["model_handle"] = "Tombstone",
    ["tool"] = "TombstoneTool"
}
v2.tombstone = v231
local v232 = {
    ["name"] = "Top Hat Flying Disc",
    ["image"] = "rbxassetid://4470749908",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "TopHatFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.top_hat_frisbee = v232
local v233 = {
    ["name"] = "Trade License",
    ["image"] = "rbxassetid://5861440776",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "TradeLicense",
    ["tool"] = "TradeLicense"
}
v2.trade_license = v233
local v234 = {
    ["name"] = "T-Rex Throw Toy",
    ["image"] = "rbxassetid://5725943344",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "TRexChewToy",
    ["tool"] = "ThrowToyTool"
}
v2.trex_chew_toy = v234
local v235 = {
    ["name"] = "T-Rex Rattle",
    ["image"] = "rbxassetid://5725943459",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "TRexRattle",
    ["tool"] = "GenericTool"
}
v2.trex_rattle = v235
local v236 = {
    ["name"] = "Trumpet",
    ["image"] = "rbxassetid://4797807247",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "TrumpetHold",
        ["use"] = "TrumpetPlay"
    },
    ["model_handle"] = "Trumpet",
    ["sounds"] = { "Trumpet1", "Trumpet2", "Trumpet3" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.trumpet = v236
local v237 = {
    ["name"] = "Turkey Leg",
    ["image"] = "rbxassetid://3486904174",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "TurkeyLeg",
    ["tool"] = "ThrowToyTool"
}
v2.turkey_leg = v237
local v238 = {
    ["name"] = "Turkey Plush",
    ["image"] = "rbxassetid://4464390422",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "TurkeyPlush",
    ["tool"] = "GenericTool"
}
v2.turkey_plush = v238
local v239 = {
    ["name"] = "Unicorn Leash",
    ["image"] = "rbxassetid://3977264097",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "UnicornLeash",
    ["model_handle"] = "UnicornLeash",
    ["tool"] = "PetLeash"
}
v2.unicorn_leash = v239
local v240 = {
    ["name"] = "Unicorn Plush",
    ["image"] = "rbxassetid://3570154347",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "UnicornPlush",
    ["tool"] = "GenericTool"
}
v2.unicorn_plush = v240
local v241 = {
    ["name"] = "Unicorn Rattle",
    ["image"] = "rbxassetid://1034712980",
    ["rarity"] = "uncommon",
    ["cost"] = 275,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["colorable"] = true,
    ["colorable_models"] = { "UnicornRattle" },
    ["model_handle"] = "UnicornRattle",
    ["tool"] = "GenericTool"
}
v2.unicornrattle = v241
v2.voting_paddle = {
    ["name"] = "Voting Paddle",
    ["image"] = "rbxassetid://7032118965",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["colorable"] = true,
    ["model_handle"] = "VotingPaddle",
    ["preserve_model_welds"] = true,
    ["temporary"] = true,
    ["tool"] = "VotingPaddle"
}
local v242 = {
    ["name"] = "Water Wings",
    ["image"] = "rbxassetid://12572767273",
    ["rarity"] = "common",
    ["cost"] = 50,
    ["anims"] = {
        ["hold"] = "RattleHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "WaterWings",
    ["tool"] = "GenericTool"
}
v2.water_wings = v242
local v243 = {
    ["name"] = "Witches Wand",
    ["image"] = "rbxassetid://2466291984",
    ["rarity"] = "uncommon",
    ["currency_id"] = "candy",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "WitchesWand",
    ["tool"] = "GenericTool"
}
v2.witch_wand = v243
local v244 = {
    ["name"] = "Wooden Pogo",
    ["image"] = "rbxassetid://2408055086",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "WoodenPogo",
    ["tool"] = "PogoTool"
}
v2.wooden_pogo = v244
local v245 = {
    ["name"] = "Wreath Flying Disc",
    ["image"] = "rbxassetid://4470750314",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "WreathFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.wreath_frisbee = v245
local v246 = {
    ["name"] = "Zombie Buffalo Plush",
    ["image"] = "rbxassetid://4155284126",
    ["rarity"] = "uncommon",
    ["currency_id"] = "candy",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "BuffaloPlush",
    ["tool"] = "GenericTool"
}
v2.zombie_buffalo_plush = v246
return v1(v2)