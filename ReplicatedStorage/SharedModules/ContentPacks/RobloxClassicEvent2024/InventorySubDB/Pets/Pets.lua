--// ReplicatedStorage.SharedModules.ContentPacks.RobloxClassicEvent2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Classic Teapot",
    ["image"] = "rbxassetid://17482380743",
    ["model"] = "RobloxClassic2024Teapot",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Roblox Classic Event",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "RobloxClassic2024TeapotTeapotBeingHeldDouble",
        ["eating"] = "RobloxClassic2024TeapotTeapotEat",
        ["flying"] = "RobloxClassic2024TeapotTeapotRun",
        ["hold"] = "RobloxClassic2024TeapotTeapotBeingHeldSingle",
        ["idle"] = "RobloxClassic2024TeapotTeapotIdle",
        ["running"] = "RobloxClassic2024TeapotTeapotRun",
        ["sit"] = "RobloxClassic2024TeapotTeapotSit",
        ["sleep"] = "RobloxClassic2024TeapotTeapotSleep"
    },
    ["tricks"] = {
        { "Sit", "RobloxClassic2024TeapotTeapotSit" },
        { "Joyful", "RobloxClassic2024TeapotTeapotJoyful" },
        { "Beg", "RobloxClassic2024TeapotTeapotBeg" },
        { "Jump", "RobloxClassic2024TeapotTeapotJump" },
        { "Trick 1", "RobloxClassic2024TeapotTeapotTrick1" },
        { "Trick 2", "RobloxClassic2024TeapotTeapotTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(121, 96, 195),
        ["HeadVoid"] = Color3.fromRGB(17, 17, 17),
        ["TorsoVoid"] = Color3.fromRGB(17, 17, 17)
    }
}
v2.roblox_classic_2024_teapot = v3
return v1(v2)