--// ReplicatedStorage.SharedModules.ContentPacks.QoLFebruary2025.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["likes_reward_2025_cap"] = {
        ["name"] = "Holo Cap",
        ["image"] = "rbxassetid://114872793620859",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "LikesReward2025Cap"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)