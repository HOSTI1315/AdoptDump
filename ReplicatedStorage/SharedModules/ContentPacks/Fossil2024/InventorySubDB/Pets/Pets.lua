--// ReplicatedStorage.SharedModules.ContentPacks.Fossil2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Brachiosaurus",
    ["model"] = "Fossil2024Brachiosaurus",
    ["image"] = "rbxassetid://16994954002",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["year"] = 2024
    },
    ["minimum_run_anim_speed"] = 1.5,
    ["anims"] = {
        ["sleep"] = "Fossil2024BrachiosaurusSleep",
        ["running"] = "Fossil2024BrachiosaurusRun",
        ["idle"] = "Fossil2024BrachiosaurusIdle",
        ["eating"] = "Fossil2024BrachiosaurusEat",
        ["sit"] = "Fossil2024BrachiosaurusSit",
        ["flying"] = "Fossil2024BrachiosaurusRun",
        ["hold"] = "Fossil2024BrachiosaurusBeingHeldSingle",
        ["double_hold"] = "Fossil2024BrachiosaurusBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Fossil2024BrachiosaurusSit" },
        { "Joyful", "Fossil2024BrachiosaurusJoyful" },
        { "Beg", "Fossil2024BrachiosaurusBeg" },
        { "Jump", "Fossil2024BrachiosaurusJump" },
        { "Trick 1", "Fossil2024BrachiosaurusTrick1" },
        { "Trick 2", "Fossil2024BrachiosaurusTrick2" }
    },
    ["neon_parts"] = {
        ["Tail2"] = Color3.fromRGB(107, 162, 185),
        ["Head2"] = Color3.fromRGB(107, 162, 185),
        ["Tail3"] = Color3.fromRGB(107, 162, 185),
        ["Torso3"] = Color3.fromRGB(107, 162, 185),
        ["Torso2"] = Color3.fromRGB(107, 162, 185)
    }
}
v2.fossil_2024_brachiosaurus = v3
local v4 = {
    ["name"] = "Velociraptor",
    ["model"] = "Fossil2024Velociraptor",
    ["image"] = "rbxassetid://17059483392",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Fossil2024VelociraptorSleep",
        ["running"] = "Fossil2024VelociraptorRun",
        ["idle"] = "Fossil2024VelociraptorIdle",
        ["eating"] = "Fossil2024VelociraptorEat",
        ["sit"] = "Fossil2024VelociraptorSit",
        ["flying"] = "Fossil2024VelociraptorRun",
        ["hold"] = "Fossil2024VelociraptorBeingHeldSingle",
        ["double_hold"] = "Fossil2024VelociraptorBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Fossil2024VelociraptorSit" },
        { "Joyful", "Fossil2024VelociraptorJoyful" },
        { "Beg", "Fossil2024VelociraptorBeg" },
        { "Jump", "Fossil2024VelociraptorJump" },
        { "Trick 1", "Fossil2024VelociraptorTrick1" },
        { "Trick 2", "Fossil2024VelociraptorTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(193, 116, 57),
        ["Torso2"] = Color3.fromRGB(193, 116, 57),
        ["Torso3"] = Color3.fromRGB(193, 116, 57)
    }
}
v2.fossil_2024_velociraptor = v4
local v5 = {
    ["name"] = "Ankylosaurus",
    ["model"] = "Fossil2024Ankylosaurus",
    ["image"] = "rbxassetid://17059776562",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Fossil2024AnkylosaurusSleep",
        ["running"] = "Fossil2024AnkylosaurusRun",
        ["idle"] = "Fossil2024AnkylosaurusIdle",
        ["eating"] = "Fossil2024AnkylosaurusEat",
        ["sit"] = "Fossil2024AnkylosaurusSit",
        ["flying"] = "Fossil2024AnkylosaurusRun",
        ["hold"] = "Fossil2024AnkylosaurusBeingHeldSingle",
        ["double_hold"] = "Fossil2024AnkylosaurusBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Fossil2024AnkylosaurusSit" },
        { "Joyful", "Fossil2024AnkylosaurusJoyful" },
        { "Beg", "Fossil2024AnkylosaurusBeg" },
        { "Jump", "Fossil2024AnkylosaurusJump" },
        { "Trick 1", "Fossil2024AnkylosaurusTrick1" },
        { "Trick 2", "Fossil2024AnkylosaurusTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot2"] = Color3.fromRGB(171, 185, 101),
        ["FrontLeftFoot2"] = Color3.fromRGB(171, 185, 101),
        ["FrontRightFoot2"] = Color3.fromRGB(171, 185, 101),
        ["BackRightFoot2"] = Color3.fromRGB(171, 185, 101),
        ["Head3"] = Color3.fromRGB(171, 185, 101),
        ["Mouth"] = Color3.fromRGB(171, 185, 101),
        ["Torso3"] = Color3.fromRGB(171, 185, 101),
        ["Tail"] = Color3.fromRGB(171, 185, 101)
    }
}
v2.fossil_2024_ankylosaurus = v5
local v6 = {
    ["name"] = "Elasmosaurus",
    ["model"] = "Fossil2024Elasmosaurus",
    ["image"] = "rbxassetid://17059860310",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Fossil2024ElasmosaurusSleep",
        ["running"] = "Fossil2024ElasmosaurusRun",
        ["idle"] = "Fossil2024ElasmosaurusIdle",
        ["eating"] = "Fossil2024ElasmosaurusEat",
        ["sit"] = "Fossil2024ElasmosaurusSit",
        ["flying"] = "Fossil2024ElasmosaurusRun",
        ["hold"] = "Fossil2024ElasmosaurusBeingHeldSingle",
        ["double_hold"] = "Fossil2024ElasmosaurusBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Fossil2024ElasmosaurusSit" },
        { "Joyful", "Fossil2024ElasmosaurusJoyful" },
        { "Beg", "Fossil2024ElasmosaurusBeg" },
        { "Jump", "Fossil2024ElasmosaurusJump" },
        { "Trick 1", "Fossil2024ElasmosaurusTrick1" },
        { "Trick 2", "Fossil2024ElasmosaurusTrick2" }
    },
    ["neon_parts"] = {
        ["Torso3"] = Color3.fromRGB(31, 184, 151),
        ["Torso2"] = Color3.fromRGB(31, 184, 151),
        ["Head2"] = Color3.fromRGB(31, 184, 151),
        ["BackRightFoot3"] = Color3.fromRGB(31, 184, 151),
        ["FrontRightFoot3"] = Color3.fromRGB(31, 184, 151),
        ["Torso5"] = Color3.fromRGB(31, 184, 151),
        ["FrontLeftFoot3"] = Color3.fromRGB(31, 184, 151),
        ["BackLeftFoot3"] = Color3.fromRGB(31, 184, 151),
        ["Tail2"] = Color3.fromRGB(31, 184, 151),
        ["Tail3"] = Color3.fromRGB(31, 184, 151),
        ["Tail4"] = Color3.fromRGB(31, 184, 151)
    }
}
v2.fossil_2024_elasmosaurus = v6
local v7 = {
    ["name"] = "Dimorphodon",
    ["model"] = "Fossil2024Dimorphodon",
    ["image"] = "rbxassetid://17059982206",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["year"] = 2024
    },
    ["already_has_flying_wings"] = true,
    ["anims"] = {
        ["sleep"] = "Fossil2024DimorphodonSleep",
        ["running"] = "Fossil2024DimorphodonRun",
        ["idle"] = "Fossil2024DimorphodonIdle",
        ["eating"] = "Fossil2024DimorphodonEat",
        ["sit"] = "Fossil2024DimorphodonSit",
        ["flying"] = "Fossil2024DimorphodonRun",
        ["hold"] = "Fossil2024DimorphodonBeingHeldSingle",
        ["double_hold"] = "Fossil2024DimorphodonBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Fossil2024DimorphodonSit" },
        { "Joyful", "Fossil2024DimorphodonJoyful" },
        { "Beg", "Fossil2024DimorphodonBeg" },
        { "Jump", "Fossil2024DimorphodonJump" },
        { "Trick 1", "Fossil2024DimorphodonTrick1" },
        { "Trick 2", "Fossil2024DimorphodonTrick2" }
    },
    ["neon_parts"] = {
        ["Frill"] = Color3.fromRGB(221, 100, 29),
        ["Head2"] = Color3.fromRGB(221, 100, 29),
        ["Torso3"] = Color3.fromRGB(221, 100, 29),
        ["Torso2"] = Color3.fromRGB(221, 100, 29),
        ["Tail"] = Color3.fromRGB(221, 100, 29),
        ["LeftWing4"] = Color3.fromRGB(200, 82, 56),
        ["RightWing4"] = Color3.fromRGB(200, 82, 56),
        ["Tail2"] = Color3.fromRGB(221, 100, 29),
        ["Tail3"] = Color3.fromRGB(221, 100, 29),
        ["Tail4"] = Color3.fromRGB(221, 100, 29)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.fossil_2024_dimorphodon = v7
return v1(v2)