--// ReplicatedStorage.SharedModules.ContentPacks.SpinMastersPursePet.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {}
local v3 = {
    ["name"] = "Llamalush Purse Pet",
    ["image"] = "rbxassetid://8905828003",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "SpinMasterLlamaPursePet"
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "PursePetLlamaHalfCloseAndBlink"
    }
}
__set_list(v4, 1, {v5})
v3.static_effects = v4
v2.spin_master_2022_llama_purse_pet = v3
local v6 = {
    ["name"] = "Glamicorn Purse Pet",
    ["image"] = "rbxassetid://7780038667",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "back",
    ["model_handle"] = "SpinMastersPursePet"
}
local v7 = {}
local v8 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "SpinMastersPursePetHalfClose"
    }
}
__set_list(v7, 1, {v8})
v6.static_effects = v7
v2.spin_masters_purse_pet = v6
return v1(v2)