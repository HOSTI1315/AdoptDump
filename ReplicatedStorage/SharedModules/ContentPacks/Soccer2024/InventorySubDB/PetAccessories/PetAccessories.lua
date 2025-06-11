--// ReplicatedStorage.SharedModules.ContentPacks.Soccer2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["soccer_2024_italy_scarf"] = {
        ["name"] = "Italy Scarf",
        ["image"] = "rbxassetid://18335210819",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Soccer2024ItalyScarf"
    },
    ["soccer_2024_netherlands_bucket_hat"] = {
        ["name"] = "Netherlands Bucket Hat",
        ["image"] = "rbxassetid://18335210640",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Soccer2024NetherlandsBucketHat"
    },
    ["soccer_2024_belgium_scarf"] = {
        ["name"] = "Belgium Scarf",
        ["image"] = "rbxassetid://18335210713",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Soccer2024BelgiumScarf"
    },
    ["soccer_2024_germany_bucket_hat"] = {
        ["name"] = "Germany Bucket Hat",
        ["image"] = "rbxassetid://18335210521",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Soccer2024GermanyBucketHat"
    },
    ["soccer_2024_romania_soccer_cap"] = {
        ["name"] = "Romania Soccer Cap",
        ["image"] = "rbxassetid://18335402559",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Soccer2024RomaniaSoccerCap"
    },
    ["soccer_2024_switzerland_soccer_boots"] = {
        ["name"] = "Switzerland Soccer Boots",
        ["image"] = "rbxassetid://18335211086",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Soccer2024SwitzerlandSoccerBoots"
    },
    ["soccer_2024_spain_soccer_earrings"] = {
        ["name"] = "Spain Soccer Earrings",
        ["image"] = "rbxassetid://18335402780",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Soccer2024SpainSoccerEarrings"
    },
    ["soccer_2024_denmark_soccer_earrings"] = {
        ["name"] = "Denmark Soccer Earrings",
        ["image"] = "rbxassetid://18335402665",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Soccer2024DenmarkSoccerEarrings"
    },
    ["soccer_2024_england_soccer_boots"] = {
        ["name"] = "England Soccer Boots",
        ["image"] = "rbxassetid://18335210937",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Soccer2024EnglandSoccerBoots"
    },
    ["soccer_2024_france_soccer_cap"] = {
        ["name"] = "France Soccer Cap",
        ["image"] = "rbxassetid://18335402394",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Soccer2024FranceSoccerCap"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)