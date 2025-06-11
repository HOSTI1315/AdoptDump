--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["lny_2022_collar"] = {
        ["name"] = "Lunar New Year Collar",
        ["image"] = "rbxassetid://8663157028",
        ["rarity"] = "rare",
        ["cost"] = 600,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "LNY2022Collar"
    },
    ["lny_2022_gold_ingot"] = {
        ["name"] = "Gold Ingot",
        ["image"] = "rbxassetid://8663156830",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "LNY2022GoldIngot"
    },
    ["lny_2022_mandarin_hat"] = {
        ["name"] = "Mandarin\'s Hat",
        ["image"] = "rbxassetid://8663157254",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1200,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LNY2022MandarinHat"
    },
    ["lny_2022_red_envelope"] = {
        ["name"] = "Red Envelope",
        ["image"] = "rbxassetid://8663157327",
        ["rarity"] = "uncommon",
        ["cost"] = 310,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "LNY2022RedEnvelope"
    },
    ["lny_2022_shoes"] = {
        ["name"] = "Lunar New Year Shoes",
        ["image"] = "rbxassetid://8663157131",
        ["rarity"] = "rare",
        ["cost"] = 800,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "LNY2022Shoes"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)