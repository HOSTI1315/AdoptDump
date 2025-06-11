--// ReplicatedStorage.SharedModules.ContentPacks.Birthday2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Birthday Butterfly 2024",
    ["image"] = "rbxassetid://18223359092",
    ["model"] = "Birthday2024Butterfly",
    ["rarity"] = "uncommon",
    ["cost"] = 1500,
    ["origin_entry"] = {
        ["origin"] = "Birthday",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Birthday2024ButterflyBeingHeldDouble",
        ["eating"] = "Birthday2024ButterflyEat",
        ["flying"] = "Birthday2024ButterflyIdle",
        ["hold"] = "Birthday2024ButterflyBeingHeldSingle",
        ["idle"] = "Birthday2024ButterflyIdle",
        ["running"] = "Birthday2024ButterflyRun",
        ["sit"] = "Birthday2024ButterflySit",
        ["sleep"] = "Birthday2024ButterflySleep"
    },
    ["tricks"] = {
        { "Sit", "Birthday2024ButterflySit" },
        { "Joyful", "Birthday2024ButterflyJoyful" },
        { "Beg", "Birthday2024ButterflyBeg" },
        { "Jump", "Birthday2024ButterflyJump" },
        { "Trick 1", "Birthday2024ButterflyTrick1" },
        { "Trick 2", "Birthday2024ButterflyTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(94, 142, 188),
        ["LeftAntenna"] = Color3.fromRGB(102, 143, 175),
        ["LeftWing"] = Color3.fromRGB(94, 142, 188),
        ["RightAntenna"] = Color3.fromRGB(102, 143, 175),
        ["RightWing"] = Color3.fromRGB(94, 142, 188),
        ["Torso2"] = Color3.fromRGB(94, 142, 188)
    },
    ["already_has_flying_wings"] = true
}
v2.birthday_2024_butterfly = v3
return v1(v2)