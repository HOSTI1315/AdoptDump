--// ReplicatedStorage.SharedModules.ContentPacks.FireDimension2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["image"] = "rbxassetid://16273266097",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "For use at a Lure[if_lootboxes_random]\nPet (Ultra Rare): 90%\nPet (Legendary): 10%[/if_lootboxes_random]",
    ["tool"] = "LuresBaitPopup",
    ["model_handle"] = "FireDimension2024BakedAlaskaBait",
    ["name"] = "Baked Alaska Bait",
    ["is_lure_bait"] = true,
    ["lure_time"] = 600,
    ["lure_pet_reveal_effect"] = "Lures2023EmberRevealEffect",
    ["lure_pet_reveal_sound"] = "LureFirePetReveal"
}
v2.fire_dimension_2024_baked_alaska_bait = v3
local v4 = {
    ["image"] = "rbxassetid://16273265763",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "For use at a Lure[if_lootboxes_random]\nBucks: 75%\nAge Potion: 10%\nAccessories/Toys: 10%\nPet (Ultra Rare): 4.5%\nPet (Legendary): 0.5%[/if_lootboxes_random]",
    ["tool"] = "LuresBaitPopup",
    ["model_handle"] = "FireDimension2024BurntBitesBait",
    ["name"] = "Burnt Bites Bait",
    ["is_lure_bait"] = true,
    ["lure_time"] = 600,
    ["lure_pet_reveal_effect"] = "Lures2023EmberRevealEffect",
    ["lure_pet_reveal_sound"] = "LureFirePetReveal"
}
v2.fire_dimension_2024_burnt_bites_bait = v4
return v1(v2)