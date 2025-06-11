--// ReplicatedStorage.SharedModules.ContentPacks.PenguinComp2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["penguin_comp_2022_ice_cream_cone_hat"] = {
        ["name"] = "Ice Cream Cone Hat",
        ["image"] = "rbxassetid://10283713196",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "PenguinComp2022IceCreamConeHat"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)