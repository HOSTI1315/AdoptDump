--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Amami Rabbit",
    ["image"] = "rbxassetid://11758569695",
    ["model"] = "LNY2023AmamiRabbit",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["currency_id"] = "lanterns_2023",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "LunarNewYear2023RabbitBeingHeldDouble",
        ["eating"] = "LunarNewYear2023RabbitEat",
        ["hold"] = "LunarNewYear2023RabbitBeingHeldSingle",
        ["idle"] = "LunarNewYear2023RabbitIdle",
        ["running"] = "LunarNewYear2023RabbitRun",
        ["sit"] = "LunarNewYear2023RabbitSit",
        ["sleep"] = "LunarNewYear2023RabbitSleep"
    },
    ["tricks"] = {
        { "Sit", "LunarNewYear2023RabbitSit" },
        { "Joyful", "LunarNewYear2023RabbitJoyful" },
        { "Beg", "LunarNewYear2023RabbitBeg" },
        { "Jump", "LunarNewYear2023RabbitJump" },
        { "Trick 1", "LunarNewYear2023RabbitTrick1" },
        { "Trick 2", "LunarNewYear2023RabbitTrick2" }
    },
    ["neon_parts"] = {
        ["FrontRightFoot"] = Color3.fromRGB(111, 104, 203),
        ["Hair"] = Color3.fromRGB(111, 104, 203),
        ["LeftBackFoot"] = Color3.fromRGB(111, 104, 203),
        ["LeftEar"] = Color3.fromRGB(111, 104, 203),
        ["LeftFrontFoot"] = Color3.fromRGB(111, 104, 203),
        ["Nose"] = Color3.fromRGB(111, 104, 203),
        ["RightBackFoot"] = Color3.fromRGB(111, 104, 203),
        ["RightEar"] = Color3.fromRGB(111, 104, 203),
        ["Tail"] = Color3.fromRGB(111, 104, 203),
        ["Whiskers"] = Color3.fromRGB(111, 104, 203)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.lny_2023_amami_rabbit = v3
local v4 = {
    ["name"] = "Black Moon Bear",
    ["image"] = "rbxassetid://11758575618",
    ["model"] = "LNY2023MoonBear",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "lny_2023_moon_bear_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "LunarNewYear2023MoonBearBeingHeldDouble",
        ["eating"] = "LunarNewYear2023MoonBearEat",
        ["hold"] = "LunarNewYear2023MoonBearBeingHeldSingle",
        ["idle"] = "LunarNewYear2023MoonBearIdle",
        ["running"] = "LunarNewYear2023MoonBearRun",
        ["sit"] = "LunarNewYear2023MoonBearSit",
        ["sleep"] = "LunarNewYear2023MoonBearSleep"
    },
    ["tricks"] = {
        { "Sit", "LunarNewYear2023MoonBearSit" },
        { "Joyful", "LunarNewYear2023MoonBearJoyful" },
        { "Beg", "LunarNewYear2023MoonBearBeg" },
        { "Jump", "LunarNewYear2023MoonBearJump" },
        { "Trick 1", "LunarNewYear2023MoonBearTrick1" },
        { "Trick 2", "LunarNewYear2023MoonBearTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(186, 160, 112),
        ["LeftArm3"] = Color3.fromRGB(186, 160, 112),
        ["LeftEar2"] = Color3.fromRGB(186, 160, 112),
        ["RightArm3"] = Color3.fromRGB(186, 160, 112),
        ["RightEar2"] = Color3.fromRGB(186, 160, 112),
        ["Torso2"] = Color3.fromRGB(186, 160, 112)
    },
    ["flying_move_anim_speed"] = 0.6,
    ["minimum_fly_anim_speed"] = 0.3
}
v2.lny_2023_moon_bear = v4
local v5 = {
    ["name"] = "Lunar Moon Bear",
    ["image"] = "rbxassetid://11758575657",
    ["model"] = "LNY2023MoonMoonBear",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "lny_2023_moon_bear_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "LunarNewYear2023MoonBearBeingHeldDouble",
        ["eating"] = "LunarNewYear2023MoonBearEat",
        ["hold"] = "LunarNewYear2023MoonBearBeingHeldSingle",
        ["idle"] = "LunarNewYear2023MoonBearIdle",
        ["running"] = "LunarNewYear2023MoonBearRun",
        ["sit"] = "LunarNewYear2023MoonBearSit",
        ["sleep"] = "LunarNewYear2023MoonBearSleep"
    },
    ["tricks"] = {
        { "Sit", "LunarNewYear2023MoonBearSit" },
        { "Joyful", "LunarNewYear2023MoonBearJoyful" },
        { "Beg", "LunarNewYear2023MoonBearBeg" },
        { "Jump", "LunarNewYear2023MoonBearJump" },
        { "Trick 1", "LunarNewYear2023MoonBearTrick3" },
        { "Trick 2", "LunarNewYear2023MoonBearTrick4" }
    },
    ["neon_parts"] = {
        ["LeftArm3"] = Color3.fromRGB(3, 154, 204),
        ["RightArm3"] = Color3.fromRGB(3, 154, 204),
        ["Stars1"] = Color3.fromRGB(17, 17, 17),
        ["Torso2"] = Color3.fromRGB(3, 154, 204)
    },
    ["flying_move_anim_speed"] = 0.6,
    ["minimum_fly_anim_speed"] = 0.3
}
v2.lny_2023_moon_moon_bear = v5
local v6 = {
    ["name"] = "Moon Rabbit",
    ["image"] = "rbxassetid://11758575705",
    ["model"] = "LNY2023MoonRabbit",
    ["rarity"] = "rare",
    ["cost"] = 375,
    ["currency_id"] = "lanterns_2023",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "LunarNewYear2023RabbitBeingHeldDouble",
        ["eating"] = "LunarNewYear2023RabbitEat",
        ["hold"] = "LunarNewYear2023RabbitBeingHeldSingle",
        ["idle"] = "LunarNewYear2023RabbitIdle",
        ["running"] = "LunarNewYear2023RabbitRun",
        ["sit"] = "LunarNewYear2023RabbitSit",
        ["sleep"] = "LunarNewYear2023RabbitSleep"
    },
    ["tricks"] = {
        { "Sit", "LunarNewYear2023RabbitSit" },
        { "Joyful", "LunarNewYear2023RabbitJoyful" },
        { "Beg", "LunarNewYear2023RabbitBeg" },
        { "Jump", "LunarNewYear2023RabbitJump" },
        { "Trick 1", "LunarNewYear2023MoonRabbitTrick1" },
        { "Trick 2", "LunarNewYear2023MoonRabbitTrick2" }
    },
    ["neon_parts"] = {
        ["FrontRightBottomFoot"] = Color3.fromRGB(86, 188, 120),
        ["FrontRightFootStars"] = Color3.fromRGB(86, 188, 120),
        ["Hair"] = Color3.fromRGB(86, 188, 120),
        ["LeftBackBottomFoot"] = Color3.fromRGB(86, 188, 120),
        ["LeftBackFootStars"] = Color3.fromRGB(86, 188, 120),
        ["LeftEar"] = Color3.fromRGB(86, 188, 120),
        ["LeftEarStars"] = Color3.fromRGB(86, 188, 120),
        ["LeftFrontBottomFoot"] = Color3.fromRGB(86, 188, 120),
        ["LeftFrontFootStars"] = Color3.fromRGB(86, 188, 120),
        ["MoonStars"] = Color3.fromRGB(86, 188, 120),
        ["NoseStars"] = Color3.fromRGB(86, 188, 120),
        ["RightBackBottomFoot"] = Color3.fromRGB(86, 188, 120),
        ["RightBackFootStars"] = Color3.fromRGB(86, 188, 120),
        ["RightEar"] = Color3.fromRGB(86, 188, 120),
        ["RightEarStars"] = Color3.fromRGB(86, 188, 120),
        ["Tail2"] = Color3.fromRGB(86, 188, 120),
        ["Whiskers"] = Color3.fromRGB(86, 188, 120)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.lny_2023_moon_rabbit = v6
local v7 = {
    ["name"] = "Winged Tiger",
    ["image"] = "rbxassetid://11758583912",
    ["model"] = "LNY2023Qiongchi",
    ["rarity"] = "legendary"
}
local v8 = {
    ["origin"] = "Lunar New Year",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 5,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2023
}
v7.origin_entry = v8
v7.anims = {
    ["double_hold"] = "LunarNewYear2023QiongchiBeingHeldDouble",
    ["eating"] = "LunarNewYear2023QiongchiEat",
    ["hold"] = "LunarNewYear2023QiongchiBeingHeldSingle",
    ["idle"] = "LunarNewYear2023QiongchiIdle",
    ["running"] = "LunarNewYear2023QiongchiRun",
    ["sit"] = "LunarNewYear2023QiongchiSit",
    ["sleep"] = "LunarNewYear2023QiongchiSleep"
}
v7.tricks = {
    { "Sit", "LunarNewYear2023QiongchiSit" },
    { "Joyful", "LunarNewYear2023QiongchiJoyful" },
    { "Beg", "LunarNewYear2023QiongchiBeg" },
    { "Jump", "LunarNewYear2023QiongchiJump" },
    { "Trick 1", "LunarNewYear2023QiongchiTrick1" },
    { "Trick 2", "LunarNewYear2023QiongchiTrick2" }
}
v7.neon_parts = {
    ["Fangs"] = Color3.fromRGB(213, 115, 61),
    ["Horns"] = Color3.fromRGB(213, 115, 61),
    ["LeftBackFoot"] = Color3.fromRGB(213, 115, 61),
    ["LeftEar2"] = Color3.fromRGB(213, 115, 61),
    ["LeftFrontFoot"] = Color3.fromRGB(213, 115, 61),
    ["LeftWIng3"] = Color3.fromRGB(213, 115, 61),
    ["LeftWing2"] = Color3.fromRGB(213, 115, 61),
    ["LeftWing4"] = Color3.fromRGB(213, 115, 61),
    ["Nose"] = Color3.fromRGB(213, 115, 61),
    ["RightBackFoot"] = Color3.fromRGB(213, 115, 61),
    ["RightEar2"] = Color3.fromRGB(213, 115, 61),
    ["RightFrontFoot"] = Color3.fromRGB(213, 115, 61),
    ["RightWIng2"] = Color3.fromRGB(213, 115, 61),
    ["RightWing3"] = Color3.fromRGB(213, 115, 61),
    ["RightWing4"] = Color3.fromRGB(213, 115, 61),
    ["Spikes"] = Color3.fromRGB(213, 115, 61),
    ["Tail2"] = Color3.fromRGB(213, 115, 61),
    ["Tail7"] = Color3.fromRGB(213, 115, 61),
    ["Torso3"] = Color3.fromRGB(213, 115, 61),
    ["Whiskers"] = Color3.fromRGB(213, 115, 61)
}
v7.already_has_flying_wings = true
v7.generate_npc_furniture_on_runtime = true
v2.lny_2023_qiongchi = v7
local v9 = {
    ["name"] = "Water Moon Bear",
    ["image"] = "rbxassetid://11758575946",
    ["model"] = "LNY2023WaterMoonBear",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "lny_2023_moon_bear_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "LunarNewYear2023MoonBearBeingHeldDouble",
        ["eating"] = "LunarNewYear2023MoonBearEat",
        ["hold"] = "LunarNewYear2023MoonBearBeingHeldSingle",
        ["idle"] = "LunarNewYear2023MoonBearIdle",
        ["running"] = "LunarNewYear2023MoonBearRun",
        ["sit"] = "LunarNewYear2023MoonBearSit",
        ["sleep"] = "LunarNewYear2023MoonBearSleep"
    },
    ["tricks"] = {
        { "Sit", "LunarNewYear2023MoonBearSit" },
        { "Joyful", "LunarNewYear2023MoonBearJoyful" },
        { "Beg", "LunarNewYear2023MoonBearBeg" },
        { "Jump", "LunarNewYear2023MoonBearJump" },
        { "Trick 1", "LunarNewYear2023MoonBearTrick3" },
        { "Trick 2", "LunarNewYear2023MoonBearTrick4" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(198, 119, 59),
        ["LeftArm3"] = Color3.fromRGB(198, 119, 59),
        ["LeftEar2"] = Color3.fromRGB(198, 119, 59),
        ["RightArm3"] = Color3.fromRGB(198, 119, 59),
        ["RightEar2"] = Color3.fromRGB(198, 119, 59),
        ["Torso2"] = Color3.fromRGB(198, 119, 59)
    },
    ["flying_move_anim_speed"] = 0.6,
    ["minimum_fly_anim_speed"] = 0.3
}
v2.lny_2023_water_moon_bear = v9
local v10 = {
    ["name"] = "Water Rabbit",
    ["image"] = "rbxassetid://11758575992",
    ["model"] = "LNY2023WaterRabbit",
    ["rarity"] = "ultra_rare",
    ["cost"] = 475,
    ["currency_id"] = "lanterns_2023",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "LunarNewYear2023RabbitBeingHeldDouble",
        ["eating"] = "LunarNewYear2023RabbitEat",
        ["hold"] = "LunarNewYear2023RabbitBeingHeldSingle",
        ["idle"] = "LunarNewYear2023RabbitIdle",
        ["running"] = "LunarNewYear2023RabbitRun",
        ["sit"] = "LunarNewYear2023RabbitSit",
        ["sleep"] = "LunarNewYear2023RabbitSleep"
    },
    ["tricks"] = {
        { "Sit", "LunarNewYear2023RabbitSit" },
        { "Joyful", "LunarNewYear2023RabbitJoyful" },
        { "Beg", "LunarNewYear2023RabbitBeg" },
        { "Jump", "LunarNewYear2023RabbitJump" },
        { "Trick 1", "LunarNewYear2023RabbitTrick1" },
        { "Trick 2", "LunarNewYear2023RabbitTrick2" }
    },
    ["neon_parts"] = {
        ["FrontRightFoot"] = Color3.fromRGB(95, 172, 189),
        ["Hair"] = Color3.fromRGB(95, 172, 189),
        ["Head3"] = Color3.fromRGB(95, 172, 189),
        ["LeftBackFoot"] = Color3.fromRGB(95, 172, 189),
        ["LeftEar2"] = Color3.fromRGB(95, 172, 189),
        ["LeftFrontFoot"] = Color3.fromRGB(95, 172, 189),
        ["Nose"] = Color3.fromRGB(95, 172, 189),
        ["RightBackFoot"] = Color3.fromRGB(95, 172, 189),
        ["RightEar2"] = Color3.fromRGB(95, 172, 189),
        ["Tail"] = Color3.fromRGB(95, 172, 189),
        ["Torso2"] = Color3.fromRGB(95, 172, 189),
        ["Whiskers"] = Color3.fromRGB(95, 172, 189)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.lny_2023_water_rabbit = v10
return v1(v2)