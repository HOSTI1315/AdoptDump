--// ReplicatedStorage.SharedModules.ContentPacks.Valentines2025.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Cupid Dragon",
    ["image"] = "rbxassetid://89693546199400",
    ["model"] = "Valentines2025CupidDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Valentines",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["pedestal_idle"] = "Valentines2025CupidDragonSit",
        ["double_hold"] = "Valentines2025CupidDragonBeingHeldDouble",
        ["eating"] = "Valentines2025CupidDragonEat",
        ["hold"] = "Valentines2025CupidDragonBeingHeldSingle",
        ["idle"] = "Valentines2025CupidDragonIdle",
        ["running"] = "Valentines2025CupidDragonRun",
        ["sit"] = "Valentines2025CupidDragonSit",
        ["sleep"] = "Valentines2025CupidDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "Valentines2025CupidDragonSit" },
        { "Joyful", "Valentines2025CupidDragonJoyful" },
        { "Beg", "Valentines2025CupidDragonBeg" },
        { "Jump", "Valentines2025CupidDragonJump" },
        { "Trick 1", "Valentines2025CupidDragonTrick1" },
        { "Trick 2", "Valentines2025CupidDragonTrick2" }
    },
    ["neon_parts"] = {
        ["LeftHorn2"] = Color3.fromRGB(194, 119, 182),
        ["Spine"] = Color3.fromRGB(194, 119, 182),
        ["Tail2"] = Color3.fromRGB(194, 119, 182),
        ["Torso3"] = Color3.fromRGB(194, 119, 182),
        ["Bowstring"] = Color3.fromRGB(219, 105, 229),
        ["Torso2"] = Color3.fromRGB(194, 119, 182),
        ["LeftWing3"] = Color3.fromRGB(194, 119, 182),
        ["RightWing3"] = Color3.fromRGB(194, 119, 182),
        ["Heart"] = Color3.fromRGB(194, 119, 182),
        ["RightHorn2"] = Color3.fromRGB(194, 119, 182),
        ["Head3"] = Color3.fromRGB(194, 119, 182)
    },
    ["already_has_flying_wings"] = true
}
v2.valentines_2025_cupid_dragon = v3
local v4 = {
    ["name"] = "Love Bird",
    ["image"] = "rbxassetid://93800993117604",
    ["model"] = "Valentines2025LoveBird",
    ["rarity"] = "rare",
    ["cost"] = 2400,
    ["currency_id"] = "cupid_hearts_2025",
    ["origin_entry"] = {
        ["origin"] = "Valentines",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["pedestal_idle"] = "Valentines2025LoveBirdSit",
        ["double_hold"] = "Valentines2025LoveBirdBeingHeldDouble",
        ["eating"] = "Valentines2025LoveBirdEat",
        ["hold"] = "Valentines2025LoveBirdBeingHeldSingle",
        ["idle"] = "Valentines2025LoveBirdIdle",
        ["running"] = "Valentines2025LoveBirdRun",
        ["sit"] = "Valentines2025LoveBirdSit",
        ["sleep"] = "Valentines2025LoveBirdSleep"
    },
    ["tricks"] = {
        { "Sit", "Valentines2025LoveBirdSit" },
        { "Joyful", "Valentines2025LoveBirdJoyful" },
        { "Beg", "Valentines2025LoveBirdBeg" },
        { "Jump", "Valentines2025LoveBirdJump" },
        { "Trick 1", "Valentines2025LoveBirdTrick1" },
        { "Trick 2", "Valentines2025LoveBirdTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(190, 60, 65),
        ["Head"] = Color3.fromRGB(186, 92, 20),
        ["Tail"] = Color3.fromRGB(190, 60, 65),
        ["RightFoot"] = Color3.fromRGB(186, 92, 20),
        ["LeftFoot"] = Color3.fromRGB(186, 92, 20),
        ["Head3"] = Color3.fromRGB(186, 92, 20),
        ["RightWing3"] = Color3.fromRGB(65, 185, 73),
        ["RightWing"] = Color3.fromRGB(186, 92, 20),
        ["LeftWing"] = Color3.fromRGB(186, 92, 20),
        ["LeftWing3"] = Color3.fromRGB(65, 185, 73),
        ["RightWing2"] = Color3.fromRGB(186, 111, 57),
        ["LeftWing2"] = Color3.fromRGB(186, 111, 57)
    },
    ["already_has_flying_wings"] = true
}
v2.valentines_2025_love_bird = v4
local v5 = {
    ["name"] = "Sweetheart Rat",
    ["image"] = "rbxassetid://136574776317301",
    ["model"] = "Valentines2025SweetheartRat",
    ["rarity"] = "rare",
    ["cost"] = 2400,
    ["currency_id"] = "cupid_hearts_2025",
    ["origin_entry"] = {
        ["origin"] = "Valentines",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["pedestal_idle"] = "Valentines2025SweetheartRatSit",
        ["double_hold"] = "Valentines2025SweetheartRatBeingHeldDouble",
        ["eating"] = "Valentines2025SweetheartRatEat",
        ["hold"] = "Valentines2025SweetheartRatBeingHeldSingle",
        ["idle"] = "Valentines2025SweetheartRatIdle",
        ["running"] = "Valentines2025SweetheartRatRun",
        ["sit"] = "Valentines2025SweetheartRatSit",
        ["sleep"] = "Valentines2025SweetheartRatSleep"
    },
    ["tricks"] = {
        { "Sit", "Valentines2025SweetheartRatSit" },
        { "Joyful", "Valentines2025SweetheartRatJoyful" },
        { "Beg", "Valentines2025SweetheartRatBeg" },
        { "Jump", "Valentines2025SweetheartRatJump" },
        { "Trick 1", "Valentines2025SweetheartRatTrick1" },
        { "Trick 2", "Valentines2025SweetheartRatTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(190, 107, 101),
        ["Tail"] = Color3.fromRGB(190, 107, 101),
        ["Torso2"] = Color3.fromRGB(190, 107, 101),
        ["RightEar2"] = Color3.fromRGB(190, 107, 101),
        ["LeftEar"] = Color3.fromRGB(190, 107, 101)
    }
}
v2.valentines_2025_sweetheart_rat = v5
return v1(v2)