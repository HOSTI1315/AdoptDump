--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["ice_dimension_2025_ice_cape"] = {
        ["name"] = "Ice Cape",
        ["model_handle"] = "IceDimension2025IceCape",
        ["image"] = "rbxassetid://125647156613305",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back"
    },
    ["ice_dimension_2025_frozen_crown"] = {
        ["name"] = "Frozen Crown",
        ["image"] = "rbxassetid://123614981215824",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "IceDimension2025FrozenCrown"
    },
    ["ice_dimension_2025_ice_monocle"] = {
        ["name"] = "Ice Monocle",
        ["image"] = "rbxassetid://85537448641131",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "IceDimension2025IceMonocle"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)