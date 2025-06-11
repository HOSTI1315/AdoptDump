--// ReplicatedStorage.SharedModules.ContentPacks.GOSH2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Therapy Dog",
    ["image"] = "rbxassetid://11245006051",
    ["model"] = "GOSH2022TherapyDog",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "GOSH",
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "TherapyDogBeingHeldDouble",
        ["eating"] = "TherapyDogEat",
        ["hold"] = "TherapyDogBeingHeldSingle",
        ["idle"] = "TherapyDogIdle",
        ["running"] = "TherapyDogRun",
        ["sit"] = "TherapyDogSit",
        ["sleep"] = "TherapyDogSleep"
    },
    ["tricks"] = {
        { "Sit", "TherapyDogSit" },
        { "Joyful", "TherapyDogJoyful" },
        { "Beg", "TherapyDogBeg" },
        { "Jump", "TherapyDogJump" },
        { "Trick 1", "TherapyDogTrick1" },
        { "Trick 2", "TherapyDogTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(190, 163, 94),
        ["BackRightFoot"] = Color3.fromRGB(190, 163, 94),
        ["CollarChain"] = Color3.fromRGB(190, 163, 94),
        ["FrontLeftFoot"] = Color3.fromRGB(190, 163, 94),
        ["FrontMane"] = Color3.fromRGB(190, 163, 94),
        ["FrontMane2"] = Color3.fromRGB(190, 163, 94),
        ["FrontMane4"] = Color3.fromRGB(190, 163, 94),
        ["FrontMane5"] = Color3.fromRGB(190, 163, 94),
        ["FrontMane7"] = Color3.fromRGB(190, 163, 94),
        ["FrontMane8"] = Color3.fromRGB(190, 163, 94),
        ["FrontRightFoot"] = Color3.fromRGB(190, 163, 94),
        ["Jacket2"] = Color3.fromRGB(190, 163, 94),
        ["LeftEar"] = Color3.fromRGB(190, 163, 94),
        ["LeftEar2"] = Color3.fromRGB(190, 163, 94),
        ["LeftEar3"] = Color3.fromRGB(190, 163, 94),
        ["RightEar"] = Color3.fromRGB(190, 163, 94),
        ["RightEar2"] = Color3.fromRGB(190, 163, 94),
        ["RightEar3"] = Color3.fromRGB(190, 163, 94),
        ["Tail"] = Color3.fromRGB(190, 163, 94)
    },
    ["eyes"] = { "Eyes" }
}
v2.gosh_2022_therapy_dog = v3
return v1(v2)