--// ReplicatedStorage.SharedModules.ContentPacks.Urban2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Alley Cat",
    ["image"] = "rbxassetid://14276930615",
    ["model"] = "Urban2023AlleyCat",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023AlleyCatBeingHeldDouble",
        ["eating"] = "Urban2023AlleyCatEat",
        ["hold"] = "Urban2023AlleyCatBeingHeldSingle",
        ["idle"] = "Urban2023AlleyCatIdle",
        ["running"] = "Urban2023AlleyCatRun",
        ["sit"] = "Urban2023AlleyCatSit",
        ["sleep"] = "Urban2023AlleyCatSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023AlleyCatSit" },
        { "Joyful", "Urban2023AlleyCatJoyful" },
        { "Beg", "Urban2023AlleyCatBeg" },
        { "Jump", "Urban2023AlleyCatJump" },
        { "Trick 1", "Urban2023AlleyCatTrick1" },
        { "Trick 2", "Urban2023AlleyCatTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(188, 89, 18),
        ["Hair2"] = Color3.fromRGB(188, 89, 18),
        ["Hair3"] = Color3.fromRGB(188, 89, 18),
        ["LeftBackFoot"] = Color3.fromRGB(188, 89, 18),
        ["LeftEar2"] = Color3.fromRGB(188, 89, 18),
        ["LeftFrontFoot"] = Color3.fromRGB(188, 89, 18),
        ["Nose"] = Color3.fromRGB(188, 89, 18),
        ["RightBackFoot"] = Color3.fromRGB(188, 89, 18),
        ["RightEar2"] = Color3.fromRGB(188, 89, 18),
        ["RightFrontFoot"] = Color3.fromRGB(188, 89, 18),
        ["Tail2"] = Color3.fromRGB(188, 89, 18),
        ["Torso3"] = Color3.fromRGB(188, 89, 18),
        ["Whiskers"] = Color3.fromRGB(188, 89, 18)
    }
}
v2.urban_2023_alley_cat = v3
local v4 = {
    ["name"] = "Billy Goat",
    ["image"] = "rbxassetid://13894724323",
    ["model"] = "Urban2023BillyGoat",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023BillyGoatBeingHeldDouble",
        ["eating"] = "Urban2023BillyGoatEat",
        ["hold"] = "Urban2023BillyGoatBeingHeldSingle",
        ["idle"] = "Urban2023BillyGoatIdle",
        ["running"] = "Urban2023BillyGoatRun",
        ["sit"] = "Urban2023BillyGoatSit",
        ["sleep"] = "Urban2023BillyGoatSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023BillyGoatSit" },
        { "Joyful", "Urban2023BillyGoatJoyful" },
        { "Beg", "Urban2023BillyGoatBeg" },
        { "Jump", "Urban2023BillyGoatJump" },
        { "Trick 1", "Urban2023BillyGoatTrick1" },
        { "Trick 2", "Urban2023BillyGoatTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(124, 185, 91),
        ["BackRightFoot"] = Color3.fromRGB(124, 185, 91),
        ["FrontLeftFoot"] = Color3.fromRGB(124, 185, 91),
        ["FrontRightFoot"] = Color3.fromRGB(124, 185, 91),
        ["Head2"] = Color3.fromRGB(124, 185, 91),
        ["LeftEar"] = Color3.fromRGB(124, 185, 91),
        ["LeftHorn"] = Color3.fromRGB(124, 185, 91),
        ["RightEar"] = Color3.fromRGB(124, 185, 91),
        ["RightHorn"] = Color3.fromRGB(124, 185, 91),
        ["Tail"] = Color3.fromRGB(124, 185, 91),
        ["Torso2"] = Color3.fromRGB(124, 185, 91)
    }
}
v2.urban_2023_billy_goat = v4
local v5 = {
    ["name"] = "Black Kite",
    ["image"] = "rbxassetid://13894169749",
    ["model"] = "Urban2023BlackKite",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023BlackKiteBeingHeldDouble",
        ["eating"] = "Urban2023BlackKiteEat",
        ["flying"] = "Urban2023BlackKiteRun",
        ["hold"] = "Urban2023BlackKiteBeingHeldSingle",
        ["idle"] = "Urban2023BlackKiteIdle",
        ["running"] = "Urban2023BlackKiteRun",
        ["sit"] = "Urban2023BlackKiteSit",
        ["sleep"] = "Urban2023BlackKiteSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023BlackKiteSit" },
        { "Joyful", "Urban2023BlackKiteJoyful" },
        { "Beg", "Urban2023BlackKiteBeg" },
        { "Jump", "Urban2023BlackKiteJump" },
        { "Trick 1", "Urban2023BlackKiteTrick1" },
        { "Trick 2", "Urban2023BlackKiteTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(190, 128, 92),
        ["Head5"] = Color3.fromRGB(190, 128, 92),
        ["LeftWing2"] = Color3.fromRGB(190, 128, 92),
        ["RightWing2"] = Color3.fromRGB(190, 128, 92),
        ["Tail2"] = Color3.fromRGB(190, 128, 92),
        ["Tail3"] = Color3.fromRGB(190, 128, 92)
    },
    ["already_has_flying_wings"] = true
}
v2.urban_2023_black_kite = v5
local v6 = {
    ["name"] = "Cockroach",
    ["image"] = "rbxassetid://14146063876",
    ["model"] = "Urban2023Cockroach",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023CockroachBeingHeldDouble",
        ["eating"] = "Urban2023CockroachEat",
        ["hold"] = "Urban2023CockroachBeingHeldSingle",
        ["idle"] = "Urban2023CockroachIdle",
        ["running"] = "Urban2023CockroachRun",
        ["sit"] = "Urban2023CockroachSit",
        ["sleep"] = "Urban2023CockroachSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023CockroachSit" },
        { "Joyful", "Urban2023CockroachJoyful" },
        { "Beg", "Urban2023CockroachBeg" },
        { "Jump", "Urban2023CockroachJump" },
        { "Trick 1", "Urban2023CockroachTrick1" },
        { "Trick 2", "Urban2023CockroachTrick2" }
    },
    ["neon_parts"] = {
        ["BackMiddleFoot"] = Color3.fromRGB(213, 115, 61),
        ["BackRightFoot"] = Color3.fromRGB(213, 115, 61),
        ["FronLeftFoot"] = Color3.fromRGB(213, 115, 61),
        ["FrontBackFoot"] = Color3.fromRGB(213, 115, 61),
        ["FrontMiddleFoot"] = Color3.fromRGB(213, 115, 61),
        ["FrontRightFoot"] = Color3.fromRGB(213, 115, 61),
        ["LeftAntenna"] = Color3.fromRGB(213, 115, 61),
        ["LeftAntenna2"] = Color3.fromRGB(213, 115, 61),
        ["LeftAntenna3"] = Color3.fromRGB(213, 115, 61),
        ["LeftAntenna4"] = Color3.fromRGB(213, 115, 61),
        ["LeftAntenna5"] = Color3.fromRGB(213, 115, 61),
        ["RightAntenna"] = Color3.fromRGB(213, 115, 61),
        ["RightAntenna2"] = Color3.fromRGB(213, 115, 61),
        ["RightAntenna3"] = Color3.fromRGB(213, 115, 61),
        ["RightAntenna4"] = Color3.fromRGB(213, 115, 61),
        ["RightAntenna5"] = Color3.fromRGB(213, 115, 61),
        ["Torso"] = Color3.fromRGB(213, 115, 61),
        ["Torso3"] = Color3.fromRGB(213, 115, 61)
    }
}
v2.urban_2023_cockroach = v6
local v7 = {
    ["name"] = "Urban Egg",
    ["image"] = "rbxassetid://13892790514",
    ["model"] = "Urban2023Egg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "Urban2023EggIdle",
        ["running"] = "Urban2023EggRun",
        ["sit"] = "DogSit",
        ["sleep"] = "Urban2023EggSleep"
    },
    ["ailments_to_hatch"] = 5
}
v2.urban_2023_egg = v7
local v8 = {
    ["name"] = "Bluebottle Fly",
    ["image"] = "rbxassetid://14146188240",
    ["model"] = "Urban2023Fly",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023FlyBeingHeldDouble",
        ["eating"] = "Urban2023FlyEat",
        ["flying"] = "Urban2023FlyRun",
        ["hold"] = "Urban2023FlyBeingHeldSingle",
        ["idle"] = "Urban2023FlyIdle",
        ["running"] = "Urban2023FlyRun",
        ["sit"] = "Urban2023FlySit",
        ["sleep"] = "Urban2023FlySleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023FlySit" },
        { "Joyful", "Urban2023FlyJoyful" },
        { "Beg", "Urban2023FlyBeg" },
        { "Jump", "Urban2023FlyJump" },
        { "Trick 1", "Urban2023FlyTrick1" },
        { "Trick 2", "Urban2023FlyTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(189, 59, 87),
        ["LeftWing2"] = Color3.fromRGB(189, 59, 87),
        ["Nose"] = Color3.fromRGB(189, 59, 87),
        ["RightWing2"] = Color3.fromRGB(189, 59, 87),
        ["Torso"] = Color3.fromRGB(189, 59, 87)
    },
    ["already_has_flying_wings"] = true
}
v2.urban_2023_fly = v8
local v9 = {
    ["name"] = "Gargoyle",
    ["image"] = "rbxassetid://14146196672",
    ["model"] = "Urban2023Gargoyle",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023GargoyleBeingHeldDouble",
        ["eating"] = "Urban2023GargoyleEat",
        ["flying"] = "Urban2023GargoyleRun",
        ["hold"] = "Urban2023GargoyleBeingHeldSingle",
        ["idle"] = "Urban2023GargoyleIdle",
        ["running"] = "Urban2023GargoyleRun",
        ["sit"] = "Urban2023GargoyleSit",
        ["sleep"] = "Urban2023GargoyleSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023GargoyleSit" },
        { "Joyful", "Urban2023GargoyleJoyful" },
        { "Beg", "Urban2023GargoyleBeg" },
        { "Jump", "Urban2023GargoyleJump" },
        { "Trick 1", "Urban2023GargoyleTrick1" },
        { "Trick 2", "Urban2023GargoyleTrick2" }
    },
    ["neon_parts"] = {
        ["Brow"] = Color3.fromRGB(90, 27, 185),
        ["Horns"] = Color3.fromRGB(90, 27, 185),
        ["LeftBackFoot"] = Color3.fromRGB(90, 27, 185),
        ["LeftFrontFoot"] = Color3.fromRGB(90, 27, 185),
        ["LeftWing"] = Color3.fromRGB(90, 27, 185),
        ["LeftWing4"] = Color3.fromRGB(90, 27, 185),
        ["RightFrontFoot"] = Color3.fromRGB(90, 27, 185),
        ["RightWing"] = Color3.fromRGB(90, 27, 185),
        ["RightWing4"] = Color3.fromRGB(90, 27, 185),
        ["Tail2"] = Color3.fromRGB(90, 27, 185),
        ["Tail5"] = Color3.fromRGB(90, 27, 185),
        ["Teeth"] = Color3.fromRGB(90, 27, 185),
        ["joint30"] = Color3.fromRGB(90, 27, 185)
    },
    ["already_has_flying_wings"] = true
}
v2.urban_2023_gargoyle = v9
local v10 = {
    ["name"] = "Indian Leopard",
    ["image"] = "rbxassetid://14146127209",
    ["model"] = "Urban2023IndianLeopard",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023IndianLeopardBeingHeldDouble",
        ["eating"] = "Urban2023IndianLeopardEat",
        ["hold"] = "Urban2023IndianLeopardBeingHeldSingle",
        ["idle"] = "Urban2023IndianLeopardIdle",
        ["running"] = "Urban2023IndianLeopardRun",
        ["sit"] = "Urban2023IndianLeopardSit",
        ["sleep"] = "Urban2023IndianLeopardSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023IndianLeopardSit" },
        { "Joyful", "Urban2023IndianLeopardJoyful" },
        { "Beg", "Urban2023IndianLeopardBeg" },
        { "Jump", "Urban2023IndianLeopardJump" },
        { "Trick 1", "Urban2023IndianLeopardTrick1" },
        { "Trick 2", "Urban2023IndianLeopardTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(105, 124, 188),
        ["BackRightFoot"] = Color3.fromRGB(105, 124, 188),
        ["FrontLeftFoot"] = Color3.fromRGB(105, 124, 188),
        ["FrontRightFoot"] = Color3.fromRGB(105, 124, 188),
        ["Head2"] = Color3.fromRGB(105, 124, 188),
        ["Head3"] = Color3.fromRGB(105, 124, 188),
        ["Head4"] = Color3.fromRGB(105, 124, 188),
        ["LeftEar3"] = Color3.fromRGB(105, 124, 188),
        ["RightEar3"] = Color3.fromRGB(105, 124, 188),
        ["Tail2"] = Color3.fromRGB(105, 124, 188),
        ["Tail3"] = Color3.fromRGB(105, 124, 188),
        ["Torso2"] = Color3.fromRGB(105, 124, 188),
        ["Torso3"] = Color3.fromRGB(105, 124, 188)
    },
    ["maximum_run_anim_speed"] = 0.65
}
v2.urban_2023_indian_leopard = v10
local v11 = {
    ["name"] = "Mongoose",
    ["image"] = "rbxassetid://14146142724",
    ["model"] = "Urban2023Mongoose",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023MongooseBeingHeldDouble",
        ["eating"] = "Urban2023MongooseEat",
        ["hold"] = "Urban2023MongooseBeingHeldSingle",
        ["idle"] = "Urban2023MongooseIdle",
        ["running"] = "Urban2023MongooseRun",
        ["sit"] = "Urban2023MongooseSit",
        ["sleep"] = "Urban2023MongooseSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023MongooseSit" },
        { "Joyful", "Urban2023MongooseJoyful" },
        { "Beg", "Urban2023MongooseBeg" },
        { "Jump", "Urban2023MongooseJump" },
        { "Trick 1", "Urban2023MongooseTrick1" },
        { "Trick 2", "Urban2023MongooseTrick2" }
    },
    ["neon_parts"] = {
        ["LeftBackFoot"] = Color3.fromRGB(16, 188, 131),
        ["LeftEar"] = Color3.fromRGB(16, 188, 131),
        ["LeftFrontFoot"] = Color3.fromRGB(16, 188, 131),
        ["Nose"] = Color3.fromRGB(16, 188, 131),
        ["RightBackFoot"] = Color3.fromRGB(16, 188, 131),
        ["RightEar"] = Color3.fromRGB(16, 188, 131),
        ["RightFrontFoot"] = Color3.fromRGB(16, 188, 131),
        ["Tail2"] = Color3.fromRGB(16, 188, 131),
        ["Whiskers"] = Color3.fromRGB(16, 188, 131)
    }
}
v2.urban_2023_mongoose = v11
local v12 = {
    ["name"] = "Rock Pigeon",
    ["image"] = "rbxassetid://14146174264",
    ["model"] = "Urban2023Pigeon",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023PigeonBeingHeldDouble",
        ["eating"] = "Urban2023PigeonEat",
        ["flying"] = "Urban2023PigeonRun",
        ["hold"] = "Urban2023PigeonBeingHeldSingle",
        ["idle"] = "Urban2023PigeonIdle",
        ["running"] = "Urban2023PigeonRun",
        ["sit"] = "Urban2023PigeonSit",
        ["sleep"] = "Urban2023PigeonSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023PigeonSit" },
        { "Joyful", "Urban2023PigeonJoyful" },
        { "Beg", "Urban2023PigeonBeg" },
        { "Jump", "Urban2023PigeonJump" },
        { "Trick 1", "Urban2023PigeonTrick1" },
        { "Trick 2", "Urban2023PigeonTrick2" }
    },
    ["neon_parts"] = {
        ["Beak2"] = Color3.fromRGB(77, 135, 188),
        ["Head2"] = Color3.fromRGB(80, 141, 195),
        ["LeftFoot"] = Color3.fromRGB(80, 141, 195),
        ["LeftWIng2"] = Color3.fromRGB(80, 141, 195),
        ["RightFoot"] = Color3.fromRGB(80, 141, 195),
        ["RightWing2"] = Color3.fromRGB(80, 141, 195)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 0.75,
    ["minimum_fly_anim_speed"] = 0.6
}
v2.urban_2023_pigeon = v12
local v13 = {
    ["name"] = "Seagull",
    ["image"] = "rbxassetid://13894408663",
    ["model"] = "Urban2023Seagull",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023SeagullBeingHeldDouble",
        ["eating"] = "Urban2023SeagullEat",
        ["flying"] = "Urban2023SeagullRun",
        ["hold"] = "Urban2023SeagullBeingHeldSingle",
        ["idle"] = "Urban2023SeagullIdle",
        ["running"] = "Urban2023SeagullRun",
        ["sit"] = "Urban2023SeagullSit",
        ["sleep"] = "Urban2023SeagullSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023SeagullSit" },
        { "Joyful", "Urban2023SeagullJoyful" },
        { "Beg", "Urban2023SeagullBeg" },
        { "Jump", "Urban2023SeagullJump" },
        { "Trick 1", "Urban2023SeagullTrick1" },
        { "Trick 2", "Urban2023SeagullTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(95, 186, 74),
        ["BackRightFoot"] = Color3.fromRGB(95, 186, 74),
        ["BeakLower2"] = Color3.fromRGB(95, 186, 74),
        ["Head2"] = Color3.fromRGB(95, 186, 74),
        ["LeftWing"] = Color3.fromRGB(95, 186, 74),
        ["LeftWing2"] = Color3.fromRGB(95, 186, 74),
        ["MouthBagLower"] = Color3.fromRGB(95, 186, 74),
        ["MouthBagUpper"] = Color3.fromRGB(95, 186, 74),
        ["RightWing"] = Color3.fromRGB(95, 186, 74),
        ["RightWing2"] = Color3.fromRGB(95, 186, 74),
        ["Tail2"] = Color3.fromRGB(95, 186, 74),
        ["TailMid02"] = Color3.fromRGB(95, 186, 74),
        ["wing_L_02"] = Color3.fromRGB(95, 186, 74),
        ["wing_L_03"] = Color3.fromRGB(95, 186, 74),
        ["wing_R_02"] = Color3.fromRGB(95, 186, 74),
        ["wing_R_03"] = Color3.fromRGB(95, 186, 74)
    },
    ["already_has_flying_wings"] = true
}
v2.urban_2023_seagull = v13
local v14 = {
    ["name"] = "Tawny Frogmouth",
    ["image"] = "rbxassetid://14146181621",
    ["model"] = "Urban2023TawnyFrogmouth",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023TawnyFrogmouthBeingHeldDouble",
        ["eating"] = "Urban2023TawnyFrogmouthEat",
        ["flying"] = "Urban2023TawnyFrogmouthRun",
        ["hold"] = "Urban2023TawnyFrogmouthBeingHeldSingle",
        ["idle"] = "Urban2023TawnyFrogmouthIdle",
        ["running"] = "Urban2023TawnyFrogmouthRun",
        ["sit"] = "Urban2023TawnyFrogmouthSit",
        ["sleep"] = "Urban2023TawnyFrogmouthSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023TawnyFrogmouthSit" },
        { "Joyful", "Urban2023TawnyFrogmouthJoyful" },
        { "Beg", "Urban2023TawnyFrogmouthBeg" },
        { "Jump", "Urban2023TawnyFrogmouthJump" },
        { "Trick 1", "Urban2023TawnyFrogmouthTrick1" },
        { "Trick 2", "Urban2023TawnyFrogmouthTrick2" }
    },
    ["neon_parts"] = {
        ["BeakFeather"] = Color3.fromRGB(101, 106, 198),
        ["BeakFeather2"] = Color3.fromRGB(101, 106, 198),
        ["BeakFeather3"] = Color3.fromRGB(101, 106, 198),
        ["Head"] = Color3.fromRGB(101, 106, 198),
        ["HeadFeather"] = Color3.fromRGB(101, 106, 198),
        ["HeadFeather2"] = Color3.fromRGB(101, 106, 198),
        ["HeadFeather3"] = Color3.fromRGB(101, 106, 198),
        ["HeadFeather4"] = Color3.fromRGB(101, 106, 198),
        ["HeadFeather5"] = Color3.fromRGB(101, 106, 198),
        ["LeftFoot"] = Color3.fromRGB(101, 106, 198),
        ["LeftWing2"] = Color3.fromRGB(101, 106, 198),
        ["LowerBeak2"] = Color3.fromRGB(101, 106, 198),
        ["LowerBeak3"] = Color3.fromRGB(101, 106, 198),
        ["RightFoot"] = Color3.fromRGB(101, 106, 198),
        ["RightWing_2"] = Color3.fromRGB(101, 106, 198),
        ["UpperBeak2"] = Color3.fromRGB(101, 106, 198)
    },
    ["already_has_flying_wings"] = true
}
v2.urban_2023_tawny_frogmouth = v14
local v15 = {
    ["name"] = "Toy Poodle",
    ["image"] = "rbxassetid://14145989411",
    ["model"] = "Urban2023ToyPoodle",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Urban",
        ["origin_items"] = { "urban_2023_egg" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Urban2023ToyPoodleBeingHeldDouble",
        ["eating"] = "Urban2023ToyPoodleEat",
        ["hold"] = "Urban2023ToyPoodleBeingHeldSingle",
        ["idle"] = "Urban2023ToyPoodleIdle",
        ["running"] = "Urban2023ToyPoodleRun",
        ["sit"] = "Urban2023ToyPoodleSit",
        ["sleep"] = "Urban2023ToyPoodleSleep"
    },
    ["tricks"] = {
        { "Sit", "Urban2023ToyPoodleSit" },
        { "Joyful", "Urban2023ToyPoodleJoyful" },
        { "Beg", "Urban2023ToyPoodleBeg" },
        { "Jump", "Urban2023ToyPoodleJump" },
        { "Trick 1", "Urban2023ToyPoodleTrick1" },
        { "Trick 2", "Urban2023ToyPoodleTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(186, 145, 88),
        ["BackRightFoot"] = Color3.fromRGB(186, 145, 88),
        ["FrontLeftFoot"] = Color3.fromRGB(186, 145, 88),
        ["FrontRightFoot"] = Color3.fromRGB(186, 145, 88),
        ["Head4"] = Color3.fromRGB(186, 145, 88),
        ["LeftEar"] = Color3.fromRGB(186, 145, 88),
        ["RightEar"] = Color3.fromRGB(186, 145, 88),
        ["Tail"] = Color3.fromRGB(186, 145, 88)
    }
}
v2.urban_2023_toy_poodle = v15
return v1(v2)