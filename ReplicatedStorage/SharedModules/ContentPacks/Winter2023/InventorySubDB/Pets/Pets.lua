--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Arctic Hare",
    ["image"] = "rbxassetid://15503941919",
    ["model"] = "Winter2023ArcticHare",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2023_hare_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023ArcticHareBeingHeldDouble",
        ["eating"] = "Winter2023ArcticHareEat",
        ["flying"] = "Winter2023ArcticHareRun",
        ["hold"] = "Winter2023ArcticHareBeingHeldSingle",
        ["idle"] = "Winter2023ArcticHareIdle",
        ["running"] = "Winter2023ArcticHareRun",
        ["sit"] = "Winter2023ArcticHareSit",
        ["sleep"] = "Winter2023ArcticHareSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023ArcticHareSit" },
        { "Joyful", "Winter2023ArcticHareJoyful" },
        { "Beg", "Winter2023ArcticHareBeg" },
        { "Jump", "Winter2023ArcticHareJump" },
        { "Trick 1", "Winter2023ArcticHareTrick1" },
        { "Trick 2", "Winter2023ArcticHareTrick2" }
    },
    ["neon_parts"] = {
        ["Brows"] = Color3.fromRGB(82, 69, 188),
        ["Hair"] = Color3.fromRGB(82, 69, 188),
        ["Hair2"] = Color3.fromRGB(82, 69, 188),
        ["LeftBackFoot"] = Color3.fromRGB(82, 69, 188),
        ["LeftBrow"] = Color3.fromRGB(82, 69, 188),
        ["LeftEar2"] = Color3.fromRGB(82, 69, 188),
        ["LeftFrontFoot"] = Color3.fromRGB(82, 69, 188),
        ["LeftWhiskers"] = Color3.fromRGB(82, 69, 188),
        ["Nose"] = Color3.fromRGB(82, 69, 188),
        ["RightBackFoot"] = Color3.fromRGB(82, 69, 188),
        ["RightBrow"] = Color3.fromRGB(82, 69, 188),
        ["RightEar2"] = Color3.fromRGB(82, 69, 188),
        ["RightFrontFoot"] = Color3.fromRGB(82, 69, 188),
        ["RightWhiskers"] = Color3.fromRGB(82, 69, 188),
        ["Tail"] = Color3.fromRGB(82, 69, 188),
        ["Tail2"] = Color3.fromRGB(82, 69, 188),
        ["Torso2"] = Color3.fromRGB(82, 69, 188),
        ["Torso3"] = Color3.fromRGB(82, 69, 188),
        ["Whiskers"] = Color3.fromRGB(82, 69, 188)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_arctic_hare = v3
local v4 = {
    ["name"] = "Beluga Whale",
    ["image"] = "rbxassetid://15348350458",
    ["model"] = "Winter2023BelugaWhale",
    ["rarity"] = "common",
    ["cost"] = 3300,
    ["currency_id"] = "gingerbread_2023",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023BelugaWhaleBeingHeldDouble",
        ["eating"] = "Winter2023BelugaWhaleEat",
        ["flying"] = "Winter2023BelugaWhaleRun",
        ["hold"] = "Winter2023BelugaWhaleBeingHeldSingle",
        ["idle"] = "Winter2023BelugaWhaleIdle",
        ["running"] = "Winter2023BelugaWhaleRun",
        ["sit"] = "Winter2023BelugaWhaleSit",
        ["sleep"] = "Winter2023BelugaWhaleSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023BelugaWhaleSit" },
        { "Joyful", "Winter2023BelugaWhaleJoyful" },
        { "Beg", "Winter2023BelugaWhaleBeg" },
        { "Jump", "Winter2023BelugaWhaleJump" },
        { "Trick 1", "Winter2023BelugaWhaleTrick1" },
        { "Trick 2", "Winter2023BelugaWhaleTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFin"] = Color3.fromRGB(124, 185, 131),
        ["RightFin"] = Color3.fromRGB(124, 185, 131),
        ["Tail"] = Color3.fromRGB(124, 185, 131)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_beluga_whale = v4
local v5 = {
    ["name"] = "Candy Hare",
    ["image"] = "rbxassetid://15504845135",
    ["model"] = "Winter2023CandyHare",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2023_hare_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023CandyHareBeingHeldDouble",
        ["eating"] = "Winter2023CandyHareEat",
        ["flying"] = "Winter2023CandyHareRun",
        ["hold"] = "Winter2023CandyHareBeingHeldSingle",
        ["idle"] = "Winter2023CandyHareIdle",
        ["running"] = "Winter2023CandyHareRun",
        ["sit"] = "Winter2023CandyHareSit",
        ["sleep"] = "Winter2023CandyHareSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023CandyHareSit" },
        { "Joyful", "Winter2023CandyHareJoyful" },
        { "Beg", "Winter2023CandyHareBeg" },
        { "Jump", "Winter2023CandyHareJump" },
        { "Trick 1", "Winter2023CandyHareTrick1" },
        { "Trick 2", "Winter2023CandyHareTrick2" }
    },
    ["neon_parts"] = {
        ["Brows"] = Color3.fromRGB(189, 78, 132),
        ["Hair"] = Color3.fromRGB(189, 78, 132),
        ["LeftBackFoot"] = Color3.fromRGB(189, 78, 132),
        ["LeftBrow"] = Color3.fromRGB(189, 78, 132),
        ["LeftEar"] = Color3.fromRGB(189, 78, 132),
        ["LeftFrontFoot"] = Color3.fromRGB(189, 78, 132),
        ["LeftWhiskers"] = Color3.fromRGB(189, 78, 132),
        ["Nose"] = Color3.fromRGB(189, 78, 132),
        ["RightBackFoot"] = Color3.fromRGB(189, 78, 132),
        ["RightBrow"] = Color3.fromRGB(189, 78, 132),
        ["RightEar"] = Color3.fromRGB(189, 78, 132),
        ["RightFrontFoot"] = Color3.fromRGB(189, 78, 132),
        ["RightWhiskers"] = Color3.fromRGB(189, 78, 132),
        ["Tail2"] = Color3.fromRGB(189, 78, 132),
        ["Torso2"] = Color3.fromRGB(189, 78, 132),
        ["Torso3"] = Color3.fromRGB(189, 78, 132),
        ["Whiskers"] = Color3.fromRGB(189, 78, 132)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_candy_hare = v5
local v6 = {
    ["name"] = "Chocolate Chip Bat Dragon",
    ["image"] = "rbxassetid://15365667976",
    ["model"] = "Winter2023ChocolateChipBatDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023ChocolateChipBatDragonBeingHeldDouble",
        ["eating"] = "Winter2023ChocolateChipBatDragonEat",
        ["flying"] = "Winter2023ChocolateChipBatDragonFly",
        ["hold"] = "Winter2023ChocolateChipBatDragonBeingHeldSingle",
        ["idle"] = "Winter2023ChocolateChipBatDragonIdle",
        ["running"] = "Winter2023ChocolateChipBatDragonRun",
        ["sit"] = "Winter2023ChocolateChipBatDragonSit",
        ["sleep"] = "Winter2023ChocolateChipBatDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023ChocolateChipBatDragonSit" },
        { "Joyful", "Winter2023ChocolateChipBatDragonJoyful" },
        { "Beg", "Winter2023ChocolateChipBatDragonBeg" },
        { "Jump", "Winter2023ChocolateChipBatDragonJump" },
        { "Trick 1", "Winter2023ChocolateChipBatDragonTrick1" },
        { "Trick 2", "Winter2023ChocolateChipBatDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Fangs"] = Color3.fromRGB(188, 91, 35),
        ["Freckles"] = Color3.fromRGB(188, 91, 35),
        ["Horns"] = Color3.fromRGB(188, 91, 35),
        ["LeftBackFoot"] = Color3.fromRGB(188, 91, 35),
        ["LeftEar2"] = Color3.fromRGB(188, 91, 35),
        ["LeftFrontFoot"] = Color3.fromRGB(188, 91, 35),
        ["LeftWing"] = Color3.fromRGB(188, 91, 35),
        ["RightBackFoot"] = Color3.fromRGB(188, 91, 35),
        ["RightEar2"] = Color3.fromRGB(188, 91, 35),
        ["RightFrontFoot"] = Color3.fromRGB(188, 91, 35),
        ["RightWing"] = Color3.fromRGB(188, 91, 35),
        ["Tail2"] = Color3.fromRGB(188, 91, 35),
        ["Torso2"] = Color3.fromRGB(188, 91, 35)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_chocolate_chip_bat_dragon = v6
local v7 = {
    ["name"] = "Christmas Pudding Pup",
    ["image"] = "rbxassetid://15547272520",
    ["model"] = "Winter2023ChristmasPuddingPup",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023ChristmasPuddingPupBeingHeldDouble",
        ["eating"] = "Winter2023ChristmasPuddingPupEat",
        ["flying"] = "Winter2023ChristmasPuddingPupRun",
        ["hold"] = "Winter2023ChristmasPuddingPupBeingHeldSingle",
        ["idle"] = "Winter2023ChristmasPuddingPupIdle",
        ["running"] = "Winter2023ChristmasPuddingPupRun",
        ["sit"] = "Winter2023ChristmasPuddingPupSit",
        ["sleep"] = "Winter2023ChristmasPuddingPupSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023ChristmasPuddingPupSit" },
        { "Joyful", "Winter2023ChristmasPuddingPupJoyful" },
        { "Beg", "Winter2023ChristmasPuddingPupBeg" },
        { "Jump", "Winter2023ChristmasPuddingPupJump" },
        { "Trick 1", "Winter2023ChristmasPuddingPupTrick1" },
        { "Trick 2", "Winter2023ChristmasPuddingPupTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(188, 37, 27),
        ["Icing"] = Color3.fromRGB(45, 99, 225),
        ["LeftLeaf"] = Color3.fromRGB(188, 37, 27),
        ["Nose"] = Color3.fromRGB(188, 37, 27),
        ["RightLeaf"] = Color3.fromRGB(188, 37, 27)
    }
}
v2.winter_2023_christmas_pudding_pup = v7
local v8 = {
    ["name"] = "Eggnog Dog",
    ["image"] = "rbxassetid://15508248825",
    ["model"] = "Winter2023EggnogDog",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2023_story_game_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023EggnogDogBeingHeldDouble",
        ["eating"] = "Winter2023EggnogDogEat",
        ["flying"] = "Winter2023EggnogDogRun",
        ["hold"] = "Winter2023EggnogDogBeingHeldSingle",
        ["idle"] = "Winter2023EggnogDogIdle",
        ["running"] = "Winter2023EggnogDogRun",
        ["sit"] = "Winter2023EggnogDogSit",
        ["sleep"] = "Winter2023EggnogDogSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023EggnogDogSit" },
        { "Joyful", "Winter2023EggnogDogJoyful" },
        { "Beg", "Winter2023EggnogDogBeg" },
        { "Jump", "Winter2023EggnogDogJump" },
        { "Trick 1", "Winter2023EggnogDogTrick1" },
        { "Trick 2", "Winter2023EggnogDogTrick2" }
    },
    ["neon_parts"] = {
        ["Head4"] = Color3.fromRGB(186, 95, 186),
        ["Head5"] = Color3.fromRGB(186, 95, 186),
        ["Stick"] = Color3.fromRGB(186, 95, 186),
        ["Torso2"] = Color3.fromRGB(186, 95, 186)
    }
}
v2.winter_2023_eggnog_dog = v8
local v9 = {
    ["name"] = "Eggnog Hare",
    ["image"] = "rbxassetid://15504846154",
    ["model"] = "Winter2023EggnogHare",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2023_hare_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023EggnogHareBeingHeldDouble",
        ["eating"] = "Winter2023EggnogHareEat",
        ["flying"] = "Winter2023EggnogHareRun",
        ["hold"] = "Winter2023EggnogHareBeingHeldSingle",
        ["idle"] = "Winter2023EggnogHareIdle",
        ["running"] = "Winter2023EggnogHareRun",
        ["sit"] = "Winter2023EggnogHareSit",
        ["sleep"] = "Winter2023EggnogHareSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023EggnogHareSit" },
        { "Joyful", "Winter2023EggnogHareJoyful" },
        { "Beg", "Winter2023EggnogHareBeg" },
        { "Jump", "Winter2023EggnogHareJump" },
        { "Trick 1", "Winter2023EggnogHareTrick1" },
        { "Trick 2", "Winter2023EggnogHareTrick2" }
    },
    ["neon_parts"] = {
        ["Brows"] = Color3.fromRGB(184, 135, 86),
        ["Hair"] = Color3.fromRGB(184, 135, 86),
        ["LeftBackFoot2"] = Color3.fromRGB(184, 135, 86),
        ["LeftBrow"] = Color3.fromRGB(184, 135, 86),
        ["LeftEar"] = Color3.fromRGB(184, 135, 86),
        ["LeftFrontFoot2"] = Color3.fromRGB(184, 135, 86),
        ["LeftWhiskers"] = Color3.fromRGB(184, 135, 86),
        ["Nose"] = Color3.fromRGB(184, 135, 86),
        ["RightBackFoot2"] = Color3.fromRGB(184, 135, 86),
        ["RightBrow"] = Color3.fromRGB(184, 135, 86),
        ["RightEar"] = Color3.fromRGB(184, 135, 86),
        ["RightEar2"] = Color3.fromRGB(184, 135, 86),
        ["RightEar3"] = Color3.fromRGB(184, 135, 86),
        ["RightFrontFoot2"] = Color3.fromRGB(184, 135, 86),
        ["RightWhiskers"] = Color3.fromRGB(184, 135, 86),
        ["Tail"] = Color3.fromRGB(184, 135, 86),
        ["Torso2"] = Color3.fromRGB(184, 135, 86),
        ["Whiskers"] = Color3.fromRGB(184, 135, 86)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_eggnog_hare = v9
local v10 = {
    ["name"] = "Fleur De Ice",
    ["image"] = "rbxassetid://15485137935",
    ["model"] = "Winter2023FleurDeIce",
    ["rarity"] = "legendary",
    ["cost"] = 130000,
    ["currency_id"] = "gingerbread_2023",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023FleurDeIceBeingHeldDouble",
        ["eating"] = "Winter2023FleurDeIceEat",
        ["flying"] = "Winter2023FleurDeIceRun",
        ["hold"] = "Winter2023FleurDeIceBeingHeldSingle",
        ["idle"] = "Winter2023FleurDeIceIdle",
        ["running"] = "Winter2023FleurDeIceRun",
        ["sit"] = "Winter2023FleurDeIceSit",
        ["sleep"] = "Winter2023FleurDeIceSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023FleurDeIceSit" },
        { "Joyful", "Winter2023FleurDeIceJoyful" },
        { "Beg", "Winter2023FleurDeIceBeg" },
        { "Jump", "Winter2023FleurDeIceJump" },
        { "Trick 1", "Winter2023FleurDeIceTrick1" },
        { "Trick 2", "Winter2023FleurDeIceTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot2"] = Color3.fromRGB(106, 150, 189),
        ["BackRightFoot2"] = Color3.fromRGB(106, 150, 189),
        ["FrontLeftFoot2"] = Color3.fromRGB(106, 150, 189),
        ["FrontRightFoot2"] = Color3.fromRGB(106, 150, 189),
        ["LeftEar"] = Color3.fromRGB(106, 150, 189),
        ["LeftHorn"] = Color3.fromRGB(106, 150, 189),
        ["LeftHorn2"] = Color3.fromRGB(185, 186, 168),
        ["RightEar"] = Color3.fromRGB(106, 150, 189),
        ["RightHorn"] = Color3.fromRGB(106, 150, 189),
        ["RightHorn2"] = Color3.fromRGB(185, 186, 168),
        ["Tail2"] = Color3.fromRGB(185, 186, 168),
        ["Tail4"] = Color3.fromRGB(185, 186, 168),
        ["Torso2"] = Color3.fromRGB(106, 150, 189)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_fleur_de_ice = v10
local v11 = {
    ["name"] = "Gingerbread Hare",
    ["image"] = "rbxassetid://15504847683",
    ["model"] = "Winter2023GingerbreadHare",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2023_hare_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023GingerbreadHareBeingHeldDouble",
        ["eating"] = "Winter2023GingerbreadHareEat",
        ["flying"] = "Winter2023GingerbreadHareRun",
        ["hold"] = "Winter2023GingerbreadHareBeingHeldSingle",
        ["idle"] = "Winter2023GingerbreadHareIdle",
        ["running"] = "Winter2023GingerbreadHareRun",
        ["sit"] = "Winter2023GingerbreadHareSit",
        ["sleep"] = "Winter2023GingerbreadHareSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023GingerbreadHareSit" },
        { "Joyful", "Winter2023GingerbreadHareJoyful" },
        { "Beg", "Winter2023GingerbreadHareBeg" },
        { "Jump", "Winter2023GingerbreadHareJump" },
        { "Trick 1", "Winter2023GingerbreadHareTrick1" },
        { "Trick 2", "Winter2023GingerbreadHareTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(188, 97, 27),
        ["Head2"] = Color3.fromRGB(188, 97, 27),
        ["LeftBackFoot2"] = Color3.fromRGB(188, 97, 27),
        ["LeftEar2"] = Color3.fromRGB(188, 97, 27),
        ["LeftFrontFoot2"] = Color3.fromRGB(188, 97, 27),
        ["Nose"] = Color3.fromRGB(188, 97, 27),
        ["RightBackFoot2"] = Color3.fromRGB(188, 97, 27),
        ["RightEar2"] = Color3.fromRGB(188, 97, 27),
        ["RightFrontFoot2"] = Color3.fromRGB(188, 97, 27),
        ["Tail2"] = Color3.fromRGB(188, 97, 27),
        ["Torso2"] = Color3.fromRGB(188, 97, 27),
        ["Torso4"] = Color3.fromRGB(188, 97, 27)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_gingerbread_hare = v11
local v12 = {
    ["name"] = "Gingerbread Mouse",
    ["image"] = "rbxassetid://15383967605",
    ["model"] = "Winter2023GingerbreadMouse",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023GingerbreadMouseBeingHeldDouble",
        ["eating"] = "Winter2023GingerbreadMouseEat",
        ["flying"] = "Winter2023GingerbreadMouseRun",
        ["hold"] = "Winter2023GingerbreadMouseBeingHeldSingle",
        ["idle"] = "Winter2023GingerbreadMouseIdle",
        ["running"] = "Winter2023GingerbreadMouseRun",
        ["sit"] = "Winter2023GingerbreadMouseSit",
        ["sleep"] = "Winter2023GingerbreadMouseSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023GingerbreadMouseSit" },
        { "Joyful", "Winter2023GingerbreadMouseJoyful" },
        { "Beg", "Winter2023GingerbreadMouseBeg" },
        { "Jump", "Winter2023GingerbreadMouseJump" },
        { "Trick 1", "Winter2023GingerbreadMouseTrick1" },
        { "Trick 2", "Winter2023GingerbreadMouseTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot2"] = Color3.fromRGB(188, 109, 164),
        ["BackRightFoot2"] = Color3.fromRGB(188, 109, 164),
        ["FrontLeftFoot2"] = Color3.fromRGB(188, 109, 164),
        ["FrontRightFoot2"] = Color3.fromRGB(188, 109, 164),
        ["Head2"] = Color3.fromRGB(188, 109, 164),
        ["Head3"] = Color3.fromRGB(188, 109, 164),
        ["LeftEar2"] = Color3.fromRGB(188, 109, 164),
        ["Nose"] = Color3.fromRGB(188, 37, 27),
        ["RightEar2"] = Color3.fromRGB(188, 109, 164),
        ["Tail2"] = Color3.fromRGB(188, 109, 164),
        ["Tail3"] = Color3.fromRGB(188, 37, 27),
        ["Torso2"] = Color3.fromRGB(188, 109, 164),
        ["Torso3"] = Color3.fromRGB(188, 37, 27)
    }
}
v2.winter_2023_gingerbread_mouse = v12
local v13 = {
    ["name"] = "Glacier Kitsune",
    ["image"] = "rbxassetid://15570696642",
    ["model"] = "Winter2023GlacierKitsune",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023GlacierKitsuneBeingHeldDouble",
        ["eating"] = "Winter2023GlacierKitsuneEat",
        ["flying"] = "Winter2023GlacierKitsuneRun",
        ["hold"] = "Winter2023GlacierKitsuneBeingHeldSingle",
        ["idle"] = "Winter2023GlacierKitsuneIdle",
        ["running"] = "Winter2023GlacierKitsuneRun",
        ["sit"] = "Winter2023GlacierKitsuneSit",
        ["sleep"] = "Winter2023GlacierKitsuneSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023GlacierKitsuneSit" },
        { "Joyful", "Winter2023GlacierKitsuneJoyful" },
        { "Beg", "Winter2023GlacierKitsuneBeg" },
        { "Jump", "Winter2023GlacierKitsuneJump" },
        { "Trick 1", "Winter2023GlacierKitsuneTrick1" },
        { "Trick 2", "Winter2023GlacierKitsuneTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(72, 112, 186),
        ["Head3"] = Color3.fromRGB(72, 112, 186),
        ["LeftEar2"] = Color3.fromRGB(72, 112, 186),
        ["RightEar2"] = Color3.fromRGB(72, 112, 186),
        ["TailA2"] = Color3.fromRGB(72, 112, 186),
        ["TailB2"] = Color3.fromRGB(72, 112, 186),
        ["TailC2"] = Color3.fromRGB(72, 112, 186),
        ["TailD2"] = Color3.fromRGB(72, 112, 186),
        ["TailE2"] = Color3.fromRGB(72, 112, 186),
        ["TailF2"] = Color3.fromRGB(72, 112, 186),
        ["TailG2"] = Color3.fromRGB(72, 112, 186),
        ["Torso2"] = Color3.fromRGB(72, 112, 186),
        ["Torso3"] = Color3.fromRGB(72, 112, 186)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_glacier_kitsune = v13
local v14 = {
    ["name"] = "Harp Seal",
    ["image"] = "rbxassetid://15547904644",
    ["model"] = "Winter2023HarpSeal",
    ["rarity"] = "uncommon",
    ["cost"] = 10000,
    ["currency_id"] = "gingerbread_2023",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023HarpSealBeingHeldDouble",
        ["eating"] = "Winter2023HarpSealEat",
        ["flying"] = "Winter2023HarpSealRun",
        ["hold"] = "Winter2023HarpSealBeingHeldSingle",
        ["idle"] = "Winter2023HarpSealIdle",
        ["running"] = "Winter2023HarpSealRun",
        ["sit"] = "Winter2023HarpSealSit",
        ["sleep"] = "Winter2023HarpSealSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023HarpSealSit" },
        { "Joyful", "Winter2023HarpSealJoyful" },
        { "Beg", "Winter2023HarpSealBeg" },
        { "Jump", "Winter2023HarpSealJump" },
        { "Trick 1", "Winter2023HarpSealTrick1" },
        { "Trick 2", "Winter2023HarpSealTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFlipper"] = Color3.fromRGB(96, 110, 190),
        ["LeftFlipper2"] = Color3.fromRGB(96, 110, 190),
        ["LeftFlipper3"] = Color3.fromRGB(96, 110, 190),
        ["RightFlipper"] = Color3.fromRGB(96, 110, 190),
        ["RightFlipper2"] = Color3.fromRGB(96, 110, 190),
        ["RightFlipper3"] = Color3.fromRGB(96, 110, 190),
        ["Tail"] = Color3.fromRGB(96, 110, 190),
        ["Tail2"] = Color3.fromRGB(96, 110, 190),
        ["Tail3"] = Color3.fromRGB(96, 110, 190)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["head_rotator_disabled"] = true
}
v2.winter_2023_harp_seal = v14
local v15 = {
    ["name"] = "Nutcracker Squirrel",
    ["image"] = "rbxassetid://15369729071",
    ["model"] = "Winter2023NutcrackerSquirrel",
    ["rarity"] = "rare",
    ["cost"] = 29000,
    ["currency_id"] = "gingerbread_2023"
}
local v16 = {
    ["origin"] = "Winter",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 3,
        ["offset"] = CFrame.new(0, 0.5, 0.7)
    },
    ["year"] = 2023
}
v15.origin_entry = v16
v15.anims = {
    ["double_hold"] = "Winter2023NutcrackerSquirrelBeingHeldDouble",
    ["eating"] = "Winter2023NutcrackerSquirrelEat",
    ["flying"] = "Winter2023NutcrackerSquirrelRun",
    ["hold"] = "Winter2023NutcrackerSquirrelBeingHeldSingle",
    ["idle"] = "Winter2023NutcrackerSquirrelIdle",
    ["running"] = "Winter2023NutcrackerSquirrelRun",
    ["sit"] = "Winter2023NutcrackerSquirrelSit",
    ["sleep"] = "Winter2023NutcrackerSquirrelSleep"
}
v15.tricks = {
    { "Sit", "Winter2023NutcrackerSquirrelSit" },
    { "Joyful", "Winter2023NutcrackerSquirrelJoyful" },
    { "Beg", "Winter2023NutcrackerSquirrelBeg" },
    { "Jump", "Winter2023NutcrackerSquirrelJump" },
    { "Trick 1", "Winter2023NutcrackerSquirrelTrick1" },
    { "Trick 2", "Winter2023NutcrackerSquirrelTrick2" }
}
v15.neon_parts = {
    ["Hat2"] = Color3.fromRGB(155, 188, 114),
    ["LeftEar2"] = Color3.fromRGB(155, 188, 114),
    ["RightEar2"] = Color3.fromRGB(155, 188, 114),
    ["Tail3"] = Color3.fromRGB(155, 188, 114),
    ["Torso2"] = Color3.fromRGB(155, 188, 114)
}
v15.generate_npc_furniture_on_runtime = true
v2.winter_2023_nutcracker_squirrel = v15
local v17 = {
    ["name"] = "Peppermint Penguin",
    ["image"] = "rbxassetid://15302316802",
    ["model"] = "Winter2023PeppermintPenguin",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023PeppermintPenguinBeingHeldDouble",
        ["eating"] = "Winter2023PeppermintPenguinEat",
        ["flying"] = "Winter2023PeppermintPenguinRun",
        ["hold"] = "Winter2023PeppermintPenguinBeingHeldSingle",
        ["idle"] = "Winter2023PeppermintPenguinIdle",
        ["running"] = "Winter2023PeppermintPenguinRun",
        ["sit"] = "Winter2023PeppermintPenguinSit",
        ["sleep"] = "Winter2023PeppermintPenguinSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023PeppermintPenguinSit" },
        { "Joyful", "Winter2023PeppermintPenguinJoyful" },
        { "Beg", "Winter2023PeppermintPenguinBeg" },
        { "Jump", "Winter2023PeppermintPenguinJump" },
        { "Trick 1", "Winter2023PeppermintPenguinTrick1" },
        { "Trick 2", "Winter2023PeppermintPenguinTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(7, 181, 85),
        ["BeakBot"] = Color3.fromRGB(7, 181, 85),
        ["BeakTop"] = Color3.fromRGB(7, 181, 85),
        ["Freckles"] = Color3.fromRGB(7, 181, 85),
        ["Hair"] = Color3.fromRGB(7, 181, 85),
        ["LeftFoot"] = Color3.fromRGB(7, 181, 85),
        ["LeftWing"] = Color3.fromRGB(7, 181, 85),
        ["RightFoot"] = Color3.fromRGB(7, 181, 85),
        ["RightWing"] = Color3.fromRGB(7, 181, 85),
        ["Tail"] = Color3.fromRGB(7, 181, 85),
        ["Torso"] = Color3.fromRGB(7, 181, 85)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["head_rotator_disabled"] = true
}
v2.winter_2023_peppermint_penguin = v17
local v18 = {
    ["name"] = "Snow Monkey",
    ["image"] = "rbxassetid://15555939727",
    ["model"] = "Winter2023SnowMonkey",
    ["rarity"] = "ultra_rare",
    ["cost"] = 58000,
    ["currency_id"] = "gingerbread_2023",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Winter2023SnowMonkeyBeingHeldDouble",
        ["eating"] = "Winter2023SnowMonkeyEat",
        ["flying"] = "Winter2023SnowMonkeyRun",
        ["hold"] = "Winter2023SnowMonkeyBeingHeldSingle",
        ["idle"] = "Winter2023SnowMonkeyIdle",
        ["running"] = "Winter2023SnowMonkeyRun",
        ["sit"] = "Winter2023SnowMonkeySit",
        ["sleep"] = "Winter2023SnowMonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2023SnowMonkeySit" },
        { "Joyful", "Winter2023SnowMonkeyJoyful" },
        { "Beg", "Winter2023SnowMonkeyBeg" },
        { "Jump", "Winter2023SnowMonkeyJump" },
        { "Trick 1", "Winter2023SnowMonkeyTrick1" },
        { "Trick 2", "Winter2023SnowMonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(184, 112, 83),
        ["Head3"] = Color3.fromRGB(184, 112, 83),
        ["LeftArm"] = Color3.fromRGB(184, 112, 83),
        ["LeftArm2"] = Color3.fromRGB(184, 112, 83),
        ["LeftArm4"] = Color3.fromRGB(184, 112, 83),
        ["LeftEar"] = Color3.fromRGB(184, 112, 83),
        ["LeftEar2"] = Color3.fromRGB(184, 112, 83),
        ["RightArm"] = Color3.fromRGB(184, 112, 83),
        ["RightArm2"] = Color3.fromRGB(184, 112, 83),
        ["RightArm4"] = Color3.fromRGB(184, 112, 83),
        ["RightEar"] = Color3.fromRGB(184, 112, 83),
        ["RightEar2"] = Color3.fromRGB(184, 112, 83),
        ["Tail"] = Color3.fromRGB(184, 112, 83)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2023_snow_monkey = v18
local v19 = {
    ["name"] = "Christmas Future Egg",
    ["image"] = "rbxassetid://15227882502",
    ["model"] = "Winter2023StoryGameEgg",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "Winter2023StoryGameEggIdle",
        ["eating"] = "Winter2023StoryGameEggIdle",
        ["hold"] = "Winter2023StoryGameEggIdle",
        ["idle"] = "Winter2023StoryGameEggIdle",
        ["running"] = "Winter2023StoryGameEggRun",
        ["sit"] = "Winter2023StoryGameEggIdle",
        ["sleep"] = "Winter2023StoryGameEggIdle"
    },
    ["ailments_to_hatch"] = 4
}
v2.winter_2023_story_game_egg = v19
return v1(v2)