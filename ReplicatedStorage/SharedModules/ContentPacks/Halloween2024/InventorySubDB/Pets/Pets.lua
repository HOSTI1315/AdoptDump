--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v2("GameplayFX")
local v_u_4 = v2("LiveOpsTime")
local v5 = v2("SharedConstants")
local v_u_6 = v5.day_length + v5.night_length
local v7 = v1.pets
local v8 = {}
local v9 = {
    ["name"] = "Pumpkin Friend",
    ["image"] = "rbxassetid://93775555430694",
    ["model"] = "Halloween2024PumpkinFriend",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2024PumpkinFriendBeingHeldDouble",
        ["eating"] = "Halloween2024PumpkinFriendEat",
        ["flying"] = "Halloween2024PumpkinFriendFlying",
        ["hold"] = "Halloween2024PumpkinFriendBeingHeldSingle",
        ["idle"] = "Halloween2024PumpkinFriendIdle",
        ["idle_mounted"] = "Halloween2024PumpkinFriendIdleGround",
        ["running"] = "Halloween2024PumpkinFriendRun",
        ["sit"] = "Halloween2024PumpkinFriendSit",
        ["sleep"] = "Halloween2024PumpkinFriendSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024PumpkinFriendSit" },
        { "Joyful", "Halloween2024PumpkinFriendJoyful" },
        { "Beg", "Halloween2024PumpkinFriendBeg" },
        { "Jump", "Halloween2024PumpkinFriendJump" },
        { "Trick 1", "Halloween2024PumpkinFriendTrick1" },
        { "Trick 2", "Halloween2024PumpkinFriendTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(186, 111, 57)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -10,
    ["eyes"] = { "LeftEye", "RightEye" }
}
v8.halloween_2024_pumpkin_friend = v9
local v10 = {
    ["name"] = "Frankenfeline",
    ["image"] = "rbxassetid://125112456358906",
    ["model"] = "Halloween2024Frankenfeline",
    ["rarity"] = "common",
    ["cost"] = 3600,
    ["currency_id"] = "candy_2024",
    ["origin_entry"] = {
        ["display_name"] = "Frankenfeline",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2024FrankenfelineBeingHeldDouble",
        ["eating"] = "Halloween2024FrankenfelineEat",
        ["hold"] = "Halloween2024FrankenfelineBeingHeldSingle",
        ["idle"] = "Halloween2024FrankenfelineIdle",
        ["running"] = "Halloween2024FrankenfelineRun",
        ["sit"] = "Halloween2024FrankenfelineSit",
        ["sleep"] = "Halloween2024FrankenfelineSleep",
        ["pedestal_idle"] = "Halloween2024FrankenfelineBeingHeldSingle"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024FrankenfelineSit" },
        { "Joyful", "Halloween2024FrankenfelineJoyful" },
        { "Beg", "Halloween2024FrankenfelineBeg" },
        { "Jump", "Halloween2024FrankenfelineJump" },
        { "Trick 1", "Halloween2024FrankenfelineTrick1" },
        { "Trick 2", "Halloween2024FrankenfelineTrick2" }
    },
    ["neon_parts"] = {
        ["Torso3"] = Color3.fromRGB(184, 186, 96),
        ["RightEar2"] = Color3.fromRGB(184, 186, 96),
        ["Bolts"] = Color3.fromRGB(184, 186, 96),
        ["LeftEar2"] = Color3.fromRGB(184, 186, 96),
        ["Eyes"] = Color3.fromRGB(176, 138, 113),
        ["BackLeftFoot2"] = Color3.fromRGB(184, 186, 96),
        ["FrontLeftFoot2"] = Color3.fromRGB(184, 186, 96),
        ["FrontRightFoot2"] = Color3.fromRGB(184, 186, 96),
        ["BackRightFoot2"] = Color3.fromRGB(184, 186, 96),
        ["Whiskers"] = Color3.fromRGB(55, 56, 44),
        ["Head4"] = Color3.fromRGB(184, 186, 96)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v8.halloween_2024_franken_feline = v10
local v11 = {
    ["name"] = "Indian Flying Fox",
    ["image"] = "rbxassetid://79274485636628",
    ["model"] = "Halloween2024IndianFlyingFox",
    ["rarity"] = "ultra_rare",
    ["cost"] = 61000,
    ["currency_id"] = "candy_2024",
    ["origin_entry"] = {
        ["display_name"] = "Indian Flying Fox",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2024IndianFlyingFoxBeingHeldDouble",
        ["eating"] = "Halloween2024IndianFlyingFoxEat",
        ["hold"] = "Halloween2024IndianFlyingFoxBeingHeldSingle",
        ["idle"] = "Halloween2024IndianFlyingFoxIdle",
        ["running"] = "Halloween2024IndianFlyingFoxRun",
        ["sit"] = "Halloween2024IndianFlyingFoxSit",
        ["sleep"] = "Halloween2024IndianFlyingFoxSleep",
        ["pedestal_idle"] = "Halloween2024IndianFlyingFoxBeingHeldSingle"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024IndianFlyingFoxSit" },
        { "Joyful", "Halloween2024IndianFlyingFoxJoyful" },
        { "Beg", "Halloween2024IndianFlyingFoxBeg" },
        { "Jump", "Halloween2024IndianFlyingFoxJump" },
        { "Trick 1", "Halloween2024IndianFlyingFoxTrick1" },
        { "Trick 2", "Halloween2024IndianFlyingFoxTrick2" }
    },
    ["neon_parts"] = {
        ["Fangs"] = Color3.fromRGB(188, 144, 68),
        ["Torso3"] = Color3.fromRGB(188, 144, 68),
        ["Tail"] = Color3.fromRGB(188, 144, 68),
        ["Nose"] = Color3.fromRGB(188, 144, 68),
        ["Head2"] = Color3.fromRGB(188, 144, 68),
        ["LeftFoot"] = Color3.fromRGB(188, 144, 68),
        ["RightFoot"] = Color3.fromRGB(188, 144, 68),
        ["LeftEar3"] = Color3.fromRGB(188, 144, 68),
        ["RightEar3"] = Color3.fromRGB(188, 144, 68),
        ["LeftWing2"] = Color3.fromRGB(188, 144, 68),
        ["RightWing2"] = Color3.fromRGB(188, 144, 68)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v8.halloween_2024_indian_flying_fox = v11
local v12 = {
    ["name"] = "Grim Dragon",
    ["image"] = "rbxassetid://126930507653265",
    ["model"] = "Halloween2024GrimDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["display_name"] = "Grim Dragon",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2024GrimDragonBeingHeldDouble",
        ["eating"] = "Halloween2024GrimDragonEat",
        ["hold"] = "Halloween2024GrimDragonBeingHeldSingle",
        ["idle"] = "Halloween2024GrimDragonIdle",
        ["running"] = "Halloween2024GrimDragonRun",
        ["sit"] = "Halloween2024GrimDragonSit",
        ["sleep"] = "Halloween2024GrimDragonSleep",
        ["pedestal_idle"] = "Halloween2024GrimDragonBeingHeldSingle"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024GrimDragonSit" },
        { "Joyful", "Halloween2024GrimDragonJoyful" },
        { "Beg", "Halloween2024GrimDragonBeg" },
        { "Jump", "Halloween2024GrimDragonJump" },
        { "Trick 1", "Halloween2024GrimDragonTrick1" },
        { "Trick 2", "Halloween2024GrimDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(191, 103, 100),
        ["LowerTeeth"] = Color3.fromRGB(193, 113, 99),
        ["LeftWing2"] = Color3.fromRGB(193, 113, 99),
        ["Tail"] = Color3.fromRGB(193, 113, 99),
        ["RightWing"] = Color3.fromRGB(193, 113, 99),
        ["LeftWing1"] = Color3.fromRGB(193, 113, 99),
        ["LeftWing"] = Color3.fromRGB(193, 113, 99),
        ["UpperTeeth"] = Color3.fromRGB(193, 113, 99),
        ["RightWing1"] = Color3.fromRGB(193, 113, 99),
        ["RightWing2"] = Color3.fromRGB(193, 113, 99),
        ["Horns"] = Color3.fromRGB(193, 113, 99)
    },
    ["maximum_run_anim_speed"] = 0.75,
    ["minimum_fly_anim_speed"] = 0.75,
    ["maximum_fly_anim_speed"] = 0.75,
    ["already_has_flying_wings"] = true,
    ["mounted_animation_scale_limit"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -21,
    ["generate_npc_furniture_on_runtime"] = true
}
v8.halloween_2024_grim_dragon = v12
local v13 = {
    ["name"] = "Sea Skeleton Panda",
    ["image"] = "rbxassetid://139319822015938",
    ["model"] = "Halloween2024SeaSkeletonPanda",
    ["rarity"] = "uncommon",
    ["cost"] = 8000,
    ["currency_id"] = "candy_2024",
    ["origin_entry"] = {
        ["display_name"] = "Sea Skeleton Panda",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Halloween2024SeaSkeletonPandaSleep",
        ["running"] = "Halloween2024SeaSkeletonPandaRun",
        ["idle"] = "Halloween2024SeaSkeletonPandaIdle",
        ["eating"] = "Halloween2024SeaSkeletonPandaEat",
        ["sit"] = "Halloween2024SeaSkeletonPandaSit",
        ["flying"] = "Halloween2024SeaSkeletonPandaRun",
        ["hold"] = "Halloween2024SeaSkeletonPandaBeingHeldSingle",
        ["double_hold"] = "Halloween2024SeaSkeletonPandaBeingHeldDouble",
        ["pedestal_idle"] = "Halloween2024SeaSkeletonPandaBeingHeldSingle"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024SeaSkeletonPandaSit" },
        { "Joyful", "Halloween2024SeaSkeletonPandaJoyful" },
        { "Beg", "Halloween2024SeaSkeletonPandaBeg" },
        { "Jump", "Halloween2024SeaSkeletonPandaJump" },
        { "Trick 1", "Halloween2024SeaSkeletonPandaTrick1" },
        { "Trick 2", "Halloween2024SeaSkeletonPandaTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(106, 142, 190),
        ["Head3"] = Color3.fromRGB(106, 142, 190),
        ["Shell1"] = Color3.fromRGB(119, 161, 252),
        ["Head1"] = Color3.fromRGB(106, 142, 190)
    },
    ["flying_move_anim_speed"] = 0.75,
    ["maximum_run_anim_speed"] = 0.85,
    ["generate_npc_furniture_on_runtime"] = true
}
v8.halloween_2024_sea_skeleton_panda = v13
local v14 = {
    ["name"] = "Dracula Parrot",
    ["model"] = "Halloween2024DraculaParrot",
    ["image"] = "rbxassetid://94185217299816",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["display_name"] = "Dracula Parrot",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Halloween2024DraculaParrotSleep",
        ["running"] = "Halloween2024DraculaParrotRun",
        ["idle"] = "Halloween2024DraculaParrotIdle",
        ["eating"] = "Halloween2024DraculaParrotEat",
        ["sit"] = "Halloween2024DraculaParrotSit",
        ["flying"] = "Halloween2024DraculaParrotRun",
        ["hold"] = "Halloween2024DraculaParrotBeingHeldSingle",
        ["double_hold"] = "Halloween2024DraculaParrotBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024DraculaParrotSit" },
        { "Joyful", "Halloween2024DraculaParrotJoyful" },
        { "Beg", "Halloween2024DraculaParrotBeg" },
        { "Jump", "Halloween2024DraculaParrotJump" },
        { "Trick 1", "Halloween2024DraculaParrotTrick1" },
        { "Trick 2", "Halloween2024DraculaParrotTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(190, 84, 54),
        ["RightWing2"] = Color3.fromRGB(186, 84, 53),
        ["Tail"] = Color3.fromRGB(186, 84, 53),
        ["LeftWing2"] = Color3.fromRGB(186, 84, 53)
    },
    ["already_has_flying_wings"] = true
}
v8.halloween_2024_dracula_parrot = v14
local v15 = {
    ["name"] = "Scarebear",
    ["image"] = "rbxassetid://122648024705835",
    ["model"] = "Halloween2024Scarebear",
    ["rarity"] = "legendary",
    ["cost"] = 140000,
    ["currency_id"] = "candy_2024",
    ["origin_entry"] = {
        ["year"] = 2024,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["neon_parts"] = {
        ["WereFur"] = Color3.fromRGB(127, 144, 184),
        ["RightEar2"] = Color3.fromRGB(127, 144, 184),
        ["LeftEar2"] = Color3.fromRGB(127, 144, 184),
        ["Hair"] = Color3.fromRGB(127, 144, 184)
    }
}
local v16 = {
    ["get_form"] = function()
        return v_u_4.get_is_day() and "normal" or "changed"
    end,
    ["default_form"] = "changed"
}
local v17 = {}
local v18 = {}
local v19 = {
    ["Hair"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    },
    ["Head"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    },
    ["LeftBackFoot"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    },
    ["LeftEar"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    },
    ["LeftEar2"] = {
        ["Color"] = Color3.fromRGB(224, 132, 109)
    },
    ["LeftFrontFoot"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    },
    ["RightBackFoot"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    },
    ["RightEar"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    },
    ["RightEar2"] = {
        ["Color"] = Color3.fromRGB(224, 132, 109)
    },
    ["RightFrontFoot"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    },
    ["Snout"] = {
        ["Color"] = Color3.fromRGB(228, 169, 127)
    },
    ["Torso"] = {
        ["Color"] = Color3.fromRGB(159, 83, 25)
    }
}
v18.part_properties = v19
v18.parts = { "Eyes", "Tail" }
v18.eyes = { "Eyes" }
v18.anims = {
    ["running"] = "Halloween2024ScarebearNormalRun",
    ["idle"] = "Halloween2024ScarebearNormalIdle",
    ["sleep"] = "Halloween2024ScarebearNormalSleep",
    ["sit"] = "Halloween2024ScarebearNormalSit",
    ["hold"] = "Halloween2024ScarebearNormalBeingHeldSingle",
    ["double_hold"] = "Halloween2024ScarebearNormalBeingHeldDouble",
    ["eating"] = "Halloween2024ScarebearNormalEat",
    ["pedestal_idle"] = "Halloween2024ScarebearNormalBeingHeldDouble",
    ["transform"] = "Halloween2024ScarebearTransformIn"
}
v18.tricks = {
    { "Sit", "Halloween2024ScarebearNormalSit" },
    { "Joyful", "Halloween2024ScarebearNormalJoyful" },
    { "Beg", "Halloween2024ScarebearNormalBeg" },
    { "Jump", "Halloween2024ScarebearNormalJump" },
    { "Trick 1", "Halloween2024ScarebearNormalTrick1" },
    { "Trick 2", "Halloween2024ScarebearNormalTrick2" }
}
v17.normal = v18
local v20 = {}
local v21 = {
    ["Hair"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    },
    ["Head"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    },
    ["LeftBackFoot"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    },
    ["LeftEar"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    },
    ["LeftEar2"] = {
        ["Color"] = Color3.fromRGB(27, 31, 40)
    },
    ["LeftFrontFoot"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    },
    ["RightBackFoot"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    },
    ["RightEar"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    },
    ["RightEar2"] = {
        ["Color"] = Color3.fromRGB(27, 31, 40)
    },
    ["RightFrontFoot"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    },
    ["Snout"] = {
        ["Color"] = Color3.fromRGB(27, 31, 40)
    },
    ["Torso"] = {
        ["Color"] = Color3.fromRGB(53, 58, 67)
    }
}
v20.part_properties = v21
v20.parts = {
    "Eyes_Changed",
    "LeftBackFoot2",
    "LeftFrontFoot2",
    "RightBackFoot2",
    "RightFrontFoot2",
    "WereBrows",
    "WereFangs",
    "WereFur",
    "WereFurBot",
    "WereFurBotLeft",
    "WereFurBotRight",
    "WereFurLeft",
    "WereFurRight",
    "WereFurTop",
    "WereFurTopLeft",
    "WereFurTopRight",
    "WereLeftBrow",
    "WereRightBrow",
    "WereTail",
    "WereTorso2",
    "WereTorso3",
    "WereTorso4",
    "WereTorso5",
    "WereTorso6",
    "WereTorso7",
    "WereTorso8",
    "WereTorso9"
}
v20.eyes = { "Eyes_Changed" }
v20.anims = {
    ["running"] = "Halloween2024ScarebearChangedRun",
    ["idle"] = "Halloween2024ScarebearChangedIdle",
    ["sleep"] = "Halloween2024ScarebearChangedSleep",
    ["sit"] = "Halloween2024ScarebearChangedSit",
    ["hold"] = "Halloween2024ScarebearChangedBeingHeldSingle",
    ["double_hold"] = "Halloween2024ScarebearChangedBeingHeldDouble",
    ["eating"] = "Halloween2024ScarebearChangedEat",
    ["pedestal_idle"] = "Halloween2024ScarebearNormalBeingHeldDouble",
    ["transform"] = "Halloween2024ScarebearTransformOut"
}
v20.tricks = {
    { "Sit", "Halloween2024ScarebearChangedSit" },
    { "Joyful", "Halloween2024ScarebearChangedJoyful" },
    { "Beg", "Halloween2024ScarebearChangedBeg" },
    { "Jump", "Halloween2024ScarebearChangedJump" },
    { "Trick 1", "Halloween2024ScarebearChangedTrick1" },
    { "Trick 2", "Halloween2024ScarebearChangedTrick2" }
}
v17.changed = v20
v16.forms = v17
v15.transforming_pet = v16
v15.eyes = { "Eyes", "Eyes_Changed" }
v8.halloween_2024_scarebear = v15
local v22 = {
    ["name"] = "Zombie Chick",
    ["image"] = "rbxassetid://78519945248690",
    ["model"] = "Halloween2024ZombieChick",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["display_name"] = "Zombie Chick",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Halloween2024ZombieChickSleep",
        ["running"] = "Halloween2024ZombieChickRun",
        ["idle"] = "Halloween2024ZombieChickIdle",
        ["eating"] = "Halloween2024ZombieChickEat",
        ["sit"] = "Halloween2024ZombieChickSit",
        ["flying"] = "Halloween2024ZombieChickRun",
        ["hold"] = "Halloween2024ZombieChickBeingHeldSingle",
        ["double_hold"] = "Halloween2024ZombieChickBeingHeldDouble",
        ["pedestal_idle"] = "Halloween2024ZombieChickBeingHeldSingle"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024ZombieChickSit" },
        { "Joyful", "Halloween2024ZombieChickJoyful" },
        { "Beg", "Halloween2024ZombieChickBeg" },
        { "Jump", "Halloween2024ZombieChickJump" },
        { "Trick 1", "Halloween2024ZombieChickTrick1" },
        { "Trick 2", "Halloween2024ZombieChickTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(92, 184, 101),
        ["Head3"] = Color3.fromRGB(92, 184, 101),
        ["LeftFoot"] = Color3.fromRGB(92, 184, 101),
        ["LeftWing"] = Color3.fromRGB(92, 184, 101),
        ["LeftWing2"] = Color3.fromRGB(92, 184, 101),
        ["RightFoot"] = Color3.fromRGB(92, 184, 101),
        ["RightWing"] = Color3.fromRGB(92, 184, 101),
        ["RightWing2"] = Color3.fromRGB(92, 184, 101),
        ["Torso2"] = Color3.fromRGB(92, 184, 101)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v8.halloween_2024_zombie_chick = v22
local v23 = {
    ["name"] = "Ghost Chick",
    ["image"] = "rbxassetid://103710623311342",
    ["model"] = "Halloween2024GhostChick",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["display_name"] = "Ghost Chick",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Halloween2024GhostChickSleep",
        ["running"] = "Halloween2024GhostChickRun",
        ["idle"] = "Halloween2024GhostChickIdle",
        ["eating"] = "Halloween2024GhostChickEat",
        ["sit"] = "Halloween2024GhostChickSit",
        ["flying"] = "Halloween2024GhostChickRun",
        ["hold"] = "Halloween2024GhostChickBeingHeldSingle",
        ["double_hold"] = "Halloween2024GhostChickBeingHeldDouble",
        ["pedestal_idle"] = "Halloween2024GhostChickBeingHeldSingle"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024GhostChickSit" },
        { "Joyful", "Halloween2024GhostChickJoyful" },
        { "Beg", "Halloween2024GhostChickBeg" },
        { "Jump", "Halloween2024GhostChickJump" },
        { "Trick 1", "Halloween2024GhostChickTrick1" },
        { "Trick 2", "Halloween2024GhostChickTrick2" }
    }
}
local v24 = {
    ["Beak"] = Color3.fromRGB(107, 162, 185),
    ["Eyes"] = Color3.fromRGB(107, 162, 185),
    ["LeftWing"] = Color3.fromRGB(107, 162, 185),
    ["RightWing"] = Color3.fromRGB(107, 162, 185),
    ["Spirits"] = Color3.fromRGB(92, 184, 101),
    ["Torso"] = {
        ["Material"] = Enum.Material.SmoothPlastic,
        ["Transparency"] = 0.4
    }
}
v23.neon_parts = v24
v23.generate_npc_furniture_on_runtime = true
v8.halloween_2024_ghost_chick = v23
local v25 = {
    ["name"] = "Evil Chick",
    ["image"] = "rbxassetid://126071806166898",
    ["model"] = "Halloween2024EvilChick",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["display_name"] = "Evil Chick",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Halloween2024EvilChickSleep",
        ["running"] = "Halloween2024EvilChickRun",
        ["idle"] = "Halloween2024EvilChickIdle",
        ["eating"] = "Halloween2024EvilChickEat",
        ["sit"] = "Halloween2024EvilChickSit",
        ["flying"] = "Halloween2024EvilChickRun",
        ["hold"] = "Halloween2024EvilChickBeingHeldSingle",
        ["double_hold"] = "Halloween2024EvilChickBeingHeldDouble",
        ["pedestal_idle"] = "Halloween2024EvilChickBeingHeldSingle"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024EvilChickSit" },
        { "Joyful", "Halloween2024EvilChickJoyful" },
        { "Beg", "Halloween2024EvilChickBeg" },
        { "Jump", "Halloween2024EvilChickJump" },
        { "Trick 1", "Halloween2024EvilChickTrick1" },
        { "Trick 2", "Halloween2024EvilChickTrick2" }
    },
    ["neon_parts"] = {
        ["EyeBrow"] = Color3.fromRGB(83, 51, 186),
        ["EyeBrow2"] = Color3.fromRGB(83, 51, 186),
        ["Eyes"] = Color3.fromRGB(189, 38, 9),
        ["LeftFoot"] = Color3.fromRGB(83, 51, 186),
        ["LeftWing"] = Color3.fromRGB(83, 51, 186),
        ["CollarSmoke"] = Color3.fromRGB(83, 51, 186),
        ["RightFoot"] = Color3.fromRGB(83, 51, 186),
        ["RightWing"] = Color3.fromRGB(83, 51, 186)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v8.halloween_2024_evil_chick = v25
local v26 = {
    ["name"] = "Marabou Stork",
    ["image"] = "rbxassetid://130497948875084",
    ["model"] = "Halloween2024MarabouStork",
    ["rarity"] = "rare",
    ["cost"] = 19000,
    ["currency_id"] = "candy_2024",
    ["origin_entry"] = {
        ["display_name"] = "Marabou Stork",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Halloween2024MarabouStorkSleep",
        ["running"] = "Halloween2024MarabouStorkRun",
        ["idle"] = "Halloween2024MarabouStorkIdle",
        ["eating"] = "Halloween2024MarabouStorkEat",
        ["sit"] = "Halloween2024MarabouStorkSit",
        ["flying"] = "Halloween2024MarabouStorkRun",
        ["hold"] = "Halloween2024MarabouStorkBeingHeldSingle",
        ["double_hold"] = "Halloween2024MarabouStorkBeingHeldDouble",
        ["pedestal_idle"] = "Halloween2024MarabouStorkBeingHeldSingle"
    },
    ["tricks"] = {
        { "Sit", "Halloween2024MarabouStorkSit" },
        { "Joyful", "Halloween2024MarabouStorkJoyful" },
        { "Beg", "Halloween2024MarabouStorkBeg" },
        { "Jump", "Halloween2024MarabouStorkJump" },
        { "Trick 1", "Halloween2024MarabouStorkTrick1" },
        { "Trick 2", "Halloween2024MarabouStorkTrick2" }
    },
    ["neon_parts"] = {
        ["Collar"] = Color3.fromRGB(188, 94, 31),
        ["Feather2"] = Color3.fromRGB(188, 94, 31),
        ["Head3"] = Color3.fromRGB(188, 94, 31),
        ["LeftWing2"] = Color3.fromRGB(188, 94, 31),
        ["RightWing2"] = Color3.fromRGB(188, 94, 31)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v8.halloween_2024_marabou_stork = v26
local v27 = {
    ["name"] = "Headless Horse",
    ["image"] = "rbxassetid://126725051633301",
    ["model"] = "Halloween2024HeadlessHorse",
    ["rarity"] = "ultra_rare",
    ["cost"] = 87000,
    ["currency_id"] = "candy_2024",
    ["origin_entry"] = {
        ["display_name"] = "Headless Horse",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2024HeadlessHorseBeingHeldDouble",
        ["eating"] = "Halloween2024HeadlessHorseEat",
        ["hold"] = "Halloween2024HeadlessHorseBeingHeldSingle",
        ["idle"] = "Halloween2024HeadlessHorseIdle",
        ["running"] = "Halloween2024HeadlessHorseRun",
        ["sit"] = "Halloween2024HeadlessHorseSit",
        ["sleep"] = "Halloween2024HeadlessHorseSleep",
        ["pedestal_idle"] = "Halloween2024HeadlessHorseBeingHeldSingle"
    },
    ["neon_parts"] = {
        ["Torso3"] = Color3.fromRGB(186, 111, 57),
        ["Head2"] = Color3.fromRGB(186, 111, 57),
        ["RightEar2"] = Color3.fromRGB(186, 111, 57),
        ["LeftEar2"] = Color3.fromRGB(186, 111, 57),
        ["Torso2"] = Color3.fromRGB(186, 111, 57),
        ["BackLeftFoot"] = Color3.fromRGB(186, 111, 57),
        ["BackRightFoot"] = Color3.fromRGB(186, 111, 57),
        ["FrontLeftFoot"] = Color3.fromRGB(186, 111, 57),
        ["FrontRightFoot"] = Color3.fromRGB(186, 111, 57)
    },
    ["tricks"] = {
        { "Sit", "Halloween2024HeadlessHorseSit" },
        { "Joyful", "Halloween2024HeadlessHorseJoyful" },
        { "Beg", "Halloween2024HeadlessHorseBeg" },
        { "Jump", "Halloween2024HeadlessHorseJump" },
        { "Trick 1", "Halloween2024HeadlessHorseTrick1" },
        { "Trick 2", "Halloween2024HeadlessHorseTrick2" }
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v8.halloween_2024_headless_horse = v27
local v28 = {
    ["name"] = "Jekyll Hydra",
    ["image"] = "rbxassetid://78823655016197",
    ["model"] = "Halloween2024JekyllHydra",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["year"] = 2024,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["neon_parts"] = {
        ["Spines_Geo"] = Color3.fromRGB(115, 184, 95),
        ["SpinesBack_Geo"] = Color3.fromRGB(115, 184, 95),
        ["SpinesLeft_Geo"] = Color3.fromRGB(115, 184, 95),
        ["SpinesRight_Geo"] = Color3.fromRGB(115, 184, 95),
        ["Torso"] = Color3.fromRGB(115, 184, 95),
        ["Torso2_Geo"] = Color3.fromRGB(115, 184, 95),
        ["Spines_Changed"] = Color3.fromRGB(186, 124, 61),
        ["SpinesBack_Changed"] = Color3.fromRGB(186, 124, 61),
        ["SpinesLeft_Changed"] = Color3.fromRGB(186, 124, 61),
        ["SpinesRight_Changed"] = Color3.fromRGB(186, 124, 61),
        ["Torso_Changed"] = Color3.fromRGB(186, 124, 61),
        ["Torso2_Changed"] = Color3.fromRGB(186, 124, 61)
    }
}
local v29 = {
    ["get_form"] = function()
        return v_u_4.get_current_day_start_time_seconds() / v_u_6 % 2 == 0 and "normal" or "changed"
    end,
    ["default_form"] = "normal"
}
local v30 = {}
local v31 = {}
local v32 = {
    ["Head"] = {
        ["Color"] = Color3.fromRGB(46, 116, 108)
    },
    ["HeadLeft_Geo"] = {
        ["Color"] = Color3.fromRGB(46, 116, 108)
    },
    ["HeadRight_Geo"] = {
        ["Color"] = Color3.fromRGB(46, 116, 108)
    },
    ["Nostril_Geo"] = {
        ["Color"] = Color3.fromRGB(50, 35, 32)
    },
    ["NostrilLeft_Geo"] = {
        ["Color"] = Color3.fromRGB(17, 17, 17)
    },
    ["NostrilRight_Geo"] = {
        ["Color"] = Color3.fromRGB(17, 17, 17)
    }
}
v31.part_properties = v32
v31.parts = {
    "BrowLeft_Geo",
    "BrowRight_Geo",
    "Brow_Geo",
    "EyesLeft_Geo",
    "EyesRight_Geo",
    "Eyes_Geo",
    "SpinesBack_Geo",
    "SpinesLeft_Geo",
    "SpinesRight_Geo",
    "Spines_Geo",
    "TeethLeft_Geo",
    "TeethRight_Geo",
    "Teeth_Geo",
    "Tongue_Geo",
    "Torso",
    "Torso2_Geo",
    "Torso3_Geo"
}
v31.eyes = { "Eyes_Geo" }
v31.anims = {
    ["running"] = "Halloween2024JekyllHydraNormalRun",
    ["idle"] = "Halloween2024JekyllHydraNormalIdle",
    ["sleep"] = "Halloween2024JekyllHydraNormalSleep",
    ["sit"] = "Halloween2024JekyllHydraNormalSit",
    ["hold"] = "Halloween2024JekyllHydraNormalBeingHeldSingle",
    ["double_hold"] = "Halloween2024JekyllHydraNormalBeingHeldDouble",
    ["eating"] = "Halloween2024JekyllHydraNormalEat",
    ["pedestal_idle"] = "Halloween2024JekyllHydraNormalBeingHeldDouble",
    ["transform"] = "Halloween2024JekyllHydraTransformIn"
}
v31.tricks = {
    { "Sit", "Halloween2024JekyllHydraNormalSit" },
    { "Joyful", "Halloween2024JekyllHydraNormalJoyful" },
    { "Beg", "Halloween2024JekyllHydraNormalBeg" },
    { "Jump", "Halloween2024JekyllHydraNormalJump" },
    { "Trick 1", "Halloween2024JekyllHydraNormalTrick1" },
    { "Trick 2", "Halloween2024JekyllHydraNormalTrick2" }
}
v30.normal = v31
local v33 = {}
local v34 = {
    ["Head"] = {
        ["Color"] = Color3.fromRGB(57, 75, 57)
    },
    ["HeadLeft_Geo"] = {
        ["Color"] = Color3.fromRGB(57, 75, 57)
    },
    ["HeadRight_Geo"] = {
        ["Color"] = Color3.fromRGB(57, 75, 57)
    },
    ["NostrilLeft_Geo"] = {
        ["Color"] = Color3.fromRGB(17, 17, 17)
    },
    ["NostrilRight_Geo"] = {
        ["Color"] = Color3.fromRGB(17, 17, 17)
    },
    ["Nostril_Geo"] = {
        ["Color"] = Color3.fromRGB(50, 35, 32)
    }
}
v33.part_properties = v34
v33.parts = {
    "BrowLeft_Changed",
    "BrowRight_Changed",
    "Brow_Changed",
    "EyesLeft_Geo_Changed",
    "EyesRight_Geo_Changed",
    "Eyes_Geo_Changed",
    "SpinesBack_Changed",
    "SpinesLeft_Changed",
    "SpinesRight_Changed",
    "Spines_Changed",
    "TeethLeft_Changed",
    "TeethRight_Changed",
    "Teeth_Changed",
    "Tongue_Changed",
    "Torso_Changed",
    "Torso2_Changed",
    "Torso3_Changed"
}
v33.eyes = { "Eyes_Geo_Changed" }
v33.anims = {
    ["running"] = "Halloween2024JekyllHydraChangedRun",
    ["idle"] = "Halloween2024JekyllHydraChangedIdle",
    ["sleep"] = "Halloween2024JekyllHydraChangedSleep",
    ["sit"] = "Halloween2024JekyllHydraChangedSit",
    ["hold"] = "Halloween2024JekyllHydraChangedBeingHeldSingle",
    ["double_hold"] = "Halloween2024JekyllHydraChangedBeingHeldDouble",
    ["eating"] = "Halloween2024JekyllHydraChangedEat",
    ["pedestal_idle"] = "Halloween2024JekyllHydraNormalBeingHeldDouble",
    ["transform"] = "Halloween2024JekyllHydraTransformOut"
}
v33.tricks = {
    { "Sit", "Halloween2024JekyllHydraChangedSit" },
    { "Joyful", "Halloween2024JekyllHydraChangedJoyful" },
    { "Beg", "Halloween2024JekyllHydraChangedBeg" },
    { "Jump", "Halloween2024JekyllHydraChangedJump" },
    { "Trick 1", "Halloween2024JekyllHydraChangedTrick1" },
    { "Trick 2", "Halloween2024JekyllHydraChangedTrick2" }
}
v30.changed = v33
v29.forms = v30
function v29.transformation_effects(p35)
    local v36 = game.ReplicatedStorage.Resources.Halloween2024.JekyllHydraTransformVFX.Poof
    local v37 = p35.base.pet_model
    v_u_3.emit_particle(v36, v37.Torso.Position, 64)
end
v28.transforming_pet = v29
v28.eyes = { "Eyes_Geo", "Eyes_Geo_Changed" }
v28.max_ride_scale = 1.75
v28.maximum_run_anim_speed = 0.75
v28.minimum_fly_anim_speed = 0.75
v28.maximum_fly_anim_speed = 0.75
v28.follow_offset_scale = 1.6
v8.halloween_2024_jekyll_hydra = v28
return v7(v8)