--// ReplicatedStorage.SharedModules.ContentPacks.RGBGiftRewards.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "RGB Friend",
    ["image"] = "rbxassetid://8511304223",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PuppyPlushHold",
        ["use"] = "TeddyHug"
    },
    ["model_handle"] = "RGBFriend",
    ["tool"] = "GenericTool"
}
v2.rgb_friend = v3
local v4 = {
    ["name"] = "RGB Leash",
    ["image"] = "rbxassetid://8511304366",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "Leash",
    ["model_handle"] = "RGBLeash",
    ["tool"] = "PetLeash"
}
v2.rgb_leash = v4
local v5 = {
    ["name"] = "RGB Phone Throw Toy",
    ["image"] = "rbxassetid://8511304262",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "RGBPhoneThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.rgb_phone_throw_toy = v5
local v6 = {
    ["name"] = "RGB Propeller",
    ["image"] = "rbxassetid://8511304150",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "RGBPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "DandelionSpin",
    ["tool"] = "PropellerTool"
}
v2.rgb_propeller = v6
local v7 = {
    ["name"] = "RGB Sword Rattle",
    ["image"] = "rbxassetid://8511304326",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "RGBSwordRattle",
    ["tool"] = "GenericTool"
}
v2.rgb_sword_rattle = v7
return v1(v2)