--// ReplicatedStorage.SharedModules.ContentPacks.Jungle2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Angelfish",
    ["image"] = "rbxassetid://14267322852",
    ["model"] = "Jungle2023Angelfish",
    ["rarity"] = "common",
    ["cost"] = 250,
    ["origin_entry"] = {
        ["origin"] = "Jungle",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Jungle2023AngelfishBeingHeldDouble",
        ["eating"] = "Jungle2023AngelfishEat",
        ["hold"] = "Jungle2023AngelfishBeingHeldSingle",
        ["idle"] = "Jungle2023AngelfishIdle",
        ["running"] = "Jungle2023AngelfishRun",
        ["sit"] = "Jungle2023AngelfishSit",
        ["sleep"] = "Jungle2023AngelfishSleep"
    },
    ["tricks"] = {
        { "Sit", "Jungle2023AngelfishSit" },
        { "Joyful", "Jungle2023AngelfishJoyful" },
        { "Beg", "Jungle2023AngelfishBeg" },
        { "Jump", "Jungle2023AngelfishJump" },
        { "Trick 1", "Jungle2023AngelfishTrick1" },
        { "Trick 2", "Jungle2023AngelfishTrick2" }
    },
    ["neon_parts"] = {
        ["BottomTail"] = Color3.fromRGB(214, 102, 147),
        ["BottomTail2"] = Color3.fromRGB(214, 102, 147),
        ["LowerFin2"] = Color3.fromRGB(214, 102, 147),
        ["TailFin"] = Color3.fromRGB(214, 102, 147),
        ["TopFin2"] = Color3.fromRGB(214, 102, 147),
        ["TopFin3"] = Color3.fromRGB(214, 102, 147),
        ["TopFin4"] = Color3.fromRGB(214, 102, 147),
        ["TopTail"] = Color3.fromRGB(214, 102, 147),
        ["TopTail2"] = Color3.fromRGB(214, 102, 147),
        ["Torso2"] = Color3.fromRGB(204, 88, 134),
        ["Torso3"] = Color3.fromRGB(204, 88, 134)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.jungle_2023_angelfish = v3
local v4 = {
    ["name"] = "Giant Anteater",
    ["image"] = "rbxassetid://13979141397",
    ["model"] = "Jungle2023Anteater",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Jungle",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Jungle2023AnteaterBeingHeldDouble",
        ["eating"] = "Jungle2023AnteaterEat",
        ["hold"] = "Jungle2023AnteaterBeingHeldSingle",
        ["idle"] = "Jungle2023AnteaterIdle",
        ["running"] = "Jungle2023AnteaterRun",
        ["sit"] = "Jungle2023AnteaterSit",
        ["sleep"] = "Jungle2023AnteaterSleep"
    },
    ["tricks"] = {
        { "Sit", "Jungle2023AnteaterSit" },
        { "Joyful", "Jungle2023AnteaterJoyful" },
        { "Beg", "Jungle2023AnteaterBeg" },
        { "Jump", "Jungle2023AnteaterJump" },
        { "Trick 1", "Jungle2023AnteaterTrick1" },
        { "Trick 2", "Jungle2023AnteaterTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(185, 149, 128),
        ["BackRightFoot"] = Color3.fromRGB(185, 149, 128),
        ["FrontLeftFoot"] = Color3.fromRGB(185, 149, 128),
        ["FrontRightFoot"] = Color3.fromRGB(185, 149, 128),
        ["Head2"] = Color3.fromRGB(185, 149, 128),
        ["LeftEar2"] = Color3.fromRGB(185, 149, 128),
        ["RightEar2"] = Color3.fromRGB(185, 149, 128),
        ["Tail1"] = Color3.fromRGB(185, 149, 128),
        ["Tail2"] = Color3.fromRGB(185, 149, 128),
        ["Torso2"] = Color3.fromRGB(185, 149, 128)
    }
}
v2.jungle_2023_anteater = v4
local v5 = {
    ["name"] = "Bird of Paradise",
    ["image"] = "rbxassetid://13978968837",
    ["model"] = "Jungle2023BirdOfParadise",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Jungle",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Jungle2023BirdOfParadiseBeingHeldDouble",
        ["eating"] = "Jungle2023BirdOfParadiseEat",
        ["flying"] = "Jungle2023BirdOfParadiseRun",
        ["hold"] = "Jungle2023BirdOfParadiseBeingHeldSingle",
        ["idle"] = "Jungle2023BirdOfParadiseIdle",
        ["running"] = "Jungle2023BirdOfParadiseRun",
        ["sit"] = "Jungle2023BirdOfParadiseSit",
        ["sleep"] = "Jungle2023BirdOfParadiseSleep"
    },
    ["tricks"] = {
        { "Sit", "Jungle2023BirdOfParadiseSit" },
        { "Joyful", "Jungle2023BirdOfParadiseJoyful" },
        { "Beg", "Jungle2023BirdOfParadiseBeg" },
        { "Jump", "Jungle2023BirdOfParadiseJump" },
        { "Trick 1", "Jungle2023BirdOfParadiseTrick1" },
        { "Trick 2", "Jungle2023BirdOfParadiseTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(41, 100, 188),
        ["Hair"] = Color3.fromRGB(41, 100, 188),
        ["Hair2"] = Color3.fromRGB(41, 100, 188),
        ["LeftFoot"] = Color3.fromRGB(41, 100, 188),
        ["LeftTail2"] = Color3.fromRGB(41, 100, 188),
        ["LeftTail4"] = Color3.fromRGB(41, 100, 188),
        ["LeftWing"] = Color3.fromRGB(41, 100, 188),
        ["LeftWing2"] = Color3.fromRGB(41, 100, 188),
        ["LeftWing3"] = Color3.fromRGB(41, 100, 188),
        ["RightFoot"] = Color3.fromRGB(41, 100, 188),
        ["RightTail2"] = Color3.fromRGB(41, 100, 188),
        ["RightTail4"] = Color3.fromRGB(41, 100, 188),
        ["RightWing"] = Color3.fromRGB(41, 100, 188),
        ["RightWing2"] = Color3.fromRGB(41, 100, 188),
        ["RightWing3"] = Color3.fromRGB(41, 100, 188),
        ["Tail"] = Color3.fromRGB(41, 100, 188)
    },
    ["already_has_flying_wings"] = true
}
v2.jungle_2023_bird_of_paradise = v5
local v6 = {
    ["name"] = "Cassowary",
    ["image"] = "rbxassetid://14266737982",
    ["model"] = "Jungle2023Cassowary",
    ["rarity"] = "rare",
    ["cost"] = 1100,
    ["origin_entry"] = {
        ["origin"] = "Jungle",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Jungle2023CassowaryBeingHeldDouble",
        ["eating"] = "Jungle2023CassowaryEat",
        ["hold"] = "Jungle2023CassowaryBeingHeldSingle",
        ["idle"] = "Jungle2023CassowaryIdle",
        ["running"] = "Jungle2023CassowaryRun",
        ["sit"] = "Jungle2023CassowarySit",
        ["sleep"] = "Jungle2023CassowarySleep"
    },
    ["tricks"] = {
        { "Sit", "Jungle2023CassowarySit" },
        { "Joyful", "Jungle2023CassowaryJoyful" },
        { "Beg", "Jungle2023CassowaryBeg" },
        { "Jump", "Jungle2023CassowaryJump" },
        { "Trick 1", "Jungle2023CassowaryTrick1" },
        { "Trick 2", "Jungle2023CassowaryTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(188, 170, 71),
        ["Head3"] = Color3.fromRGB(188, 170, 71),
        ["LeftFoot"] = Color3.fromRGB(188, 170, 71),
        ["RightFoot"] = Color3.fromRGB(188, 170, 71),
        ["Torso"] = Color3.fromRGB(188, 170, 71),
        ["Torso3"] = Color3.fromRGB(188, 170, 71),
        ["Torso6"] = Color3.fromRGB(188, 170, 71),
        ["Wattle"] = Color3.fromRGB(188, 170, 71),
        ["Wattle2"] = Color3.fromRGB(188, 170, 71),
        ["Wattle3"] = Color3.fromRGB(188, 170, 71)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.jungle_2023_cassowary = v6
local v7 = {
    ["name"] = "Fossa",
    ["image"] = "rbxassetid://13979014954",
    ["model"] = "Jungle2023Fossa",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Jungle",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Jungle2023FossaBeingHeldDouble",
        ["eating"] = "Jungle2023FossaEat",
        ["hold"] = "Jungle2023FossaBeingHeldSingle",
        ["idle"] = "Jungle2023FossaIdle",
        ["running"] = "Jungle2023FossaRun",
        ["sit"] = "Jungle2023FossaSit",
        ["sleep"] = "Jungle2023FossaSleep"
    },
    ["tricks"] = {
        { "Sit", "Jungle2023FossaSit" },
        { "Joyful", "Jungle2023FossaJoyful" },
        { "Beg", "Jungle2023FossaBeg" },
        { "Jump", "Jungle2023FossaJump" },
        { "Trick 1", "Jungle2023FossaTrick1" },
        { "Trick 2", "Jungle2023FossaTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(184, 185, 104),
        ["LeftEar2"] = Color3.fromRGB(184, 185, 104),
        ["Nose"] = Color3.fromRGB(184, 185, 104),
        ["RightEar"] = Color3.fromRGB(184, 185, 104),
        ["RightEar2"] = Color3.fromRGB(184, 185, 104),
        ["Tail"] = Color3.fromRGB(184, 185, 104),
        ["Torso2"] = Color3.fromRGB(184, 185, 104)
    }
}
v2.jungle_2023_fossa = v7
local v8 = {
    ["name"] = "Ring-tailed Lemur",
    ["image"] = "rbxassetid://14266900917",
    ["model"] = "Jungle2023RingTailedLemur",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Jungle",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Jungle2023RingTailedLemurBeingHeldDouble",
        ["eating"] = "Jungle2023RingTailedLemurEat",
        ["hold"] = "Jungle2023RingTailedLemurBeingHeldSingle",
        ["idle"] = "Jungle2023RingTailedLemurIdle",
        ["running"] = "Jungle2023RingTailedLemurRun",
        ["sit"] = "Jungle2023RingTailedLemurSit",
        ["sleep"] = "Jungle2023RingTailedLemurSleep"
    },
    ["tricks"] = {
        { "Sit", "Jungle2023RingTailedLemurSit" },
        { "Joyful", "Jungle2023RingTailedLemurJoyful" },
        { "Beg", "Jungle2023RingTailedLemurBeg" },
        { "Jump", "Jungle2023RingTailedLemurJump" },
        { "Trick 1", "Jungle2023RingTailedLemurTrick1" },
        { "Trick 2", "Jungle2023RingTailedLemurTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(89, 30, 193),
        ["LeftEar2"] = Color3.fromRGB(89, 30, 193),
        ["LeftFoot"] = Color3.fromRGB(89, 30, 193),
        ["LeftHand"] = Color3.fromRGB(89, 30, 193),
        ["RightEar2"] = Color3.fromRGB(89, 30, 193),
        ["RightFoot"] = Color3.fromRGB(89, 30, 193),
        ["RightHand"] = Color3.fromRGB(89, 30, 193),
        ["Rim"] = Color3.fromRGB(89, 30, 193),
        ["Tail"] = Color3.fromRGB(89, 30, 193),
        ["Tail3"] = Color3.fromRGB(89, 30, 193)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.jungle_2023_ring_tailed_lemur = v8
return v1(v2)