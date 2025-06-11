--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Basilisk",
    ["image"] = "rbxassetid://10971808356",
    ["model"] = "Halloween2022Basilisk",
    ["rarity"] = "rare",
    ["cost"] = 25000,
    ["currency_id"] = "candy_2022"
}
local v4 = {
    ["origin"] = "Halloween",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 6,
        ["offset"] = CFrame.new(0, 1, -2.5)
    },
    ["year"] = 2022
}
v3.origin_entry = v4
v3.anims = {
    ["double_hold"] = "Halloween2022BasiliskBeingHeldDouble",
    ["eating"] = "Halloween2022BasiliskEat",
    ["flying"] = "Halloween2022BasiliskRun",
    ["hold"] = "Halloween2022BasiliskBeingHeldSingle",
    ["idle"] = "Halloween2022BasiliskIdle",
    ["running"] = "Halloween2022BasiliskRun",
    ["sit"] = "Halloween2022BasiliskSit",
    ["sleep"] = "Halloween2022BasiliskSleep"
}
v3.tricks = {
    { "Sit", "Halloween2022BasiliskSit" },
    { "Joyful", "Halloween2022BasiliskJoyful" },
    { "Beg", "Halloween2022BasiliskBeg" },
    { "Jump", "Halloween2022BasiliskJump" },
    { "Trick 1", "Halloween2022BasiliskTrick1" },
    { "Trick 2", "Halloween2022BasiliskTrick2" }
}
v3.neon_parts = {
    ["Head"] = Color3.fromRGB(92, 193, 90),
    ["Horns"] = Color3.fromRGB(92, 193, 90),
    ["Jaw"] = Color3.fromRGB(92, 193, 90),
    ["Spikes"] = Color3.fromRGB(92, 193, 90),
    ["SpikesNeon"] = Color3.fromRGB(92, 193, 90),
    ["Torso4"] = Color3.fromRGB(92, 193, 90),
    ["Torso4Neon"] = Color3.fromRGB(92, 193, 90),
    ["Torso5"] = Color3.fromRGB(92, 193, 90),
    ["Torso6"] = Color3.fromRGB(92, 193, 90)
}
v3.avatar_editor_app_camera_distance_overrides = {
    ["fit_to_screen"] = 17.846,
    ["front_facing"] = 13.754
}
v3.generate_npc_furniture_on_runtime = true
v3.interaction_part_name = "HumanoidRootPart"
v3.minimum_fly_anim_speed = 1
v2.halloween_2022_basilisk = v3
local v5 = {
    ["name"] = "Chickatrice",
    ["image"] = "rbxassetid://11119263014",
    ["model"] = "Halloween2022Chickatrice",
    ["rarity"] = "uncommon",
    ["cost"] = 15000,
    ["currency_id"] = "candy_2022",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022ChickatriceBeingHeldDouble",
        ["eating"] = "Halloween2022ChickatriceEat",
        ["flying"] = "Halloween2022ChickatriceRun",
        ["hold"] = "Halloween2022ChickatriceBeingHeldSingle",
        ["idle"] = "Halloween2022ChickatriceIdle",
        ["running"] = "Halloween2022ChickatriceRun",
        ["sit"] = "Halloween2022ChickatriceSit",
        ["sleep"] = "Halloween2022ChickatriceSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022ChickatriceSit" },
        { "Joyful", "Halloween2022ChickatriceJoyful" },
        { "Beg", "Halloween2022ChickatriceBeg" },
        { "Jump", "Halloween2022ChickatriceJump" },
        { "Trick 1", "Halloween2022ChickatriceTrick1" },
        { "Trick 2", "Halloween2022ChickatriceTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(157, 108, 225),
        ["LeftWing2"] = Color3.fromRGB(157, 108, 225),
        ["LeftWing3"] = Color3.fromRGB(157, 108, 225),
        ["LeftWing4"] = Color3.fromRGB(157, 108, 225),
        ["LeftWingFeathers"] = Color3.fromRGB(157, 108, 225),
        ["RightWing2"] = Color3.fromRGB(157, 108, 225),
        ["RightWing3"] = Color3.fromRGB(157, 108, 225),
        ["RightWing4"] = Color3.fromRGB(157, 108, 225),
        ["RightWingFeathers"] = Color3.fromRGB(157, 108, 225),
        ["TailFeather"] = Color3.fromRGB(157, 108, 225)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 1
}
v2.halloween_2022_chickatrice = v5
local v6 = {
    ["name"] = "Chimera",
    ["image"] = "rbxassetid://10926054030",
    ["model"] = "Halloween2022Chimera",
    ["rarity"] = "legendary",
    ["cost"] = 110000,
    ["currency_id"] = "candy_2022",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022ChimeraBeingHeldDouble",
        ["eating"] = "Halloween2022ChimeraEat",
        ["hold"] = "Halloween2022ChimeraBeingHeldSingle",
        ["idle"] = "Halloween2022ChimeraIdle",
        ["running"] = "Halloween2022ChimeraRun",
        ["sit"] = "Halloween2022ChimeraSit",
        ["sleep"] = "Halloween2022ChimeraSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022ChimeraSit" },
        { "Joyful", "Halloween2022ChimeraJoyful" },
        { "Beg", "Halloween2022ChimeraBeg" },
        { "Jump", "Halloween2022ChimeraJump" },
        { "Trick 1", "Halloween2022ChimeraTrick1" },
        { "Trick 2", "Halloween2022ChimeraTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(99, 94, 255),
        ["BackRightFoot"] = Color3.fromRGB(99, 94, 255),
        ["Head2"] = Color3.fromRGB(99, 94, 255),
        ["Head3"] = Color3.fromRGB(99, 94, 255),
        ["LeftEar2"] = Color3.fromRGB(99, 91, 189),
        ["LeftEar4"] = Color3.fromRGB(255, 129, 120),
        ["LeftHead2"] = Color3.fromRGB(255, 129, 120),
        ["LeftHead3"] = Color3.fromRGB(255, 129, 120),
        ["RightEar2"] = Color3.fromRGB(99, 91, 189),
        ["Tail2"] = Color3.fromRGB(100, 98, 209),
        ["Tongue"] = Color3.fromRGB(255, 129, 120)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.halloween_2022_chimera = v6
local v7 = {
    ["name"] = "Evil Basilisk",
    ["image"] = "rbxassetid://10971808447",
    ["model"] = "Halloween2022EvilBasilisk",
    ["rarity"] = "ultra_rare",
    ["cost"] = 60000,
    ["currency_id"] = "candy_2022"
}
local v8 = {
    ["origin"] = "Halloween",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 6,
        ["offset"] = CFrame.new(0, 1, -2.5)
    },
    ["year"] = 2022
}
v7.origin_entry = v8
v7.anims = {
    ["double_hold"] = "Halloween2022BasiliskBeingHeldDouble",
    ["eating"] = "Halloween2022BasiliskEat",
    ["flying"] = "Halloween2022BasiliskRun",
    ["hold"] = "Halloween2022BasiliskBeingHeldSingle",
    ["idle"] = "Halloween2022BasiliskIdle",
    ["running"] = "Halloween2022BasiliskRun",
    ["sit"] = "Halloween2022BasiliskSit",
    ["sleep"] = "Halloween2022BasiliskSleep"
}
v7.tricks = {
    { "Sit", "Halloween2022BasiliskSit" },
    { "Joyful", "Halloween2022BasiliskJoyful" },
    { "Beg", "Halloween2022BasiliskBeg" },
    { "Jump", "Halloween2022BasiliskJump" },
    { "Trick 1", "Halloween2022BasiliskTrick1" },
    { "Trick 2", "Halloween2022BasiliskTrick2" }
}
local v9 = {
    ["Eyes"] = Color3.fromRGB(188, 37, 26),
    ["Head"] = Color3.fromRGB(188, 37, 26),
    ["Horns"] = Color3.fromRGB(188, 37, 26),
    ["Jaw"] = Color3.fromRGB(188, 37, 26),
    ["Spikes"] = {
        ["Transparency"] = 1
    },
    ["SpikesNeon"] = {
        ["Color"] = Color3.fromRGB(253, 251, 255),
        ["Transparency"] = 0
    },
    ["Tongue"] = Color3.fromRGB(188, 37, 26),
    ["Tongue2"] = Color3.fromRGB(188, 37, 26),
    ["Tongue3"] = Color3.fromRGB(188, 37, 26),
    ["Tongue4"] = Color3.fromRGB(188, 37, 26),
    ["Torso3"] = {
        ["Transparency"] = 1
    },
    ["Torso3Neon"] = {
        ["Color"] = Color3.fromRGB(255, 255, 255),
        ["Transparency"] = 0
    },
    ["Torso4"] = {
        ["Transparency"] = 1
    },
    ["Torso4Neon"] = {
        ["Color"] = Color3.fromRGB(255, 255, 255),
        ["Transparency"] = 0
    },
    ["Torso5"] = Color3.fromRGB(188, 37, 26),
    ["Torso6"] = Color3.fromRGB(188, 37, 26)
}
v7.neon_parts = v9
v7.mega_neon_parts = {
    ["Eyes"] = Color3.fromRGB(188, 37, 26),
    ["Head"] = Color3.fromRGB(188, 37, 26),
    ["Horns"] = Color3.fromRGB(188, 37, 26),
    ["Jaw"] = Color3.fromRGB(188, 37, 26),
    ["Spikes"] = Color3.fromRGB(188, 37, 26),
    ["Tongue"] = Color3.fromRGB(188, 37, 26),
    ["Tongue2"] = Color3.fromRGB(188, 37, 26),
    ["Tongue3"] = Color3.fromRGB(188, 37, 26),
    ["Tongue4"] = Color3.fromRGB(188, 37, 26),
    ["Torso3"] = Color3.fromRGB(188, 37, 26),
    ["Torso4"] = Color3.fromRGB(188, 37, 26),
    ["Torso5"] = Color3.fromRGB(188, 37, 26),
    ["Torso6"] = Color3.fromRGB(188, 37, 26)
}
v7.avatar_editor_app_camera_distance_overrides = {
    ["fit_to_screen"] = 17.846,
    ["front_facing"] = 13.754
}
v7.generate_npc_furniture_on_runtime = true
v7.interaction_part_name = "HumanoidRootPart"
v7.minimum_fly_anim_speed = 1
v2.halloween_2022_evil_basilisk = v7
local v10 = {
    ["name"] = "Evil Chickatrice",
    ["image"] = "rbxassetid://11119262646",
    ["model"] = "Halloween2022EvilChickatrice",
    ["rarity"] = "ultra_rare",
    ["cost"] = 45000,
    ["currency_id"] = "candy_2022",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022ChickatriceBeingHeldDouble",
        ["eating"] = "Halloween2022ChickatriceEat",
        ["flying"] = "Halloween2022ChickatriceRun",
        ["hold"] = "Halloween2022ChickatriceBeingHeldSingle",
        ["idle"] = "Halloween2022ChickatriceIdle",
        ["running"] = "Halloween2022ChickatriceRun",
        ["sit"] = "Halloween2022ChickatriceSit",
        ["sleep"] = "Halloween2022ChickatriceSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022ChickatriceSit" },
        { "Joyful", "Halloween2022ChickatriceJoyful" },
        { "Beg", "Halloween2022ChickatriceBeg" },
        { "Jump", "Halloween2022ChickatriceJump" },
        { "Trick 1", "Halloween2022ChickatriceTrick1" },
        { "Trick 2", "Halloween2022ChickatriceTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(188, 37, 26),
        ["Head2"] = Color3.fromRGB(188, 37, 26),
        ["LeftWing2"] = Color3.fromRGB(188, 37, 26),
        ["LeftWing3"] = Color3.fromRGB(188, 37, 26),
        ["LeftWing4"] = Color3.fromRGB(188, 37, 26),
        ["LeftWingFeathers"] = Color3.fromRGB(188, 37, 26),
        ["RightWing2"] = Color3.fromRGB(188, 37, 26),
        ["RightWing3"] = Color3.fromRGB(188, 37, 26),
        ["RightWing4"] = Color3.fromRGB(188, 37, 26),
        ["RightWingFeathers"] = Color3.fromRGB(188, 37, 26),
        ["TailFeather"] = Color3.fromRGB(188, 37, 26)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 1
}
v2.halloween_2022_evil_chickatrice = v10
local v11 = {
    ["name"] = "Ghost Wolf",
    ["image"] = "rbxassetid://11109314958",
    ["model"] = "Halloween2022GhostWolf",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2022_wolf_box" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022SteppeWolfBeingHeldDouble",
        ["eating"] = "Halloween2022SteppeWolfEat",
        ["flying"] = "Halloween2022SteppeWolfRun",
        ["hold"] = "Halloween2022SteppeWolfBeingHeldSingle",
        ["idle"] = "Halloween2022SteppeWolfIdle",
        ["running"] = "Halloween2022SteppeWolfRun",
        ["sit"] = "Halloween2022SteppeWolfSit",
        ["sleep"] = "Halloween2022SteppeWolfSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022SteppeWolfSit" },
        { "Joyful", "Halloween2022SteppeWolfJoyful" },
        { "Beg", "Halloween2022SteppeWolfBeg" },
        { "Jump", "Halloween2022SteppeWolfJump" },
        { "Trick 1", "Halloween2022SteppeWolfTrick1" },
        { "Trick 2", "Halloween2022SteppeWolfTrick2" }
    },
    ["neon_parts"] = {
        ["Body2"] = Color3.fromRGB(189, 125, 95),
        ["Head"] = Color3.fromRGB(189, 125, 95),
        ["LeftEar2"] = Color3.fromRGB(189, 125, 95),
        ["RightEar2"] = Color3.fromRGB(189, 125, 95),
        ["Tail3"] = Color3.fromRGB(189, 125, 95),
        ["Tail4"] = Color3.fromRGB(189, 125, 95)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.2
}
v2.halloween_2022_ghost_wolf = v11
local v12 = {
    ["name"] = "Jousting Horse",
    ["image"] = "rbxassetid://11191341630",
    ["model"] = "Halloween2022JoustingHorse",
    ["rarity"] = "legendary",
    ["cost"] = 150000,
    ["currency_id"] = "candy_2022",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022JoustingHorseBeingHeldDouble",
        ["eating"] = "Halloween2022JoustingHorseEat",
        ["flying"] = "Halloween2022JoustingHorseRun",
        ["hold"] = "Halloween2022JoustingHorseBeingHeldSingle",
        ["idle"] = "Halloween2022JoustingHorseIdle",
        ["running"] = "Halloween2022JoustingHorseRun",
        ["sit"] = "Halloween2022JoustingHorseSit",
        ["sleep"] = "Halloween2022JoustingHorseSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022JoustingHorseSit" },
        { "Joyful", "Halloween2022JoustingHorseJoyful" },
        { "Beg", "Halloween2022JoustingHorseBeg" },
        { "Jump", "Halloween2022JoustingHorseJump" },
        { "Trick 1", "Halloween2022JoustingHorseTrick1" },
        { "Trick 2", "Halloween2022JoustingHorseTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(188, 0, 0),
        ["BackRightFoot"] = Color3.fromRGB(188, 0, 0),
        ["FrontLeftFoot"] = Color3.fromRGB(188, 0, 0),
        ["FrontRightFoot"] = Color3.fromRGB(188, 0, 0),
        ["Hair2"] = Color3.fromRGB(188, 0, 0),
        ["Hair7"] = Color3.fromRGB(188, 0, 0),
        ["HeadArmor"] = Color3.fromRGB(188, 0, 0),
        ["Tail"] = Color3.fromRGB(188, 0, 0),
        ["Tail2"] = Color3.fromRGB(188, 0, 0),
        ["Tail3"] = Color3.fromRGB(188, 0, 0),
        ["Tail4"] = Color3.fromRGB(188, 0, 0),
        ["Tail5"] = Color3.fromRGB(188, 0, 0),
        ["Tail6"] = Color3.fromRGB(188, 0, 0),
        ["Tail7"] = Color3.fromRGB(188, 0, 0),
        ["Tail8"] = Color3.fromRGB(188, 0, 0),
        ["Tail9"] = Color3.fromRGB(188, 0, 0),
        ["TorsoArmour"] = Color3.fromRGB(188, 0, 0),
        ["TorsoCloth3"] = Color3.fromRGB(188, 0, 0),
        ["TorsoCloth5"] = Color3.fromRGB(188, 0, 0),
        ["TorsoCloth6"] = Color3.fromRGB(188, 0, 0),
        ["TorsoCloth7"] = Color3.fromRGB(188, 0, 0)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.2
}
v2.halloween_2022_jousting_horse = v12
local v13 = {
    ["name"] = "Lava Dragon",
    ["image"] = "rbxassetid://10925517718",
    ["model"] = "Halloween2022LavaDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022LavaDragonBeingHeldDouble",
        ["eating"] = "Halloween2022LavaDragonEat",
        ["flying"] = "Halloween2022LavaDragonRun",
        ["hold"] = "Halloween2022LavaDragonBeingHeldSingle",
        ["idle"] = "Halloween2022LavaDragonIdle",
        ["running"] = "Halloween2022LavaDragonRun",
        ["sit"] = "Halloween2022LavaDragonSit",
        ["sleep"] = "Halloween2022LavaDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022LavaDragonSit" },
        { "Joyful", "Halloween2022LavaDragonJoyful" },
        { "Beg", "Halloween2022LavaDragonBeg" },
        { "Jump", "Halloween2022LavaDragonJump" },
        { "Trick 1", "Halloween2022LavaDragonTrick1" },
        { "Trick 2", "Halloween2022LavaDragonTrick2" }
    },
    ["neon_parts"] = {
        ["BodySpots"] = Color3.fromRGB(225, 87, 59),
        ["Eyes"] = Color3.fromRGB(255, 107, 78),
        ["Head2"] = Color3.fromRGB(255, 107, 78),
        ["Head4"] = Color3.fromRGB(225, 87, 59),
        ["HeadSpots1"] = Color3.fromRGB(225, 87, 59),
        ["HeadSpots2"] = Color3.fromRGB(225, 87, 59),
        ["Horns"] = Color3.fromRGB(225, 87, 59),
        ["InnerMouthLower"] = Color3.fromRGB(255, 107, 78),
        ["InnerMouthUpper"] = Color3.fromRGB(255, 107, 78),
        ["LavaDrip1"] = Color3.fromRGB(255, 107, 78),
        ["LavaDrip2"] = Color3.fromRGB(255, 107, 78),
        ["LavaDrip3"] = Color3.fromRGB(255, 107, 78),
        ["LavaDrip4"] = Color3.fromRGB(255, 107, 78),
        ["LeftWingWeb"] = Color3.fromRGB(255, 107, 78),
        ["RightWingWeb"] = Color3.fromRGB(255, 107, 78),
        ["Spine"] = Color3.fromRGB(225, 87, 59),
        ["Tail2"] = Color3.fromRGB(255, 107, 78),
        ["Tail3"] = Color3.fromRGB(255, 107, 78),
        ["Torso2"] = Color3.fromRGB(255, 107, 78)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 1
}
v2.halloween_2022_lava_dragon = v13
local v14 = {
    ["name"] = "Lava Wolf",
    ["image"] = "rbxassetid://11109286837",
    ["model"] = "Halloween2022LavaWolf",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2022_wolf_box" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022LavaWolfBeingHeldDouble",
        ["eating"] = "Halloween2022LavaWolfEat",
        ["flying"] = "Halloween2022LavaWolfRun",
        ["hold"] = "Halloween2022LavaWolfBeingHeldSingle",
        ["idle"] = "Halloween2022LavaWolfIdle",
        ["running"] = "Halloween2022LavaWolfRun",
        ["sit"] = "Halloween2022LavaWolfSit",
        ["sleep"] = "Halloween2022LavaWolfSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022LavaWolfSit" },
        { "Joyful", "Halloween2022LavaWolfJoyful" },
        { "Beg", "Halloween2022LavaWolfBeg" },
        { "Jump", "Halloween2022LavaWolfJump" },
        { "Trick 1", "Halloween2022LavaWolfTrick1" },
        { "Trick 2", "Halloween2022LavaWolfTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(255, 107, 78),
        ["BackRightFoot"] = Color3.fromRGB(255, 107, 78),
        ["Eyes"] = Color3.fromRGB(255, 107, 78),
        ["FrontLeftFoot"] = Color3.fromRGB(255, 107, 78),
        ["FrontRightFoot"] = Color3.fromRGB(255, 107, 78),
        ["Head2"] = Color3.fromRGB(255, 107, 78),
        ["LavaBlob2"] = Color3.fromRGB(255, 107, 78),
        ["LeftEar2"] = Color3.fromRGB(255, 107, 78),
        ["Nose"] = Color3.fromRGB(255, 107, 78),
        ["RightEar2"] = Color3.fromRGB(255, 107, 78),
        ["Tail"] = Color3.fromRGB(255, 107, 78),
        ["Tail2"] = Color3.fromRGB(255, 107, 78),
        ["Tail3"] = Color3.fromRGB(255, 107, 78),
        ["Torso2"] = Color3.fromRGB(255, 107, 78),
        ["Torso3"] = Color3.fromRGB(255, 107, 78),
        ["Torso4"] = Color3.fromRGB(255, 107, 78)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.2
}
v2.halloween_2022_lava_wolf = v14
local v15 = {
    ["name"] = "Mule",
    ["image"] = "rbxassetid://11181152874",
    ["model"] = "Halloween2022Mule",
    ["rarity"] = "rare",
    ["cost"] = 35000,
    ["currency_id"] = "candy_2022",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022MuleBeingHeldDouble",
        ["eating"] = "Halloween2022MuleEat",
        ["flying"] = "Halloween2022MuleRun",
        ["hold"] = "Halloween2022MuleBeingHeldSingle",
        ["idle"] = "Halloween2022MuleIdle",
        ["running"] = "Halloween2022MuleRun",
        ["sit"] = "Halloween2022MuleSit",
        ["sleep"] = "Halloween2022MuleSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022MuleSit" },
        { "Joyful", "Halloween2022MuleJoyful" },
        { "Beg", "Halloween2022MuleBeg" },
        { "Jump", "Halloween2022MuleJump" },
        { "Trick 1", "Halloween2022MuleTrick1" },
        { "Trick 2", "Halloween2022MuleTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(105, 142, 87),
        ["BackRightFoot"] = Color3.fromRGB(105, 142, 87),
        ["FrontLeftFoot"] = Color3.fromRGB(105, 142, 87),
        ["FrontRightFoot"] = Color3.fromRGB(105, 142, 87),
        ["Hair"] = Color3.fromRGB(105, 142, 87),
        ["Hair11"] = Color3.fromRGB(105, 142, 87),
        ["Hair13"] = Color3.fromRGB(105, 142, 87),
        ["Hair3"] = Color3.fromRGB(105, 142, 87),
        ["Hair4"] = Color3.fromRGB(105, 142, 87),
        ["Hair5"] = Color3.fromRGB(105, 142, 87),
        ["Hair9"] = Color3.fromRGB(105, 142, 87),
        ["Nose"] = Color3.fromRGB(105, 142, 87),
        ["Tail"] = Color3.fromRGB(105, 142, 87),
        ["Tail2"] = Color3.fromRGB(105, 142, 87),
        ["Tail3"] = Color3.fromRGB(105, 142, 87)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.2,
    ["pre_equipped_removable_accessories"] = { "halloween_2022_mule_baskets" }
}
v2.halloween_2022_mule = v15
local v16 = {
    ["name"] = "Slug",
    ["image"] = "rbxassetid://10926054144",
    ["model"] = "Halloween2022Slug",
    ["rarity"] = "uncommon",
    ["cost"] = 9000,
    ["currency_id"] = "candy_2022"
}
local v17 = {
    ["origin"] = "Halloween",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 2.5,
        ["offset"] = CFrame.new(0, 0, 0.5)
    },
    ["year"] = 2022
}
v16.origin_entry = v17
v16.anims = {
    ["double_hold"] = "Halloween2022SlugBeingHeldDouble",
    ["eating"] = "Halloween2022SlugEat",
    ["hold"] = "Halloween2022SlugBeingHeldSingle",
    ["idle"] = "Halloween2022SlugIdle",
    ["running"] = "Halloween2022SlugRun",
    ["sit"] = "Halloween2022SlugSit",
    ["sleep"] = "Halloween2022SlugSleep"
}
v16.tricks = {
    { "Sit", "Halloween2022SlugSit" },
    { "Joyful", "Halloween2022SlugJoyful" },
    { "Beg", "Halloween2022SlugBeg" },
    { "Jump", "Halloween2022SlugJump" },
    { "Trick 1", "Halloween2022SlugTrick1" },
    { "Trick 2", "Halloween2022SlugTrick2" }
}
v16.neon_parts = {
    ["Spots"] = Color3.fromRGB(172, 99, 185),
    ["Torso2"] = Color3.fromRGB(172, 99, 185)
}
v16.eyes = { "EyeLeft", "EyeRight" }
v16.generate_npc_furniture_on_runtime = true
v2.halloween_2022_slug = v16
local v18 = {
    ["name"] = "Undead Jousting Horse",
    ["image"] = "rbxassetid://11192035130",
    ["model"] = "Halloween2022UndeadJoustingHorse",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022JoustingHorseBeingHeldDouble",
        ["eating"] = "Halloween2022JoustingHorseEat",
        ["flying"] = "Halloween2022JoustingHorseRun",
        ["hold"] = "Halloween2022JoustingHorseBeingHeldSingle",
        ["idle"] = "Halloween2022JoustingHorseIdle",
        ["running"] = "Halloween2022JoustingHorseRun",
        ["sit"] = "Halloween2022JoustingHorseSit",
        ["sleep"] = "Halloween2022JoustingHorseSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022JoustingHorseSit" },
        { "Joyful", "Halloween2022JoustingHorseJoyful" },
        { "Beg", "Halloween2022JoustingHorseBeg" },
        { "Jump", "Halloween2022JoustingHorseJump" },
        { "Trick 1", "Halloween2022JoustingHorseTrick1" },
        { "Trick 2", "Halloween2022JoustingHorseTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(115, 83, 217),
        ["BackRightFoot"] = Color3.fromRGB(115, 83, 217),
        ["Eyes"] = Color3.fromRGB(115, 83, 217),
        ["FrontLeftFoot"] = Color3.fromRGB(115, 83, 217),
        ["FrontRightFoot"] = Color3.fromRGB(115, 83, 217),
        ["Hair2"] = Color3.fromRGB(115, 83, 217),
        ["Head3"] = Color3.fromRGB(115, 83, 217),
        ["HeadArmor"] = Color3.fromRGB(115, 83, 217),
        ["Tail"] = Color3.fromRGB(115, 83, 217),
        ["Tail2"] = Color3.fromRGB(115, 83, 217),
        ["Tail3"] = Color3.fromRGB(115, 83, 217),
        ["Tail4"] = Color3.fromRGB(115, 83, 217),
        ["Tail5"] = Color3.fromRGB(115, 83, 217),
        ["Tail6"] = Color3.fromRGB(115, 83, 217),
        ["Tail7"] = Color3.fromRGB(115, 83, 217),
        ["Tail8"] = Color3.fromRGB(115, 83, 217),
        ["Tail9"] = Color3.fromRGB(115, 83, 217),
        ["TorsoArmour"] = Color3.fromRGB(115, 83, 217),
        ["TorsoCloth3"] = Color3.fromRGB(115, 83, 217),
        ["TorsoCloth5"] = Color3.fromRGB(115, 83, 217),
        ["TorsoCloth6"] = Color3.fromRGB(115, 83, 217)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.2
}
v2.halloween_2022_undead_jousting_horse = v18
local v19 = {
    ["name"] = "Zombie Wolf",
    ["image"] = "rbxassetid://11109302289",
    ["model"] = "Halloween2022ZombieWolf",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2022_wolf_box" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "Halloween2022SteppeWolfBeingHeldDouble",
        ["eating"] = "Halloween2022SteppeWolfEat",
        ["flying"] = "Halloween2022SteppeWolfRun",
        ["hold"] = "Halloween2022SteppeWolfBeingHeldSingle",
        ["idle"] = "Halloween2022SteppeWolfIdle",
        ["running"] = "Halloween2022SteppeWolfRun",
        ["sit"] = "Halloween2022SteppeWolfSit",
        ["sleep"] = "Halloween2022SteppeWolfSleep"
    },
    ["tricks"] = {
        { "Sit", "Halloween2022SteppeWolfSit" },
        { "Joyful", "Halloween2022SteppeWolfJoyful" },
        { "Beg", "Halloween2022SteppeWolfBeg" },
        { "Jump", "Halloween2022SteppeWolfJump" },
        { "Trick 1", "Halloween2022SteppeWolfTrick1" },
        { "Trick 2", "Halloween2022SteppeWolfTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(190, 132, 97),
        ["BackRightFoot"] = Color3.fromRGB(190, 132, 97),
        ["Body3"] = Color3.fromRGB(190, 132, 97),
        ["FrontLeftFoot"] = Color3.fromRGB(190, 132, 97),
        ["FrontRightFoot"] = Color3.fromRGB(190, 132, 97),
        ["Head2"] = Color3.fromRGB(190, 132, 97),
        ["LeftEar2"] = Color3.fromRGB(190, 132, 97),
        ["RightEar2"] = Color3.fromRGB(190, 132, 97)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.2
}
v2.halloween_2022_zombie_wolf = v19
return v1(v2)