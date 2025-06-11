--// ReplicatedStorage.SharedModules.ContentPacks.Kiwi2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Kiwi",
    ["image"] = "rbxassetid://13981141292",
    ["model"] = "Kiwi2023Kiwi",
    ["rarity"] = "rare",
    ["cost"] = 1200,
    ["origin_entry"] = {
        ["origin"] = "Kiwi",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Kiwi2023KiwiBeingHeldDouble",
        ["eating"] = "Kiwi2023KiwiEat",
        ["flying"] = "Kiwi2023KiwiRun",
        ["hold"] = "Kiwi2023KiwiBeingHeldSingle",
        ["idle"] = "Kiwi2023KiwiIdle",
        ["running"] = "Kiwi2023KiwiRun",
        ["sit"] = "Kiwi2023KiwiSit",
        ["sleep"] = "Kiwi2023KiwiSleep"
    },
    ["tricks"] = {
        { "Sit", "Kiwi2023KiwiSit" },
        { "Joyful", "Kiwi2023KiwiJoyful" },
        { "Beg", "Kiwi2023KiwiBeg" },
        { "Jump", "Kiwi2023KiwiJump" },
        { "Trick 1", "Kiwi2023KiwiTrick1" },
        { "Trick 2", "Kiwi2023KiwiTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(189, 81, 38),
        ["Beak3"] = Color3.fromRGB(189, 81, 38),
        ["Hair"] = Color3.fromRGB(189, 81, 38),
        ["LeftFoot"] = Color3.fromRGB(189, 81, 38),
        ["RightFoot"] = Color3.fromRGB(189, 81, 38),
        ["Torso2"] = Color3.fromRGB(189, 81, 38),
        ["Torso3"] = Color3.fromRGB(189, 81, 38)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.25
}
v2.kiwi_2023_kiwi = v3
return v1(v2)