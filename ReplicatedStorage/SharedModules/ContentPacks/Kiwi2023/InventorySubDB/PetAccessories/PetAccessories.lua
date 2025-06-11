--// ReplicatedStorage.SharedModules.ContentPacks.Kiwi2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["kiwi_2023_red_scarf"] = {
        ["name"] = "Red Scarf",
        ["image"] = "rbxassetid://14288758852",
        ["rarity"] = "uncommon",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Kiwi2023RedScarf"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)