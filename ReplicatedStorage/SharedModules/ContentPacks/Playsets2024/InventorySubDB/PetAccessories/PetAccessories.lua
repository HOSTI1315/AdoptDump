--// ReplicatedStorage.SharedModules.ContentPacks.Playsets2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["playsets_2024_cherry_on_top_hat"] = {
        ["name"] = "Cherry-on-Top",
        ["image"] = "rbxassetid://110286954719531",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Playsets2024CherryOnTopHat"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)