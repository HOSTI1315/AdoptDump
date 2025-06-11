--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {
    ["lny_2022_bench"] = {
        ["name"] = "Moon Viewing Bench",
        ["image"] = "rbxassetid://8663156923",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1800,
        ["model_handle"] = "LNY2022PlaceableBench",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    }
}
local v3 = {
    ["name"] = "Fan Flying Disc",
    ["image"] = "rbxassetid://8663156669",
    ["rarity"] = "uncommon",
    ["cost"] = 400,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "LNY2022FanFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.lny_2022_fan_flying_disc = v3
local v4 = {
    ["name"] = "Lunar New Year Lantern",
    ["image"] = "rbxassetid://8663157195",
    ["rarity"] = "uncommon",
    ["cost"] = 400,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "LNY2022LanternFlashlight",
    ["tool"] = "FlashlightTool"
}
v2.lny_2022_lantern_flashlight = v4
local v5 = {
    ["name"] = "Lunar New Year Teapot Leash",
    ["image"] = "rbxassetid://8663166708",
    ["rarity"] = "rare",
    ["cost"] = 700,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "YellowLeash",
    ["model_handle"] = "LNY2022TeapotLeash",
    ["tool"] = "PetLeash"
}
v2.lny_2022_teapot_leash = v5
return v1(v2)