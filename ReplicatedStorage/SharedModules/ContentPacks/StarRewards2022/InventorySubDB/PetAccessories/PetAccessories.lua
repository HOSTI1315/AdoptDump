--// ReplicatedStorage.SharedModules.ContentPacks.StarRewards2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["star_rewards_2022_wind_turbine_earrings"] = {
        ["name"] = "Wind Turbine Earrings",
        ["image"] = "rbxassetid://10224209982",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "StarRewards2022sWindTurbineEarrings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)