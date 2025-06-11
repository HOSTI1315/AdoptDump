--// ReplicatedStorage.SharedModules.ContentPacks.RoyalPalace2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Royal Corgi",
    ["image"] = "rbxassetid://10274421272",
    ["model"] = "RoyalPalace2022Corgi",
    ["rarity"] = "ultra_rare",
    ["cost"] = 4000,
    ["origin_entry"] = {
        ["display_name"] = "Royal Corgi",
        ["origin"] = "Royal Tea Party",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "BlackCorgiBeingHeldDouble",
        ["eating"] = "BlackCorgiEat",
        ["flying"] = "BlackCorgiRun",
        ["hold"] = "BlackCorgiBeingHeldSingle",
        ["idle"] = "BlackCorgiIdle",
        ["running"] = "BlackCorgiRun",
        ["sit"] = "BlackCorgiSit",
        ["sleep"] = "BlackCorgiSleep"
    },
    ["tricks"] = {
        { "Sit", "BlackCorgiSit" },
        { "Joyful", "BlackCorgiJoyful" },
        { "Beg", "BlackCorgiBeg" },
        { "Jump", "BlackCorgiJump" },
        { "Trick 1", "BlackCorgiTrick1" },
        { "Trick 2", "BlackCorgiTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(186, 151, 115),
        ["BackRightFoot"] = Color3.fromRGB(186, 151, 115),
        ["FrontLeftFoot"] = Color3.fromRGB(186, 151, 115),
        ["FrontRightFoot"] = Color3.fromRGB(186, 151, 115),
        ["Head2"] = Color3.fromRGB(186, 151, 115),
        ["InnerEarL"] = Color3.fromRGB(186, 151, 115),
        ["InnerEarR"] = Color3.fromRGB(186, 151, 115),
        ["Tail2"] = Color3.fromRGB(186, 151, 115),
        ["Torso2"] = Color3.fromRGB(186, 151, 115)
    },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.royal_palace_2022_corgi = v3
local v4 = {
    ["name"] = "Royal Palace Spaniel",
    ["image"] = "rbxassetid://9994480266",
    ["model"] = "RoyalPalace2022Spaniel",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["display_name"] = "Royal Palace Spaniel",
        ["origin"] = "Royal Tea Party",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "CockerSpanielBeingHeldDouble",
        ["eating"] = "CockerSpanielEat",
        ["flying"] = "CockerSpanielRun",
        ["hold"] = "CockerSpanielBeingHeldSingle",
        ["idle"] = "CockerSpanielIdle",
        ["running"] = "CockerSpanielRun",
        ["sit"] = "CockerSpanielSit",
        ["sleep"] = "CockerSpanielSleep"
    },
    ["tricks"] = {
        { "Sit", "CockerSpanielSit" },
        { "Joyful", "CockerSpanielJoyful" },
        { "Beg", "CockerSpanielBeg" },
        { "Jump", "CockerSpanielJump" },
        { "Trick 1", "CockerSpanielTrick1" },
        { "Trick 2", "CockerSpanielTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(188, 113, 168),
        ["BackRightFoot"] = Color3.fromRGB(188, 113, 168),
        ["FrontLeftFoot"] = Color3.fromRGB(188, 113, 168),
        ["FrontRightFoot"] = Color3.fromRGB(188, 113, 168),
        ["LeftEar"] = Color3.fromRGB(188, 113, 168),
        ["RightEar"] = Color3.fromRGB(188, 113, 168),
        ["Tail"] = Color3.fromRGB(188, 113, 168),
        ["Torso2"] = Color3.fromRGB(188, 113, 168),
        ["Torso3"] = Color3.fromRGB(188, 113, 168)
    },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.royal_palace_2022_spaniel = v4
return v1(v2)