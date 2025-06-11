--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["image"] = "rbxassetid://85127959328507",
    ["rarity"] = "rare",
    ["cost"] = 200,
    ["currency_id"] = "ice_shards_2025",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "For use at a Lure[if_lootboxes_random]\nSticker: 40%\nBucks: 38%\nAge Potion: 12%\nShiver Wolf: 9.99%\nFrostbite Bear: 0.01%[/if_lootboxes_random]",
    ["tool"] = "LuresBaitPopup",
    ["model_handle"] = "IceDimension2025ShiverConeBait",
    ["name"] = "Shiver Cone Bait",
    ["is_lure_bait"] = true,
    ["lure_time"] = 14400,
    ["lure_pet_reveal_effect"] = "IceDimension2025IceRevealEffect",
    ["lure_pet_reveal_sound"] = "LureIceDimensionPetReveal"
}
v2.ice_dimension_2025_shiver_cone_bait = v3
local v4 = {
    ["image"] = "rbxassetid://104567424356607",
    ["rarity"] = "rare",
    ["cost"] = 200,
    ["currency_id"] = "ice_shards_2025",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "For use at a Lure[if_lootboxes_random]\nSticker: 40%\nBucks: 38%\nAge Potion: 12%\nSubzero Scorpion: 9.99%\nFrostbite Bear: 0.01%[/if_lootboxes_random]",
    ["tool"] = "LuresBaitPopup",
    ["model_handle"] = "IceDimension2025SubzeroPopsicleBait",
    ["name"] = "Subzero Popsicle Bait",
    ["is_lure_bait"] = true,
    ["lure_time"] = 14400,
    ["lure_pet_reveal_effect"] = "IceDimension2025IceRevealEffect",
    ["lure_pet_reveal_sound"] = "LureIceDimensionPetReveal"
}
v2.ice_dimension_2025_subzero_popsicle_bait = v4
local v5 = {
    ["image"] = "rbxassetid://83561411988910",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "Bucks: 72.9%\nAge Potion: 12.5%\nAccessories: 7.1%\nSticker: 6%\nPet (Ultra Rare): 1.49%\nFrostbite Bear: 0.01%",
    ["tool"] = "LuresBaitPopup",
    ["model_handle"] = "IceDimension2025IceSoupBait",
    ["name"] = "Ice Soup Bait",
    ["is_lure_bait"] = true,
    ["display_infinite_amount_in_backpack"] = true,
    ["is_hidden_unless_picking_source"] = "lures_bait_pick",
    ["is_infinite_bait"] = true,
    ["temporary"] = true,
    ["lure_time"] = 14400,
    ["lure_pet_reveal_effect"] = "IceDimension2025IceRevealEffect",
    ["lure_pet_reveal_sound"] = "LureIceDimensionPetReveal"
}
v2.ice_dimension_2025_ice_soup_bait = v5
return v1(v2)