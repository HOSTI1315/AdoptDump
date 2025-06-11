--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Yule Log Treat",
    ["image"] = "rbxassetid://91314569001316",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Winter2024YuleLogTreat",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.winter_2024_yule_log_treat = v3
local v4 = {
    ["name"] = "Lebkuchen Cookie",
    ["image"] = "rbxassetid://74107383651689",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Winter2024LebkuchenCookie",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.winter_2024_lebkuchen_cookie = v4
local v5 = {
    ["name"] = "Winter Deer Bait",
    ["image"] = "rbxassetid://120240198678244",
    ["rarity"] = "ultra_rare",
    ["cost"] = 40000,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["is_lure_bait"] = true,
    ["lure_pet_reveal_effect"] = "Winter2024LuresRevealEffect",
    ["lure_pet_reveal_sound"] = "LureFirePetReveal",
    ["lure_time"] = 900,
    ["model_handle"] = "Winter2024WinterDeerBait",
    ["tool"] = "LuresBaitPopup",
    ["use_generated_public_lootbox_tooltip_description"] = true
}
v2.winter_2024_winter_deer_bait = v5
return v1(v2)