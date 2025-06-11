--// ReplicatedStorage.SharedModules.ContentPacks.Pride2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Goat",
    ["image"] = "rbxassetid://9800792849",
    ["model"] = "Pride2022Goat",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Pride Update",
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "GoatBeingHeldDouble",
        ["eating"] = "GoatEat",
        ["hold"] = "GoatBeingHeldSingle",
        ["idle"] = "GoatIdle",
        ["running"] = "GoatRun",
        ["sit"] = "GoatSit",
        ["sleep"] = "GoatSleep"
    },
    ["tricks"] = {
        { "Sit", "GoatSit" },
        { "Joyful", "GoatJoyful" },
        { "Beg", "GoatBeg" },
        { "Jump", "GoatJump" },
        { "Trick 1", "GoatTrick1" },
        { "Trick 2", "GoatTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(155, 101, 216),
        ["BackRightFoot"] = Color3.fromRGB(155, 101, 216),
        ["FrontLeftFoot"] = Color3.fromRGB(155, 101, 216),
        ["FrontRightFoot"] = Color3.fromRGB(155, 101, 216),
        ["Head2"] = Color3.fromRGB(155, 101, 216),
        ["Head3"] = Color3.fromRGB(155, 101, 216),
        ["LeftEar2"] = Color3.fromRGB(155, 101, 216),
        ["RightEar2"] = Color3.fromRGB(155, 101, 216),
        ["Tail"] = Color3.fromRGB(155, 101, 216)
    },
    ["eyes"] = { "Eyes" }
}
v2.pride_2022_goat = v3
return v1(v2)