--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Border Collie",
    ["image"] = "rbxassetid://12720029753",
    ["model"] = "Springfest2023BorderCollie",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Springfest",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Springfest2023BorderCollieBeingHeldDouble",
        ["eating"] = "Springfest2023BorderCollieEat",
        ["hold"] = "Springfest2023BorderCollieBeingHeldSingle",
        ["idle"] = "Springfest2023BorderCollieIdle",
        ["running"] = "Springfest2023BorderCollieRun",
        ["sit"] = "Springfest2023BorderCollieSit",
        ["sleep"] = "Springfest2023BorderCollieSleep"
    },
    ["tricks"] = {
        { "Sit", "Springfest2023BorderCollieSit" },
        { "Joyful", "Springfest2023BorderCollieJoyful" },
        { "Beg", "Springfest2023BorderCollieBeg" },
        { "Jump", "Springfest2023BorderCollieJump" },
        { "Trick 1", "Springfest2023BorderCollieTrick1" },
        { "Trick 2", "Springfest2023BorderCollieTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(86, 108, 188),
        ["BackRightFoot"] = Color3.fromRGB(86, 108, 188),
        ["FrontLeftFoot"] = Color3.fromRGB(86, 108, 188),
        ["FrontRightFoot"] = Color3.fromRGB(86, 108, 188),
        ["Head2"] = Color3.fromRGB(86, 108, 188),
        ["LeftEar2"] = Color3.fromRGB(86, 108, 188),
        ["RightEar2"] = Color3.fromRGB(86, 108, 188),
        ["Tail2"] = Color3.fromRGB(86, 108, 188),
        ["Torso2"] = Color3.fromRGB(86, 108, 188),
        ["Torso3"] = Color3.fromRGB(86, 108, 188)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.springfest_2023_border_collie = v3
local v4 = {
    ["name"] = "Field Mouse",
    ["image"] = "rbxassetid://12935498875",
    ["model"] = "Springfest2023FieldMouse",
    ["rarity"] = "legendary",
    ["cost"] = 75000,
    ["currency_id"] = "eggs_2023",
    ["origin_entry"] = {
        ["origin"] = "Springfest",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Springfest2023FieldMouseBeingHeldDouble",
        ["eating"] = "Springfest2023FieldMouseEat",
        ["hold"] = "Springfest2023FieldMouseBeingHeldSingle",
        ["idle"] = "Springfest2023FieldMouseIdle",
        ["running"] = "Springfest2023FieldMouseRun",
        ["sit"] = "Springfest2023FieldMouseSit",
        ["sleep"] = "Springfest2023FieldMouseSleep"
    },
    ["tricks"] = {
        { "Sit", "Springfest2023FieldMouseSit" },
        { "Joyful", "Springfest2023FieldMouseJoyful" },
        { "Beg", "Springfest2023FieldMouseBeg" },
        { "Jump", "Springfest2023FieldMouseJump" },
        { "Trick 1", "Springfest2023FieldMouseTrick1" },
        { "Trick 2", "Springfest2023FieldMouseTrick2" }
    },
    ["neon_parts"] = {
        ["LeftBackFoot"] = Color3.fromRGB(184, 172, 37),
        ["LeftEar2"] = Color3.fromRGB(184, 172, 37),
        ["LeftFrontFoot"] = Color3.fromRGB(184, 172, 37),
        ["Nose"] = Color3.fromRGB(184, 172, 37),
        ["RightBackFoot"] = Color3.fromRGB(184, 172, 37),
        ["RightEar2"] = Color3.fromRGB(184, 172, 37),
        ["RightFrontFoot"] = Color3.fromRGB(184, 172, 37),
        ["Tail"] = Color3.fromRGB(184, 172, 37),
        ["Tail2"] = Color3.fromRGB(184, 172, 37),
        ["Tail3"] = Color3.fromRGB(184, 172, 37),
        ["Tail4"] = Color3.fromRGB(184, 172, 37),
        ["Tail5"] = Color3.fromRGB(184, 172, 37),
        ["Whiskers"] = Color3.fromRGB(184, 172, 37)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.springfest_2023_field_mouse = v4
local v5 = {
    ["name"] = "Flower Power Duckling",
    ["image"] = "rbxassetid://12917347184",
    ["model"] = "Springfest2023FlowerPowerDuckling",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Springfest",
        ["origin_items"] = { "springfest_2023_duckling_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Springfest2023DucklingBeingHeldDouble",
        ["eating"] = "Springfest2023DucklingEat",
        ["hold"] = "Springfest2023DucklingBeingHeldSingle",
        ["idle"] = "Springfest2023DucklingIdle",
        ["running"] = "Springfest2023DucklingRun",
        ["sit"] = "Springfest2023DucklingSit",
        ["sleep"] = "Springfest2023DucklingSleep"
    },
    ["tricks"] = {
        { "Sit", "Springfest2023DucklingSit" },
        { "Joyful", "Springfest2023DucklingJoyful" },
        { "Beg", "Springfest2023DucklingBeg" },
        { "Jump", "Springfest2023DucklingJump" },
        { "Trick 1", "Springfest2023DucklingTrick1" },
        { "Trick 2", "Springfest2023DucklingTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(190, 147, 133),
        ["FlowerCollar"] = Color3.fromRGB(190, 147, 133),
        ["FlowerHat"] = Color3.fromRGB(190, 147, 133),
        ["LeftFoot"] = Color3.fromRGB(190, 147, 133),
        ["RightFoot"] = Color3.fromRGB(190, 147, 133),
        ["Stem"] = Color3.fromRGB(190, 147, 133)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.springfest_2023_flower_power_duckling = v5
local v6 = {
    ["name"] = "Goose",
    ["image"] = "rbxassetid://12792506715",
    ["model"] = "Springfest2023Goose",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Springfest",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Springfest2023GooseBeingHeldDouble",
        ["eating"] = "Springfest2023GooseEat",
        ["hold"] = "Springfest2023GooseBeingHeldSingle",
        ["idle"] = "Springfest2023GooseIdle",
        ["running"] = "Springfest2023GooseRun",
        ["sit"] = "Springfest2023GooseSit",
        ["sleep"] = "Springfest2023GooseSleep"
    },
    ["tricks"] = {
        { "Sit", "Springfest2023GooseSit" },
        { "Joyful", "Springfest2023GooseJoyful" },
        { "Beg", "Springfest2023GooseBeg" },
        { "Jump", "Springfest2023GooseJump" },
        { "Trick 1", "Springfest2023GooseTrick1" },
        { "Trick 2", "Springfest2023GooseTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(99, 139, 182),
        ["LeftFoot"] = Color3.fromRGB(99, 139, 182),
        ["LeftWing"] = Color3.fromRGB(99, 139, 182),
        ["LeftWing2"] = Color3.fromRGB(99, 139, 182),
        ["RightFoot"] = Color3.fromRGB(99, 139, 182),
        ["RightWing"] = Color3.fromRGB(99, 139, 182),
        ["RightWing2"] = Color3.fromRGB(99, 139, 182)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.springfest_2023_goose = v6
local v7 = {
    ["name"] = "Happy Duckling",
    ["image"] = "rbxassetid://12917346501",
    ["model"] = "Springfest2023HappyDuckling",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Springfest",
        ["origin_items"] = { "springfest_2023_duckling_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Springfest2023DucklingBeingHeldDouble",
        ["eating"] = "Springfest2023DucklingEat",
        ["hold"] = "Springfest2023DucklingBeingHeldSingle",
        ["idle"] = "Springfest2023DucklingIdle",
        ["running"] = "Springfest2023DucklingRun",
        ["sit"] = "Springfest2023DucklingSit",
        ["sleep"] = "Springfest2023DucklingSleep"
    },
    ["tricks"] = {
        { "Sit", "Springfest2023DucklingSit" },
        { "Joyful", "Springfest2023DucklingJoyful" },
        { "Beg", "Springfest2023DucklingBeg" },
        { "Jump", "Springfest2023DucklingJump" },
        { "Trick 1", "Springfest2023DucklingTrick1" },
        { "Trick 2", "Springfest2023DucklingTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(186, 154, 36),
        ["Hair"] = Color3.fromRGB(186, 154, 36),
        ["LeftFoot"] = Color3.fromRGB(186, 154, 36),
        ["LeftWing"] = Color3.fromRGB(186, 154, 36),
        ["LeftWing2"] = Color3.fromRGB(186, 154, 36),
        ["RightFoot"] = Color3.fromRGB(186, 154, 36),
        ["RightWing"] = Color3.fromRGB(186, 154, 36),
        ["RightWing2"] = Color3.fromRGB(186, 154, 36)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.springfest_2023_happy_duckling = v7
local v8 = {
    ["name"] = "Hare",
    ["image"] = "rbxassetid://12720028898",
    ["model"] = "Springfest2023Hare",
    ["rarity"] = "rare",
    ["cost"] = 35000,
    ["currency_id"] = "eggs_2023",
    ["origin_entry"] = {
        ["origin"] = "Springfest",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Springfest2023HareBeingHeldDouble",
        ["eating"] = "Springfest2023HareEat",
        ["hold"] = "Springfest2023HareBeingHeldSingle",
        ["idle"] = "Springfest2023HareIdle",
        ["running"] = "Springfest2023HareRun",
        ["sit"] = "Springfest2023HareSit",
        ["sleep"] = "Springfest2023HareSleep"
    },
    ["tricks"] = {
        { "Sit", "Springfest2023HareSit" },
        { "Joyful", "Springfest2023HareJoyful" },
        { "Beg", "Springfest2023HareBeg" },
        { "Jump", "Springfest2023HareJump" },
        { "Trick 1", "Springfest2023HareTrick1" },
        { "Trick 2", "Springfest2023HareTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(110, 184, 173),
        ["BackRightFoot"] = Color3.fromRGB(110, 184, 173),
        ["FrontLeftFoot"] = Color3.fromRGB(110, 184, 173),
        ["FrontRightFoot"] = Color3.fromRGB(110, 184, 173),
        ["FurTuft"] = Color3.fromRGB(110, 184, 173),
        ["LeftEar"] = Color3.fromRGB(110, 184, 173),
        ["LeftEar2"] = Color3.fromRGB(110, 184, 173),
        ["LeftEar3"] = Color3.fromRGB(110, 184, 173),
        ["LeftEar4"] = Color3.fromRGB(110, 184, 173),
        ["Nose"] = Color3.fromRGB(110, 184, 173),
        ["RightEar"] = Color3.fromRGB(110, 184, 173),
        ["RightEar2"] = Color3.fromRGB(110, 184, 173),
        ["RightEar3"] = Color3.fromRGB(110, 184, 173),
        ["RightEar4"] = Color3.fromRGB(110, 184, 173),
        ["Tail2"] = Color3.fromRGB(110, 184, 173),
        ["Torso2"] = Color3.fromRGB(110, 184, 173)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.springfest_2023_hare = v8
local v9 = {
    ["name"] = "Sunrise Duckling",
    ["image"] = "rbxassetid://12917347755",
    ["model"] = "Springfest2023SunriseDuckling",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Springfest",
        ["origin_items"] = { "springfest_2023_duckling_box" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Springfest2023DucklingBeingHeldDouble",
        ["eating"] = "Springfest2023DucklingEat",
        ["hold"] = "Springfest2023DucklingBeingHeldSingle",
        ["idle"] = "Springfest2023DucklingIdle",
        ["running"] = "Springfest2023DucklingRun",
        ["sit"] = "Springfest2023DucklingSit",
        ["sleep"] = "Springfest2023DucklingSleep"
    },
    ["tricks"] = {
        { "Sit", "Springfest2023DucklingSit" },
        { "Joyful", "Springfest2023DucklingJoyful" },
        { "Beg", "Springfest2023DucklingBeg" },
        { "Jump", "Springfest2023DucklingJump" },
        { "Trick 1", "Springfest2023DucklingTrick3" },
        { "Trick 2", "Springfest2023DucklingTrick4" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(188, 148, 103),
        ["Crown"] = Color3.fromRGB(188, 148, 103),
        ["Crown2"] = Color3.fromRGB(188, 148, 103),
        ["LeftFoot"] = Color3.fromRGB(188, 148, 103),
        ["Necklace"] = Color3.fromRGB(188, 148, 103),
        ["RightFoot"] = Color3.fromRGB(188, 148, 103)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.springfest_2023_sunrise_duckling = v9
local v10 = {
    ["name"] = "Wood Pigeon",
    ["image"] = "rbxassetid://12720029414",
    ["model"] = "Springfest2023WoodPigeon",
    ["rarity"] = "ultra_rare",
    ["cost"] = 60000,
    ["currency_id"] = "eggs_2023",
    ["origin_entry"] = {
        ["origin"] = "Springfest",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Springfest2023WoodPigeonBeingHeldDouble",
        ["eating"] = "Springfest2023WoodPigeonEat",
        ["hold"] = "Springfest2023WoodPigeonBeingHeldSingle",
        ["idle"] = "Springfest2023WoodPigeonIdle",
        ["running"] = "Springfest2023WoodPigeonRun",
        ["sit"] = "Springfest2023WoodPigeonSit",
        ["sleep"] = "Springfest2023WoodPigeonSleep"
    },
    ["tricks"] = {
        { "Sit", "Springfest2023WoodPigeonSit" },
        { "Joyful", "Springfest2023WoodPigeonJoyful" },
        { "Beg", "Springfest2023WoodPigeonBeg" },
        { "Jump", "Springfest2023WoodPigeonJump" },
        { "Trick 1", "Springfest2023WoodPigeonTrick1" },
        { "Trick 2", "Springfest2023WoodPigeonTrick2" }
    },
    ["neon_parts"] = {
        ["Beak3"] = Color3.fromRGB(67, 113, 185),
        ["Head"] = Color3.fromRGB(67, 113, 185),
        ["LeftFoot"] = Color3.fromRGB(67, 113, 185),
        ["LeftWing2"] = Color3.fromRGB(67, 113, 185),
        ["RightFoot"] = Color3.fromRGB(67, 113, 185),
        ["RightWing2"] = Color3.fromRGB(67, 113, 185),
        ["Torso2"] = Color3.fromRGB(67, 113, 185),
        ["Torso3"] = Color3.fromRGB(67, 113, 185)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.springfest_2023_wood_pigeon = v10
return v1(v2)