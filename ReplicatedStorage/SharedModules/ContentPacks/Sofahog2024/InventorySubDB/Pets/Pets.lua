--// ReplicatedStorage.SharedModules.ContentPacks.Sofahog2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Groundhog",
    ["image"] = "rbxassetid://16000498338",
    ["model"] = "Sofahog2024Groundhog",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Groundhog Day",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Sofahog2024GroundhogBeingHeldDouble",
        ["eating"] = "Sofahog2024GroundhogEat",
        ["flying"] = "Sofahog2024GroundhogRun",
        ["hold"] = "Sofahog2024GroundhogBeingHeldSingle",
        ["idle"] = "Sofahog2024GroundhogIdle",
        ["running"] = "Sofahog2024GroundhogRun",
        ["sit"] = "Sofahog2024GroundhogSit",
        ["sleep"] = "Sofahog2024GroundhogSleep"
    },
    ["tricks"] = {
        { "Sit", "Sofahog2024GroundhogSit" },
        { "Joyful", "Sofahog2024GroundhogJoyful" },
        { "Beg", "Sofahog2024GroundhogBeg" },
        { "Jump", "Sofahog2024GroundhogJump" },
        { "Trick 1", "Sofahog2024GroundhogTrick1" },
        { "Trick 2", "Sofahog2024GroundhogTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(169, 172, 188),
        ["LeftEar3"] = Color3.fromRGB(169, 172, 188),
        ["RightEar3"] = Color3.fromRGB(169, 172, 188),
        ["Tail"] = Color3.fromRGB(169, 172, 188)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.sofahog_2024_groundhog = v3
return v1(v2)