--// ReplicatedStorage.SharedModules.ContentPacks.UGCRewards2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Irish Water Spaniel",
    ["image"] = "rbxassetid://9901393350",
    ["model"] = "UGCRewards2022IrishWaterSpaniel",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "UGC Rewards",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "IrishWaterSpanielBeingHeldDouble",
        ["eating"] = "IrishWaterSpanielEat",
        ["hold"] = "IrishWaterSpanielBeingHeldSingle",
        ["idle"] = "IrishWaterSpanielIdle",
        ["running"] = "IrishWaterSpanielRun",
        ["sit"] = "IrishWaterSpanielSit",
        ["sleep"] = "IrishWaterSpanielSleep"
    },
    ["tricks"] = {
        { "Sit", "IrishWaterSpanielSit" },
        { "Joyful", "IrishWaterSpanielJoyful" },
        { "Beg", "IrishWaterSpanielBeg" },
        { "Jump", "IrishWaterSpanielJump" },
        { "Trick 1", "IrishWaterSpanielTrick1" },
        { "Trick 2", "IrishWaterSpanielTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(188, 129, 106),
        ["BackRightFoot"] = Color3.fromRGB(188, 129, 106),
        ["EarL"] = Color3.fromRGB(188, 129, 106),
        ["EarR"] = Color3.fromRGB(188, 129, 106),
        ["FrontLeftFoot"] = Color3.fromRGB(188, 129, 106),
        ["FrontRightFoot"] = Color3.fromRGB(188, 129, 106),
        ["Head2"] = Color3.fromRGB(188, 129, 106),
        ["Tail"] = Color3.fromRGB(188, 129, 106)
    },
    ["eyes"] = { "Eyes" }
}
v2.ugc_rewards_2022_irish_water_spaniel = v3
return v1(v2)