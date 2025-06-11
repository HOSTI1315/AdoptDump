--// ReplicatedStorage.SharedModules.ContentPacks.PiB2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Persian Cat",
    ["image"] = "rbxassetid://11189235896",
    ["model"] = "PiB2022PersianCat",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Puss in Boots",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "PersianCatBeingHeldDouble",
        ["eating"] = "PersianCatEat",
        ["flying"] = "PersianCatRun",
        ["hold"] = "PersianCatBeingHeldSingle",
        ["idle"] = "PersianCatIdle",
        ["running"] = "PersianCatRun",
        ["sit"] = "PersianCatSit",
        ["sleep"] = "PersianCatSleep"
    },
    ["tricks"] = {
        { "Sit", "PersianCatSit" },
        { "Joyful", "PersianCatJoyful" },
        { "Beg", "PersianCatBeg" },
        { "Jump", "PersianCatJump" },
        { "Trick 1", "PersianCatTrick1" },
        { "Trick 2", "PersianCatTrick2" }
    },
    ["neon_parts"] = {
        ["ChestFluff"] = Color3.fromRGB(91, 173, 185),
        ["Head2"] = Color3.fromRGB(91, 173, 185),
        ["Head3"] = Color3.fromRGB(91, 173, 185),
        ["LeftEar2"] = Color3.fromRGB(91, 173, 185),
        ["RightEar2"] = Color3.fromRGB(91, 173, 185),
        ["Tail2"] = Color3.fromRGB(91, 173, 185),
        ["Torso2"] = Color3.fromRGB(91, 173, 185)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.5
}
v2.pib_2022_persian_cat = v3
return v1(v2)