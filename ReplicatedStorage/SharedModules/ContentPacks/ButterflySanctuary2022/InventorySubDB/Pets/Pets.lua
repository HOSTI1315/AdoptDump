--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Diamond Butterfly",
    ["image"] = "rbxassetid://10453528102",
    ["model"] = "ButterflySanctuary2022PremiumDiamond",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "sanctuary_2022_gold_leaf" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SanctuaryButterflyPremiumBeingHeldDouble",
        ["eating"] = "SanctuaryButterflyPremiumEat",
        ["flying"] = "SanctuaryButterflyPremiumRun",
        ["hold"] = "SanctuaryButterflyPremiumBeingHeldSingle",
        ["idle"] = "SanctuaryButterflyPremiumIdle",
        ["running"] = "SanctuaryButterflyPremiumRun",
        ["sit"] = "SanctuaryButterflyPremiumSit",
        ["sleep"] = "SanctuaryButterflyPremiumSleep"
    },
    ["tricks"] = {
        { "Sit", "SanctuaryButterflyPremiumSit" },
        { "Joyful", "SanctuaryButterflyPremiumJoyful" },
        { "Beg", "SanctuaryButterflyPremiumBeg" },
        { "Jump", "SanctuaryButterflyPremiumJump" },
        { "Trick 1", "SanctuaryButterflyPremiumTrick1" },
        { "Trick 2", "SanctuaryButterflyPremiumTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna1"] = Color3.fromRGB(109, 159, 186),
        ["LeftAntenna2"] = Color3.fromRGB(109, 159, 186),
        ["LeftAntenna3"] = Color3.fromRGB(109, 159, 186),
        ["LeftAntenna4"] = Color3.fromRGB(109, 159, 186),
        ["LeftWing"] = Color3.fromRGB(109, 159, 186),
        ["RightAntenna1"] = Color3.fromRGB(109, 159, 186),
        ["RightAntenna2"] = Color3.fromRGB(109, 159, 186),
        ["RightAntenna3"] = Color3.fromRGB(109, 159, 186),
        ["RightAntenna4"] = Color3.fromRGB(109, 159, 186),
        ["RightWing"] = Color3.fromRGB(109, 159, 186)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1
}
v2.sanctuary_2022_diamond_premium_butterfly = v3
local v4 = {
    ["name"] = "Green Butterfly",
    ["image"] = "rbxassetid://10318105392",
    ["model"] = "ButterflySanctuary2022PremiumGreen",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "sanctuary_2022_gold_leaf" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SanctuaryButterflyPremiumBeingHeldDouble",
        ["eating"] = "SanctuaryButterflyPremiumEat",
        ["flying"] = "SanctuaryButterflyPremiumRun",
        ["hold"] = "SanctuaryButterflyPremiumBeingHeldSingle",
        ["idle"] = "SanctuaryButterflyPremiumIdle",
        ["running"] = "SanctuaryButterflyPremiumRun",
        ["sit"] = "SanctuaryButterflyPremiumSit",
        ["sleep"] = "SanctuaryButterflyPremiumSleep"
    },
    ["tricks"] = {
        { "Sit", "SanctuaryButterflyPremiumSit" },
        { "Joyful", "SanctuaryButterflyPremiumJoyful" },
        { "Beg", "SanctuaryButterflyPremiumBeg" },
        { "Jump", "SanctuaryButterflyPremiumJump" },
        { "Trick 1", "SanctuaryButterflyPremiumTrick1" },
        { "Trick 2", "SanctuaryButterflyPremiumTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna1"] = Color3.fromRGB(109, 182, 108),
        ["LeftAntenna2"] = Color3.fromRGB(109, 182, 108),
        ["LeftAntenna3"] = Color3.fromRGB(109, 182, 108),
        ["LeftAntenna4"] = Color3.fromRGB(109, 182, 108),
        ["LeftWing"] = Color3.fromRGB(109, 182, 108),
        ["RightAntenna1"] = Color3.fromRGB(109, 182, 108),
        ["RightAntenna2"] = Color3.fromRGB(109, 182, 108),
        ["RightAntenna3"] = Color3.fromRGB(109, 182, 108),
        ["RightAntenna4"] = Color3.fromRGB(109, 182, 108),
        ["RightWing"] = Color3.fromRGB(109, 182, 108)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1
}
v2.sanctuary_2022_green_premium_butterfly = v4
local v5 = {
    ["name"] = "Orange Butterfly",
    ["image"] = "rbxassetid://10318105683",
    ["model"] = "ButterflySanctuary2022PremiumOrange",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "sanctuary_2022_gold_leaf" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SanctuaryButterflyPremiumBeingHeldDouble",
        ["eating"] = "SanctuaryButterflyPremiumEat",
        ["flying"] = "SanctuaryButterflyPremiumRun",
        ["hold"] = "SanctuaryButterflyPremiumBeingHeldSingle",
        ["idle"] = "SanctuaryButterflyPremiumIdle",
        ["running"] = "SanctuaryButterflyPremiumRun",
        ["sit"] = "SanctuaryButterflyPremiumSit",
        ["sleep"] = "SanctuaryButterflyPremiumSleep"
    },
    ["tricks"] = {
        { "Sit", "SanctuaryButterflyPremiumSit" },
        { "Joyful", "SanctuaryButterflyPremiumJoyful" },
        { "Beg", "SanctuaryButterflyPremiumBeg" },
        { "Jump", "SanctuaryButterflyPremiumJump" },
        { "Trick 1", "SanctuaryButterflyPremiumTrick1" },
        { "Trick 2", "SanctuaryButterflyPremiumTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna1"] = Color3.fromRGB(180, 181, 99),
        ["LeftAntenna2"] = Color3.fromRGB(180, 181, 99),
        ["LeftAntenna3"] = Color3.fromRGB(180, 181, 99),
        ["LeftAntenna4"] = Color3.fromRGB(180, 181, 99),
        ["LeftWing"] = Color3.fromRGB(180, 181, 99),
        ["RightAntenna1"] = Color3.fromRGB(180, 181, 99),
        ["RightAntenna2"] = Color3.fromRGB(180, 181, 99),
        ["RightAntenna3"] = Color3.fromRGB(180, 181, 99),
        ["RightAntenna4"] = Color3.fromRGB(180, 181, 99),
        ["RightWing"] = Color3.fromRGB(180, 181, 99)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1
}
v2.sanctuary_2022_orange_premium_butterfly = v5
local v6 = {
    ["name"] = "Purple Butterfly",
    ["image"] = "rbxassetid://10318105900",
    ["model"] = "ButterflySanctuary2022Purple",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "sanctuary_2022_leaf" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SanctuaryButterflyBucksBeingHeldDouble",
        ["eating"] = "SanctuaryButterflyBucksEat",
        ["flying"] = "SanctuaryButterflyBucksRun",
        ["hold"] = "SanctuaryButterflyBucksBeingHeldSingle",
        ["idle"] = "SanctuaryButterflyBucksIdle",
        ["running"] = "SanctuaryButterflyBucksRun",
        ["sit"] = "SanctuaryButterflyBucksSit",
        ["sleep"] = "SanctuaryButterflyBucksSleep"
    },
    ["tricks"] = {
        { "Sit", "SanctuaryButterflyBucksSit" },
        { "Joyful", "SanctuaryButterflyBucksJoyful" },
        { "Beg", "SanctuaryButterflyBucksBeg" },
        { "Jump", "SanctuaryButterflyBucksJump" },
        { "Trick 1", "SanctuaryButterflyBucksTrick1" },
        { "Trick 2", "SanctuaryButterflyBucksTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(132, 94, 188),
        ["LeftAntenna2"] = Color3.fromRGB(132, 94, 188),
        ["LeftAntenna3"] = Color3.fromRGB(132, 94, 188),
        ["LeftAntenna4"] = Color3.fromRGB(132, 94, 188),
        ["LeftWing"] = Color3.fromRGB(132, 94, 188),
        ["RightAntenna"] = Color3.fromRGB(132, 94, 188),
        ["RightAntenna2"] = Color3.fromRGB(132, 94, 188),
        ["RightAntenna3"] = Color3.fromRGB(132, 94, 188),
        ["RightAntenna4"] = Color3.fromRGB(132, 94, 188),
        ["RightWing"] = Color3.fromRGB(132, 94, 188)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1
}
v2.sanctuary_2022_purple_bucks_butterfly = v6
local v7 = {
    ["name"] = "Scarlet Butterfly",
    ["image"] = "rbxassetid://10318106124",
    ["model"] = "ButterflySanctuary2022Red",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "sanctuary_2022_leaf" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SanctuaryButterflyBucksBeingHeldDouble",
        ["eating"] = "SanctuaryButterflyBucksEat",
        ["flying"] = "SanctuaryButterflyBucksRun",
        ["hold"] = "SanctuaryButterflyBucksBeingHeldSingle",
        ["idle"] = "SanctuaryButterflyBucksIdle",
        ["running"] = "SanctuaryButterflyBucksRun",
        ["sit"] = "SanctuaryButterflyBucksSit",
        ["sleep"] = "SanctuaryButterflyBucksSleep"
    },
    ["tricks"] = {
        { "Sit", "SanctuaryButterflyBucksSit" },
        { "Joyful", "SanctuaryButterflyBucksJoyful" },
        { "Beg", "SanctuaryButterflyBucksBeg" },
        { "Jump", "SanctuaryButterflyBucksJump" },
        { "Trick 1", "SanctuaryButterflyBucksTrick1" },
        { "Trick 2", "SanctuaryButterflyBucksTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(218, 134, 122),
        ["LeftAntenna2"] = Color3.fromRGB(218, 134, 122),
        ["LeftAntenna3"] = Color3.fromRGB(218, 134, 122),
        ["LeftAntenna4"] = Color3.fromRGB(218, 134, 122),
        ["LeftWing"] = Color3.fromRGB(218, 134, 122),
        ["RightAntenna"] = Color3.fromRGB(218, 134, 122),
        ["RightAntenna2"] = Color3.fromRGB(218, 134, 122),
        ["RightAntenna3"] = Color3.fromRGB(218, 134, 122),
        ["RightAntenna4"] = Color3.fromRGB(218, 134, 122),
        ["RightWing"] = Color3.fromRGB(218, 134, 122)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1
}
v2.sanctuary_2022_red_bucks_butterfly = v7
local v8 = {
    ["name"] = "Yellow Butterfly",
    ["image"] = "rbxassetid://10318106327",
    ["model"] = "ButterflySanctuary2022Yellow",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "sanctuary_2022_leaf" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SanctuaryButterflyBucksBeingHeldDouble",
        ["eating"] = "SanctuaryButterflyBucksEat",
        ["flying"] = "SanctuaryButterflyBucksRun",
        ["hold"] = "SanctuaryButterflyBucksBeingHeldSingle",
        ["idle"] = "SanctuaryButterflyBucksIdle",
        ["running"] = "SanctuaryButterflyBucksRun",
        ["sit"] = "SanctuaryButterflyBucksSit",
        ["sleep"] = "SanctuaryButterflyBucksSleep"
    },
    ["tricks"] = {
        { "Sit", "SanctuaryButterflyBucksSit" },
        { "Joyful", "SanctuaryButterflyBucksJoyful" },
        { "Beg", "SanctuaryButterflyBucksBeg" },
        { "Jump", "SanctuaryButterflyBucksJump" },
        { "Trick 1", "SanctuaryButterflyBucksTrick1" },
        { "Trick 2", "SanctuaryButterflyBucksTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(142, 182, 123),
        ["LeftAntenna2"] = Color3.fromRGB(142, 182, 123),
        ["LeftAntenna3"] = Color3.fromRGB(142, 182, 123),
        ["LeftAntenna4"] = Color3.fromRGB(142, 182, 123),
        ["LeftWing"] = Color3.fromRGB(142, 182, 123),
        ["RightAntenna"] = Color3.fromRGB(142, 182, 123),
        ["RightAntenna2"] = Color3.fromRGB(142, 182, 123),
        ["RightAntenna3"] = Color3.fromRGB(142, 182, 123),
        ["RightAntenna4"] = Color3.fromRGB(142, 182, 123),
        ["RightWing"] = Color3.fromRGB(142, 182, 123)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1
}
v2.sanctuary_2022_yellow_bucks_butterfly = v8
return v1(v2)