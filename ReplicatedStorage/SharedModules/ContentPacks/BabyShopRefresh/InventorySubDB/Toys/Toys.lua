--// ReplicatedStorage.SharedModules.ContentPacks.BabyShopRefresh.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Banana Rattle",
    ["image"] = "rbxassetid://6936625094",
    ["rarity"] = "common",
    ["cost"] = 100,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "BananaRattle",
    ["tool"] = "GenericTool"
}
v2.banana_rattle = v3
local v4 = {
    ["name"] = "Clouds & Rainbow Rattle",
    ["image"] = "rbxassetid://6936626354",
    ["rarity"] = "rare",
    ["cost"] = 400,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "CloudsRainbowRattle",
    ["tool"] = "GenericTool"
}
v2.clouds_rainbow_rattle = v4
local v5 = {
    ["name"] = "Golden Maned Unicorn Rattle",
    ["image"] = "rbxassetid://6936627177",
    ["rarity"] = "ultra_rare",
    ["cost"] = 615,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "GoldenManedUnicornRattle",
    ["tool"] = "GenericTool"
}
v2.golden_maned_unicorn_rattle = v5
local v6 = {
    ["name"] = "Llama Rattle",
    ["image"] = "rbxassetid://6936623901",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "LlamaRattle",
    ["tool"] = "GenericTool"
}
v2.llama_rattle = v6
return v1(v2)