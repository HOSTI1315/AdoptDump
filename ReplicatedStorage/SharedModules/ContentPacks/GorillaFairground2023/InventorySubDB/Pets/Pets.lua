--// ReplicatedStorage.SharedModules.ContentPacks.GorillaFairground2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Albino Gorilla",
    ["image"] = "rbxassetid://12403863809",
    ["model"] = "GorillaFair2023AlbinoGorilla",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Gorilla Fairground",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "GorillaBeingHeldDouble",
        ["eating"] = "GorillaEat",
        ["hold"] = "GorillaBeingHeldSingle",
        ["idle"] = "GorillaIdle",
        ["running"] = "GorillaRun",
        ["sit"] = "GorillaSit",
        ["sleep"] = "GorillaSleep"
    },
    ["tricks"] = {
        { "Sit", "GorillaSit" },
        { "Joyful", "GorillaJoyful" },
        { "Beg", "GorillaBeg" },
        { "Jump", "GorillaJump" },
        { "Trick 1", "GorillaTrick1" },
        { "Trick 2", "GorillaTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(186, 119, 63),
        ["LeftEar2"] = Color3.fromRGB(186, 119, 63),
        ["LeftFoot"] = Color3.fromRGB(186, 119, 63),
        ["LeftHand"] = Color3.fromRGB(186, 119, 63),
        ["RightEar2"] = Color3.fromRGB(186, 119, 63),
        ["RightFoot"] = Color3.fromRGB(186, 119, 63),
        ["RightHand"] = Color3.fromRGB(186, 119, 63),
        ["Torso2"] = Color3.fromRGB(186, 119, 63)
    },
    ["flying_move_anim_speed"] = 0.7,
    ["minimum_fly_anim_speed"] = 0.5,
    ["pre_equipped_removable_accessories"] = { "gorilla_fair_2023_tuxedo_tie", "gorilla_fair_2023_tuxedo_top_hat", "gorilla_fair_2023_tuxedo_walking_stick" }
}
v2.gorilla_fair_2023_albino_gorilla = v3
local v4 = {
    ["name"] = "Astronaut Gorilla",
    ["image"] = "rbxassetid://12778628650",
    ["model"] = "GorillaFair2023AstronautGorilla",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Gorilla Fairground",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "AstronautGorillaBeingHeldDouble",
        ["eating"] = "AstronautGorillaEat",
        ["hold"] = "AstronautGorillaBeingHeldSingle",
        ["idle"] = "AstronautGorillaIdle",
        ["running"] = "AstronautGorillaRun",
        ["sit"] = "AstronautGorillaSit",
        ["sleep"] = "AstronautGorillaSleep"
    },
    ["tricks"] = {
        { "Sit", "AstronautGorillaSit" },
        { "Joyful", "AstronautGorillaJoyful" },
        { "Beg", "AstronautGorillaBeg" },
        { "Jump", "AstronautGorillaJump" },
        { "Trick 1", "AstronautGorillaTrick1" },
        { "Trick 2", "AstronautGorillaTrick2" }
    },
    ["neon_parts"] = {
        ["Helmet2"] = Color3.fromRGB(82, 71, 202),
        ["Helmet3"] = Color3.fromRGB(82, 71, 202),
        ["LeftFoot"] = Color3.fromRGB(82, 71, 202),
        ["LeftHand"] = Color3.fromRGB(82, 71, 202),
        ["RightFoot"] = Color3.fromRGB(82, 71, 202),
        ["RightHand"] = Color3.fromRGB(82, 71, 202)
    },
    ["baked_in_accessory_parts"] = {
        ["gorilla_fair_2023_astronaut_accessory"] = {
            "JetPack",
            "Jetpack2",
            "Jetpack3",
            "Jetpack4"
        }
    },
    ["flying_move_anim_speed"] = 0.7,
    ["minimum_fly_anim_speed"] = 0.5,
    ["minimum_run_anim_speed"] = 1.5,
    ["pre_equipped_removable_accessories"] = { "gorilla_fair_2023_astronaut_accessory" }
}
v2.gorilla_fair_2023_astronaut_gorilla = v4
local v5 = {
    ["name"] = "Chef Gorilla",
    ["image"] = "rbxassetid://12778628745",
    ["model"] = "GorillaFair2023ChefGorilla",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Gorilla Fairground",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "ChefGorillaBeingHeldDouble",
        ["eating"] = "ChefGorillaEat",
        ["hold"] = "ChefGorillaBeingHeldSingle",
        ["idle"] = "ChefGorillaIdle",
        ["running"] = "ChefGorillaRun",
        ["sit"] = "ChefGorillaSit",
        ["sleep"] = "ChefGorillaSleep"
    },
    ["tricks"] = {
        { "Sit", "ChefGorillaSit" },
        { "Joyful", "ChefGorillaJoyful" },
        { "Beg", "ChefGorillaBeg" },
        { "Jump", "ChefGorillaJump" },
        { "Trick 1", "ChefGorillaTrick1" },
        { "Trick 2", "ChefGorillaTrick2" }
    },
    ["neon_parts"] = {
        ["Hat"] = Color3.fromRGB(186, 37, 26),
        ["LeftFoot"] = Color3.fromRGB(186, 37, 26),
        ["LeftHand"] = Color3.fromRGB(186, 37, 26),
        ["RightFoot"] = Color3.fromRGB(186, 37, 26),
        ["RightHand"] = Color3.fromRGB(186, 37, 26),
        ["Tie"] = Color3.fromRGB(186, 37, 26)
    },
    ["baked_in_accessory_parts"] = {
        ["gorilla_fair_2023_chef_accessory"] = { "Hat", "HatEmblem" }
    },
    ["flying_move_anim_speed"] = 0.7,
    ["minimum_fly_anim_speed"] = 0.5,
    ["minimum_run_anim_speed"] = 1.5,
    ["pre_equipped_removable_accessories"] = { "gorilla_fair_2023_chef_accessory" }
}
v2.gorilla_fair_2023_chef_gorilla = v5
local v6 = {
    ["name"] = "Emperor Gorilla",
    ["image"] = "rbxassetid://12778628831",
    ["model"] = "GorillaFair2023EmperorGorilla",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Gorilla Fairground",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "EmperorGorillaBeingHeldDouble",
        ["eating"] = "EmperorGorillaEat",
        ["hold"] = "EmperorGorillaBeingHeldSingle",
        ["idle"] = "EmperorGorillaIdle",
        ["running"] = "EmperorGorillaRun",
        ["sit"] = "EmperorGorillaSit",
        ["sleep"] = "EmperorGorillaSleep"
    },
    ["tricks"] = {
        { "Sit", "EmperorGorillaSit" },
        { "Joyful", "EmperorGorillaJoyful" },
        { "Beg", "EmperorGorillaBeg" },
        { "Jump", "EmperorGorillaJump" },
        { "Trick 1", "EmperorGorillaTrick1" },
        { "Trick 2", "EmperorGorillaTrick2" }
    },
    ["neon_parts"] = {
        ["Crown2"] = Color3.fromRGB(198, 100, 43),
        ["Crown3"] = Color3.fromRGB(198, 100, 43),
        ["LeftArm3"] = Color3.fromRGB(198, 100, 43),
        ["LeftFoot"] = Color3.fromRGB(198, 100, 43),
        ["RightArm3"] = Color3.fromRGB(198, 100, 43),
        ["RightFoot"] = Color3.fromRGB(198, 100, 43),
        ["Torso2"] = Color3.fromRGB(198, 100, 43)
    },
    ["baked_in_accessory_parts"] = {
        ["gorilla_fair_2023_emperor_accessory"] = { "Crown", "Crown2", "Crown3" }
    },
    ["flying_move_anim_speed"] = 0.7,
    ["minimum_fly_anim_speed"] = 0.5,
    ["minimum_run_anim_speed"] = 1.5,
    ["pre_equipped_removable_accessories"] = { "gorilla_fair_2023_emperor_accessory" }
}
v2.gorilla_fair_2023_emperor_gorilla = v6
local v7 = {
    ["name"] = "Gorilla",
    ["image"] = "rbxassetid://12403864254",
    ["model"] = "GorillaFair2023Gorilla",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Gorilla Fairground",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "GorillaBeingHeldDouble",
        ["eating"] = "GorillaEat",
        ["hold"] = "GorillaBeingHeldSingle",
        ["idle"] = "GorillaIdle",
        ["running"] = "GorillaRun",
        ["sit"] = "GorillaSit",
        ["sleep"] = "GorillaSleep"
    },
    ["tricks"] = {
        { "Sit", "GorillaSit" },
        { "Joyful", "GorillaJoyful" },
        { "Beg", "GorillaBeg" },
        { "Jump", "GorillaJump" },
        { "Trick 1", "GorillaTrick1" },
        { "Trick 2", "GorillaTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(184, 100, 71),
        ["LeftEar2"] = Color3.fromRGB(184, 100, 71),
        ["LeftFoot"] = Color3.fromRGB(184, 100, 71),
        ["LeftHand"] = Color3.fromRGB(184, 100, 71),
        ["RightEar2"] = Color3.fromRGB(184, 100, 71),
        ["RightFoot"] = Color3.fromRGB(184, 100, 71),
        ["RightHand"] = Color3.fromRGB(184, 100, 71),
        ["Torso2"] = Color3.fromRGB(184, 100, 71)
    },
    ["flying_move_anim_speed"] = 0.7,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.gorilla_fair_2023_gorilla = v7
local v8 = {
    ["name"] = "Karate Gorilla",
    ["image"] = "rbxassetid://12778628897",
    ["model"] = "GorillaFair2023KarateGorilla",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Gorilla Fairground",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "KarateGorillaBeingHeldDouble",
        ["eating"] = "KarateGorillaEat",
        ["hold"] = "KarateGorillaBeingHeldSingle",
        ["idle"] = "KarateGorillaIdle",
        ["running"] = "KarateGorillaRun",
        ["sit"] = "KarateGorillaSit",
        ["sleep"] = "KarateGorillaSleep"
    },
    ["tricks"] = {
        { "Sit", "KarateGorillaSit" },
        { "Joyful", "KarateGorillaJoyful" },
        { "Beg", "KarateGorillaBeg" },
        { "Jump", "KarateGorillaJump" },
        { "Trick 1", "KarateGorillaTrick1" },
        { "Trick 2", "KarateGorillaTrick2" }
    },
    ["neon_parts"] = {
        ["Headband"] = Color3.fromRGB(186, 54, 54),
        ["LeftArm3"] = Color3.fromRGB(186, 54, 54),
        ["RightArm3"] = Color3.fromRGB(186, 54, 54),
        ["Torso4"] = Color3.fromRGB(186, 54, 54)
    },
    ["baked_in_accessory_parts"] = {
        ["gorilla_fair_2023_karate_accessory"] = { "Headband", "Headband2" }
    },
    ["flying_move_anim_speed"] = 0.7,
    ["minimum_fly_anim_speed"] = 0.5,
    ["pre_equipped_removable_accessories"] = { "gorilla_fair_2023_karate_accessory" }
}
v2.gorilla_fair_2023_karate_gorilla = v8
return v1(v2)