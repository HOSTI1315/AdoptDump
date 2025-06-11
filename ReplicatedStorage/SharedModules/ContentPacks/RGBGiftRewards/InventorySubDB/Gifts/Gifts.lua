--// ReplicatedStorage.SharedModules.ContentPacks.RGBGiftRewards.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "RGB Reward Box",
    ["image"] = "rbxassetid://8604215904",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["use"] = "PumpkinUse"
    },
    ["custom_tooltip_description"] = "44% Common\n30% Uncommon\n14.5% Rare\n7% Ultra-Rare\n4.5% Legendary",
    ["model_handle"] = "RGBRewardBox",
    ["tool"] = "RGBRewardBoxTool"
}
v2.rgb_reward_box = v3
return v1(v2)