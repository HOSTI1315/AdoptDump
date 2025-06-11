--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Bat Box",
    ["image"] = "rbxassetid://5888839551",
    ["rarity"] = "rare",
    ["cost"] = 1000,
    ["currency_id"] = "candy_2020",
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "BatBox",
    ["tool"] = "BatBoxTool"
}
v2.bat_box = v3
local v4 = {
    ["name"] = "Big Gift",
    ["image"] = "rbxassetid://3012204286",
    ["rarity"] = "rare",
    ["cost"] = 199,
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["use"] = "PumpkinUse"
    },
    ["model_handle"] = "BigGift",
    ["tool"] = "GiftTool",
    ["uses"] = 1
}
v2.biggift = v4
local v5 = {
    ["name"] = "Christmas Gift",
    ["image"] = "rbxassetid://4510475651",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["use"] = "PumpkinUse"
    },
    ["model_handle"] = "ChristmasGift",
    ["tool"] = "GiftTool",
    ["uses"] = 1
}
v2.christmas_gift = v5
local v6 = {
    ["name"] = "Golden Gift",
    ["image"] = "rbxassetid://4510471983",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["use"] = "PumpkinUse"
    },
    ["model_handle"] = "GoldenGift",
    ["tool"] = "GiftTool",
    ["uses"] = 1
}
v2.golden_gift = v6
local v7 = {
    ["name"] = "Massive Gift",
    ["image"] = "rbxassetid://3012204333",
    ["rarity"] = "legendary",
    ["cost"] = 499,
    ["anims"] = {
        ["hold"] = "MassiveGiftHold",
        ["use"] = "MassiveGiftOpen"
    },
    ["model_handle"] = "MassiveGift",
    ["tool"] = "GiftTool",
    ["uses"] = 1
}
v2.massivegift = v7
local v8 = {
    ["name"] = "Monkey Box",
    ["image"] = "rbxassetid://5057100696",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["open"] = "MonkeyBoxOpen",
        ["use"] = "PumpkinUse"
    },
    ["model_handle"] = "MonkeyBox",
    ["tool"] = "MonkeyBoxTool"
}
v2.monkey_box = v8
local v9 = {
    ["name"] = "Ox Box",
    ["image"] = "rbxassetid://6240246974",
    ["rarity"] = "ultra_rare",
    ["cost"] = 350,
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "OxBox",
    ["tool"] = "OxBoxTool"
}
v2.ox_box = v9
local v10 = {
    ["name"] = "Premium Monkey Box",
    ["image"] = "rbxassetid://5067925110",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["open"] = "MonkeyBoxOpenEpic",
        ["use"] = "PumpkinUse"
    },
    ["model_handle"] = "RareMonkeyBox",
    ["tool"] = "MonkeyBoxTool"
}
v2.premium_monkey_box = v10
local v11 = {
    ["name"] = "Rat Box",
    ["image"] = "rbxassetid://4621220017",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["use"] = "PumpkinUse"
    },
    ["model_handle"] = "RatBox",
    ["tool"] = "RatBoxTool"
}
v2.rat_box = v11
local v12 = {
    ["name"] = "Small Gift",
    ["image"] = "rbxassetid://3012204373",
    ["rarity"] = "common",
    ["cost"] = 70,
    ["anims"] = {
        ["hold"] = "PumpkinHold",
        ["use"] = "PumpkinUse"
    },
    ["model_handle"] = "SmallGift",
    ["tool"] = "GiftTool",
    ["uses"] = 1
}
v2.smallgift = v12
return v1(v2)