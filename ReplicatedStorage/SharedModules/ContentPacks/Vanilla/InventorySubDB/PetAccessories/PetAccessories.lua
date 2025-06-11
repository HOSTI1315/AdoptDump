--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {
    ["ace_pride_pin"] = {
        ["name"] = "Ace Pride Pin",
        ["image"] = "rbxassetid://5464334279",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "AcePridePin"
    },
    ["adventurers_hood"] = {
        ["name"] = "Adventurer\'s Hood",
        ["image"] = "rbxassetid://4880426741",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "AdventurersHood"
    },
    ["adventurers_sword"] = {
        ["name"] = "Adventurer\'s Sword",
        ["image"] = "rbxassetid://4880426585",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "AdventurersSword"
    },
    ["agender_pride_pin"] = {
        ["name"] = "Agender Pride Pin",
        ["image"] = "rbxassetid://6927701246",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "AgenderPridePin"
    },
    ["amber_earrings"] = {
        ["name"] = "Amber Earrings",
        ["image"] = "rbxassetid://5726048254",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "AmberEarrings"
    },
    ["angel_wings"] = {
        ["name"] = "Angel Wings",
        ["image"] = "rbxassetid://4849973461",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "AngelWings"
    },
    ["antenna"] = {
        ["name"] = "Antenna",
        ["image"] = "rbxassetid://6380734633",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Antenna"
    },
    ["aromantic_pride_pin"] = {
        ["name"] = "Aromantic Pride Pin",
        ["image"] = "rbxassetid://6927698400",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "AromanticPridePin"
    },
    ["aviators"] = {
        ["name"] = "Aviators",
        ["image"] = "rbxassetid://4849972567",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Aviators"
    },
    ["bat_wings"] = {
        ["name"] = "Bat Wings",
        ["image"] = "rbxassetid://4849973554",
        ["rarity"] = "ultra_rare",
        ["cost"] = 2000,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BatWings"
    },
    ["beaked_whale_badge"] = {
        ["name"] = "Beaked Whale Badge",
        ["image"] = "rbxassetid://6906062681",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "BeakedWhaleBadge"
    },
    ["bear_winter_hat"] = {
        ["name"] = "Bear Winter Hat",
        ["image"] = "rbxassetid://6060998837",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BearWinterHat"
    },
    ["bee_hive"] = {
        ["name"] = "Bee Hive",
        ["image"] = "rbxassetid://6380843886",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BeeHive"
    },
    ["bee_wings"] = {
        ["name"] = "Bee Wings",
        ["image"] = "rbxassetid://6380734557",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BeeWings"
    },
    ["beluga_badge"] = {
        ["name"] = "Beluga Badge",
        ["image"] = "rbxassetid://6906062604",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "BelugaBadge"
    },
    ["beret"] = {
        ["name"] = "Beret",
        ["image"] = "rbxassetid://4849973352",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Beret"
    },
    ["bewitched_hat"] = {
        ["name"] = "Bewitched Hat",
        ["image"] = "rbxassetid://5881347869",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BewitchedHat"
    },
    ["bi_pride_pin"] = {
        ["name"] = "Bi Pride Pin",
        ["image"] = "rbxassetid://5415514294",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "BiPridePin"
    },
    ["black_5_panel_cap"] = {
        ["name"] = "Black 5 Panel Cap",
        ["image"] = "rbxassetid://5415514537",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Black5PanelCap"
    },
    ["black_bandana"] = {
        ["name"] = "Black Bandana",
        ["image"] = "rbxassetid://4849973753",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "BlackBandana"
    },
    ["black_boots"] = {
        ["name"] = "Black Boots",
        ["image"] = "rbxassetid://5415514707",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "BlackBoots"
    },
    ["black_bowtie"] = {
        ["name"] = "Black Bowtie",
        ["image"] = "rbxassetid://4849974697",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "BlackBowtie"
    },
    ["black_cozy_hood"] = {
        ["name"] = "Black Cozy Hood",
        ["image"] = "rbxassetid://5415514845",
        ["rarity"] = "uncommon",
        ["cost"] = 200,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BlackCozyHood"
    },
    ["black_designer_backpack"] = {
        ["name"] = "Black Designer Backpack",
        ["image"] = "rbxassetid://5415515017",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BlackDesignerBackpack"
    },
    ["black_fedora"] = {
        ["name"] = "Black Fedora",
        ["image"] = "rbxassetid://4849975075",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BlackFedora"
    },
    ["black_hightops"] = {
        ["name"] = "Black Hightops",
        ["image"] = "rbxassetid://5415515284",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "BlackHightops"
    },
    ["black_purse"] = {
        ["name"] = "Black Purse",
        ["image"] = "rbxassetid://5415515507",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BlackPurse"
    },
    ["black_scarf"] = {
        ["name"] = "Black Scarf",
        ["image"] = "rbxassetid://4880426690",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "BlackScarf"
    },
    ["black_sneakers"] = {
        ["name"] = "Black Sneakers",
        ["image"] = "rbxassetid://5415515653",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "BlackSneakers"
    },
    ["blue_backpack"] = {
        ["name"] = "Blue Backpack",
        ["image"] = "rbxassetid://4849979291",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BlueBackpack"
    },
    ["blue_butterfly_wings"] = {
        ["name"] = "Blue Butterfly Wings",
        ["image"] = "rbxassetid://5444594385",
        ["rarity"] = "ultra_rare",
        ["cost"] = 2000,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BlueButterflyWings"
    },
    ["blue_cap"] = {
        ["name"] = "Blue Cap",
        ["image"] = "rbxassetid://4849975245",
        ["rarity"] = "common",
        ["donatable"] = false,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BlueCap"
    },
    ["blue_cat_ear_headphones"] = {
        ["name"] = "Blue Cat Ear Headphones",
        ["image"] = "rbxassetid://4849980085",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BlueCatEarHeadphones"
    },
    ["blue_sneakers"] = {
        ["name"] = "Blue Sneakers",
        ["image"] = "rbxassetid://5415515800",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "BlueSneakers"
    },
    ["bone_wings"] = {
        ["name"] = "Bone Wings",
        ["image"] = "rbxassetid://5726048365",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BoneWings"
    },
    ["bowler"] = {
        ["name"] = "Bowler",
        ["image"] = "rbxassetid://4849975329",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Bowler"
    },
    ["briefcase"] = {
        ["name"] = "Briefcase",
        ["image"] = "rbxassetid://4880426624",
        ["rarity"] = "uncommon",
        ["cost"] = 200,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BriefCase"
    },
    ["brown_cozy_hood"] = {
        ["name"] = "Brown Cozy Hood",
        ["image"] = "rbxassetid://5415516147",
        ["rarity"] = "common",
        ["cost"] = 125,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BrownCozyHood"
    },
    ["bucket_hat"] = {
        ["name"] = "Bucket Hat",
        ["image"] = "rbxassetid://4849975400",
        ["rarity"] = "common",
        ["cost"] = 125,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BucketHat"
    },
    ["bug_net"] = {
        ["name"] = "Bug Net",
        ["image"] = "rbxassetid://6380734401",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BugNet"
    },
    ["bunny_ear_tiara"] = {
        ["name"] = "Bunny Ear Tiara",
        ["image"] = "rbxassetid://6706595341",
        ["rarity"] = "legendary",
        ["cost"] = 600,
        ["currency_id"] = "eggs_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "BunnyEarTiara"
    },
    ["buttoned_ushanka"] = {
        ["name"] = "Buttoned Ushanka",
        ["image"] = "rbxassetid://4849975457",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ButtonedUshanka"
    },
    ["buzz_off_skateboard"] = {
        ["name"] = "Buzz Off! Skateboard",
        ["image"] = "rbxassetid://4849978837",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "BuzzOffSkateboard"
    },
    ["cassette"] = {
        ["name"] = "Cassette",
        ["image"] = "rbxassetid://5415516304",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Cassette"
    },
    ["chef_hat"] = {
        ["name"] = "Chef Hat",
        ["image"] = "rbxassetid://4849975557",
        ["rarity"] = "uncommon",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ChefHat"
    },
    ["cherry_earrings"] = {
        ["name"] = "Cherry Earrings",
        ["image"] = "rbxassetid://6380734302",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "CherryEarrings"
    },
    ["chick_backpack"] = {
        ["name"] = "Chick Backpack",
        ["image"] = "rbxassetid://6706591422",
        ["rarity"] = "rare",
        ["cost"] = 250,
        ["currency_id"] = "eggs_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "ChickBackpack"
    },
    ["chick_hat"] = {
        ["name"] = "Chick Hat",
        ["image"] = "rbxassetid://6706592723",
        ["rarity"] = "rare",
        ["cost"] = 250,
        ["currency_id"] = "eggs_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ChickHat"
    },
    ["chicken_hat"] = {
        ["name"] = "Chicken Hat",
        ["image"] = "rbxassetid://4849975633",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ChickenHat"
    },
    ["clear_glasses"] = {
        ["name"] = "Clear Glasses",
        ["image"] = "rbxassetid://5415516467",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "ClearGlasses"
    },
    ["clout_goggles"] = {
        ["name"] = "Clout Goggles",
        ["image"] = "rbxassetid://4849972658",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "CloutGoggles"
    },
    ["conductor_hat"] = {
        ["name"] = "Conductor Hat",
        ["image"] = "rbxassetid://4849975702",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ConductorHat"
    },
    ["construction_hat"] = {
        ["name"] = "Construction Hat",
        ["image"] = "rbxassetid://4849975838",
        ["rarity"] = "common",
        ["cost"] = 125,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ConstructionHat"
    },
    ["cowbell"] = {
        ["name"] = "Cowbell",
        ["image"] = "rbxassetid://4849973919",
        ["rarity"] = "common",
        ["donatable"] = false,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Cowbell"
    },
    ["cowboy_hat"] = {
        ["name"] = "Cowboy Hat",
        ["image"] = "rbxassetid://4849975936",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "CowboyHat"
    },
    ["cute_circle_glasses"] = {
        ["name"] = "Cute Circle Glasses",
        ["image"] = "rbxassetid://5415516746",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "CuteCircleGlasses"
    },
    ["cutlass"] = {
        ["name"] = "Cutlass",
        ["image"] = "rbxassetid://4936545219",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Cutlass"
    },
    ["cyborg_shades"] = {
        ["name"] = "Cyborg Shades",
        ["image"] = "rbxassetid://4849972740",
        ["rarity"] = "rare",
        ["cost"] = 555,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "CyborgShades"
    },
    ["daisy_glasses"] = {
        ["name"] = "Daisy Glasses",
        ["image"] = "rbxassetid://6404037745",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "DaisyGlasses"
    },
    ["demi_pride_pin"] = {
        ["name"] = "Demi Pride Pin",
        ["image"] = "rbxassetid://6927698303",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "DemiPridePin"
    },
    ["detective_hat"] = {
        ["name"] = "Detective Hat",
        ["image"] = "rbxassetid://4968254439",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "DetectiveHat"
    },
    ["detective_mustache"] = {
        ["name"] = "Detective Mustache",
        ["image"] = "rbxassetid://4978225755",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "DetectiveMustache"
    },
    ["dolphin_badge"] = {
        ["name"] = "Dolphin Badge",
        ["image"] = "rbxassetid://6906062528",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "DolphinBadge"
    },
    ["eco_black_tree_motif_cap"] = {
        ["name"] = "Eco Black Tree Motif Cap",
        ["image"] = "rbxassetid://7543191460",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoBlackTreeMotifCap"
    },
    ["eco_blue_recycling_bin_badge"] = {
        ["name"] = "Eco Blue Recycling Bin Badge",
        ["image"] = "rbxassetid://7542825431",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "EcoBlueRecyclingBinBadge"
    },
    ["eco_blue_recycling_bin_hat"] = {
        ["name"] = "Eco Blue Recycling Bin Hat",
        ["image"] = "rbxassetid://7542825594",
        ["rarity"] = "uncommon",
        ["cost"] = 200,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoBlueRecyclingBinHat"
    },
    ["eco_blue_reusable_bottle_backpack"] = {
        ["name"] = "Eco Blue Reusable Bottle Backpack",
        ["image"] = "rbxassetid://7601648534",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "EcoBlueReusableBottleBackpack"
    },
    ["eco_blue_solar_panel_backpack"] = {
        ["name"] = "Eco Blue Solar Panel Backpack",
        ["image"] = "rbxassetid://7542826699",
        ["rarity"] = "uncommon",
        ["cost"] = 290,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "EcoBlueSolarPanelBackpack"
    },
    ["eco_brown_branch_headphones"] = {
        ["name"] = "Eco Brown Branch Headphones",
        ["image"] = "rbxassetid://7542810947",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1600,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoBrownBranchHeadphones"
    },
    ["eco_brown_earth_wizard_hat"] = {
        ["name"] = "Eco Brown Earth-Wizard Hat",
        ["image"] = "rbxassetid://7542814282",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1900,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoBrownEarthWizardHat"
    },
    ["eco_brown_hiking_backpack"] = {
        ["name"] = "Eco Brown Hiking Backpack",
        ["image"] = "rbxassetid://7542815049",
        ["rarity"] = "rare",
        ["cost"] = 600,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "EcoBrownHikingBackpack"
    },
    ["eco_brown_pinecone_earrings"] = {
        ["name"] = "Eco Brown Pinecone Earrings",
        ["image"] = "rbxassetid://7542822638",
        ["rarity"] = "common",
        ["cost"] = 120,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "EcoBrownPineconeEarrings"
    },
    ["eco_brown_wooden_clogs"] = {
        ["name"] = "Eco Brown Wooden Clogs",
        ["image"] = "rbxassetid://7542831564",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "EcoBrownWoodenClogs"
    },
    ["eco_glowing_lightbulb_necklace"] = {
        ["name"] = "Eco Glowing Lightbulb Necklace",
        ["image"] = "rbxassetid://7542819074",
        ["rarity"] = "common",
        ["cost"] = 115,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "EcoGlowingLightbulbNecklace"
    },
    ["eco_green_leaf_afro"] = {
        ["name"] = "Eco Green Leaf Afro",
        ["image"] = "rbxassetid://7542816175",
        ["rarity"] = "uncommon",
        ["cost"] = 240,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoGreenLeafAfro"
    },
    ["eco_green_leaf_glasses"] = {
        ["name"] = "Eco Green Leaf Glasses",
        ["image"] = "rbxassetid://7542816369",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "EcoGreenLeafGlasses"
    },
    ["eco_green_vine_badge"] = {
        ["name"] = "Eco Green Vine Badge",
        ["image"] = "rbxassetid://7542828472",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "EcoGreenVineBadge"
    },
    ["eco_green_vine_barrette"] = {
        ["name"] = "Eco Green Vine Barrette",
        ["image"] = "rbxassetid://7542828795",
        ["rarity"] = "common",
        ["cost"] = 115,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoGreenVineBarrette"
    },
    ["eco_green_vine_mustache"] = {
        ["name"] = "Eco Green Vine Mustache",
        ["image"] = "rbxassetid://7542830030",
        ["rarity"] = "common",
        ["cost"] = 110,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "EcoGreenVineMustache"
    },
    ["eco_grey_origami_boat_hat"] = {
        ["name"] = "Eco Grey Origami Boat Hat",
        ["image"] = "rbxassetid://7542821893",
        ["rarity"] = "common",
        ["cost"] = 125,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoGreyOrigamiBoatHat"
    },
    ["eco_orange_leaf_wings"] = {
        ["name"] = "Eco Orange Leaf Wings",
        ["image"] = "rbxassetid://7542810810",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "EcoOrangeLeafWings"
    },
    ["eco_orange_maple_cape"] = {
        ["name"] = "Eco Orange Maple Cape",
        ["image"] = "rbxassetid://7542820583",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1850,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "EcoOrangeMapleCape"
    },
    ["eco_orange_maple_earrings"] = {
        ["name"] = "Eco Orange Maple Earrings",
        ["image"] = "rbxassetid://7542810709",
        ["rarity"] = "uncommon",
        ["cost"] = 210,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "EcoOrangeMapleEarrings"
    },
    ["eco_orange_maple_headpiece"] = {
        ["name"] = "Eco Orange Maple Headpiece",
        ["image"] = "rbxassetid://7542820771",
        ["rarity"] = "common",
        ["cost"] = 140,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoOrangeMapleHeadpiece"
    },
    ["eco_orange_maple_leaf_mustache"] = {
        ["name"] = "Eco Orange Maple Leaf Mustache",
        ["image"] = "rbxassetid://7542817607",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "EcoOrangeMapleLeafMustache"
    },
    ["eco_orange_maple_leaf_scarf"] = {
        ["name"] = "Eco Orange Maple Leaf Scarf",
        ["image"] = "rbxassetid://7542817978",
        ["rarity"] = "uncommon",
        ["cost"] = 280,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "EcoOrangeMapleLeafScarf"
    },
    ["eco_orange_pumpkin_eyepatch"] = {
        ["name"] = "Eco Orange Pumpkin Eyepatch",
        ["image"] = "rbxassetid://7542823324",
        ["rarity"] = "rare",
        ["cost"] = 550,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "EcoOrangePumpkinEyepatch"
    },
    ["eco_orange_pumpkin_pie_wings"] = {
        ["name"] = "Eco Orange Pumpkin Pie Wings",
        ["image"] = "rbxassetid://7542824283",
        ["rarity"] = "ultra_rare",
        ["cost"] = 2000,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "EcoOrangePumpkinPieWings"
    },
    ["eco_red_apple_basket_hat"] = {
        ["name"] = "Eco Red Apple Basket Hat",
        ["image"] = "rbxassetid://7542810496",
        ["rarity"] = "common",
        ["cost"] = 130,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoRedAppleBasketHat"
    },
    ["eco_red_apple_hat"] = {
        ["name"] = "Eco Red Apple Hat",
        ["image"] = "rbxassetid://7542810624",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoRedAppleHat"
    },
    ["eco_red_cranberry_branch_wings"] = {
        ["name"] = "Eco Red Cranberry Branch Wings",
        ["image"] = "rbxassetid://7542813412",
        ["rarity"] = "rare",
        ["cost"] = 725,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "EcoRedCranberryBranchWings"
    },
    ["eco_red_mushroom_hood"] = {
        ["name"] = "Eco Red Mushroom Hood",
        ["image"] = "rbxassetid://7542821672",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EcoRedMushroomHood"
    },
    ["eco_white_spider_web_badge"] = {
        ["name"] = "Eco White Spider Web Badge",
        ["image"] = "rbxassetid://7542827477",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "EcoWhiteSpiderWebBadge"
    },
    ["eco_yellow_corncob_bowtie"] = {
        ["name"] = "Eco Yellow Corncob Bowtie",
        ["image"] = "rbxassetid://7542813230",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "EcoYellowCorncobBowtie"
    },
    ["egg_barrette"] = {
        ["name"] = "Egg Barrette",
        ["image"] = "rbxassetid://6706593596",
        ["rarity"] = "uncommon",
        ["cost"] = 100,
        ["currency_id"] = "eggs_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "EggBarrette"
    },
    ["egg_glasses"] = {
        ["name"] = "Egg Glasses",
        ["image"] = "rbxassetid://6706594347",
        ["rarity"] = "ultra_rare",
        ["cost"] = 400,
        ["currency_id"] = "eggs_2021",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "EggGlasses"
    },
    ["elf_hat"] = {
        ["name"] = "Elf Hat",
        ["image"] = "rbxassetid://4850383048",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ElfHat"
    },
    ["enby_pride_pin"] = {
        ["name"] = "Enby Pride Pin",
        ["image"] = "rbxassetid://5415516935",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "EnbyPridePin"
    },
    ["explorer_hat"] = {
        ["name"] = "Explorer Hat",
        ["image"] = "rbxassetid://4849976006",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ExplorerHat"
    },
    ["eyepatch"] = {
        ["name"] = "Eyepatch",
        ["image"] = "rbxassetid://4933495463",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Eyepatch"
    },
    ["fancy_top_hat"] = {
        ["name"] = "Fancy Top Hat",
        ["image"] = "rbxassetid://4849976160",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "FancyTopHat"
    },
    ["festive_tree_hat"] = {
        ["name"] = "Festive Tree Hat",
        ["image"] = "rbxassetid://6060998776",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "FestiveTreeHat"
    },
    ["fez"] = {
        ["name"] = "Fez",
        ["image"] = "rbxassetid://5067924466",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Fez"
    },
    ["firey_aura"] = {
        ["name"] = "Firey Aura",
        ["image"] = "rbxassetid://4853278462",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "FireyAura"
    },
    ["first_aid_bag"] = {
        ["name"] = "First Aid Bag",
        ["image"] = "rbxassetid://4849979365",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "FirstAidBag"
    },
    ["flamenco_hat"] = {
        ["name"] = "Flamenco Hat",
        ["image"] = "rbxassetid://4849976218",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "FlamencoHat"
    },
    ["flower_collar"] = {
        ["name"] = "Flower Collar",
        ["image"] = "rbxassetid://6437127230",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "FlowerCollar"
    },
    ["flower_crown"] = {
        ["name"] = "Flower Crown",
        ["image"] = "rbxassetid://6380734218",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "FlowerCrown"
    },
    ["flowery_hair_bow"] = {
        ["name"] = "Flowery Hair Bow",
        ["image"] = "rbxassetid://5415517076",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "FloweryHairBow"
    },
    ["forgotten_flower"] = {
        ["name"] = "Forgotten Flower",
        ["image"] = "rbxassetid://5726048455",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "ForgottenFlower"
    },
    ["fried_egg"] = {
        ["name"] = "Fried Egg",
        ["image"] = "rbxassetid://5415517194",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "FriedEgg"
    },
    ["froggy_hat"] = {
        ["name"] = "Froggy Hat",
        ["image"] = "rbxassetid://6380734014",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "FroggyHat"
    },
    ["fur_boots"] = {
        ["name"] = "Fur Boots",
        ["image"] = "rbxassetid://6060998635",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "FurBoots"
    },
    ["gardener_hat"] = {
        ["name"] = "Gardener Hat",
        ["image"] = "rbxassetid://4849976310",
        ["rarity"] = "common",
        ["cost"] = 125,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GardenerHat"
    },
    ["gay_man_pride_pin"] = {
        ["name"] = "Gay Man Pride Pin",
        ["image"] = "rbxassetid://6927698193",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "GayManPridePin"
    },
    ["gay_pride_pin"] = {
        ["name"] = "Gay Pride Pin",
        ["image"] = "rbxassetid://5415517354",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "GayPridePin"
    },
    ["genderfluid_pride_pin"] = {
        ["name"] = "Genderfluid Pride Pin",
        ["image"] = "rbxassetid://6927698099",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "GenderFluidPridePin"
    },
    ["gold_chain"] = {
        ["name"] = "Gold Chain",
        ["image"] = "rbxassetid://5415517473",
        ["rarity"] = "rare",
        ["cost"] = 650,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "GoldChain"
    },
    ["gold_circle_glasses"] = {
        ["name"] = "Gold Circle Glasses",
        ["image"] = "rbxassetid://5415517604",
        ["rarity"] = "uncommon",
        ["cost"] = 250,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "GoldCircleGlasses"
    },
    ["gold_tiara"] = {
        ["name"] = "Gold Tiara",
        ["image"] = "rbxassetid://5415517745",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GoldTiara"
    },
    ["golden_headset"] = {
        ["name"] = "Golden Headset",
        ["image"] = "rbxassetid://4849979471",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GoldenHeadset"
    },
    ["goth_shoes"] = {
        ["name"] = "Goth Shoes",
        ["image"] = "rbxassetid://6380730894",
        ["rarity"] = "rare",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "GothShoes"
    },
    ["green_lotus"] = {
        ["name"] = "Green Lotus",
        ["image"] = "rbxassetid://4849976420",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GreenLotus"
    }
}
local v3 = {
    ["name"] = "Growing Flower Hat",
    ["image"] = "rbxassetid://7368039312",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "GrowingFlowerHat"
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GrowingFlowerHatGrow"
    }
}
local v6 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "GrowingFlowerHatIdle"
    }
}
__set_list(v4, 1, {v5, v6})
v3.static_effects = v4
v2.growing_flower_hat = v3
v2.guitar_accessory = {
    ["name"] = "Guitar",
    ["image"] = "rbxassetid://4849979763",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "Guitar"
}
v2.halo = {
    ["name"] = "Halo",
    ["image"] = "rbxassetid://4489907389",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Halo"
}
v2.handheld = {
    ["name"] = "Handheld",
    ["image"] = "rbxassetid://5444594659",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "Handheld"
}
v2.head_chef = {
    ["name"] = "Head Chef",
    ["image"] = "rbxassetid://4849976512",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "HeadChef"
}
v2.head_tie = {
    ["name"] = "Head Tie",
    ["image"] = "rbxassetid://5067924536",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "HeadTie"
}
v2.headband = {
    ["name"] = "Headband",
    ["image"] = "rbxassetid://6404037642",
    ["rarity"] = "common",
    ["cost"] = 125,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Headband"
}
v2.headset = {
    ["name"] = "Headset",
    ["image"] = "rbxassetid://4849979572",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Headset"
}
v2.hoop_earrings = {
    ["name"] = "Hoop Earrings",
    ["image"] = "rbxassetid://5415521592",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["equip_type"] = "earrings",
    ["model_handle"] = "HoopEarrings"
}
v2.hype_crown = {
    ["name"] = "Founder\'s Crown",
    ["image"] = "rbxassetid://4853278628",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "CrownOfTheFounder"
}
v2.ice_crown = {
    ["name"] = "Ice Crown",
    ["image"] = "rbxassetid://6060991420",
    ["rarity"] = "rare",
    ["cost"] = 1200,
    ["currency_id"] = "gingerbread_2020",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "IceCrown"
}
v2.ice_earrings = {
    ["name"] = "Ice Earrings",
    ["image"] = "rbxassetid://6060991330",
    ["rarity"] = "rare",
    ["cost"] = 1200,
    ["currency_id"] = "gingerbread_2020",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["equip_type"] = "earrings",
    ["model_handle"] = "IceEarrings"
}
v2.ice_wings = {
    ["name"] = "Ice Wings",
    ["image"] = "rbxassetid://6060991245",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2000,
    ["currency_id"] = "gingerbread_2020",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "IceWings"
}
v2.icepack = {
    ["name"] = "Icepack",
    ["image"] = "",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Icepack",
    ["temporary"] = true
}
v2.icey_aura = {
    ["name"] = "Icey Aura",
    ["image"] = "rbxassetid://4849976581",
    ["rarity"] = "rare",
    ["cost"] = 600,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "IceyAura"
}
v2.ivy_necklace = {
    ["name"] = "Ivy Necklace",
    ["image"] = "rbxassetid://6380730464",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "IvyNecklace"
}
v2.jade_moth_wings = {
    ["name"] = "Jade Moth Wings",
    ["image"] = "rbxassetid://4849973617",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2000,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "JadeMothWings"
}
v2.jeffs_nametag = {
    ["name"] = "Jeff\'s Nametag",
    ["image"] = "rbxassetid://4849979214",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "JeffsNametag"
}
v2.jetpack = {
    ["name"] = "Jetpack",
    ["image"] = "rbxassetid://5415517859",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "Jetpack"
}
v2.k9_badge = {
    ["name"] = "Star Badge",
    ["image"] = "rbxassetid://5228763951",
    ["rarity"] = "rare",
    ["cost"] = 650,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "StarBadge"
}
v2.k9_hat = {
    ["name"] = "Marching Band Cap",
    ["image"] = "rbxassetid://5228764153",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "MarchingBandCap"
}
v2.killer_whale_badge = {
    ["name"] = "Killer Whale Badge",
    ["image"] = "rbxassetid://6906062457",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "KillerWhaleBadge"
}
v2.kitsune_mask = {
    ["name"] = "Kitsune Mask",
    ["image"] = "rbxassetid://5067924626",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "KitsuneMask"
}
v2.lavender_scarf = {
    ["name"] = "Lavender Scarf",
    ["image"] = "rbxassetid://4849973992",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "LavenderScarf"
}
v2.leaf_crown = {
    ["name"] = "Leaf Crown",
    ["image"] = "rbxassetid://5810013262",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LeafCrown"
}
v2.leaf_wings = {
    ["name"] = "Leaf Wings",
    ["image"] = "rbxassetid://6380730364",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2000,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "LeafWings"
}
v2.leprechaun_hat = {
    ["name"] = "Leprechaun Hat",
    ["image"] = "rbxassetid://6380730271",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "LeprechaunHat"
}
v2.lesbian_pride_pin = {
    ["name"] = "Lesbian Pride Pin",
    ["image"] = "rbxassetid://9406023514",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "LesbianPridePin"
}
v2.lgbtq_pride_pin = {
    ["name"] = "LGBTQ Pride Pin",
    ["image"] = "rbxassetid://6930594429",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "LGBTQPridePin"
}
v2.luggage = {
    ["name"] = "Luggage",
    ["image"] = "rbxassetid://4853278902",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "Luggage"
}
v2.magnifying_glass = {
    ["name"] = "Magnifying Glass",
    ["image"] = "rbxassetid://4968254373",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "MagnifyingGlass"
}
v2.monkey_king_crown = {
    ["name"] = "Monkey King Crown",
    ["image"] = "rbxassetid://5067924890",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "MonkeyKingCrown"
}
v2.monocle = {
    ["name"] = "Monocle",
    ["image"] = "rbxassetid://4849977086",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "Monocle"
}
v2.moon_tome = {
    ["name"] = "Moon Tome",
    ["image"] = "rbxassetid://4849979887",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "MoonTome"
}
v2.morion = {
    ["name"] = "Morion",
    ["image"] = "rbxassetid://4849976759",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Morion"
}
v2.nautilus_shell_necklace = {
    ["name"] = "Nautilus Shell Necklace",
    ["image"] = "rbxassetid://5726048545",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "NautilusShell"
}
v2.neck_ribbon = {
    ["name"] = "Neck Ribbon",
    ["image"] = "rbxassetid://6404037541",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "NeckRibbon"
}
v2.neckerchief = {
    ["name"] = "Neckerchief",
    ["image"] = "rbxassetid://6380730677",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "Neckerchief"
}
v2.nest = {
    ["name"] = "Nest",
    ["image"] = "rbxassetid://6380727413",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Nest"
}
v2.newsboy_cap = {
    ["name"] = "Newsboy Cap",
    ["image"] = "rbxassetid://4849976840",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "NewsboyCap"
}
v2.ninja_headband = {
    ["name"] = "Ninja Headband",
    ["image"] = "rbxassetid://4849976912",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "NinjaHeadband"
}
v2.number_one_ribbon = {
    ["name"] = "#1 Ribbon",
    ["image"] = "rbxassetid://4849978964",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "NumberOneRibbon"
}
v2.orange_backpack = {
    ["name"] = "Orange Backpack",
    ["image"] = "rbxassetid://6404037449",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "OrangeBackpack"
}
v2.orange_glasses = {
    ["name"] = "Orange Glasses",
    ["image"] = "rbxassetid://6380727237",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "OrangeGlasses"
}
v2.pan_pride_pin = {
    ["name"] = "Pan Pride Pin",
    ["image"] = "rbxassetid://5459218920",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "PanPridePin"
}
v2.party_crown = {
    ["name"] = "Party Crown",
    ["image"] = "rbxassetid://4849977244",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PartyCrown"
}
v2.pearl_necklace = {
    ["name"] = "Pearl Necklace",
    ["image"] = "rbxassetid://5415523249",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "PearlNecklace"
}
v2.picnic_basket = {
    ["name"] = "Picnic Basket",
    ["image"] = "rbxassetid://6380727177",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "PicnicBasket"
}
v2.pink_5_panel_cap = {
    ["name"] = "Pink 5 Panel Cap",
    ["image"] = "rbxassetid://5415518324",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Pink5PanelCap"
}
v2.pink_bandana = {
    ["name"] = "Pink Bandana",
    ["image"] = "rbxassetid://4849980334",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "PinkBandana"
}
v2.pink_boots = {
    ["name"] = "Pink Boots",
    ["image"] = "rbxassetid://5415518474",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "PinkBoots"
}
v2.pink_bowtie = {
    ["name"] = "Pink Bowtie",
    ["image"] = "rbxassetid://4849974786",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "PinkBowtie"
}
v2.pink_butterfly_wings = {
    ["name"] = "Pink Butterfly Wings",
    ["image"] = "rbxassetid://5444594884",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2000,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "PinkButterflyWings"
}
v2.pink_cap = {
    ["name"] = "Pink Cap",
    ["image"] = "rbxassetid://4853278362",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PinkCap"
}
v2.pink_cat_ear_headphones = {
    ["name"] = "Pink Cat Ear Headphones",
    ["image"] = "rbxassetid://4849979637",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1750,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PinkCatEarHeadphones"
}
v2.pink_designer_backpack = {
    ["name"] = "Pink Designer Backpack",
    ["image"] = "rbxassetid://5415518613",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "PinkDesignerBackpack"
}
v2.pink_heart_glasses = {
    ["name"] = "Pink Heart Glasses",
    ["image"] = "rbxassetid://4849972826",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "PinkHeartGlasses"
}
v2.pink_hightops = {
    ["name"] = "Pink Hightops",
    ["image"] = "rbxassetid://5457768184",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1500,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "PinkHightops"
}
v2.pink_instant_camera = {
    ["name"] = "Pink Instant Camera",
    ["image"] = "rbxassetid://5415518811",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "PinkInstantCamera"
}
v2.pink_lotus = {
    ["name"] = "Pink Lotus",
    ["image"] = "rbxassetid://4849977427",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PinkLotus"
}
v2.pink_sneakers = {
    ["name"] = "Pink Sneakers",
    ["image"] = "rbxassetid://5415520296",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "PinkSneakers"
}
v2.pirate_hat = {
    ["name"] = "Pirate Hat",
    ["image"] = "rbxassetid://4849977514",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PirateHat"
}
v2.pirate_hat_and_friend = {
    ["name"] = "Pirate Hat & Friend",
    ["image"] = "rbxassetid://4933495502",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PirateHatAndFriend"
}
v2.platinum_tiara = {
    ["name"] = "Platinum Tiara",
    ["image"] = "rbxassetid://5444711861",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PlatinumTiara"
}
v2.pocket_protector = {
    ["name"] = "Pocket Protector",
    ["image"] = "rbxassetid://4849978903",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "PocketProtector"
}
v2.prescription_glasses = {
    ["name"] = "Prescription Glasses",
    ["image"] = "rbxassetid://5415520468",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "PrescriptionGlasses"
}
v2.pretty_red_bow = {
    ["name"] = "Pretty Red Bow",
    ["image"] = "rbxassetid://5415520664",
    ["rarity"] = "common",
    ["cost"] = 125,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PrettyRedBow"
}
v2.propeller_hat = {
    ["name"] = "Propeller Hat",
    ["image"] = "rbxassetid://4849977607",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PropellerHat"
}
v2.purple_and_green_beads = {
    ["name"] = "Purple & Green Beads",
    ["image"] = "rbxassetid://6380727102",
    ["rarity"] = "uncommon",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "PurpleAndGreenBeads"
}
v2.purple_heart_glasses = {
    ["name"] = "Purple Heart Glasses",
    ["image"] = "rbxassetid://4849972928",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "PurpleHeartGlasses"
}
v2.purple_masquerade_mask = {
    ["name"] = "Purple Masquerade Mask",
    ["image"] = "rbxassetid://6380727007",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "PurpleMasqueradeMask"
}
v2.purple_rose = {
    ["name"] = "Purple Rose",
    ["image"] = "rbxassetid://4849977695",
    ["rarity"] = "ultra_rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "PurpleRose"
}
v2.rain_boots = {
    ["name"] = "Rain Boots",
    ["image"] = "rbxassetid://6404037362",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "RainBoots"
}
v2.rain_hat = {
    ["name"] = "Rain Hat",
    ["image"] = "rbxassetid://5415520831",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "RainHat"
}
v2.rb_battles_trophy_hat = {
    ["name"] = "RB Battles Trophy Hat",
    ["image"] = "rbxassetid://7498079214",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "RBBattlesTrophyHat"
}
v2.red_and_yellow_beads = {
    ["name"] = "Red & Yellow Beads",
    ["image"] = "rbxassetid://6380726814",
    ["rarity"] = "uncommon",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "RedAndYellowBeads"
}
v2.red_back_ribbon = {
    ["name"] = "Red Back Ribbon",
    ["image"] = "rbxassetid://6467719713",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "RedBackRibbon"
}
v2.red_beanie = {
    ["name"] = "Red Beanie",
    ["image"] = "rbxassetid://4849977830",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "RedBeanie"
}
v2.red_bowtie = {
    ["name"] = "Red Bowtie",
    ["image"] = "rbxassetid://4849974868",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "RedBowtie"
}
v2.red_butterfly = {
    ["name"] = "Red Butterfly",
    ["image"] = "rbxassetid://5457769586",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "RedButterfly"
}
v2.red_collar = {
    ["name"] = "Red Collar",
    ["image"] = "rbxassetid://4849974348",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "RedCollar"
}
v2.red_masquerade_mask = {
    ["name"] = "Red Masquerade Mask",
    ["image"] = "rbxassetid://6380847814",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "RedMasqueradeMask"
}
v2.red_necktie = {
    ["name"] = "Red Necktie",
    ["image"] = "rbxassetid://4849974932",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "RedNecktie"
}
v2.red_purse = {
    ["name"] = "Red Purse",
    ["image"] = "rbxassetid://5415520972",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "RedPurse"
}
v2.red_ribbon = {
    ["name"] = "Red Ribbon",
    ["image"] = "rbxassetid://4849977930",
    ["rarity"] = "common",
    ["cost"] = 125,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "RedRibbon"
}
v2.red_sneakers = {
    ["name"] = "Red Sneakers",
    ["image"] = "rbxassetid://5415521183",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "RedSneakers"
}
v2.reindeer_antlers = {
    ["name"] = "Reindeer Antlers",
    ["image"] = "rbxassetid://4849973276",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "ReindeerAntlers"
}
v2.respectful_mustache = {
    ["name"] = "Respectful Mustache",
    ["image"] = "rbxassetid://4933495361",
    ["rarity"] = "rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "RespectfulMustache"
}
v2.rose = {
    ["name"] = "Rose",
    ["image"] = "rbxassetid://4849978102",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Rose"
}
v2.ruff = {
    ["name"] = "Ruff",
    ["image"] = "rbxassetid://4933495425",
    ["rarity"] = "uncommon",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "Ruff"
}
v2.sailor_cap = {
    ["name"] = "Sailor Cap",
    ["image"] = "rbxassetid://4849978200",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "SailorCap"
}
v2.santa_hat = {
    ["name"] = "Santa Hat",
    ["image"] = "rbxassetid://4850382817",
    ["rarity"] = "ultra_rare",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "SantaHat"
}
v2.scythe = {
    ["name"] = "Scythe",
    ["image"] = "rbxassetid://5881348094",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "Scythe"
}
v2.shadow_aura = {
    ["name"] = "Shadow Aura",
    ["image"] = "rbxassetid://4853278537",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "ShadowAura"
}
v2.shadow_shuriken = {
    ["name"] = "Shadow Shuriken",
    ["image"] = "rbxassetid://4849980009",
    ["rarity"] = "rare",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "ShadowShuriken"
}
v2.shadow_wings = {
    ["name"] = "Shadow Wings",
    ["image"] = "rbxassetid://4849973681",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "ShadowWings"
}
v2.shark_fin = {
    ["name"] = "Shark Fin",
    ["image"] = "rbxassetid://4849972466",
    ["rarity"] = "rare",
    ["cost"] = 650,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "SharkFin"
}
v2.shuriken = {
    ["name"] = "Shuriken",
    ["image"] = "rbxassetid://4849973100",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "Shuriken"
}
v2.silver_chain = {
    ["name"] = "Silver Chain",
    ["image"] = "rbxassetid://5415521379",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "SilverChain"
}
v2.skeleton_shell = {
    ["name"] = "Skeleton Shell",
    ["image"] = "rbxassetid://4849974099",
    ["rarity"] = "rare",
    ["cost"] = 650,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "SkeletonShell"
}
v2.sketchbook = {
    ["name"] = "Sketchbook",
    ["image"] = "rbxassetid://6380723672",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "Sketchbook"
}
v2.ski_goggles = {
    ["name"] = "Ski Goggles",
    ["image"] = "rbxassetid://6060991012",
    ["rarity"] = "common",
    ["cost"] = 125,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "SkiGoggles"
}
v2.skis = {
    ["name"] = "Skis",
    ["image"] = "rbxassetid://6060990946",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "Skis"
}
v2.snowman_winter_hat = {
    ["name"] = "Snowman Winter Hat",
    ["image"] = "rbxassetid://6060990819",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "SnowmanWinterHat"
}
v2.socks_and_sandals = {
    ["name"] = "Socks & Sandals",
    ["image"] = "rbxassetid://6380723586",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "SocksAndSandals"
}
v2.sombrero = {
    ["name"] = "Sombrero",
    ["image"] = "rbxassetid://4853278310",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Sombrero"
}
v2.sperm_whale_badge = {
    ["name"] = "Sperm Whale Badge",
    ["image"] = "rbxassetid://6906062378",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "SpermWhaleBadge"
}
v2.spike_collar = {
    ["name"] = "Spike Collar",
    ["image"] = "rbxassetid://4849974434",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "SpikeCollar"
}
v2.spring_glasses = {
    ["name"] = "Spring Glasses",
    ["image"] = "rbxassetid://6380723504",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "SpringGlasses"
}
v2.strawberry_hat = {
    ["name"] = "Strawberry Hat",
    ["image"] = "rbxassetid://6380723429",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "StrawberryHat"
}
v2.striped_necktie = {
    ["name"] = "Striped Necktie",
    ["image"] = "rbxassetid://4849975012",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "StripedNecktie"
}
v2.striped_tophat = {
    ["name"] = "Striped Tophat",
    ["image"] = "rbxassetid://5881348205",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "StripedTophat"
}
v2.sun_and_moon_earrings = {
    ["name"] = "Sun & Moon Earrings",
    ["image"] = "rbxassetid://5415521810",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["equip_type"] = "earrings",
    ["model_handle"] = "SunAndMoonEarrings"
}
v2.sun_tome = {
    ["name"] = "Sun Tome",
    ["image"] = "rbxassetid://4849975162",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "SunTome"
}
v2.sunglasses = {
    ["name"] = "Sunglasses",
    ["image"] = "rbxassetid://4849973004",
    ["rarity"] = "common",
    ["cost"] = 125,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "Sunglasses"
}
v2.sunhat = {
    ["name"] = "Sunhat",
    ["image"] = "rbxassetid://5415521995",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Sunhat"
}
v2.sushi_skateboard = {
    ["name"] = "Sushi Skateboard",
    ["image"] = "rbxassetid://4849976090",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "SushiSkateboard"
}
v2.thermometer = {
    ["name"] = "Thermometer",
    ["image"] = "",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "Thermometer",
    ["temporary"] = true
}
v2.traffic_cone = {
    ["name"] = "Traffic Cone",
    ["image"] = "rbxassetid://4849978328",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "TrafficCone"
}
v2.trans_pride_pin = {
    ["name"] = "Trans Pride Pin",
    ["image"] = "rbxassetid://5415522173",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "TransPridePin"
}
v2.turtle_shell = {
    ["name"] = "Turtle Shell",
    ["image"] = "rbxassetid://4849976985",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "TurtleShell"
}
v2.tusks = {
    ["name"] = "Tusks",
    ["image"] = "rbxassetid://5726048621",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "Tusks"
}
v2.tutorial_2023_graduation_cap = {
    ["name"] = "Tutorial Graduation Cap",
    ["image"] = "rbxassetid://13670763327",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "TutorialGradCap"
}
v2.umbrella_hat = {
    ["name"] = "Umbrella Hat",
    ["image"] = "rbxassetid://6380723364",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "UmbrellaHat"
}
v2.vampire_cape = {
    ["name"] = "Vampire Cape",
    ["image"] = "rbxassetid://5881348345",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "VampireCape"
}
v2.watermelon_backpack = {
    ["name"] = "Watermelon Backpack",
    ["image"] = "rbxassetid://4849978035",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "WatermelonBackpack"
}
v2.watermelon_hat = {
    ["name"] = "Watermelon Hat",
    ["image"] = "rbxassetid://6380723294",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "WatermelonHat"
}
v2.wave_badge = {
    ["name"] = "Wave Badge",
    ["image"] = "rbxassetid://6906062307",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "WaveBadge"
}
v2.wdc_badge = {
    ["name"] = "WDC Badge",
    ["image"] = "rbxassetid://6923558512",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "WDCBadge"
}
v2.whale_badge = {
    ["name"] = "Whale Badge",
    ["image"] = "rbxassetid://6906062158",
    ["rarity"] = "common",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "chest",
    ["model_handle"] = "WhaleBadge"
}
v2.white_bandana = {
    ["name"] = "White Bandana",
    ["image"] = "rbxassetid://4849974568",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "WhiteBandana"
}
v2.white_bowtie = {
    ["name"] = "White Bowtie",
    ["image"] = "rbxassetid://4849977168",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "neck",
    ["model_handle"] = "WhiteBowtie"
}
v2.white_cozy_hood = {
    ["name"] = "White Cozy Hood",
    ["image"] = "rbxassetid://5415516615",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "WhiteCozyHood"
}
v2.white_designer_backpack = {
    ["name"] = "White Designer Backpack",
    ["image"] = "rbxassetid://5415522308",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "WhiteDesignerBackpack"
}
v2.white_purse = {
    ["name"] = "White Purse",
    ["image"] = "rbxassetid://5415522533",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "WhitePurse"
}
v2.white_visor = {
    ["name"] = "White Visor",
    ["image"] = "rbxassetid://4849978530",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "WhiteVisor"
}
v2.white_winter_hat = {
    ["name"] = "White Winter Hat",
    ["image"] = "rbxassetid://6061459658",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "WhiteWinterHat"
}
v2.windup_key = {
    ["name"] = "Windup Key",
    ["image"] = "rbxassetid://4849979019",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "WindupKey"
}
v2.winter_scarf = {
    ["name"] = "Winter Scarf",
    ["image"] = "rbxassetid://6060987995",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "WinterScarf"
}
v2.witch_boots = {
    ["name"] = "Witch Boots",
    ["image"] = "rbxassetid://5881348447",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "WitchBoots"
}
v2.witch_broom = {
    ["name"] = "Witch Broom",
    ["image"] = "rbxassetid://5881347991",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "WitchBroom"
}
v2.witch_hat = {
    ["name"] = "Witch Hat",
    ["image"] = "rbxassetid://4849977314",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "WitchHat"
}
v2.wizard_hat = {
    ["name"] = "Wizard Hat",
    ["image"] = "rbxassetid://4849978608",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "WizardHat"
}
v2.wool_beard = {
    ["name"] = "Wool Beard",
    ["image"] = "rbxassetid://6060987918",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "glasses",
    ["model_handle"] = "WoolBeard"
}
v2.yellow_5_panel_cap = {
    ["name"] = "Yellow 5 Panel Cap",
    ["image"] = "rbxassetid://5415522715",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Yellow5PanelCap"
}
v2.yellow_beanie = {
    ["name"] = "Yellow Beanie",
    ["image"] = "rbxassetid://4849978730",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "YellowBeanie"
}
v2.yellow_cap = {
    ["name"] = "Yellow Cap",
    ["image"] = "rbxassetid://4853278407",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "YellowCap"
}
v2.yellow_designer_backpack = {
    ["name"] = "Yellow Designer Backpack",
    ["image"] = "rbxassetid://5415522859",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "YellowDesignerBackpack"
}
v2.yellow_instant_camera = {
    ["name"] = "Yellow Instant Camera",
    ["image"] = "rbxassetid://5415522973",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "collar",
    ["model_handle"] = "YellowInstantCamera"
}
v2.yellow_sneakers = {
    ["name"] = "Yellow Sneakers",
    ["image"] = "rbxassetid://5415523115",
    ["rarity"] = "common",
    ["cost"] = 150,
    ["is_in_hatshop_rotation"] = true,
    ["sort_group"] = "General",
    ["accessory_type"] = "shoes",
    ["equip_type"] = "shoes",
    ["model_handle"] = "YellowSneakers"
}
return v1(v2)