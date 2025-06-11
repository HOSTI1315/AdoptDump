--// ReplicatedStorage.SharedModules.ContentPacks.Danger2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Angler Fish",
    ["image"] = "rbxassetid://13663102008",
    ["model"] = "Danger2023AnglerFish",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023AnglerFishBeingHeldDouble",
        ["eating"] = "Danger2023AnglerFishEat",
        ["flying"] = "Danger2023AnglerFishRun",
        ["hold"] = "Danger2023AnglerFishBeingHeldSingle",
        ["idle"] = "Danger2023AnglerFishIdle",
        ["running"] = "Danger2023AnglerFishRun",
        ["sit"] = "Danger2023AnglerFishSit",
        ["sleep"] = "Danger2023AnglerFishSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023AnglerFishSit" },
        { "Joyful", "Danger2023AnglerFishJoyful" },
        { "Beg", "Danger2023AnglerFishBeg" },
        { "Jump", "Danger2023AnglerFishJump" },
        { "Trick 1", "Danger2023AnglerFishTrick1" },
        { "Trick 2", "Danger2023AnglerFishTrick2" }
    },
    ["neon_parts"] = {
        ["Antenna"] = Color3.fromRGB(98, 186, 183),
        ["Antenna2"] = Color3.fromRGB(98, 186, 183),
        ["Antenna3"] = Color3.fromRGB(98, 186, 183),
        ["LeftFin"] = Color3.fromRGB(98, 186, 183),
        ["LeftFin2"] = Color3.fromRGB(98, 186, 183),
        ["LeftSpikes"] = Color3.fromRGB(98, 186, 183),
        ["Light"] = Color3.fromRGB(186, 186, 124),
        ["Light2"] = Color3.fromRGB(188, 188, 108),
        ["Light3"] = Color3.fromRGB(188, 188, 108),
        ["RightFin"] = Color3.fromRGB(98, 186, 183),
        ["RightFin2"] = Color3.fromRGB(98, 186, 183),
        ["RightSpikes"] = Color3.fromRGB(98, 186, 183),
        ["Spikes"] = Color3.fromRGB(98, 186, 183),
        ["Tail"] = Color3.fromRGB(98, 186, 183),
        ["Tail2"] = Color3.fromRGB(98, 186, 183),
        ["Teeth"] = Color3.fromRGB(98, 186, 183),
        ["Torso4"] = Color3.fromRGB(98, 186, 183)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_angler_fish = v3
local v4 = {
    ["name"] = "Blue Ringed Octopus",
    ["image"] = "rbxassetid://13104110160",
    ["model"] = "Danger2023BlueRingedOctopus",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023BlueRingedOctopusBeingHeldDouble",
        ["eating"] = "Danger2023BlueRingedOctopusEat",
        ["flying"] = "Danger2023BlueRingedOctopusRun",
        ["hold"] = "Danger2023BlueRingedOctopusBeingHeldSingle",
        ["idle"] = "Danger2023BlueRingedOctopusIdle",
        ["running"] = "Danger2023BlueRingedOctopusRun",
        ["sit"] = "Danger2023BlueRingedOctopusSit",
        ["sleep"] = "Danger2023BlueRingedOctopusSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023BlueRingedOctopusSit" },
        { "Joyful", "Danger2023BlueRingedOctopusJoyful" },
        { "Beg", "Danger2023BlueRingedOctopusBeg" },
        { "Jump", "Danger2023BlueRingedOctopusJump" },
        { "Trick 1", "Danger2023BlueRingedOctopusTrick1" },
        { "Trick 2", "Danger2023BlueRingedOctopusTrick2" }
    },
    ["neon_parts"] = {
        ["ELegA"] = Color3.fromRGB(96, 46, 204),
        ["ELegB"] = Color3.fromRGB(96, 46, 204),
        ["ELegC"] = Color3.fromRGB(96, 46, 204),
        ["NELegB"] = Color3.fromRGB(96, 46, 204),
        ["NELegC"] = Color3.fromRGB(96, 46, 204),
        ["NLegB"] = Color3.fromRGB(96, 46, 204),
        ["NLegC"] = Color3.fromRGB(96, 46, 204),
        ["NWLegB"] = Color3.fromRGB(96, 46, 204),
        ["NWLegC"] = Color3.fromRGB(96, 46, 204),
        ["Rings"] = Color3.fromRGB(96, 46, 204),
        ["SELegA"] = Color3.fromRGB(96, 46, 204),
        ["SELegB"] = Color3.fromRGB(96, 46, 204),
        ["SELegC"] = Color3.fromRGB(96, 46, 204),
        ["SLegA"] = Color3.fromRGB(96, 46, 204),
        ["SLegB"] = Color3.fromRGB(96, 46, 204),
        ["SLegC"] = Color3.fromRGB(96, 46, 204),
        ["SWLegA"] = Color3.fromRGB(96, 46, 204),
        ["SWLegB"] = Color3.fromRGB(96, 46, 204),
        ["SWLegC"] = Color3.fromRGB(96, 46, 204),
        ["Torso"] = Color3.fromRGB(96, 46, 204),
        ["WLegA"] = Color3.fromRGB(96, 46, 204),
        ["WLegB"] = Color3.fromRGB(96, 46, 204),
        ["WLegC"] = Color3.fromRGB(96, 46, 204)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_blue_ringed_octopus = v4
local v5 = {
    ["name"] = "Borhyaena Gigantica",
    ["image"] = "rbxassetid://13104122472",
    ["model"] = "Danger2023BorhyaenaGigantica",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023BorhyaenaGiganticaBeingHeldDouble",
        ["eating"] = "Danger2023BorhyaenaGiganticaEat",
        ["flying"] = "Danger2023BorhyaenaGiganticaRun",
        ["hold"] = "Danger2023BorhyaenaGiganticaBeingHeldSingle",
        ["idle"] = "Danger2023BorhyaenaGiganticaIdle",
        ["running"] = "Danger2023BorhyaenaGiganticaRun",
        ["sit"] = "Danger2023BorhyaenaGiganticaSit",
        ["sleep"] = "Danger2023BorhyaenaGiganticaSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023BorhyaenaGiganticaSit" },
        { "Joyful", "Danger2023BorhyaenaGiganticaJoyful" },
        { "Beg", "Danger2023BorhyaenaGiganticaBeg" },
        { "Jump", "Danger2023BorhyaenaGiganticaJump" },
        { "Trick 1", "Danger2023BorhyaenaGiganticaTrick1" },
        { "Trick 2", "Danger2023BorhyaenaGiganticaTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(94, 94, 189),
        ["BackRightFoot"] = Color3.fromRGB(94, 94, 189),
        ["FrontLeftFoot"] = Color3.fromRGB(94, 94, 189),
        ["FrontRightFoot"] = Color3.fromRGB(94, 94, 189),
        ["Head2"] = Color3.fromRGB(94, 94, 189),
        ["LeftEar"] = Color3.fromRGB(94, 94, 189),
        ["LeftEar2"] = Color3.fromRGB(94, 94, 189),
        ["RightEar"] = Color3.fromRGB(94, 94, 189),
        ["RightEar2"] = Color3.fromRGB(94, 94, 189),
        ["Tail"] = Color3.fromRGB(94, 94, 189),
        ["Tail2"] = Color3.fromRGB(94, 94, 189),
        ["Tail3"] = Color3.fromRGB(94, 94, 189),
        ["Torso2"] = Color3.fromRGB(94, 94, 189)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_borhyaena_gigantica = v5
local v6 = {
    ["name"] = "Danger Egg",
    ["image"] = "rbxassetid://13104102169",
    ["model"] = "Danger2023Egg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "Danger2023EggIdle",
        ["running"] = "Danger2023EggRun",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 5
}
v2.danger_2023_egg = v6
local v7 = {
    ["name"] = "Hippo",
    ["image"] = "rbxassetid://13104122150",
    ["model"] = "Danger2023Hippo",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023HippoBeingHeldDouble",
        ["eating"] = "Danger2023HippoEat",
        ["flying"] = "Danger2023HippoRun",
        ["hold"] = "Danger2023HippoBeingHeldSingle",
        ["idle"] = "Danger2023HippoIdle",
        ["running"] = "Danger2023HippoRun",
        ["sit"] = "Danger2023HippoSit",
        ["sleep"] = "Danger2023HippoSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023HippoSit" },
        { "Joyful", "Danger2023HippoJoyful" },
        { "Beg", "Danger2023HippoBeg" },
        { "Jump", "Danger2023HippoJump" },
        { "Trick 1", "Danger2023HippoTrick1" },
        { "Trick 2", "Danger2023HippoTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(189, 181, 91),
        ["RightEar2"] = Color3.fromRGB(189, 181, 91),
        ["Teeth"] = Color3.fromRGB(189, 181, 91),
        ["Torso2"] = Color3.fromRGB(189, 181, 91)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_hippo = v7
local v8 = {
    ["name"] = "Lammergeier",
    ["image"] = "rbxassetid://13104108894",
    ["model"] = "Danger2023Lammergeier",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023LammergeierBeingHeldDouble",
        ["eating"] = "Danger2023LammergeierEat",
        ["flying"] = "Danger2023LammergeierRun",
        ["hold"] = "Danger2023LammergeierBeingHeldSingle",
        ["idle"] = "Danger2023LammergeierIdle",
        ["running"] = "Danger2023LammergeierRun",
        ["sit"] = "Danger2023LammergeierSit",
        ["sleep"] = "Danger2023LammergeierSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023LammergeierSit" },
        { "Joyful", "Danger2023LammergeierJoyful" },
        { "Beg", "Danger2023LammergeierBeg" },
        { "Jump", "Danger2023LammergeierJump" },
        { "Trick 1", "Danger2023LammergeierTrick1" },
        { "Trick 2", "Danger2023LammergeierTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(50, 186, 89),
        ["Beak2"] = Color3.fromRGB(50, 186, 89),
        ["Head3"] = Color3.fromRGB(50, 186, 89),
        ["LeftFoot"] = Color3.fromRGB(50, 186, 89),
        ["LeftWing"] = Color3.fromRGB(50, 186, 89),
        ["LeftWing2"] = Color3.fromRGB(50, 186, 89),
        ["RightFoot"] = Color3.fromRGB(50, 186, 89),
        ["RightWing"] = Color3.fromRGB(50, 186, 89),
        ["RightWing2"] = Color3.fromRGB(50, 186, 89),
        ["Tail"] = Color3.fromRGB(50, 186, 89),
        ["Tail2"] = Color3.fromRGB(50, 186, 89),
        ["Tail3"] = Color3.fromRGB(50, 186, 89)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_lammergeier = v8
local v9 = {
    ["name"] = "Liger",
    ["image"] = "rbxassetid://13104118499",
    ["model"] = "Danger2023Liger",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023LigerBeingHeldDouble",
        ["eating"] = "Danger2023LigerEat",
        ["flying"] = "Danger2023LigerRun",
        ["hold"] = "Danger2023LigerBeingHeldSingle",
        ["idle"] = "Danger2023LigerIdle",
        ["running"] = "Danger2023LigerRun",
        ["sit"] = "Danger2023LigerSit",
        ["sleep"] = "Danger2023LigerSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023LigerSit" },
        { "Joyful", "Danger2023LigerJoyful" },
        { "Beg", "Danger2023LigerBeg" },
        { "Jump", "Danger2023LigerJump" },
        { "Trick 1", "Danger2023LigerTrick1" },
        { "Trick 2", "Danger2023LigerTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(55, 188, 95),
        ["LeftBackFoot"] = Color3.fromRGB(55, 188, 95),
        ["LeftEar2"] = Color3.fromRGB(55, 188, 95),
        ["LeftFrontFoot"] = Color3.fromRGB(55, 188, 95),
        ["Nose"] = Color3.fromRGB(55, 188, 95),
        ["RightBackFoot"] = Color3.fromRGB(55, 188, 95),
        ["RightEar2"] = Color3.fromRGB(55, 188, 95),
        ["RightFrontFoot"] = Color3.fromRGB(55, 188, 95),
        ["Tail2"] = Color3.fromRGB(55, 188, 95),
        ["Tail4"] = Color3.fromRGB(55, 188, 95),
        ["Tail5"] = Color3.fromRGB(55, 188, 95),
        ["Tail6"] = Color3.fromRGB(55, 188, 95),
        ["Torso2"] = Color3.fromRGB(55, 188, 95),
        ["Whiskers"] = Color3.fromRGB(55, 188, 95)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_liger = v9
local v10 = {
    ["name"] = "Mosquito",
    ["image"] = "rbxassetid://13104106555",
    ["model"] = "Danger2023Mosquito",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023MosquitoBeingHeldDouble",
        ["eating"] = "Danger2023MosquitoEat",
        ["flying"] = "Danger2023MosquitoRun",
        ["hold"] = "Danger2023MosquitoBeingHeldSingle",
        ["idle"] = "Danger2023MosquitoIdle",
        ["running"] = "Danger2023MosquitoRun",
        ["sit"] = "Danger2023MosquitoSit",
        ["sleep"] = "Danger2023MosquitoSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023MosquitoSit" },
        { "Joyful", "Danger2023MosquitoJoyful" },
        { "Beg", "Danger2023MosquitoBeg" },
        { "Jump", "Danger2023MosquitoJump" },
        { "Trick 1", "Danger2023MosquitoTrick1" },
        { "Trick 2", "Danger2023MosquitoTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(195, 112, 79),
        ["LeftAntenna2"] = Color3.fromRGB(195, 112, 79),
        ["LeftAntenna3"] = Color3.fromRGB(195, 112, 79),
        ["LeftWing"] = Color3.fromRGB(195, 112, 79),
        ["LeftWing2"] = Color3.fromRGB(195, 112, 79),
        ["LeftWing3"] = Color3.fromRGB(195, 112, 79),
        ["RightAntenna"] = Color3.fromRGB(195, 112, 79),
        ["RightAntenna2"] = Color3.fromRGB(195, 112, 79),
        ["RightAntenna3"] = Color3.fromRGB(195, 112, 79),
        ["RightWing"] = Color3.fromRGB(195, 112, 79),
        ["RightWing2"] = Color3.fromRGB(195, 112, 79),
        ["RightWing3"] = Color3.fromRGB(195, 112, 79),
        ["Torso"] = Color3.fromRGB(195, 112, 79),
        ["Torso2"] = Color3.fromRGB(195, 112, 79),
        ["Torso3"] = Color3.fromRGB(195, 112, 79)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_mosquito = v10
local v11 = {
    ["name"] = "Owlbear",
    ["image"] = "rbxassetid://13104112588",
    ["model"] = "Danger2023Owlbear",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023OwlbearBeingHeldDouble",
        ["eating"] = "Danger2023OwlbearEat",
        ["flying"] = "Danger2023OwlbearRun",
        ["hold"] = "Danger2023OwlbearBeingHeldSingle",
        ["idle"] = "Danger2023OwlbearIdle",
        ["running"] = "Danger2023OwlbearRun",
        ["sit"] = "Danger2023OwlbearSit",
        ["sleep"] = "Danger2023OwlbearSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023OwlbearSit" },
        { "Joyful", "Danger2023OwlbearJoyful" },
        { "Beg", "Danger2023OwlbearBeg" },
        { "Jump", "Danger2023OwlbearJump" },
        { "Trick 1", "Danger2023OwlbearTrick1" },
        { "Trick 2", "Danger2023OwlbearTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(101, 127, 223),
        ["LeftArm"] = Color3.fromRGB(101, 127, 223),
        ["LeftArm2"] = Color3.fromRGB(101, 127, 223),
        ["LeftFoot"] = Color3.fromRGB(101, 127, 223),
        ["LeftWing3"] = Color3.fromRGB(101, 127, 223),
        ["RightArm"] = Color3.fromRGB(101, 127, 223),
        ["RightArm2"] = Color3.fromRGB(101, 127, 223),
        ["RightFoot"] = Color3.fromRGB(101, 127, 223),
        ["RightWing3"] = Color3.fromRGB(101, 127, 223),
        ["Torso3"] = Color3.fromRGB(101, 127, 223)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_owlbear = v11
local v12 = {
    ["name"] = "Piranha",
    ["image"] = "rbxassetid://13104111122",
    ["model"] = "Danger2023Piranha",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023PiranhaBeingHeldDouble",
        ["eating"] = "Danger2023PiranhaEat",
        ["flying"] = "Danger2023PiranhaRun",
        ["hold"] = "Danger2023PiranhaBeingHeldSingle",
        ["idle"] = "Danger2023PiranhaIdle",
        ["running"] = "Danger2023PiranhaRun",
        ["sit"] = "Danger2023PiranhaSit",
        ["sleep"] = "Danger2023PiranhaSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023PiranhaSit" },
        { "Joyful", "Danger2023PiranhaJoyful" },
        { "Beg", "Danger2023PiranhaBeg" },
        { "Jump", "Danger2023PiranhaJump" },
        { "Trick 1", "Danger2023PiranhaTrick1" },
        { "Trick 2", "Danger2023PiranhaTrick2" }
    },
    ["neon_parts"] = {
        ["BackFin"] = Color3.fromRGB(95, 186, 85),
        ["BottomFin2"] = Color3.fromRGB(95, 186, 85),
        ["LeftFin2"] = Color3.fromRGB(95, 186, 85),
        ["LowerTeeth"] = Color3.fromRGB(95, 186, 85),
        ["RightFin2"] = Color3.fromRGB(95, 186, 85),
        ["Tail"] = Color3.fromRGB(95, 186, 85),
        ["Torso2"] = Color3.fromRGB(95, 186, 85),
        ["UpperTeeth"] = Color3.fromRGB(95, 186, 85)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_piranha = v12
local v13 = {
    ["name"] = "Poison Dart Frog",
    ["image"] = "rbxassetid://13104121371",
    ["model"] = "Danger2023PoisonDartFrog",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023PoisonDartFrogBeingHeldDouble",
        ["eating"] = "Danger2023PoisonDartFrogEat",
        ["flying"] = "Danger2023PoisonDartFrogFly",
        ["hold"] = "Danger2023PoisonDartFrogBeingHeldSingle",
        ["idle"] = "Danger2023PoisonDartFrogIdle",
        ["running"] = "Danger2023PoisonDartFrogRun",
        ["sit"] = "Danger2023PoisonDartFrogSit",
        ["sleep"] = "Danger2023PoisonDartFrogSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023PoisonDartFrogSit" },
        { "Joyful", "Danger2023PoisonDartFrogJoyful" },
        { "Beg", "Danger2023PoisonDartFrogBeg" },
        { "Jump", "Danger2023PoisonDartFrogJump" },
        { "Trick 1", "Danger2023PoisonDartFrogTrick1" },
        { "Trick 2", "Danger2023PoisonDartFrogTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(108, 186, 80),
        ["BackRightFoot"] = Color3.fromRGB(108, 186, 80),
        ["FrontLeftFoot"] = Color3.fromRGB(108, 186, 80),
        ["FrontRightFoot"] = Color3.fromRGB(108, 186, 80),
        ["Torso2"] = Color3.fromRGB(108, 186, 80),
        ["Torso3"] = Color3.fromRGB(108, 186, 80)
    },
    ["eyes"] = { "Eyes" },
    ["flying_move_anim_speed"] = 0.75,
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_poison_dart_frog = v13
local v14 = {
    ["name"] = "Puffer Fish",
    ["image"] = "rbxassetid://13104107016",
    ["model"] = "Danger2023PufferFish",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023PufferFishBeingHeldDouble",
        ["eating"] = "Danger2023PufferFishEat",
        ["flying"] = "Danger2023PufferFishRun",
        ["hold"] = "Danger2023PufferFishBeingHeldSingle",
        ["idle"] = "Danger2023PufferFishIdle",
        ["running"] = "Danger2023PufferFishRun",
        ["sit"] = "Danger2023PufferFishSit",
        ["sleep"] = "Danger2023PufferFishSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023PufferFishSit" },
        { "Joyful", "Danger2023PufferFishJoyful" },
        { "Beg", "Danger2023PufferFishBeg" },
        { "Jump", "Danger2023PufferFishJump" },
        { "Trick 1", "Danger2023PufferFishTrick1" },
        { "Trick 2", "Danger2023PufferFishTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(69, 181, 119),
        ["LeftFin"] = Color3.fromRGB(69, 181, 119),
        ["RightFin"] = Color3.fromRGB(69, 181, 119),
        ["Scale1"] = Color3.fromRGB(69, 181, 119),
        ["Scale10"] = Color3.fromRGB(69, 181, 119),
        ["Scale11"] = Color3.fromRGB(69, 181, 119),
        ["Scale14"] = Color3.fromRGB(69, 181, 119),
        ["Scale17"] = Color3.fromRGB(69, 181, 119),
        ["Scale18"] = Color3.fromRGB(69, 181, 119),
        ["Scale19"] = Color3.fromRGB(69, 181, 119),
        ["Scale2"] = Color3.fromRGB(69, 181, 119),
        ["Scale3"] = Color3.fromRGB(69, 181, 119),
        ["Scale4"] = Color3.fromRGB(69, 181, 119),
        ["Scale5"] = Color3.fromRGB(69, 181, 119),
        ["Scale6"] = Color3.fromRGB(69, 181, 119),
        ["Scale8"] = Color3.fromRGB(69, 181, 119),
        ["Scale9"] = Color3.fromRGB(69, 181, 119),
        ["Spikes"] = Color3.fromRGB(69, 181, 119),
        ["Spikes2"] = Color3.fromRGB(69, 181, 119),
        ["Spikes3"] = Color3.fromRGB(69, 181, 119),
        ["Torso"] = Color3.fromRGB(69, 181, 119)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "EyesLeft", "EyesRight" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_puffer_fish = v14
local v15 = {
    ["name"] = "Spinosaurus",
    ["image"] = "rbxassetid://13104109574",
    ["model"] = "Danger2023Spinosaurus",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Danger",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Danger2023SpinosaurusBeingHeldDouble",
        ["eating"] = "Danger2023SpinosaurusEat",
        ["flying"] = "Danger2023SpinosaurusRun",
        ["hold"] = "Danger2023SpinosaurusBeingHeldSingle",
        ["idle"] = "Danger2023SpinosaurusIdle",
        ["running"] = "Danger2023SpinosaurusRun",
        ["sit"] = "Danger2023SpinosaurusSit",
        ["sleep"] = "Danger2023SpinosaurusSleep"
    },
    ["tricks"] = {
        { "Sit", "Danger2023SpinosaurusSit" },
        { "Joyful", "Danger2023SpinosaurusJoyful" },
        { "Beg", "Danger2023SpinosaurusBeg" },
        { "Jump", "Danger2023SpinosaurusJump" },
        { "Trick 1", "Danger2023SpinosaurusTrick1" },
        { "Trick 2", "Danger2023SpinosaurusTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(211, 100, 78),
        ["Head3"] = Color3.fromRGB(211, 100, 78),
        ["Head4"] = Color3.fromRGB(211, 100, 78),
        ["LeftFoot2"] = Color3.fromRGB(211, 100, 78),
        ["LeftHand2"] = Color3.fromRGB(211, 100, 78),
        ["RightFoot2"] = Color3.fromRGB(211, 100, 78),
        ["RightHand2"] = Color3.fromRGB(211, 100, 78),
        ["Torso2"] = Color3.fromRGB(211, 100, 78),
        ["Torso3"] = Color3.fromRGB(211, 100, 78),
        ["Torso4"] = Color3.fromRGB(211, 100, 78)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.75
}
v2.danger_2023_spinosaurus = v15
return v1(v2)