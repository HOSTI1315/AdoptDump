--// ReplicatedStorage.SharedModules.ContentPacks.ModularCastles2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Frost Unicorn",
    ["image"] = "rbxassetid://12479991588",
    ["model"] = "ModularCastles2023FrostUnicorn",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Mountain House",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "FrostUnicornBeingHeldDouble",
        ["eating"] = "FrostUnicornEat",
        ["flying"] = "FrostUnicornRun",
        ["hold"] = "FrostUnicornBeingHeldSingle",
        ["idle"] = "FrostUnicornIdle",
        ["running"] = "FrostUnicornRun",
        ["sit"] = "FrostUnicornSit",
        ["sleep"] = "FrostUnicornSleep"
    },
    ["tricks"] = {
        { "Sit", "FrostUnicornSit" },
        { "Joyful", "FrostUnicornJoyful" },
        { "Beg", "FrostUnicornBeg" },
        { "Jump", "FrostUnicornJump" },
        { "Trick 1", "FrostUnicornTrick1" },
        { "Trick 2", "FrostUnicornTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(119, 87, 216),
        ["BackRightFoot"] = Color3.fromRGB(119, 87, 216),
        ["Eyes"] = Color3.fromRGB(119, 87, 216),
        ["FrontLeftFoot"] = Color3.fromRGB(119, 87, 216),
        ["FrontRightFoot"] = Color3.fromRGB(119, 87, 216),
        ["Hair"] = Color3.fromRGB(119, 87, 216),
        ["Hair10"] = Color3.fromRGB(119, 87, 216),
        ["Hair11"] = Color3.fromRGB(119, 87, 216),
        ["Hair12"] = Color3.fromRGB(119, 87, 216),
        ["Hair13"] = Color3.fromRGB(119, 87, 216),
        ["Hair14"] = Color3.fromRGB(119, 87, 216),
        ["Hair15"] = Color3.fromRGB(119, 87, 216),
        ["Hair16"] = Color3.fromRGB(119, 87, 216),
        ["Hair17"] = Color3.fromRGB(119, 87, 216),
        ["Hair18"] = Color3.fromRGB(119, 87, 216),
        ["Hair19"] = Color3.fromRGB(119, 87, 216),
        ["Hair2"] = Color3.fromRGB(119, 87, 216),
        ["Hair20"] = Color3.fromRGB(119, 87, 216),
        ["Hair21"] = Color3.fromRGB(119, 87, 216),
        ["Hair3"] = Color3.fromRGB(119, 87, 216),
        ["Hair4"] = Color3.fromRGB(119, 87, 216),
        ["Hair5"] = Color3.fromRGB(119, 87, 216),
        ["Hair6"] = Color3.fromRGB(119, 87, 216),
        ["Hair7"] = Color3.fromRGB(119, 87, 216),
        ["Hair8"] = Color3.fromRGB(119, 87, 216),
        ["Hair9"] = Color3.fromRGB(119, 87, 216),
        ["Horn"] = Color3.fromRGB(119, 87, 216),
        ["LeftEar"] = Color3.fromRGB(119, 87, 216),
        ["Rightear"] = Color3.fromRGB(119, 87, 216),
        ["Tail"] = Color3.fromRGB(119, 87, 216),
        ["Tail10"] = Color3.fromRGB(119, 87, 216),
        ["Tail11"] = Color3.fromRGB(119, 87, 216),
        ["Tail12"] = Color3.fromRGB(119, 87, 216),
        ["Tail13"] = Color3.fromRGB(119, 87, 216),
        ["Tail2"] = Color3.fromRGB(119, 87, 216),
        ["Tail3"] = Color3.fromRGB(119, 87, 216),
        ["Tail5"] = Color3.fromRGB(119, 87, 216),
        ["Tail7"] = Color3.fromRGB(119, 87, 216),
        ["Tail8"] = Color3.fromRGB(119, 87, 216),
        ["Tail9"] = Color3.fromRGB(119, 87, 216)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.modular_castles_2023_frost_unicorn = v3
return v1(v2)