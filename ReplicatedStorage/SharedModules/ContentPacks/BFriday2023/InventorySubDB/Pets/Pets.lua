--// ReplicatedStorage.SharedModules.ContentPacks.BFriday2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Mecha Meow",
    ["image"] = "rbxassetid://15292843858",
    ["model"] = "BFriday2023MechaMeow",
    ["rarity"] = "legendary",
    ["cost"] = 7500,
    ["origin_entry"] = {
        ["origin"] = "Black Friday",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "BFriday2023MechaMeowBeingHeldDouble",
        ["eating"] = "BFriday2023MechaMeowEat",
        ["hold"] = "BFriday2023MechaMeowBeingHeldSingle",
        ["idle"] = "BFriday2023MechaMeowIdle",
        ["running"] = "BFriday2023MechaMeowRun",
        ["sit"] = "BFriday2023MechaMeowSit",
        ["sleep"] = "BFriday2023MechaMeowSleep"
    },
    ["tricks"] = {
        { "Sit", "BFriday2023MechaMeowSit" },
        { "Joyful", "BFriday2023MechaMeowJoyful" },
        { "Beg", "BFriday2023MechaMeowBeg" },
        { "Jump", "BFriday2023MechaMeowJump" },
        { "Trick 1", "BFriday2023MechaMeowTrick1" },
        { "Trick 2", "BFriday2023MechaMeowTrick2" }
    },
    ["neon_parts"] = {
        ["LeftArm4"] = Color3.fromRGB(186, 92, 120),
        ["LeftPalm"] = Color3.fromRGB(186, 92, 120),
        ["RightArm4"] = Color3.fromRGB(186, 92, 120),
        ["RightPalm"] = Color3.fromRGB(186, 92, 120),
        ["Torso3"] = Color3.fromRGB(186, 92, 120)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.bfriday_2023_mecha_meow = v3
return v1(v2)