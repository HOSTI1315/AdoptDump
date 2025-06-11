--// ReplicatedStorage.SharedModules.ContentPacks.Winter2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Ermine",
    ["image"] = "rbxassetid://11631390464",
    ["model"] = "Winter2022Ermine",
    ["rarity"] = "uncommon",
    ["cost"] = 9000,
    ["currency_id"] = "gingerbread_2022",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022ErmineBeingHeldDouble",
        ["eating"] = "Winter2022ErmineEat",
        ["flying"] = "Winter2022ErmineRun",
        ["hold"] = "Winter2022ErmineBeingHeldSingle",
        ["idle"] = "Winter2022ErmineIdle",
        ["running"] = "Winter2022ErmineRun",
        ["sit"] = "Winter2022ErmineSit",
        ["sleep"] = "Winter2022ErmineSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022ErmineSit" },
        { "Joyful", "Winter2022ErmineJoyful" },
        { "Beg", "Winter2022ErmineBeg" },
        { "Jump", "Winter2022ErmineJump" },
        { "Trick 1", "Winter2022ErmineTrick1" },
        { "Trick 2", "Winter2022ErmineTrick2" }
    },
    ["neon_parts"] = {
        ["LeftBackFoot"] = Color3.fromRGB(197, 106, 56),
        ["LeftEar"] = Color3.fromRGB(197, 106, 56),
        ["LeftEar2"] = Color3.fromRGB(197, 106, 56),
        ["LeftFrontFoot"] = Color3.fromRGB(197, 106, 56),
        ["Nose"] = Color3.fromRGB(197, 106, 56),
        ["RightBackFoot"] = Color3.fromRGB(197, 106, 56),
        ["RightEar"] = Color3.fromRGB(197, 106, 56),
        ["RightEar2"] = Color3.fromRGB(197, 106, 56),
        ["RightFrontFoot"] = Color3.fromRGB(197, 106, 56),
        ["Tail2"] = Color3.fromRGB(197, 106, 56),
        ["Whiskers"] = Color3.fromRGB(197, 106, 56)
    },
    ["eyes"] = { "Eyes" },
    ["flying_move_anim_speed"] = 0.5,
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_ermine = v3
local v4 = {
    ["name"] = "Gingerbread Reindeer",
    ["image"] = "rbxassetid://11765322595",
    ["model"] = "Winter2022GingerbreadReindeer",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022GingerbreadReindeerBeingDoubleHeld",
        ["eating"] = "Winter2022GingerbreadReindeerEating",
        ["hold"] = "Winter2022GingerbreadReindeerBeingHeld",
        ["idle"] = "Winter2022GingerbreadReindeerIdle",
        ["running"] = "Winter2022GingerbreadReindeerRunning",
        ["sit"] = "Winter2022GingerbreadReindeerSit",
        ["sleep"] = "Winter2022GingerbreadReindeerSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022GingerbreadReindeerSit" },
        { "Joyful", "Winter2022GingerbreadReindeerJoyful" },
        { "Beg", "Winter2022GingerbreadReindeerBeg" },
        { "Jump", "Winter2022GingerbreadReindeerJump" },
        { "Trick 1", "Winter2022GingerbreadReindeerTrick1" },
        { "Trick 2", "Winter2022GingerbreadReindeerTrick2" }
    },
    ["neon_parts"] = {
        ["Antlers2"] = Color3.fromRGB(191, 38, 27),
        ["Antlers3"] = Color3.fromRGB(88, 185, 31),
        ["LeftEar3"] = Color3.fromRGB(181, 182, 188),
        ["RightEar3"] = Color3.fromRGB(181, 182, 188),
        ["Tail3"] = Color3.fromRGB(181, 182, 188),
        ["Torso3"] = Color3.fromRGB(88, 185, 31),
        ["Torso4"] = Color3.fromRGB(191, 38, 27)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_gingerbread_reindeer = v4
local v5 = {
    ["name"] = "Ice Moth Dragon",
    ["image"] = "rbxassetid://11496077150",
    ["model"] = "Winter2022IceMothDragon",
    ["rarity"] = "legendary",
    ["cost"] = 120000,
    ["currency_id"] = "gingerbread_2022",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022IceMothDragonBeingHeldDouble",
        ["eating"] = "Winter2022IceMothDragonEat",
        ["hold"] = "Winter2022IceMothDragonBeingHeldSingle",
        ["idle"] = "Winter2022IceMothDragonIdle",
        ["running"] = "Winter2022IceMothDragonRun",
        ["sit"] = "Winter2022IceMothDragonSit",
        ["sleep"] = "Winter2022IceMothDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022IceMothDragonSit" },
        { "Joyful", "Winter2022IceMothDragonJoyful" },
        { "Beg", "Winter2022IceMothDragonBeg" },
        { "Jump", "Winter2022IceMothDragonJump" },
        { "Trick 1", "Winter2022IceMothDragonTrick1" },
        { "Trick 2", "Winter2022IceMothDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Hair10"] = Color3.fromRGB(120, 144, 130),
        ["Hair12"] = Color3.fromRGB(120, 144, 130),
        ["Hair14"] = Color3.fromRGB(120, 144, 130),
        ["Hair2"] = Color3.fromRGB(120, 144, 130),
        ["Hair3"] = Color3.fromRGB(120, 144, 130),
        ["Hair8"] = Color3.fromRGB(120, 144, 130),
        ["Head2"] = Color3.fromRGB(120, 144, 130),
        ["LeftAntenna"] = Color3.fromRGB(120, 144, 130),
        ["LeftBackFoot"] = Color3.fromRGB(120, 144, 130),
        ["LeftFrontFoot"] = Color3.fromRGB(120, 144, 130),
        ["LeftWhisker"] = Color3.fromRGB(120, 144, 130),
        ["LeftWhisker2"] = Color3.fromRGB(120, 144, 130),
        ["LeftWing"] = Color3.fromRGB(120, 144, 130),
        ["LeftWing3"] = Color3.fromRGB(120, 144, 130),
        ["LeftWing4"] = Color3.fromRGB(120, 144, 130),
        ["RightAntenna"] = Color3.fromRGB(120, 144, 130),
        ["RightBackFoot"] = Color3.fromRGB(120, 144, 130),
        ["RightFrontFoot"] = Color3.fromRGB(120, 144, 130),
        ["RightWhisker"] = Color3.fromRGB(120, 144, 130),
        ["RightWhisker2"] = Color3.fromRGB(120, 144, 130),
        ["RightWing"] = Color3.fromRGB(120, 144, 130),
        ["RightWing3"] = Color3.fromRGB(120, 144, 130),
        ["RightWing4"] = Color3.fromRGB(120, 144, 130),
        ["Tail2"] = Color3.fromRGB(120, 144, 130)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.8
}
v2.winter_2022_ice_moth_dragon = v5
local v6 = {
    ["name"] = "Ice Wolf",
    ["image"] = "rbxassetid://11505509482",
    ["model"] = "Winter2022IceWolf",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022IceWolfBeingHeldDouble",
        ["eating"] = "Winter2022IceWolfEat",
        ["flying"] = "Winter2022IceWolfRun",
        ["hold"] = "Winter2022IceWolfBeingHeldSingle",
        ["idle"] = "Winter2022IceWolfIdle",
        ["running"] = "Winter2022IceWolfRun",
        ["sit"] = "Winter2022IceWolfSit",
        ["sleep"] = "Winter2022IceWolfSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022IceWolfSit" },
        { "Joyful", "Winter2022IceWolfJoyful" },
        { "Beg", "Winter2022IceWolfBeg" },
        { "Jump", "Winter2022IceWolfJump" },
        { "Trick 1", "Winter2022IceWolfTrick1" },
        { "Trick 2", "Winter2022IceWolfTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(13, 190, 209),
        ["Head2"] = Color3.fromRGB(13, 190, 209),
        ["LeftEar2"] = Color3.fromRGB(13, 190, 209),
        ["Nose"] = Color3.fromRGB(13, 190, 209),
        ["RightEar2"] = Color3.fromRGB(13, 190, 209),
        ["Spine"] = Color3.fromRGB(13, 190, 209),
        ["Torso"] = Color3.fromRGB(13, 190, 209)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_ice_wolf = v6
local v7 = {
    ["name"] = "Irish Elk",
    ["image"] = "rbxassetid://11507151679",
    ["model"] = "Winter2022IrishElk",
    ["rarity"] = "rare",
    ["cost"] = 35000,
    ["currency_id"] = "gingerbread_2022",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022IrishElkBeingHeldDouble",
        ["eating"] = "Winter2022IrishElkEat",
        ["flying"] = "Winter2022IrishElkRun",
        ["hold"] = "Winter2022IrishElkBeingHeldSingle",
        ["idle"] = "Winter2022IrishElkIdle",
        ["running"] = "Winter2022IrishElkRun",
        ["sit"] = "Winter2022IrishElkSit",
        ["sleep"] = "Winter2022IrishElkSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022IrishElkSit" },
        { "Joyful", "Winter2022IrishElkJoyful" },
        { "Beg", "Winter2022IrishElkBeg" },
        { "Jump", "Winter2022IrishElkJump" },
        { "Trick 1", "Winter2022IrishElkTrick1" },
        { "Trick 2", "Winter2022IrishElkTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntler"] = Color3.fromRGB(189, 142, 101),
        ["LeftEar"] = Color3.fromRGB(189, 142, 101),
        ["LeftEar2"] = Color3.fromRGB(189, 142, 101),
        ["NeckFur"] = Color3.fromRGB(189, 142, 101),
        ["NeckFur2"] = Color3.fromRGB(189, 142, 101),
        ["NeckFur3"] = Color3.fromRGB(189, 142, 101),
        ["NeckFur4"] = Color3.fromRGB(189, 142, 101),
        ["NeckFur5"] = Color3.fromRGB(189, 142, 101),
        ["NeckFur6"] = Color3.fromRGB(189, 142, 101),
        ["RightAntler"] = Color3.fromRGB(189, 142, 101),
        ["RightEar2"] = Color3.fromRGB(189, 142, 101),
        ["RightEar3"] = Color3.fromRGB(189, 142, 101),
        ["Tail"] = Color3.fromRGB(189, 142, 101),
        ["Tail2"] = Color3.fromRGB(189, 142, 101),
        ["Torso2"] = Color3.fromRGB(189, 142, 101)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_irish_elk = v7
local v8 = {
    ["name"] = "Ram",
    ["image"] = "rbxassetid://11505487641",
    ["model"] = "Winter2022Ram",
    ["rarity"] = "ultra_rare",
    ["cost"] = 50000,
    ["currency_id"] = "gingerbread_2022",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022RamBeingHeldDouble",
        ["eating"] = "Winter2022RamEat",
        ["flying"] = "Winter2022RamRun",
        ["hold"] = "Winter2022RamBeingHeldSingle",
        ["idle"] = "Winter2022RamIdle",
        ["running"] = "Winter2022RamRun",
        ["sit"] = "Winter2022RamSit",
        ["sleep"] = "Winter2022RamSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022RamSit" },
        { "Joyful", "Winter2022RamJoyful" },
        { "Beg", "Winter2022RamBeg" },
        { "Jump", "Winter2022RamJump" },
        { "Trick 1", "Winter2022RamTrick1" },
        { "Trick 2", "Winter2022RamTrick2" }
    },
    ["neon_parts"] = {
        ["LeftBackFoot"] = Color3.fromRGB(112, 183, 184),
        ["LeftFrontFoot"] = Color3.fromRGB(112, 183, 184),
        ["LeftHorn"] = Color3.fromRGB(112, 183, 184),
        ["LeftHorn2"] = Color3.fromRGB(112, 183, 184),
        ["Nose"] = Color3.fromRGB(112, 183, 184),
        ["RightBackFoot"] = Color3.fromRGB(112, 183, 184),
        ["RightFrontFoot"] = Color3.fromRGB(112, 183, 184),
        ["RightHorn"] = Color3.fromRGB(112, 183, 184),
        ["RightHorn2"] = Color3.fromRGB(112, 183, 184),
        ["Tail"] = Color3.fromRGB(112, 183, 184),
        ["Tail2"] = Color3.fromRGB(112, 183, 184)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_ram = v8
local v9 = {
    ["name"] = "Shetland Pony Dark Brown",
    ["image"] = "rbxassetid://11694855214",
    ["model"] = "Winter2022ShetlandPonyDarkBrown",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022ShetlandPonyBeingHeldDouble",
        ["eating"] = "Winter2022ShetlandPonyEat",
        ["flying"] = "Winter2022ShetlandPonyRun",
        ["hold"] = "Winter2022ShetlandPonyBeingHeldSingle",
        ["idle"] = "Winter2022ShetlandPonyIdle",
        ["running"] = "Winter2022ShetlandPonyRun",
        ["sit"] = "Winter2022ShetlandPonySit",
        ["sleep"] = "Winter2022ShetlandPonySleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022ShetlandPonySit" },
        { "Joyful", "Winter2022ShetlandPonyJoyful" },
        { "Beg", "Winter2022ShetlandPonyBeg" },
        { "Jump", "Winter2022ShetlandPonyJump" },
        { "Trick 1", "Winter2022ShetlandPonyTrick1" },
        { "Trick 2", "Winter2022ShetlandPonyTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(194, 119, 109),
        ["BackRightFoot"] = Color3.fromRGB(194, 119, 109),
        ["FrontLeftFoot"] = Color3.fromRGB(194, 119, 109),
        ["FrontRightFoot"] = Color3.fromRGB(194, 119, 109),
        ["LeftEar2"] = Color3.fromRGB(194, 119, 109),
        ["Mane"] = Color3.fromRGB(194, 119, 109),
        ["RightEar2"] = Color3.fromRGB(194, 119, 109),
        ["Tail"] = Color3.fromRGB(194, 119, 109),
        ["Torso2"] = Color3.fromRGB(194, 119, 109)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_shetland_pony_dark_brown = v9
local v10 = {
    ["name"] = "Shetland Pony Light Brown",
    ["image"] = "rbxassetid://11694854226",
    ["model"] = "Winter2022ShetlandPonyLightBrown",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022ShetlandPonyBeingHeldDouble",
        ["eating"] = "Winter2022ShetlandPonyEat",
        ["flying"] = "Winter2022ShetlandPonyRun",
        ["hold"] = "Winter2022ShetlandPonyBeingHeldSingle",
        ["idle"] = "Winter2022ShetlandPonyIdle",
        ["running"] = "Winter2022ShetlandPonyRun",
        ["sit"] = "Winter2022ShetlandPonySit",
        ["sleep"] = "Winter2022ShetlandPonySleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022ShetlandPonySit" },
        { "Joyful", "Winter2022ShetlandPonyJoyful" },
        { "Beg", "Winter2022ShetlandPonyBeg" },
        { "Jump", "Winter2022ShetlandPonyJump" },
        { "Trick 1", "Winter2022ShetlandPonyTrick1" },
        { "Trick 2", "Winter2022ShetlandPonyTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(188, 181, 142),
        ["BackRightFoot"] = Color3.fromRGB(188, 181, 142),
        ["FrontLeftFoot"] = Color3.fromRGB(188, 181, 142),
        ["FrontRightFoot"] = Color3.fromRGB(188, 181, 142),
        ["LeftEar2"] = Color3.fromRGB(188, 181, 142),
        ["Mane"] = Color3.fromRGB(188, 181, 142),
        ["RightEar2"] = Color3.fromRGB(188, 181, 142),
        ["Tail"] = Color3.fromRGB(188, 181, 142),
        ["Torso2"] = Color3.fromRGB(188, 181, 142)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_shetland_pony_light_brown = v10
local v11 = {
    ["name"] = "Shetland Pony White",
    ["image"] = "rbxassetid://11694853423",
    ["model"] = "Winter2022ShetlandPonyWhite",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022ShetlandPonyBeingHeldDouble",
        ["eating"] = "Winter2022ShetlandPonyEat",
        ["flying"] = "Winter2022ShetlandPonyRun",
        ["hold"] = "Winter2022ShetlandPonyBeingHeldSingle",
        ["idle"] = "Winter2022ShetlandPonyIdle",
        ["running"] = "Winter2022ShetlandPonyRun",
        ["sit"] = "Winter2022ShetlandPonySit",
        ["sleep"] = "Winter2022ShetlandPonySleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022ShetlandPonySit" },
        { "Joyful", "Winter2022ShetlandPonyJoyful" },
        { "Beg", "Winter2022ShetlandPonyBeg" },
        { "Jump", "Winter2022ShetlandPonyJump" },
        { "Trick 1", "Winter2022ShetlandPonyTrick1" },
        { "Trick 2", "Winter2022ShetlandPonyTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(107, 185, 90),
        ["BackRightFoot"] = Color3.fromRGB(107, 185, 90),
        ["FrontLeftFoot"] = Color3.fromRGB(107, 185, 90),
        ["FrontRightFoot"] = Color3.fromRGB(107, 185, 90),
        ["LeftEar2"] = Color3.fromRGB(107, 185, 90),
        ["Mane"] = Color3.fromRGB(107, 185, 90),
        ["RightEar2"] = Color3.fromRGB(107, 185, 90),
        ["Tail"] = Color3.fromRGB(107, 185, 90),
        ["Torso2"] = Color3.fromRGB(107, 185, 90)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_shetland_pony_white = v11
local v12 = {
    ["name"] = "Snowball Pet",
    ["image"] = "rbxassetid://11706110842",
    ["model"] = "Winter2022SnowballPet",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022SnowballPetBeingHeldDouble",
        ["eating"] = "Winter2022SnowballPetEat",
        ["flying"] = "Winter2022SnowballPetRun",
        ["hold"] = "Winter2022SnowballPetBeingHeldSingle",
        ["idle"] = "Winter2022SnowballPetIdle",
        ["running"] = "Winter2022SnowballPetRun",
        ["sit"] = "Winter2022SnowballPetSit",
        ["sleep"] = "Winter2022SnowballPetSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022SnowballPetSit" },
        { "Joyful", "Winter2022SnowballPetJoyful" },
        { "Beg", "Winter2022SnowballPetBeg" },
        { "Jump", "Winter2022SnowballPetJump" },
        { "Trick 1", "Winter2022SnowballPetTrick1" },
        { "Trick 2", "Winter2022SnowballPetTrick2" }
    },
    ["neon_parts"] = {
        ["Freckles"] = Color3.fromRGB(52, 172, 112),
        ["LeftFoot"] = Color3.fromRGB(52, 172, 112),
        ["LeftHand"] = Color3.fromRGB(52, 172, 112),
        ["Nose"] = Color3.fromRGB(52, 172, 112),
        ["RightFoot"] = Color3.fromRGB(52, 172, 112),
        ["RightHand"] = Color3.fromRGB(52, 172, 112),
        ["Torso"] = Color3.fromRGB(52, 172, 112)
    },
    ["flying_move_anim_speed"] = 0.5,
    ["minimum_fly_anim_speed"] = 0.2,
    ["wings_offset"] = Vector3.new(0.2, 0, 0)
}
v2.winter_2022_snowball_pet = v12
local v13 = {
    ["name"] = "Steppe Lion",
    ["image"] = "rbxassetid://11706157391",
    ["model"] = "Winter2022SteppeLion",
    ["rarity"] = "rare",
    ["cost"] = 25000,
    ["currency_id"] = "gingerbread_2022",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022SteppeLionBeingHeldDouble",
        ["eating"] = "Winter2022SteppeLionEat",
        ["flying"] = "Winter2022SteppeLionRun",
        ["hold"] = "Winter2022SteppeLionBeingHeldSingle",
        ["idle"] = "Winter2022SteppeLionIdle",
        ["running"] = "Winter2022SteppeLionRun",
        ["sit"] = "Winter2022SteppeLionSit",
        ["sleep"] = "Winter2022SteppeLionSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022SteppeLionSit" },
        { "Joyful", "Winter2022SteppeLionJoyful" },
        { "Beg", "Winter2022SteppeLionBeg" },
        { "Jump", "Winter2022SteppeLionJump" },
        { "Trick 1", "Winter2022SteppeLionTrick1" },
        { "Trick 2", "Winter2022SteppeLionTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(142, 101, 202),
        ["BackRightFoot"] = Color3.fromRGB(142, 101, 202),
        ["Body2"] = Color3.fromRGB(142, 101, 202),
        ["Body3"] = Color3.fromRGB(142, 101, 202),
        ["FrontLeftFoot"] = Color3.fromRGB(142, 101, 202),
        ["FrontRightFoot"] = Color3.fromRGB(142, 101, 202),
        ["Head2"] = Color3.fromRGB(142, 101, 202),
        ["Head3"] = Color3.fromRGB(142, 101, 202),
        ["LeftEar2"] = Color3.fromRGB(142, 101, 202),
        ["Mane1"] = Color3.fromRGB(142, 101, 202),
        ["Mane2"] = Color3.fromRGB(142, 101, 202),
        ["RightEar2"] = Color3.fromRGB(142, 101, 202),
        ["Tail2"] = Color3.fromRGB(142, 101, 202),
        ["Tail3"] = Color3.fromRGB(142, 101, 202)
    },
    ["flying_move_anim_speed"] = 0.4,
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_steppe_lion = v13
local v14 = {
    ["name"] = "Strawberry Shortcake Bat Dragon",
    ["image"] = "rbxassetid://11506045996",
    ["model"] = "Winter2022StrawberryShortcakeBatDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022StrawberryShortcakeBatDragonBeingHeldDouble",
        ["eating"] = "Winter2022StrawberryShortcakeBatDragonEat",
        ["hold"] = "Winter2022StrawberryShortcakeBatDragonBeingHeldSingle",
        ["idle"] = "Winter2022StrawberryShortcakeBatDragonIdle",
        ["running"] = "Winter2022StrawberryShortcakeBatDragonRun",
        ["sit"] = "Winter2022StrawberryShortcakeBatDragonSit",
        ["sleep"] = "Winter2022StrawberryShortcakeBatDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022StrawberryShortcakeBatDragonSit" },
        { "Joyful", "Winter2022StrawberryShortcakeBatDragonJoyful" },
        { "Beg", "Winter2022StrawberryShortcakeBatDragonBeg" },
        { "Jump", "Winter2022StrawberryShortcakeBatDragonJump" },
        { "Trick 1", "Winter2022StrawberryShortcakeBatDragonTrick1" },
        { "Trick 2", "Winter2022StrawberryShortcakeBatDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Fangs"] = Color3.fromRGB(188, 105, 188),
        ["Freckles"] = Color3.fromRGB(188, 105, 188),
        ["Horns"] = Color3.fromRGB(188, 105, 188),
        ["LeftBackFoot"] = Color3.fromRGB(188, 105, 188),
        ["LeftEar"] = Color3.fromRGB(188, 105, 188),
        ["LeftFrontFoot"] = Color3.fromRGB(188, 105, 188),
        ["LeftWIng4"] = Color3.fromRGB(188, 105, 188),
        ["LeftWIng5"] = Color3.fromRGB(188, 105, 188),
        ["LeftWing2"] = Color3.fromRGB(188, 105, 188),
        ["Nose"] = Color3.fromRGB(188, 105, 188),
        ["RightBackFoot"] = Color3.fromRGB(188, 105, 188),
        ["RightEar"] = Color3.fromRGB(188, 105, 188),
        ["RightFrontFoot"] = Color3.fromRGB(188, 105, 188),
        ["RightWIng2"] = Color3.fromRGB(188, 105, 188),
        ["RightWing4"] = Color3.fromRGB(188, 105, 188),
        ["RightWing5"] = Color3.fromRGB(188, 105, 188),
        ["Strawberry"] = Color3.fromRGB(188, 105, 188),
        ["Tail3"] = Color3.fromRGB(188, 105, 188),
        ["Tail4"] = Color3.fromRGB(188, 105, 188),
        ["Torso3"] = Color3.fromRGB(188, 105, 188)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.8
}
v2.winter_2022_strawberry_shortcake_bat_dragon = v14
local v15 = {
    ["name"] = "Wooly Rhino",
    ["image"] = "rbxassetid://11767069383",
    ["model"] = "Winter2022WoolyRhino",
    ["rarity"] = "ultra_rare",
    ["cost"] = 80000,
    ["currency_id"] = "gingerbread_2022",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Winter2022WoolyRhinoBeingDoubleHeld",
        ["eating"] = "Winter2022WoolyRhinoEating",
        ["hold"] = "Winter2022WoolyRhinoBeingHeld",
        ["idle"] = "Winter2022WoolyRhinoIdle",
        ["running"] = "Winter2022WoolyRhinoRunning",
        ["sit"] = "Winter2022WoolyRhinoSit",
        ["sleep"] = "Winter2022WoolyRhinoSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2022WoolyRhinoSit" },
        { "Joyful", "Winter2022WoolyRhinoJoyful" },
        { "Beg", "Winter2022WoolyRhinoBeg" },
        { "Jump", "Winter2022WoolyRhinoJump" },
        { "Trick 1", "Winter2022WoolyRhinoTrick1" },
        { "Trick 2", "Winter2022WoolyRhinoTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(188, 109, 164),
        ["HornFur"] = Color3.fromRGB(188, 109, 164),
        ["Horns"] = Color3.fromRGB(188, 109, 164),
        ["LeftEar2"] = Color3.fromRGB(188, 109, 164),
        ["RightEar2"] = Color3.fromRGB(188, 109, 164),
        ["Tail2"] = Color3.fromRGB(188, 109, 164),
        ["Tail3"] = Color3.fromRGB(188, 109, 164),
        ["Torso2"] = Color3.fromRGB(188, 109, 164)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.winter_2022_wooly_rhino = v15
return v1(v2)