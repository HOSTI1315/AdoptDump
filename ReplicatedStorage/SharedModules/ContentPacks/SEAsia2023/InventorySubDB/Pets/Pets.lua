--// ReplicatedStorage.SharedModules.ContentPacks.SEAsia2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Bali Starling",
    ["image"] = "rbxassetid://12479810452",
    ["model"] = "SEAsia2023BaliStarling",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023BaliStarlingBeingHeldDouble",
        ["eating"] = "SEAsia2023BaliStarlingEat",
        ["flying"] = "SEAsia2023BaliStarlingRun",
        ["hold"] = "SEAsia2023BaliStarlingBeingHeldSingle",
        ["idle"] = "SEAsia2023BaliStarlingIdle",
        ["running"] = "SEAsia2023BaliStarlingRun",
        ["sit"] = "SEAsia2023BaliStarlingSit",
        ["sleep"] = "SEAsia2023BaliStarlingSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023BaliStarlingSit" },
        { "Joyful", "SEAsia2023BaliStarlingJoyful" },
        { "Beg", "SEAsia2023BaliStarlingBeg" },
        { "Jump", "SEAsia2023BaliStarlingJump" },
        { "Trick 1", "SEAsia2023BaliStarlingTrick1" },
        { "Trick 2", "SEAsia2023BaliStarlingTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(172, 188, 102),
        ["Head3"] = Color3.fromRGB(172, 188, 102),
        ["LeftFoot"] = Color3.fromRGB(172, 188, 102),
        ["LeftWing2"] = Color3.fromRGB(172, 188, 102),
        ["RightFoot"] = Color3.fromRGB(172, 188, 102),
        ["RightWing2"] = Color3.fromRGB(172, 188, 102),
        ["Tail"] = Color3.fromRGB(172, 188, 102),
        ["Tail2"] = Color3.fromRGB(172, 188, 102),
        ["TopBeak2"] = Color3.fromRGB(172, 188, 102),
        ["Torso2"] = Color3.fromRGB(172, 188, 102),
        ["Torso3"] = Color3.fromRGB(172, 188, 102),
        ["Torso4"] = Color3.fromRGB(172, 188, 102)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.seasia_2023_bali_starling = v3
local v4 = {
    ["name"] = "Banded Palm Civet",
    ["image"] = "rbxassetid://12509687499",
    ["model"] = "SEAsia2023BandedPalmCivet",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023BandedPalmCivetBeingHeldDouble",
        ["eating"] = "SEAsia2023BandedPalmCivetEat",
        ["flying"] = "SEAsia2023BandedPalmCivetRun",
        ["hold"] = "SEAsia2023BandedPalmCivetBeingHeldSingle",
        ["idle"] = "SEAsia2023BandedPalmCivetIdle",
        ["running"] = "SEAsia2023BandedPalmCivetRun",
        ["sit"] = "SEAsia2023BandedPalmCivetSit",
        ["sleep"] = "SEAsia2023BandedPalmCivetSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023BandedPalmCivetSit" },
        { "Joyful", "SEAsia2023BandedPalmCivetJoyful" },
        { "Beg", "SEAsia2023BandedPalmCivetBeg" },
        { "Jump", "SEAsia2023BandedPalmCivetJump" },
        { "Trick 1", "SEAsia2023BandedPalmCivetTrick1" },
        { "Trick 2", "SEAsia2023BandedPalmCivetTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(82, 124, 174),
        ["Head2"] = Color3.fromRGB(82, 124, 174),
        ["LeftBackFoot"] = Color3.fromRGB(82, 124, 174),
        ["LeftEar2"] = Color3.fromRGB(82, 124, 174),
        ["LeftFrontFoot"] = Color3.fromRGB(82, 124, 174),
        ["LeftWhisker"] = Color3.fromRGB(82, 124, 174),
        ["RightBackFoot"] = Color3.fromRGB(82, 124, 174),
        ["RightEar2"] = Color3.fromRGB(82, 124, 174),
        ["RightFrontFoot"] = Color3.fromRGB(82, 124, 174),
        ["RightWhisker"] = Color3.fromRGB(82, 124, 174),
        ["Tail2"] = Color3.fromRGB(82, 124, 174),
        ["Torso3"] = Color3.fromRGB(82, 124, 174)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.seasia_2023_banded_palm_civet = v4
local v5 = {
    ["name"] = "Binturong",
    ["image"] = "rbxassetid://12480406935",
    ["model"] = "SEAsia2023Binturong",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023BinturongBeingHeldDouble",
        ["eating"] = "SEAsia2023BinturongEat",
        ["flying"] = "SEAsia2023BinturongRun",
        ["hold"] = "SEAsia2023BinturongBeingHeldSingle",
        ["idle"] = "SEAsia2023BinturongIdle",
        ["running"] = "SEAsia2023BinturongRun",
        ["sit"] = "SEAsia2023BinturongSit",
        ["sleep"] = "SEAsia2023BinturongSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023BinturongSit" },
        { "Joyful", "SEAsia2023BinturongJoyful" },
        { "Beg", "SEAsia2023BinturongBeg" },
        { "Jump", "SEAsia2023BinturongJump" },
        { "Trick 1", "SEAsia2023BinturongTrick1" },
        { "Trick 2", "SEAsia2023BinturongTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(213, 115, 61),
        ["LeftBrow"] = Color3.fromRGB(213, 115, 61),
        ["LeftEar3"] = Color3.fromRGB(213, 115, 61),
        ["RightBrow"] = Color3.fromRGB(213, 115, 61),
        ["RightEar3"] = Color3.fromRGB(213, 115, 61),
        ["Tail2"] = Color3.fromRGB(213, 115, 61),
        ["Tail3"] = Color3.fromRGB(213, 115, 61),
        ["Torso2"] = Color3.fromRGB(213, 115, 61)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.seasia_2023_binturong = v5
local v6 = {
    ["name"] = "Black Macaque",
    ["image"] = "rbxassetid://12480556316",
    ["model"] = "SEAsia2023BlackMacaque",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023BlackMacaqueBeingHeldDouble",
        ["eating"] = "SEAsia2023BlackMacaqueEat",
        ["flying"] = "SEAsia2023BlackMacaqueRun",
        ["hold"] = "SEAsia2023BlackMacaqueBeingHeldSingle",
        ["idle"] = "SEAsia2023BlackMacaqueIdle",
        ["running"] = "SEAsia2023BlackMacaqueRun",
        ["sit"] = "SEAsia2023BlackMacaqueSit",
        ["sleep"] = "SEAsia2023BlackMacaqueSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023BlackMacaqueSit" },
        { "Joyful", "SEAsia2023BlackMacaqueJoyful" },
        { "Beg", "SEAsia2023BlackMacaqueBeg" },
        { "Jump", "SEAsia2023BlackMacaqueJump" },
        { "Trick 1", "SEAsia2023BlackMacaqueTrick1" },
        { "Trick 2", "SEAsia2023BlackMacaqueTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(184, 185, 185),
        ["LeftArm"] = Color3.fromRGB(184, 185, 185),
        ["LeftEar"] = Color3.fromRGB(184, 185, 185),
        ["RightArm"] = Color3.fromRGB(184, 185, 185),
        ["RightEar2"] = Color3.fromRGB(184, 185, 185),
        ["Torso"] = Color3.fromRGB(184, 185, 185)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.seasia_2023_black_macaque = v6
local v7 = {
    ["name"] = "Southeast Asia Egg",
    ["image"] = "rbxassetid://12479078933",
    ["model"] = "SEAsia2023Egg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "SEAsia2023EggIdle",
        ["running"] = "SEAsia2023EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 5
}
v2.seasia_2023_egg = v7
local v8 = {
    ["name"] = "Gecko",
    ["image"] = "rbxassetid://12490691849",
    ["model"] = "SEAsia2023Gecko",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023GeckoBeingHeldDouble",
        ["eating"] = "SEAsia2023GeckoEat",
        ["flying"] = "SEAsia2023GeckoRun",
        ["hold"] = "SEAsia2023GeckoBeingHeldSingle",
        ["idle"] = "SEAsia2023GeckoIdle",
        ["running"] = "SEAsia2023GeckoRun",
        ["sit"] = "SEAsia2023GeckoSit",
        ["sleep"] = "SEAsia2023GeckoSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023GeckoSit" },
        { "Joyful", "SEAsia2023GeckoJoyful" },
        { "Beg", "SEAsia2023GeckoBeg" },
        { "Jump", "SEAsia2023GeckoJump" },
        { "Trick 1", "SEAsia2023GeckoTrick1" },
        { "Trick 2", "SEAsia2023GeckoTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(193, 119, 97),
        ["BackRightFoot"] = Color3.fromRGB(193, 119, 97),
        ["FrontLeftFoot"] = Color3.fromRGB(193, 119, 97),
        ["FrontRightFoot"] = Color3.fromRGB(193, 119, 97),
        ["Head2"] = Color3.fromRGB(193, 119, 97),
        ["Head3"] = Color3.fromRGB(193, 119, 97),
        ["Nose"] = Color3.fromRGB(193, 119, 97),
        ["Tail2"] = Color3.fromRGB(193, 119, 97),
        ["Tail3"] = Color3.fromRGB(193, 119, 97),
        ["Tail4"] = Color3.fromRGB(193, 119, 97),
        ["Torso2"] = Color3.fromRGB(193, 119, 97),
        ["Torso3"] = Color3.fromRGB(193, 119, 97),
        ["Torso4"] = Color3.fromRGB(193, 119, 97)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.seasia_2023_gecko = v8
local v9 = {
    ["name"] = "Komodo Dragon",
    ["image"] = "rbxassetid://12489494348",
    ["model"] = "SEAsia2023KomodoDragon",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023KomodoDragonBeingHeldDouble",
        ["eating"] = "SEAsia2023KomodoDragonEat",
        ["flying"] = "SEAsia2023KomodoDragonRun",
        ["hold"] = "SEAsia2023KomodoDragonBeingHeldSingle",
        ["idle"] = "SEAsia2023KomodoDragonIdle",
        ["running"] = "SEAsia2023KomodoDragonRun",
        ["sit"] = "SEAsia2023KomodoDragonSit",
        ["sleep"] = "SEAsia2023KomodoDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023KomodoDragonSit" },
        { "Joyful", "SEAsia2023KomodoDragonJoyful" },
        { "Beg", "SEAsia2023KomodoDragonBeg" },
        { "Jump", "SEAsia2023KomodoDragonJump" },
        { "Trick 1", "SEAsia2023KomodoDragonTrick1" },
        { "Trick 2", "SEAsia2023KomodoDragonTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(188, 109, 164),
        ["BackRightFoot"] = Color3.fromRGB(188, 109, 164),
        ["FrontLeftFoot"] = Color3.fromRGB(188, 109, 164),
        ["FrontRightFoot"] = Color3.fromRGB(188, 109, 164),
        ["Head2"] = Color3.fromRGB(188, 109, 164),
        ["Head3"] = Color3.fromRGB(188, 109, 164),
        ["Tail2"] = Color3.fromRGB(188, 109, 164),
        ["Tongue"] = Color3.fromRGB(188, 109, 164),
        ["Torso2"] = Color3.fromRGB(188, 109, 164),
        ["Torso3"] = Color3.fromRGB(188, 109, 164)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.seasia_2023_komodo_dragon = v9
local v10 = {
    ["name"] = "Malayan Tapir",
    ["image"] = "rbxassetid://12480314681",
    ["model"] = "SEAsia2023MalayTapir",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023MalaysianTapirBeingHeldDouble",
        ["eating"] = "SEAsia2023MalaysianTapirEat",
        ["flying"] = "SEAsia2023MalaysianTapirRun",
        ["hold"] = "SEAsia2023MalaysianTapirBeingHeldSingle",
        ["idle"] = "SEAsia2023MalaysianTapirIdle",
        ["running"] = "SEAsia2023MalaysianTapirRun",
        ["sit"] = "SEAsia2023MalaysianTapirSit",
        ["sleep"] = "SEAsia2023MalaysianTapirSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023MalaysianTapirSit" },
        { "Joyful", "SEAsia2023MalaysianTapirJoyful" },
        { "Beg", "SEAsia2023MalaysianTapirBeg" },
        { "Jump", "SEAsia2023MalaysianTapirJump" },
        { "Trick 1", "SEAsia2023MalaysianTapirTrick1" },
        { "Trick 2", "SEAsia2023MalaysianTapirTrick2" }
    },
    ["neon_parts"] = {
        ["LeftBackFoot"] = Color3.fromRGB(107, 185, 83),
        ["LeftEar2"] = Color3.fromRGB(107, 185, 83),
        ["LeftFrontFoot"] = Color3.fromRGB(107, 185, 83),
        ["RightBackFoot"] = Color3.fromRGB(107, 185, 83),
        ["RightEar2"] = Color3.fromRGB(107, 185, 83),
        ["RightFrontFoot"] = Color3.fromRGB(107, 185, 83),
        ["Tail"] = Color3.fromRGB(107, 185, 83),
        ["Torso2"] = Color3.fromRGB(107, 185, 83)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.seasia_2023_malaysian_tapir = v10
local v11 = {
    ["name"] = "Maleo Bird",
    ["image"] = "rbxassetid://12479656052",
    ["model"] = "SEAsia2023MaleoBird",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023MaleoBirdBeingHeldDouble",
        ["eating"] = "SEAsia2023MaleoBirdEat",
        ["flying"] = "SEAsia2023MaleoBirdRun",
        ["hold"] = "SEAsia2023MaleoBirdBeingHeldSingle",
        ["idle"] = "SEAsia2023MaleoBirdIdle",
        ["running"] = "SEAsia2023MaleoBirdRun",
        ["sit"] = "SEAsia2023MaleoBirdSit",
        ["sleep"] = "SEAsia2023MaleoBirdSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023MaleoBirdSit" },
        { "Joyful", "SEAsia2023MaleoBirdJoyful" },
        { "Beg", "SEAsia2023MaleoBirdBeg" },
        { "Jump", "SEAsia2023MaleoBirdJump" },
        { "Trick 1", "SEAsia2023MaleoBirdTrick1" },
        { "Trick 2", "SEAsia2023MaleoBirdTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(110, 185, 91),
        ["Head4"] = Color3.fromRGB(110, 185, 91),
        ["LeftWing"] = Color3.fromRGB(110, 185, 91),
        ["LeftWing2"] = Color3.fromRGB(110, 185, 91),
        ["RightWing"] = Color3.fromRGB(110, 185, 91),
        ["RightWing2"] = Color3.fromRGB(110, 185, 91),
        ["Tail"] = Color3.fromRGB(110, 185, 91),
        ["Torso2"] = Color3.fromRGB(110, 185, 91)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.seasia_2023_maleo_bird = v11
local v12 = {
    ["name"] = "Naga Dragon",
    ["image"] = "rbxassetid://12557346746",
    ["model"] = "SEAsia2023NagaDragon",
    ["rarity"] = "legendary"
}
local v13 = {
    ["origin"] = "Southeast Asia",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 8,
        ["offset"] = CFrame.new(0, -2, -6)
    },
    ["year"] = 2023
}
v12.origin_entry = v13
v12.anims = {
    ["double_hold"] = "SEAsia2023NagaDragonBeingHeldDouble",
    ["eating"] = "SEAsia2023NagaDragonEat",
    ["flying"] = "SEAsia2023NagaDragonRun",
    ["hold"] = "SEAsia2023NagaDragonBeingHeldSingle",
    ["idle"] = "SEAsia2023NagaDragonIdle",
    ["running"] = "SEAsia2023NagaDragonRun",
    ["sit"] = "SEAsia2023NagaDragonSit",
    ["sleep"] = "SEAsia2023NagaDragonSleep"
}
v12.tricks = {
    { "Sit", "SEAsia2023NagaDragonSit" },
    { "Joyful", "SEAsia2023NagaDragonJoyful" },
    { "Beg", "SEAsia2023NagaDragonBeg" },
    { "Jump", "SEAsia2023NagaDragonJump" },
    { "Trick 1", "SEAsia2023NagaDragonTrick1" },
    { "Trick 2", "SEAsia2023NagaDragonTrick2" }
}
v12.neon_parts = {
    ["Head2"] = Color3.fromRGB(82, 73, 184),
    ["Tail"] = Color3.fromRGB(82, 73, 184),
    ["Torso2"] = Color3.fromRGB(82, 73, 184),
    ["Torso5"] = Color3.fromRGB(82, 73, 184),
    ["Torso6"] = Color3.fromRGB(82, 73, 184)
}
v12.already_has_flying_wings = true
v12.avatar_editor_app_camera_distance_overrides = {
    ["fit_to_screen"] = 17.846,
    ["front_facing"] = 13.754
}
v12.eyes = { "Eyes" }
v12.fly_camera_offset = CFrame.new(0, 15, -5)
v12.flying_move_anim_speed = 0.6
v12.interaction_part_name = "Torso5"
v12.minimum_fly_anim_speed = 0.25
v12.stabilizer_part_override = "Torso9"
v2.seasia_2023_naga_dragon = v12
local v14 = {
    ["name"] = "Tarsier",
    ["image"] = "rbxassetid://12489700965",
    ["model"] = "SEAsia2023Tarsier",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023TarsierBeingHeldDouble",
        ["eating"] = "SEAsia2023TarsierEat",
        ["flying"] = "SEAsia2023TarsierRun",
        ["hold"] = "SEAsia2023TarsierBeingHeldSingle",
        ["idle"] = "SEAsia2023TarsierIdle",
        ["running"] = "SEAsia2023TarsierRun",
        ["sit"] = "SEAsia2023TarsierSit",
        ["sleep"] = "SEAsia2023TarsierSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023TarsierSit" },
        { "Joyful", "SEAsia2023TarsierJoyful" },
        { "Beg", "SEAsia2023TarsierBeg" },
        { "Jump", "SEAsia2023TarsierJump" },
        { "Trick 1", "SEAsia2023TarsierTrick1" },
        { "Trick 2", "SEAsia2023TarsierTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(107, 107, 191),
        ["LeftArm"] = Color3.fromRGB(107, 107, 191),
        ["LeftArm2"] = Color3.fromRGB(107, 107, 191),
        ["LeftEar"] = Color3.fromRGB(107, 107, 191),
        ["LeftEar2"] = Color3.fromRGB(107, 107, 191),
        ["LeftFoot"] = Color3.fromRGB(107, 107, 191),
        ["RightArm"] = Color3.fromRGB(107, 107, 191),
        ["RightArm2"] = Color3.fromRGB(107, 107, 191),
        ["RightEar"] = Color3.fromRGB(107, 107, 191),
        ["RightEar2"] = Color3.fromRGB(107, 107, 191),
        ["RightFoot"] = Color3.fromRGB(107, 107, 191),
        ["Tail"] = Color3.fromRGB(107, 107, 191),
        ["Tail2"] = Color3.fromRGB(107, 107, 191),
        ["Tail3"] = Color3.fromRGB(107, 107, 191),
        ["Tail4"] = Color3.fromRGB(107, 107, 191)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.seasia_2023_tarsier = v14
local v15 = {
    ["name"] = "Tree Kangaroo",
    ["image"] = "rbxassetid://12480100169",
    ["model"] = "SEAsia2023TreeKangaroo",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Southeast Asia",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SEAsia2023TreeKangarooBeingHeldDouble",
        ["eating"] = "SEAsia2023TreeKangarooEat",
        ["flying"] = "SEAsia2023TreeKangarooRun",
        ["hold"] = "SEAsia2023TreeKangarooBeingHeldSingle",
        ["idle"] = "SEAsia2023TreeKangarooIdle",
        ["running"] = "SEAsia2023TreeKangarooRun",
        ["sit"] = "SEAsia2023TreeKangarooSit",
        ["sleep"] = "SEAsia2023TreeKangarooSleep"
    },
    ["tricks"] = {
        { "Sit", "SEAsia2023TreeKangarooSit" },
        { "Joyful", "SEAsia2023TreeKangarooJoyful" },
        { "Beg", "SEAsia2023TreeKangarooBeg" },
        { "Jump", "SEAsia2023TreeKangarooJump" },
        { "Trick 1", "SEAsia2023TreeKangarooTrick1" },
        { "Trick 2", "SEAsia2023TreeKangarooTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(185, 110, 160),
        ["LeftFoot"] = Color3.fromRGB(185, 110, 160),
        ["Nose"] = Color3.fromRGB(185, 110, 160),
        ["RightEar2"] = Color3.fromRGB(185, 110, 160),
        ["RightFoot"] = Color3.fromRGB(185, 110, 160),
        ["Tail2"] = Color3.fromRGB(185, 110, 160)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.seasia_2023_tree_kangaroo = v15
local v16 = {
    ["name"] = "Yellow-lipped Sea Krait",
    ["image"] = "rbxassetid://12488273089",
    ["model"] = "SEAsia2023YellowLippedSeaKrait",
    ["rarity"] = "uncommon"
}
local v17 = {
    ["origin"] = "Southeast Asia",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 7,
        ["offset"] = CFrame.new(0, 1.75, -2)
    },
    ["year"] = 2023
}
v16.origin_entry = v17
v16.anims = {
    ["double_hold"] = "SEAsia2023YellowLippedSeaKraitBeingHeldDouble",
    ["eating"] = "SEAsia2023YellowLippedSeaKraitEat",
    ["flying"] = "SEAsia2023YellowLippedSeaKraitRun",
    ["hold"] = "SEAsia2023YellowLippedSeaKraitBeingHeldSingle",
    ["idle"] = "SEAsia2023YellowLippedSeaKraitIdle",
    ["running"] = "SEAsia2023YellowLippedSeaKraitRun",
    ["sit"] = "SEAsia2023YellowLippedSeaKraitSit",
    ["sleep"] = "SEAsia2023YellowLippedSeaKraitSleep"
}
v16.tricks = {
    { "Sit", "SEAsia2023YellowLippedSeaKraitSit" },
    { "Joyful", "SEAsia2023YellowLippedSeaKraitJoyful" },
    { "Beg", "SEAsia2023YellowLippedSeaKraitBeg" },
    { "Jump", "SEAsia2023YellowLippedSeaKraitJump" },
    { "Trick 1", "SEAsia2023YellowLippedSeaKraitTrick1" },
    { "Trick 2", "SEAsia2023YellowLippedSeaKraitTrick2" }
}
v16.neon_parts = {
    ["Head"] = Color3.fromRGB(218, 134, 122),
    ["Head3"] = Color3.fromRGB(218, 134, 122),
    ["Torso10"] = Color3.fromRGB(218, 134, 122),
    ["Torso3"] = Color3.fromRGB(218, 134, 122),
    ["Torso4"] = Color3.fromRGB(218, 134, 122),
    ["Torso7"] = Color3.fromRGB(218, 134, 122),
    ["Torso8"] = Color3.fromRGB(218, 134, 122),
    ["Torso9"] = Color3.fromRGB(218, 134, 122)
}
v16.avatar_editor_app_camera_distance_overrides = {
    ["fit_to_screen"] = 13.3845,
    ["front_facing"] = 10.3155
}
v16.eyes = { "Eyes" }
v16.interaction_part_name = "Torso6"
v16.minimum_fly_anim_speed = 0.25
v2.seasia_2023_yellow_lipped_sea_krait = v16
return v1(v2)