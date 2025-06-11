--// ReplicatedStorage.SharedModules.ContentPacks.Lures2023.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Campfire Cookie Bait",
    ["image"] = "rbxassetid://14473164000",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "Bucks: 79%\nAge Potion: 12.5%\nAccessories/Toys: 5%\nPaint Sealer: 2%\nPet (Ultra Rare): 1.49%\nPet (Legendary): 0.01%",
    ["display_infinite_amount_in_backpack"] = true,
    ["is_hidden_unless_picking_source"] = "lures_bait_pick",
    ["is_infinite_bait"] = true,
    ["is_lure_bait"] = true,
    ["lure_pet_reveal_effect"] = "Lures2023EmberRevealEffect",
    ["lure_pet_reveal_sound"] = "LureFirePetReveal",
    ["lure_time"] = 14400,
    ["model_handle"] = "Lures2023CampfireCookies",
    ["temporary"] = true,
    ["tool"] = "LuresBaitPopup"
}
v2.lures_2023_campfire_cookies = v3
local v4 = {
    ["name"] = "Flaming Zebra Bait",
    ["image"] = "rbxassetid://14384506717",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "100% chance of adopting a Flaming Zebra.\n\nExpertly crafted bait specifically designed for the Flaming Zebra. Ensures its attraction and willingness to stay when placed inside [???].",
    ["is_lure_bait"] = true,
    ["lure_pet_reveal_effect"] = "Lures2023EmberRevealEffect",
    ["lure_pet_reveal_sound"] = "LureFirePetReveal",
    ["lure_time"] = 1800,
    ["model_handle"] = "Lures2023FlameSwirlPie",
    ["tool"] = "LuresBaitPopup"
}
v2.lures_2023_flame_swirl_pie = v4
local v5 = {
    ["name"] = "Molten Melon",
    ["image"] = "rbxassetid://14529465832",
    ["rarity"] = "rare",
    ["donatable"] = true,
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "A very valuable ingredient requested by Cool Tim.",
    ["model_handle"] = "Lures2023MagmaMelon",
    ["tool"] = "GenericTool"
}
v2.lures_2023_magma_melon = v5
local v6 = {
    ["name"] = "Ash Zebra Bait",
    ["image"] = "rbxassetid://14523681138",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "100% chance of adopting an Ash Zebra.\n\nExpertly crafted bait specifically designed for the Ash Zebra. Ensures its attraction and willingness to stay when placed inside [???].",
    ["is_lure_bait"] = true,
    ["lure_pet_reveal_effect"] = "Lures2023EmberRevealEffect",
    ["lure_pet_reveal_sound"] = "LureFirePetReveal",
    ["lure_time"] = 1800,
    ["model_handle"] = "Lures2023OvercookedTart",
    ["tool"] = "LuresBaitPopup"
}
v2.lures_2023_overcooked_tart = v6
return v1(v2)