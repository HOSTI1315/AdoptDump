--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v2 = {}
local v3 = {
    ["name"] = "Starter Egg",
    ["image"] = "rbxassetid://3215315313",
    ["model"] = "TutorialEgg",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["origin_entry"] = {
        ["origin"] = "Sir Woofington",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 3
}
v2.tutorial_2025_egg = v3
return v1.pets(v2)