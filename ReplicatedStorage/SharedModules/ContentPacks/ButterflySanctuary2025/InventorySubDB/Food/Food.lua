--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.InventorySubDB.Food (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.ClientDB.Inventory.EntryHelper).food
local v3 = {}
local v4 = {
    ["name"] = "Snapdragon Flower",
    ["image"] = "rbxassetid://78505688490129",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Butterfly2025Snapdragon",
    ["use_generated_public_lootbox_tooltip_description"] = true,
    ["tool"] = "AdoptionTool"
}
v3.butterfly_2025_snapdragon_flower = v4
local v5 = {
    ["name"] = "Bluebell Flower",
    ["image"] = "rbxassetid://120913661659056",
    ["rarity"] = "ultra_rare",
    ["cost"] = 900,
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Butterfly2025Bluebell",
    ["use_generated_public_lootbox_tooltip_description"] = true,
    ["tool"] = "AdoptionTool"
}
v3.butterfly_2025_bluebell_flower = v5
local v6 = {
    ["name"] = "Goldenrod Flower",
    ["image"] = "rbxassetid://108548213184520",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Butterfly2025Goldenrod",
    ["use_generated_public_lootbox_tooltip_description"] = true,
    ["tool"] = "AdoptionTool"
}
v3.butterfly_2025_goldenrod_flower = v6
return v2(v3)