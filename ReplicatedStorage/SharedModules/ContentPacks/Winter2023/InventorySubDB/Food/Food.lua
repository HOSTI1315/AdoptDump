--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Candy Cane Cake",
    ["image"] = "rbxassetid://15319067259",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "Winter2023CandyCaneCake",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.winter_2023_candy_cane_cake = v3
local v4 = {
    ["name"] = "Christmas Pudding Pup Bait",
    ["image"] = "rbxassetid://15383634799",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "100% chance of adopting a Christmas Pudding Pup.\n\nExpertly crafted bait specifically designed for the Christmas Pudding Pup. Ensures its attraction and willingness to stay when placed inside a lure.",
    ["is_lure_bait"] = true,
    ["lure_pet_reveal_effect"] = "Lures2023EmberRevealEffect",
    ["lure_pet_reveal_sound"] = "LureFirePetReveal",
    ["lure_time"] = 1500,
    ["model_handle"] = "Winter2023ChristmasPuddingPupBait",
    ["tool"] = "LuresBaitPopup"
}
v2.winter_2023_christmas_pudding_pup_bait = v4
local v5 = {
    ["name"] = "Hot Cocoa",
    ["image"] = "rbxassetid://15433627053",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "ChocoMilkHold",
        ["use"] = "ChocoMilkEat"
    },
    ["model_handle"] = "Winter2023HotCocoa",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.winter_2023_hot_cocoa = v5
local v6 = {
    ["name"] = "Snowflake Cookie",
    ["image"] = "rbxassetid://15416904025",
    ["rarity"] = "uncommon",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "Winter2023SnowflakeCookie",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.winter_2023_snowflake_cookie = v6
return v1(v2)