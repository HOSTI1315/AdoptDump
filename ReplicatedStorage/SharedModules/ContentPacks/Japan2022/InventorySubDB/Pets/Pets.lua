--// ReplicatedStorage.SharedModules.ContentPacks.Japan2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Baku",
    ["image"] = "rbxassetid://10618035564",
    ["model"] = "Japan2022Baku",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "BakuBeingHeldDouble",
        ["eating"] = "BakuEat",
        ["flying"] = "BakuRun",
        ["hold"] = "BakuBeingHeldSingle",
        ["idle"] = "BakuIdle",
        ["running"] = "BakuRun",
        ["sit"] = "BakuSit",
        ["sleep"] = "BakuSleep"
    },
    ["tricks"] = {
        { "Sit", "BakuSit" },
        { "Joyful", "BakuJoyful" },
        { "Beg", "BakuBeg" },
        { "Jump", "BakuJump" },
        { "Trick 1", "BakuTrick1" },
        { "Trick 2", "BakuTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(191, 102, 54),
        ["Hairs1"] = Color3.fromRGB(191, 102, 54),
        ["Hairs10"] = Color3.fromRGB(191, 102, 54),
        ["Hairs11"] = Color3.fromRGB(191, 102, 54),
        ["Hairs12"] = Color3.fromRGB(191, 102, 54),
        ["Hairs13"] = Color3.fromRGB(191, 102, 54),
        ["Hairs14"] = Color3.fromRGB(191, 102, 54),
        ["Hairs2"] = Color3.fromRGB(191, 102, 54),
        ["Hairs3"] = Color3.fromRGB(191, 102, 54),
        ["Hairs5"] = Color3.fromRGB(191, 102, 54),
        ["Hairs7"] = Color3.fromRGB(191, 102, 54),
        ["Hairs8"] = Color3.fromRGB(191, 102, 54),
        ["Hairs9"] = Color3.fromRGB(191, 102, 54),
        ["LeftBackFoot"] = Color3.fromRGB(191, 102, 54),
        ["LeftBrow"] = Color3.fromRGB(191, 102, 54),
        ["LeftFrontFoot"] = Color3.fromRGB(191, 102, 54),
        ["RightBackFoot"] = Color3.fromRGB(191, 102, 54),
        ["RightBrow"] = Color3.fromRGB(191, 102, 54),
        ["RightFrontFoot"] = Color3.fromRGB(191, 102, 54),
        ["Tail10"] = Color3.fromRGB(191, 102, 54),
        ["Tail11"] = Color3.fromRGB(191, 102, 54),
        ["Tail12"] = Color3.fromRGB(191, 102, 54),
        ["Tail2"] = Color3.fromRGB(191, 102, 54),
        ["Tail3"] = Color3.fromRGB(191, 102, 54),
        ["Tail4"] = Color3.fromRGB(191, 102, 54),
        ["Tail5"] = Color3.fromRGB(191, 102, 54),
        ["Tail6"] = Color3.fromRGB(191, 102, 54),
        ["Tail7"] = Color3.fromRGB(191, 102, 54),
        ["Tail8"] = Color3.fromRGB(191, 102, 54),
        ["Tail9"] = Color3.fromRGB(191, 102, 54),
        ["Torso3"] = Color3.fromRGB(191, 102, 54)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_baku = v3
local v4 = {
    ["name"] = "Dugong",
    ["image"] = "rbxassetid://9982819219",
    ["model"] = "Japan2022Dugong",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "DugongBeingHeldDouble",
        ["eating"] = "DugongEat",
        ["flying"] = "DugongRun",
        ["hold"] = "DugongBeingHeldSingle",
        ["idle"] = "DugongIdle",
        ["running"] = "DugongRun",
        ["sit"] = "DugongSit",
        ["sleep"] = "DugongSleep"
    },
    ["tricks"] = {
        { "Sit", "DugongSit" },
        { "Joyful", "DugongJoyful" },
        { "Beg", "DugongBeg" },
        { "Jump", "DugongJump" },
        { "Trick 1", "DugongTrick1" },
        { "Trick 2", "DugongTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(102, 144, 188),
        ["Torso5"] = Color3.fromRGB(102, 144, 188)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_dugong = v4
local v5 = {
    ["name"] = "Japan Egg",
    ["image"] = "rbxassetid://10321884333",
    ["model"] = "Japan2022Egg",
    ["rarity"] = "legendary",
    ["cost"] = 750
}
local v6 = {
    ["origin"] = "Japan",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 4,
        ["offset"] = CFrame.new(0, 0.1, 0)
    },
    ["year"] = 2022
}
v5.origin_entry = v6
v5.is_egg = true
v5.anims = {
    ["double_hold"] = "EggBeingDoubleHeld",
    ["eating"] = "DogEating",
    ["hold"] = "EggBeingHeld",
    ["idle"] = "JapanEggIdle",
    ["running"] = "JapanEggRun",
    ["sit"] = "DogSit",
    ["sleep"] = "JapanEggSleep"
}
v5.ailments_to_hatch = 5
v2.japan_2022_egg = v5
local v7 = {
    ["name"] = "Ibis",
    ["image"] = "rbxassetid://10357178561",
    ["model"] = "Japan2022Ibis",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "IbisBeingHeldDouble",
        ["eating"] = "IbisEat",
        ["hold"] = "IbisBeingHeldSingle",
        ["idle"] = "IbisIdle",
        ["running"] = "IbisRun",
        ["sit"] = "IbisSit",
        ["sleep"] = "IbisSleep"
    },
    ["tricks"] = {
        { "Sit", "IbisSit" },
        { "Joyful", "IbisJoyful" },
        { "Beg", "IbisBeg" },
        { "Jump", "IbisJump" },
        { "Trick 1", "IbisTrick1" },
        { "Trick 2", "IbisTrick2" }
    },
    ["neon_parts"] = {
        ["Hair2"] = Color3.fromRGB(89, 185, 25),
        ["Head"] = Color3.fromRGB(89, 185, 25),
        ["LeftFoot"] = Color3.fromRGB(89, 185, 25),
        ["LeftWing2"] = Color3.fromRGB(89, 185, 25),
        ["RightFoot"] = Color3.fromRGB(89, 185, 25),
        ["RightWing2"] = Color3.fromRGB(89, 185, 25),
        ["Tail2"] = Color3.fromRGB(89, 185, 25)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 0.75
}
v2.japan_2022_ibis = v7
local v8 = {
    ["name"] = "Koi Carp",
    ["image"] = "rbxassetid://10606175827",
    ["model"] = "Japan2022KoiCarp",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "KoiCarpBeingHeldDouble",
        ["eating"] = "KoiCarpEat",
        ["flying"] = "KoiCarpIdle",
        ["hold"] = "KoiCarpBeingHeldSingle",
        ["idle"] = "KoiCarpIdle",
        ["running"] = "KoiCarpRun",
        ["sit"] = "KoiCarpSit",
        ["sleep"] = "KoiCarpSleep"
    },
    ["tricks"] = {
        { "Sit", "KoiCarpSit" },
        { "Joyful", "KoiCarpJoyful" },
        { "Beg", "KoiCarpBeg" },
        { "Jump", "KoiCarpJump" },
        { "Trick 1", "KoiCarpTrick1" },
        { "Trick 2", "KoiCarpTrick2" }
    },
    ["neon_parts"] = {
        ["BottomFin"] = Color3.fromRGB(209, 77, 77),
        ["DorsalFin"] = Color3.fromRGB(209, 77, 77),
        ["FrontLeftFin"] = Color3.fromRGB(209, 77, 77),
        ["FrontRightFin"] = Color3.fromRGB(209, 77, 77),
        ["Head2"] = Color3.fromRGB(209, 77, 77),
        ["Tailfin"] = Color3.fromRGB(209, 77, 77),
        ["Tailfin3"] = Color3.fromRGB(209, 77, 77),
        ["Tailfin4"] = Color3.fromRGB(209, 77, 77),
        ["Tailfin5"] = Color3.fromRGB(209, 77, 77),
        ["Torso2"] = Color3.fromRGB(209, 77, 77)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_koi_carp = v8
local v9 = {
    ["name"] = "Leopard Cat",
    ["image"] = "rbxassetid://10467419131",
    ["model"] = "Japan2022LeopardCat",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "LeopardCatBeingHeldDouble",
        ["eating"] = "LeopardCatEat",
        ["flying"] = "LeopardCatRun",
        ["hold"] = "LeopardCatBeingHeldSingle",
        ["idle"] = "LeopardCatIdle",
        ["running"] = "LeopardCatRun",
        ["sit"] = "LeopardCatSit",
        ["sleep"] = "LeopardCatSleep"
    },
    ["tricks"] = {
        { "Sit", "LeopardCatSit" },
        { "Joyful", "LeopardCatJoyful" },
        { "Beg", "LeopardCatBeg" },
        { "Jump", "LeopardCatJump" },
        { "Trick 1", "LeopardCatTrick1" },
        { "Trick 2", "LeopardCatTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(188, 112, 163),
        ["LeftEar2"] = Color3.fromRGB(188, 112, 163),
        ["LeftWhisker"] = Color3.fromRGB(188, 112, 163),
        ["RightEar2"] = Color3.fromRGB(188, 112, 163),
        ["RightWhisker"] = Color3.fromRGB(188, 112, 163),
        ["Spots"] = Color3.fromRGB(188, 112, 163),
        ["Spots2"] = Color3.fromRGB(188, 112, 163),
        ["Tail2"] = Color3.fromRGB(188, 112, 163)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_leopard_cat = v9
local v10 = {
    ["name"] = "Maneki-Neko",
    ["image"] = "rbxassetid://10695038557",
    ["model"] = "Japan2022ManekiNeko",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ManekiNekoBeingHeldDouble",
        ["eating"] = "ManekiNekoEat",
        ["flying"] = "ManekiNekoRun",
        ["hold"] = "ManekiNekoBeingHeldSingle",
        ["idle"] = "ManekiNekoIdle",
        ["running"] = "ManekiNekoRun",
        ["sit"] = "ManekiNekoSit",
        ["sleep"] = "ManekiNekoSleep"
    },
    ["tricks"] = {
        { "Sit", "ManekiNekoSit" },
        { "Joyful", "ManekiNekoJoyful" },
        { "Beg", "ManekiNekoBeg" },
        { "Jump", "ManekiNekoJump" },
        { "Trick 1", "ManekiNekoTrick1" },
        { "Trick 2", "ManekiNekoTrick2" }
    },
    ["neon_parts"] = {
        ["Bell"] = Color3.fromRGB(240, 127, 70),
        ["Collar"] = Color3.fromRGB(240, 127, 70),
        ["LeftEar2"] = Color3.fromRGB(240, 127, 70),
        ["Nose"] = Color3.fromRGB(240, 127, 70),
        ["RightEar2"] = Color3.fromRGB(240, 127, 70),
        ["Tablet1"] = Color3.fromRGB(240, 127, 70),
        ["Torso3"] = Color3.fromRGB(240, 127, 70),
        ["joint16"] = Color3.fromRGB(240, 127, 70),
        ["joint17"] = Color3.fromRGB(240, 127, 70),
        ["joint18"] = Color3.fromRGB(240, 127, 70),
        ["joint19"] = Color3.fromRGB(240, 127, 70)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_maneki_neko = v10
local v11 = {
    ["name"] = "Red Crowned Crane",
    ["image"] = "rbxassetid://10193736072",
    ["model"] = "Japan2022RedCrownedCrane",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "RedCrownedCraneBeingHeldDouble",
        ["eating"] = "RedCrownedCraneEat",
        ["hold"] = "RedCrownedCraneBeingHeldSingle",
        ["idle"] = "RedCrownedCraneIdle",
        ["running"] = "RedCrownedCraneRun",
        ["sit"] = "RedCrownedCraneSit",
        ["sleep"] = "RedCrownedCraneSleep"
    },
    ["tricks"] = {
        { "Sit", "RedCrownedCraneSit" },
        { "Joyful", "RedCrownedCraneJoyful" },
        { "Beg", "RedCrownedCraneBeg" },
        { "Jump", "RedCrownedCraneJump" },
        { "Trick 1", "RedCrownedCraneTrick1" },
        { "Trick 2", "RedCrownedCraneTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(108, 188, 179),
        ["LeftWing3"] = Color3.fromRGB(108, 188, 179),
        ["LeftWing4"] = Color3.fromRGB(108, 188, 179),
        ["LeftWing5"] = Color3.fromRGB(108, 188, 179),
        ["RightWing3"] = Color3.fromRGB(108, 188, 179),
        ["RightWing4"] = Color3.fromRGB(108, 188, 179),
        ["RightWing5"] = Color3.fromRGB(108, 188, 179),
        ["Tail"] = Color3.fromRGB(108, 188, 179),
        ["Tail2"] = Color3.fromRGB(108, 188, 179),
        ["Tail3"] = Color3.fromRGB(108, 188, 179),
        ["Tail4"] = Color3.fromRGB(108, 188, 179),
        ["Torso2"] = Color3.fromRGB(108, 188, 179)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 0.75
}
v2.japan_2022_red_crowned_crane = v11
local v12 = {
    ["name"] = "Rhino Beetle",
    ["image"] = "rbxassetid://10381386150",
    ["model"] = "Japan2022RhinoBeetle",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "RhinoBeetleBeingHeldDouble",
        ["eating"] = "RhinoBeetleEat",
        ["flying"] = "RhinoBeetleRun",
        ["hold"] = "RhinoBeetleBeingHeldSingle",
        ["idle"] = "RhinoBeetleIdle",
        ["running"] = "RhinoBeetleRun",
        ["sit"] = "RhinoBeetleSit",
        ["sleep"] = "RhinoBeetleSleep"
    },
    ["tricks"] = {
        { "Sit", "RhinoBeetleSit" },
        { "Joyful", "RhinoBeetleJoyful" },
        { "Beg", "RhinoBeetleBeg" },
        { "Jump", "RhinoBeetleJump" },
        { "Trick 1", "RhinoBeetleTrick1" },
        { "Trick 2", "RhinoBeetleTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(102, 190, 137),
        ["Head3"] = Color3.fromRGB(102, 190, 137),
        ["LeftWingCasing2"] = Color3.fromRGB(102, 190, 137),
        ["RightWingCasing2"] = Color3.fromRGB(102, 190, 137)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_rhino_beetle = v12
local v13 = {
    ["name"] = "Sado Mole",
    ["image"] = "rbxassetid://10382786163",
    ["model"] = "Japan2022SadoMole",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SadoMoleBeingHeldDouble",
        ["eating"] = "SadoMoleEat",
        ["flying"] = "SadoMoleRun",
        ["hold"] = "SadoMoleBeingHeldSingle",
        ["idle"] = "SadoMoleIdle",
        ["running"] = "SadoMoleRun",
        ["sit"] = "SadoMoleSit",
        ["sleep"] = "SadoMoleSleep"
    },
    ["tricks"] = {
        { "Sit", "SadoMoleSit" },
        { "Joyful", "SadoMoleJoyful" },
        { "Beg", "SadoMoleBeg" },
        { "Jump", "SadoMoleJump" },
        { "Trick 1", "SadoMoleTrick1" },
        { "Trick 2", "SadoMoleTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(157, 108, 225),
        ["BackRightFoot"] = Color3.fromRGB(157, 108, 225),
        ["FrontLeftFoot"] = Color3.fromRGB(157, 108, 225),
        ["FrontRightFoot"] = Color3.fromRGB(157, 108, 225),
        ["Hair"] = Color3.fromRGB(157, 108, 225),
        ["Nose"] = Color3.fromRGB(157, 108, 225),
        ["Tail"] = Color3.fromRGB(157, 108, 225),
        ["Tail2"] = Color3.fromRGB(157, 108, 225)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_sado_mole = v13
local v14 = {
    ["name"] = "Spider Crab",
    ["image"] = "rbxassetid://10639131895",
    ["model"] = "Japan2022SpiderCrab",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SpiderCrabBeingHeldDouble",
        ["eating"] = "SpiderCrabEat",
        ["flying"] = "SpiderCrabRun",
        ["hold"] = "SpiderCrabBeingHeldSingle",
        ["idle"] = "SpiderCrabIdle",
        ["running"] = "SpiderCrabRun",
        ["sit"] = "SpiderCrabSit",
        ["sleep"] = "SpiderCrabSleep"
    },
    ["tricks"] = {
        { "Sit", "SpiderCrabSit" },
        { "Joyful", "SpiderCrabJoyful" },
        { "Beg", "SpiderCrabBeg" },
        { "Jump", "SpiderCrabJump" },
        { "Trick 1", "SpiderCrabTrick1" },
        { "Trick 2", "SpiderCrabTrick2" }
    },
    ["neon_parts"] = {
        ["ArmsBackside"] = Color3.fromRGB(180, 128, 255),
        ["BackLeftFoot"] = Color3.fromRGB(180, 128, 255),
        ["BackMiddleLeftFoot"] = Color3.fromRGB(180, 128, 255),
        ["BackMiddleRightFoot"] = Color3.fromRGB(180, 128, 255),
        ["BackRightFoot"] = Color3.fromRGB(180, 128, 255),
        ["FrontLeftFoot"] = Color3.fromRGB(180, 128, 255),
        ["FrontMiddleLeftFoot"] = Color3.fromRGB(180, 128, 255),
        ["FrontMiddleRightFoot"] = Color3.fromRGB(180, 128, 255),
        ["FrontRightFoot"] = Color3.fromRGB(180, 128, 255),
        ["LegsBackside"] = Color3.fromRGB(180, 128, 255)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25,
    ["head_rotator_disabled"] = true
}
v2.japan_2022_spider_crab = v14
local v15 = {
    ["name"] = "Tanuki",
    ["image"] = "rbxassetid://10489161125",
    ["model"] = "Japan2022Tanuki",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "TanukiBeingHeldDouble",
        ["eating"] = "TanukiEat",
        ["flying"] = "TanukiRun",
        ["hold"] = "TanukiBeingHeldSingle",
        ["idle"] = "TanukiIdle",
        ["running"] = "TanukiRun",
        ["sit"] = "TanukiSit",
        ["sleep"] = "TanukiSleep"
    },
    ["tricks"] = {
        { "Sit", "TanukiSit" },
        { "Joyful", "TanukiJoyful" },
        { "Beg", "TanukiBeg" },
        { "Jump", "TanukiJump" },
        { "Trick 1", "TanukiTrick1" },
        { "Trick 2", "TanukiTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(186, 166, 117),
        ["LeftEar2"] = Color3.fromRGB(186, 166, 117),
        ["RightEar2"] = Color3.fromRGB(186, 166, 117),
        ["Tail2"] = Color3.fromRGB(186, 166, 117)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_tanuki = v15
local v16 = {
    ["name"] = "Trapdoor Snail",
    ["image"] = "rbxassetid://9913459163",
    ["model"] = "Japan2022TrapdoorSnail",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Japan",
        ["origin_items"] = { "japan_2022_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "TrapdoorSnailBeingHeldDouble",
        ["eating"] = "TrapdoorSnailEat",
        ["flying"] = "TrapdoorSnailRun",
        ["hold"] = "TrapdoorSnailBeingHeldSingle",
        ["idle"] = "TrapdoorSnailIdle",
        ["running"] = "TrapdoorSnailRun",
        ["sit"] = "TrapdoorSnailSit",
        ["sleep"] = "TrapdoorSnailSleep"
    },
    ["tricks"] = {
        { "Sit", "TrapdoorSnailSit" },
        { "Joyful", "TrapdoorSnailJoyful" },
        { "Beg", "TrapdoorSnailBeg" },
        { "Jump", "TrapdoorSnailJump" },
        { "Trick 1", "TrapdoorSnailTrick1" },
        { "Trick 2", "TrapdoorSnailTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(99, 94, 255),
        ["RightEar"] = Color3.fromRGB(99, 94, 255),
        ["Torso3"] = Color3.fromRGB(99, 94, 255)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.japan_2022_trapdoor_snail = v16
return v1(v2)