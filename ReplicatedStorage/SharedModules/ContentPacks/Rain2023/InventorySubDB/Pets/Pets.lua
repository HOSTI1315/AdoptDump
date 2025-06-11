--// ReplicatedStorage.SharedModules.ContentPacks.Rain2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Diamond Amazon",
    ["image"] = "rbxassetid://11109117895",
    ["model"] = "Rain2023DiamondAmazon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Rain",
        ["origin_items"] = { "rain_2023_golden_plantain" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "AmazonBeingHeldDouble",
        ["eating"] = "AmazonEat",
        ["hold"] = "AmazonBeingHeldSingle",
        ["idle"] = "AmazonIdle",
        ["running"] = "AmazonRun",
        ["sit"] = "AmazonSit",
        ["sleep"] = "AmazonSleep"
    },
    ["tricks"] = {
        { "Sit", "AmazonSit" },
        { "Joyful", "AmazonJoyful" },
        { "Beg", "AmazonBeg" },
        { "Jump", "AmazonJump" },
        { "Trick 1", "AmazonTrick1" },
        { "Trick 2", "AmazonTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(189, 172, 103),
        ["Head3"] = Color3.fromRGB(85, 111, 197),
        ["Head4"] = Color3.fromRGB(85, 111, 197),
        ["LeftFoot"] = Color3.fromRGB(85, 111, 197),
        ["LeftWing"] = Color3.fromRGB(189, 172, 103),
        ["LeftWing3"] = Color3.fromRGB(189, 172, 103),
        ["LeftWing4"] = Color3.fromRGB(85, 111, 197),
        ["RightFoot"] = Color3.fromRGB(85, 111, 197),
        ["RightWing"] = Color3.fromRGB(189, 172, 103),
        ["RightWing3"] = Color3.fromRGB(189, 172, 103),
        ["RightWing4"] = Color3.fromRGB(85, 111, 197),
        ["Tail"] = Color3.fromRGB(85, 111, 197),
        ["Tail2"] = Color3.fromRGB(189, 172, 103)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["minimum_run_anim_speed"] = 0.75
}
v2.rain_2023_diamond_amazon = v3
local v4 = {
    ["name"] = "Green Amazon",
    ["image"] = "rbxassetid://11109032702",
    ["model"] = "Rain2023GreenAmazon",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Rain",
        ["origin_items"] = { "rain_2023_golden_plantain" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "AmazonBeingHeldDouble",
        ["eating"] = "AmazonEat",
        ["hold"] = "AmazonBeingHeldSingle",
        ["idle"] = "AmazonIdle",
        ["running"] = "AmazonRun",
        ["sit"] = "AmazonSit",
        ["sleep"] = "AmazonSleep"
    },
    ["tricks"] = {
        { "Sit", "AmazonSit" },
        { "Joyful", "AmazonJoyful" },
        { "Beg", "AmazonBeg" },
        { "Jump", "AmazonJump" },
        { "Trick 1", "AmazonTrick1" },
        { "Trick 2", "AmazonTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(99, 96, 189),
        ["Head3"] = Color3.fromRGB(165, 186, 95),
        ["Head4"] = Color3.fromRGB(165, 186, 95),
        ["LeftFoot"] = Color3.fromRGB(165, 186, 95),
        ["LeftWing"] = Color3.fromRGB(165, 186, 95),
        ["LeftWing3"] = Color3.fromRGB(99, 96, 189),
        ["LeftWing4"] = Color3.fromRGB(165, 186, 95),
        ["RightFoot"] = Color3.fromRGB(165, 186, 95),
        ["RightWing"] = Color3.fromRGB(165, 186, 95),
        ["RightWing3"] = Color3.fromRGB(99, 96, 189),
        ["RightWing4"] = Color3.fromRGB(165, 186, 95),
        ["Tail"] = Color3.fromRGB(99, 96, 189),
        ["Tail2"] = Color3.fromRGB(165, 186, 95)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["minimum_run_anim_speed"] = 0.75
}
v2.rain_2023_green_amazon = v4
local v5 = {
    ["name"] = "Ocelot",
    ["image"] = "rbxassetid://11108831285",
    ["model"] = "Rain2023Ocelot",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["origin_entry"] = {
        ["origin"] = "Rain",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "OcelotBeingHeldDouble",
        ["eating"] = "OcelotEat",
        ["flying"] = "OcelotRun",
        ["hold"] = "OcelotBeingHeldSingle",
        ["idle"] = "OcelotIdle",
        ["running"] = "OcelotRun",
        ["sit"] = "OcelotSit",
        ["sleep"] = "OcelotSleep"
    },
    ["tricks"] = {
        { "Sit", "OcelotSit" },
        { "Joyful", "OcelotJoyful" },
        { "Beg", "OcelotBeg" },
        { "Jump", "OcelotJump" },
        { "Trick 1", "OcelotTrick1" },
        { "Trick 2", "OcelotTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(198, 85, 85),
        ["LeftEar2"] = Color3.fromRGB(198, 85, 85),
        ["LeftEar3"] = Color3.fromRGB(198, 85, 85),
        ["LeftEar4"] = Color3.fromRGB(198, 85, 85),
        ["Nose"] = Color3.fromRGB(198, 85, 85),
        ["RightEar2"] = Color3.fromRGB(198, 85, 85),
        ["RightEar3"] = Color3.fromRGB(198, 85, 85),
        ["RightEar4"] = Color3.fromRGB(198, 85, 85),
        ["Tail2"] = Color3.fromRGB(198, 85, 85),
        ["Tail4"] = Color3.fromRGB(198, 85, 85),
        ["Torso2"] = Color3.fromRGB(198, 85, 85),
        ["Torso3"] = Color3.fromRGB(198, 85, 85)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["minimum_fly_anim_speed"] = 0.25
}
v2.rain_2023_ocelot = v5
local v6 = {
    ["name"] = "White Amazon",
    ["image"] = "rbxassetid://11109110190",
    ["model"] = "Rain2023WhiteAmazon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Rain",
        ["origin_items"] = { "rain_2023_golden_plantain" },
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "AmazonBeingHeldDouble",
        ["eating"] = "AmazonEat",
        ["hold"] = "AmazonBeingHeldSingle",
        ["idle"] = "AmazonIdle",
        ["running"] = "AmazonRun",
        ["sit"] = "AmazonSit",
        ["sleep"] = "AmazonSleep"
    },
    ["tricks"] = {
        { "Sit", "AmazonSit" },
        { "Joyful", "AmazonJoyful" },
        { "Beg", "AmazonBeg" },
        { "Jump", "AmazonJump" },
        { "Trick 1", "AmazonTrick1" },
        { "Trick 2", "AmazonTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(132, 103, 194),
        ["Head3"] = Color3.fromRGB(188, 88, 156),
        ["Head4"] = Color3.fromRGB(188, 88, 156),
        ["LeftFoot"] = Color3.fromRGB(188, 88, 156),
        ["LeftWing3"] = Color3.fromRGB(188, 88, 156),
        ["LeftWing4"] = Color3.fromRGB(132, 103, 194),
        ["RightFoot"] = Color3.fromRGB(188, 88, 156),
        ["RightWing3"] = Color3.fromRGB(188, 88, 156),
        ["RightWing4"] = Color3.fromRGB(132, 103, 194),
        ["Tail"] = Color3.fromRGB(188, 88, 156),
        ["Tail2"] = Color3.fromRGB(132, 103, 194)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["minimum_run_anim_speed"] = 0.75
}
v2.rain_2023_white_amazon = v6
return v1(v2)