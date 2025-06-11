--// ReplicatedStorage.SharedModules.ContentPacks.Easter2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Black Springer Spaniel",
    ["image"] = "rbxassetid://9287841987",
    ["model"] = "Easter2022SpringerSpanielBlack",
    ["rarity"] = "ultra_rare",
    ["cost"] = 3000,
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SpringerSpanielBeingHeldDouble",
        ["eating"] = "SpringerSpanielEat",
        ["hold"] = "SpringerSpanielBeingHeldSingle",
        ["idle"] = "SpringerSpanielIdle",
        ["running"] = "SpringerSpanielRun",
        ["sit"] = "SpringerSpanielSit",
        ["sleep"] = "SpringerSpanielSleep"
    },
    ["tricks"] = {
        { "Sit", "SpringerSpanielSit" },
        { "Joyful", "SpringerSpanielJoyful" },
        { "Beg", "SpringerSpanielBeg" },
        { "Jump", "SpringerSpanielJump" },
        { "Trick 1", "SpringerSpanielTrick1" },
        { "Trick 2", "SpringerSpanielTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(191, 136, 105),
        ["BackRightFoot"] = Color3.fromRGB(191, 136, 105),
        ["FrontLeftFoot"] = Color3.fromRGB(191, 136, 105),
        ["FrontRightFoot"] = Color3.fromRGB(191, 136, 105),
        ["Head"] = Color3.fromRGB(191, 136, 105),
        ["Torso"] = Color3.fromRGB(191, 136, 105)
    }
}
v2.easter_2022_springer_spaniel_black = v3
local v4 = {
    ["name"] = "Brown Springer Spaniel",
    ["image"] = "rbxassetid://9287842106",
    ["model"] = "Easter2022SpringerSpanielBrown",
    ["rarity"] = "ultra_rare",
    ["cost"] = 3000,
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SpringerSpanielBeingHeldDouble",
        ["eating"] = "SpringerSpanielEat",
        ["hold"] = "SpringerSpanielBeingHeldSingle",
        ["idle"] = "SpringerSpanielIdle",
        ["running"] = "SpringerSpanielRun",
        ["sit"] = "SpringerSpanielSit",
        ["sleep"] = "SpringerSpanielSleep"
    },
    ["tricks"] = {
        { "Sit", "SpringerSpanielSit" },
        { "Joyful", "SpringerSpanielJoyful" },
        { "Beg", "SpringerSpanielBeg" },
        { "Jump", "SpringerSpanielJump" },
        { "Trick 1", "SpringerSpanielTrick1" },
        { "Trick 2", "SpringerSpanielTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(191, 136, 105),
        ["BackRightFoot"] = Color3.fromRGB(191, 136, 105),
        ["FrontLeftFoot"] = Color3.fromRGB(191, 136, 105),
        ["FrontRightFoot"] = Color3.fromRGB(191, 136, 105),
        ["Head"] = Color3.fromRGB(191, 136, 105),
        ["Torso"] = Color3.fromRGB(191, 136, 105)
    }
}
v2.easter_2022_springer_spaniel_brown = v4
local v5 = {
    ["name"] = "Sugar Glider",
    ["image"] = "rbxassetid://9281950769",
    ["model"] = "Easter2022SugarGlider",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SugarGliderBeingHeldDouble",
        ["eating"] = "SugarGliderEat",
        ["hold"] = "SugarGliderBeingHeldSingle",
        ["idle"] = "SugarGliderIdle",
        ["running"] = "SugarGliderRun",
        ["sit"] = "SugarGliderSit",
        ["sleep"] = "SugarGliderSleep"
    },
    ["tricks"] = {
        { "Sit", "SugarGliderSit" },
        { "Joyful", "SugarGliderJoyful" },
        { "Beg", "SugarGliderBeg" },
        { "Jump", "SugarGliderJump" },
        { "Trick 1", "SugarGliderTrick1" },
        { "Trick 2", "SugarGliderTrick2" }
    },
    ["neon_parts"] = {
        ["Body2"] = Color3.fromRGB(197, 117, 171),
        ["Head2"] = Color3.fromRGB(197, 117, 171),
        ["Tail2"] = Color3.fromRGB(197, 117, 171)
    }
}
v2.easter_2022_sugar_glider = v5
return v1(v2)