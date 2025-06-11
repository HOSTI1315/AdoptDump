--// ReplicatedStorage.SharedModules.ContentPacks.Desert2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Abyssinian Cat",
    ["image"] = "rbxassetid://8705079225",
    ["model"] = "Desert2022AbyssinianCat",
    ["rarity"] = "rare",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Desert Update",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "AbyssinianCatHeldDouble",
        ["eating"] = "MummyCatEat",
        ["hold"] = "MummyCatBeingHeldSingle",
        ["idle"] = "MummyCatIdle",
        ["running"] = "MummyCatRun",
        ["sit"] = "MummyCatSit",
        ["sleep"] = "MummyCatSleep"
    },
    ["tricks"] = {
        { "Sit", "MummyCatSit" },
        { "Joyful", "MummyCatJoyful" },
        { "Beg", "MummyCatBeg" },
        { "Jump", "MummyCatJump" },
        { "Trick 1", "MummyCatTrick1" },
        { "Trick 2", "MummyCatTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot_Geo"] = Color3.fromRGB(220, 102, 5),
        ["BackRightFoot_Geo"] = Color3.fromRGB(220, 102, 5),
        ["RightEar_Geo"] = Color3.fromRGB(220, 102, 5),
        ["LeftEar_Geo"] = Color3.fromRGB(220, 102, 5),
        ["FrontLeftFoot_Geo"] = Color3.fromRGB(220, 102, 5),
        ["FrontRightFoot_Geo"] = Color3.fromRGB(220, 102, 5),
        ["Head2_Geo"] = Color3.fromRGB(220, 102, 5)
    },
    ["liveops_map_type_required_for_purchase"] = "Desert"
}
v2.desert_2022_abyssinian_cat = v3
local v4 = {
    ["name"] = "Giant Black Scarab",
    ["image"] = "rbxassetid://8566684181",
    ["model"] = "Desert2022BlackScarab",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Desert Update",
        ["origin_items"] = { "desert_2022_mud_ball" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ScarabBeingHeldDouble",
        ["eating"] = "ScarabEat",
        ["hold"] = "ScarabBeingHeldSingle",
        ["idle"] = "ScarabIdle",
        ["running"] = "ScarabRun",
        ["sit"] = "ScarabSit",
        ["sleep"] = "ScarabSleep"
    },
    ["tricks"] = {
        { "Sit", "ScarabSit" },
        { "Joyful", "ScarabJoyful" },
        { "Beg", "ScarabBeg" },
        { "Jump", "ScarabJump" },
        { "Trick 1", "ScarabTrick1" },
        { "Trick 2", "ScarabTrick2" }
    },
    ["neon_parts"] = {
        ["AntennaL_02"] = Color3.fromRGB(194, 194, 194),
        ["AntennaR_02"] = Color3.fromRGB(194, 194, 194),
        ["Body_01"] = Color3.fromRGB(68, 70, 77),
        ["Body_02"] = Color3.fromRGB(68, 70, 77),
        ["Face_01"] = Color3.fromRGB(68, 70, 77),
        ["Face_02"] = Color3.fromRGB(194, 194, 194),
        ["Head_02"] = Color3.fromRGB(68, 70, 77),
        ["Head_03"] = Color3.fromRGB(68, 70, 77),
        ["LeftShell_01"] = Color3.fromRGB(68, 70, 77),
        ["LeftShell_02"] = Color3.fromRGB(194, 194, 194),
        ["RightShell_01"] = Color3.fromRGB(68, 70, 77),
        ["RightShell_02"] = Color3.fromRGB(194, 194, 194)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(68, 70, 77),
        Color3.fromRGB(194, 194, 194),
        Color3.fromRGB(0, 0, 0),
        Color3.fromRGB(255, 255, 255)
    },
    ["eyes"] = { "Eye_L", "Eye_R" }
}
v2.desert_2022_black_scarab = v4
local v5 = {
    ["name"] = "Giant Blue Scarab",
    ["image"] = "rbxassetid://8566683782",
    ["model"] = "Desert2022BlueScarab",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Desert Update",
        ["origin_items"] = { "desert_2022_mud_ball" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ScarabBeingHeldDouble",
        ["eating"] = "ScarabEat",
        ["hold"] = "ScarabBeingHeldSingle",
        ["idle"] = "ScarabIdle",
        ["running"] = "ScarabRun",
        ["sit"] = "ScarabSit",
        ["sleep"] = "ScarabSleep"
    },
    ["tricks"] = {
        { "Sit", "ScarabSit" },
        { "Joyful", "ScarabJoyful" },
        { "Beg", "ScarabBeg" },
        { "Jump", "ScarabJump" },
        { "Trick 1", "ScarabTrick1" },
        { "Trick 2", "ScarabTrick2" }
    },
    ["neon_parts"] = {
        ["AntennaL_02"] = Color3.fromRGB(255, 176, 0),
        ["AntennaR_02"] = Color3.fromRGB(255, 176, 0),
        ["Body_01"] = Color3.fromRGB(0, 81, 204),
        ["Body_02"] = Color3.fromRGB(0, 81, 204),
        ["Face_01"] = Color3.fromRGB(0, 81, 204),
        ["Face_02"] = Color3.fromRGB(255, 176, 0),
        ["Head_02"] = Color3.fromRGB(0, 81, 204),
        ["Head_03"] = Color3.fromRGB(0, 81, 204),
        ["LeftShell_01"] = Color3.fromRGB(0, 81, 204),
        ["LeftShell_02"] = Color3.fromRGB(255, 176, 0),
        ["RightShell_01"] = Color3.fromRGB(0, 81, 204),
        ["RightShell_02"] = Color3.fromRGB(255, 176, 0)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(0, 81, 204),
        Color3.fromRGB(0, 102, 255),
        Color3.fromRGB(77, 1, 80),
        Color3.fromRGB(195, 0, 255)
    },
    ["eyes"] = { "Eye_L", "Eye_R" }
}
v2.desert_2022_blue_scarab = v5
local v6 = {
    ["name"] = "Giant Gold Scarab",
    ["image"] = "rbxassetid://8566683457",
    ["model"] = "Desert2022GoldScarab",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Desert Update",
        ["origin_items"] = { "desert_2022_mud_ball" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ScarabBeingHeldDouble",
        ["eating"] = "ScarabEat",
        ["hold"] = "ScarabBeingHeldSingle",
        ["idle"] = "ScarabIdle",
        ["running"] = "ScarabRun",
        ["sit"] = "ScarabSit",
        ["sleep"] = "ScarabSleep"
    },
    ["tricks"] = {
        { "Sit", "ScarabSit" },
        { "Joyful", "ScarabJoyful" },
        { "Beg", "ScarabBeg" },
        { "Jump", "ScarabJump" },
        { "Trick 1", "ScarabTrick1" },
        { "Trick 2", "ScarabTrick2" }
    },
    ["neon_parts"] = {
        ["AntennaL_02"] = Color3.fromRGB(255, 86, 1),
        ["AntennaR_02"] = Color3.fromRGB(255, 86, 1),
        ["Body_01"] = Color3.fromRGB(162, 133, 17),
        ["Body_02"] = Color3.fromRGB(162, 133, 17),
        ["Face_01"] = Color3.fromRGB(162, 133, 17),
        ["Face_02"] = Color3.fromRGB(255, 86, 1),
        ["Head_02"] = Color3.fromRGB(162, 133, 17),
        ["Head_03"] = Color3.fromRGB(162, 133, 17),
        ["LeftShell_01"] = Color3.fromRGB(162, 133, 17),
        ["LeftShell_02"] = Color3.fromRGB(255, 86, 1),
        ["RightShell_01"] = Color3.fromRGB(162, 133, 17),
        ["RightShell_02"] = Color3.fromRGB(255, 86, 1)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(162, 133, 17),
        Color3.fromRGB(255, 86, 1),
        Color3.fromRGB(247, 207, 48),
        Color3.fromRGB(162, 17, 17)
    },
    ["eyes"] = { "Eye_L", "Eye_R" }
}
v2.desert_2022_gold_scarab = v6
return v1(v2)