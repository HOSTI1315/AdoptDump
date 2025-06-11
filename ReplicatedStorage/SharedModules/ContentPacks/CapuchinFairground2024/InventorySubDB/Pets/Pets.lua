--// ReplicatedStorage.SharedModules.ContentPacks.CapuchinFairground2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Capuchin Monkey",
    ["image"] = "rbxassetid://16897788024",
    ["model"] = "Capuchin2024CapuchinMonkey",
    ["rarity"] = "rare",
    ["cost"] = 300,
    ["origin_entry"] = {
        ["origin"] = "Capuchin Fairground",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Capuchin2024CapuchinMonkeyBeingHeldDouble",
        ["eating"] = "Capuchin2024CapuchinMonkeyEat",
        ["hold"] = "Capuchin2024CapuchinMonkeyBeingHeldSingle",
        ["idle"] = "Capuchin2024CapuchinMonkeyIdle",
        ["running"] = "Capuchin2024CapuchinMonkeyRun",
        ["sit"] = "Capuchin2024CapuchinMonkeySit",
        ["sleep"] = "Capuchin2024CapuchinMonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "Capuchin2024CapuchinMonkeySit" },
        { "Joyful", "Capuchin2024CapuchinMonkeyJoyful" },
        { "Beg", "Capuchin2024CapuchinMonkeyBeg" },
        { "Jump", "Capuchin2024CapuchinMonkeyJump" },
        { "Trick 1", "Capuchin2024CapuchinMonkeyTrick1" },
        { "Trick 2", "Capuchin2024CapuchinMonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["RightArm"] = Color3.fromRGB(185, 36, 55),
        ["LeftArm"] = Color3.fromRGB(185, 36, 55),
        ["RightHand"] = Color3.fromRGB(185, 36, 55),
        ["LeftHand"] = Color3.fromRGB(185, 36, 55),
        ["RightFoot"] = Color3.fromRGB(185, 36, 55),
        ["LeftFoot"] = Color3.fromRGB(185, 36, 55),
        ["RightEar2"] = Color3.fromRGB(185, 36, 55),
        ["LeftEar2"] = Color3.fromRGB(185, 36, 55),
        ["Nose"] = Color3.fromRGB(185, 36, 55),
        ["RightBrow"] = Color3.fromRGB(185, 36, 55),
        ["LeftBrow"] = Color3.fromRGB(185, 36, 55),
        ["Tail2"] = Color3.fromRGB(185, 36, 55)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.capuchin_2024_capuchin_monkey = v3
local v4 = {
    ["name"] = "Inmate Capuchin Monkey",
    ["image"] = "rbxassetid://16999461770",
    ["model"] = "Capuchin2024InmateCapuchinMonkey",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Capuchin Fairground",
        ["origin_items"] = { "capuchin_2024_capuchin_monkey", "3 capuchin_2024_toy_handcuffs" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Capuchin2024InmateCapuchinMonkeyBeingHeldDouble",
        ["eating"] = "Capuchin2024InmateCapuchinMonkeyEat",
        ["hold"] = "Capuchin2024InmateCapuchinMonkeyBeingHeldSingle",
        ["idle"] = "Capuchin2024InmateCapuchinMonkeyIdle",
        ["running"] = "Capuchin2024InmateCapuchinMonkeyRun",
        ["sit"] = "Capuchin2024InmateCapuchinMonkeySit",
        ["sleep"] = "Capuchin2024InmateCapuchinMonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "Capuchin2024InmateCapuchinMonkeySit" },
        { "Joyful", "Capuchin2024InmateCapuchinMonkeyJoyful" },
        { "Beg", "Capuchin2024InmateCapuchinMonkeyBeg" },
        { "Jump", "Capuchin2024InmateCapuchinMonkeyJump" },
        { "Trick 1", "Capuchin2024InmateCapuchinMonkeyTrick1" },
        { "Trick 2", "Capuchin2024InmateCapuchinMonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(186, 92, 20),
        ["RightFoot"] = Color3.fromRGB(186, 92, 20),
        ["LeftEar2"] = Color3.fromRGB(186, 92, 20),
        ["LeftHand"] = Color3.fromRGB(186, 92, 20),
        ["RightHand"] = Color3.fromRGB(186, 92, 20),
        ["RightEar2"] = Color3.fromRGB(186, 92, 20),
        ["Nose"] = Color3.fromRGB(186, 92, 20),
        ["Tail2"] = Color3.fromRGB(186, 92, 20),
        ["Torso"] = Color3.fromRGB(186, 92, 20),
        ["Hat2"] = Color3.fromRGB(186, 92, 20),
        ["Weight"] = Color3.fromRGB(186, 92, 20),
        ["LeftArm"] = Color3.fromRGB(186, 92, 20),
        ["RightArm"] = Color3.fromRGB(186, 92, 20),
        ["RightBrow"] = Color3.fromRGB(186, 92, 20),
        ["LeftBrow"] = Color3.fromRGB(186, 92, 20)
    },
    ["baked_in_accessory_parts"] = {
        ["capuchin_2024_inmate_cap"] = { "Hat", "Hat2" }
    },
    ["pre_equipped_removable_accessories"] = { "capuchin_2024_inmate_cap" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.capuchin_2024_inmate_capuchin_monkey = v4
local v5 = {
    ["name"] = "Preppy Capuchin Monkey",
    ["image"] = "rbxassetid://16898328648",
    ["model"] = "Capuchin2024PreppyCapuchinMonkey",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Capuchin Fairground",
        ["origin_items"] = { "capuchin_2024_capuchin_monkey", "3 capuchin_2024_cool_sunglasses" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Capuchin2024PreppyCapuchinMonkeyBeingHeldDouble",
        ["eating"] = "Capuchin2024PreppyCapuchinMonkeyEat",
        ["hold"] = "Capuchin2024PreppyCapuchinMonkeyBeingHeldSingle",
        ["idle"] = "Capuchin2024PreppyCapuchinMonkeyIdle",
        ["running"] = "Capuchin2024PreppyCapuchinMonkeyRun",
        ["sit"] = "Capuchin2024PreppyCapuchinMonkeySit",
        ["sleep"] = "Capuchin2024PreppyCapuchinMonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "Capuchin2024PreppyCapuchinMonkeySit" },
        { "Joyful", "Capuchin2024PreppyCapuchinMonkeyJoyful" },
        { "Beg", "Capuchin2024PreppyCapuchinMonkeyBeg" },
        { "Jump", "Capuchin2024PreppyCapuchinMonkeyJump" },
        { "Trick 1", "Capuchin2024PreppyCapuchinMonkeyTrick1" },
        { "Trick 2", "Capuchin2024PreppyCapuchinMonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(185, 163, 101),
        ["RightFoot"] = Color3.fromRGB(185, 163, 101),
        ["LeftEar2"] = Color3.fromRGB(185, 163, 101),
        ["LeftHand"] = Color3.fromRGB(185, 163, 101),
        ["RightHand"] = Color3.fromRGB(185, 163, 101),
        ["RightEar2"] = Color3.fromRGB(185, 163, 101),
        ["Nose"] = Color3.fromRGB(185, 163, 101),
        ["Tail2"] = Color3.fromRGB(185, 163, 101),
        ["Tie"] = Color3.fromRGB(185, 163, 101),
        ["RightBrow"] = Color3.fromRGB(185, 163, 101),
        ["LeftBrow"] = Color3.fromRGB(185, 163, 101),
        ["Torso3"] = Color3.fromRGB(185, 163, 101)
    },
    ["baked_in_accessory_parts"] = {
        ["capuchin_2024_preppy_sweater"] = { "Sweater", "Sweater2" }
    },
    ["pre_equipped_removable_accessories"] = { "capuchin_2024_preppy_sweater" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.capuchin_2024_preppy_capuchin_monkey = v5
local v6 = {
    ["name"] = "Princess Capuchin Monkey",
    ["image"] = "rbxassetid://16898331554",
    ["model"] = "Capuchin2024PrincessCapuchinMonkey",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Capuchin Fairground",
        ["origin_items"] = { "capuchin_2024_capuchin_monkey", "3 capuchin_2024_tutu" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Capuchin2024PrincessCapuchinMonkeyBeingHeldDouble",
        ["eating"] = "Capuchin2024PrincessCapuchinMonkeyEat",
        ["hold"] = "Capuchin2024PrincessCapuchinMonkeyBeingHeldSingle",
        ["idle"] = "Capuchin2024PrincessCapuchinMonkeyIdle",
        ["running"] = "Capuchin2024PrincessCapuchinMonkeyRun",
        ["sit"] = "Capuchin2024PrincessCapuchinMonkeySit",
        ["sleep"] = "Capuchin2024PrincessCapuchinMonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "Capuchin2024PrincessCapuchinMonkeySit" },
        { "Joyful", "Capuchin2024PrincessCapuchinMonkeyJoyful" },
        { "Beg", "Capuchin2024PrincessCapuchinMonkeyBeg" },
        { "Jump", "Capuchin2024PrincessCapuchinMonkeyJump" },
        { "Trick 1", "Capuchin2024PrincessCapuchinMonkeyTrick1" },
        { "Trick 2", "Capuchin2024PrincessCapuchinMonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftHand"] = Color3.fromRGB(185, 44, 74),
        ["RightHand"] = Color3.fromRGB(185, 44, 74),
        ["Nose"] = Color3.fromRGB(185, 44, 74),
        ["Tail3"] = Color3.fromRGB(185, 44, 74),
        ["LeftArm2"] = Color3.fromRGB(185, 44, 74),
        ["RightArm2"] = Color3.fromRGB(185, 44, 74),
        ["Torso4"] = Color3.fromRGB(185, 44, 74),
        ["Torso2"] = Color3.fromRGB(185, 44, 74),
        ["Crown3"] = Color3.fromRGB(185, 44, 74),
        ["RightFoot"] = Color3.fromRGB(185, 44, 74),
        ["LeftFoot"] = Color3.fromRGB(185, 44, 74),
        ["RightBrow"] = Color3.fromRGB(185, 44, 74),
        ["LeftBrow"] = Color3.fromRGB(185, 44, 74)
    },
    ["pre_equipped_removable_accessories"] = { "capuchin_2024_princess_booties" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.capuchin_2024_princess_capuchin_monkey = v6
local v7 = {
    ["name"] = "Pirate Ghost Capuchin Monkey",
    ["image"] = "rbxassetid://16898343164",
    ["model"] = "Capuchin2024PirateGhostCapuchinMonkey",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Capuchin Fairground",
        ["origin_items"] = { "capuchin_2024_capuchin_monkey", "3 capuchin_2024_compass" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Capuchin2024PirateGhostCapuchinMonkeyBeingHeldDouble",
        ["eating"] = "Capuchin2024PirateGhostCapuchinMonkeyEat",
        ["hold"] = "Capuchin2024PirateGhostCapuchinMonkeyBeingHeldSingle",
        ["idle"] = "Capuchin2024PirateGhostCapuchinMonkeyIdle",
        ["running"] = "Capuchin2024PirateGhostCapuchinMonkeyRun",
        ["sit"] = "Capuchin2024PirateGhostCapuchinMonkeySit",
        ["sleep"] = "Capuchin2024PirateGhostCapuchinMonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "Capuchin2024PirateGhostCapuchinMonkeySit" },
        { "Joyful", "Capuchin2024PirateGhostCapuchinMonkeyJoyful" },
        { "Beg", "Capuchin2024PirateGhostCapuchinMonkeyBeg" },
        { "Jump", "Capuchin2024PirateGhostCapuchinMonkeyJump" },
        { "Trick 1", "Capuchin2024PirateGhostCapuchinMonkeyTrick1" },
        { "Trick 2", "Capuchin2024PirateGhostCapuchinMonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(100, 184, 96),
        ["LeftFoot"] = Color3.fromRGB(100, 184, 96),
        ["RightFoot"] = Color3.fromRGB(100, 184, 96),
        ["LeftEar2"] = Color3.fromRGB(100, 184, 96),
        ["LeftHand"] = Color3.fromRGB(100, 184, 96),
        ["RightHand"] = Color3.fromRGB(100, 184, 96),
        ["RightEar2"] = Color3.fromRGB(100, 184, 96),
        ["Nose"] = Color3.fromRGB(100, 184, 96),
        ["Tail2"] = Color3.fromRGB(100, 184, 96),
        ["LeftArm2"] = Color3.fromRGB(100, 184, 96),
        ["RightArm2"] = Color3.fromRGB(100, 184, 96),
        ["Torso2"] = Color3.fromRGB(100, 184, 96),
        ["Hat3"] = Color3.fromRGB(100, 184, 96),
        ["Torso5"] = Color3.fromRGB(100, 184, 96),
        ["RightBrow"] = Color3.fromRGB(100, 184, 96),
        ["LeftBrow"] = Color3.fromRGB(100, 184, 96),
        ["Hat2"] = Color3.fromRGB(100, 184, 96)
    },
    ["baked_in_accessory_parts"] = {
        ["capuchin_2024_ship_wheel_necklace"] = {
            "Necklace",
            "Necklace2",
            "Necklace3",
            "Necklace4"
        }
    },
    ["pre_equipped_removable_accessories"] = { "capuchin_2024_ship_wheel_necklace" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.capuchin_2024_pirate_ghost_capuchin_monkey = v7
local v8 = {
    ["name"] = "Royal Capuchin Monkey",
    ["image"] = "rbxassetid://16911441596",
    ["model"] = "Capuchin2024RoyalCapuchinMonkey",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Capuchin Fairground",
        ["origin_items"] = { "capuchin_2024_standard_box", "capuchin_2024_premium_box" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Capuchin2024RoyalCapuchinMonkeyBeingHeldDouble",
        ["eating"] = "Capuchin2024RoyalCapuchinMonkeyEat",
        ["hold"] = "Capuchin2024RoyalCapuchinMonkeyBeingHeldSingle",
        ["idle"] = "Capuchin2024RoyalCapuchinMonkeyIdle",
        ["running"] = "Capuchin2024RoyalCapuchinMonkeyRun",
        ["sit"] = "Capuchin2024RoyalCapuchinMonkeySit",
        ["sleep"] = "Capuchin2024RoyalCapuchinMonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "Capuchin2024RoyalCapuchinMonkeySit" },
        { "Joyful", "Capuchin2024RoyalCapuchinMonkeyJoyful" },
        { "Beg", "Capuchin2024RoyalCapuchinMonkeyBeg" },
        { "Jump", "Capuchin2024RoyalCapuchinMonkeyJump" },
        { "Trick 1", "Capuchin2024RoyalCapuchinMonkeyTrick1" },
        { "Trick 2", "Capuchin2024RoyalCapuchinMonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(94, 142, 188),
        ["RightFoot"] = Color3.fromRGB(94, 142, 188),
        ["LeftEar2"] = Color3.fromRGB(94, 142, 188),
        ["RightArm"] = Color3.fromRGB(94, 142, 188),
        ["LeftHand"] = Color3.fromRGB(94, 142, 188),
        ["RightHand"] = Color3.fromRGB(94, 142, 188),
        ["LeftArm"] = Color3.fromRGB(94, 142, 188),
        ["RightEar2"] = Color3.fromRGB(94, 142, 188),
        ["Nose"] = Color3.fromRGB(94, 142, 188),
        ["Tail2"] = Color3.fromRGB(94, 142, 188),
        ["Hair"] = Color3.fromRGB(90, 174, 189),
        ["Tail4"] = Color3.fromRGB(94, 142, 188),
        ["Tail5"] = Color3.fromRGB(94, 142, 188),
        ["RightBrow"] = Color3.fromRGB(94, 142, 188),
        ["LeftBrow"] = Color3.fromRGB(94, 142, 188),
        ["Cape3"] = Color3.fromRGB(90, 174, 189),
        ["Crown2"] = Color3.fromRGB(90, 174, 189)
    },
    ["baked_in_accessory_parts"] = {
        ["capuchin_2024_royal_capuchin_cape"] = { "Cape", "Cape2", "Cape3" },
        ["capuchin_2024_royal_capuchin_crown"] = { "Crown", "Crown2" },
        ["capuchin_2024_royal_capuchin_saber_pin"] = {
            "Saber",
            "Saber2",
            "Saber3",
            "Saber4"
        }
    },
    ["pre_equipped_removable_accessories"] = { "capuchin_2024_royal_capuchin_cape", "capuchin_2024_royal_capuchin_crown", "capuchin_2024_royal_capuchin_saber_pin" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.capuchin_2024_royal_capuchin_monkey = v8
return v1(v2)