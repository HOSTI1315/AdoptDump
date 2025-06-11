--// ReplicatedStorage.SharedModules.ContentPacks.Winter2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["winter_2022_gingerbread_star_eye_patch"] = {
        ["name"] = "Gingerbread Star Eye Patch",
        ["image"] = "rbxassetid://11582922372",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Winter2022GingerbreadStarEyePatch"
    },
    ["winter_2022_strawberry_crown"] = {
        ["name"] = "Strawberry Crown",
        ["image"] = "rbxassetid://11582930326",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2022StrawberryCrown"
    },
    ["winter_2022_strawberry_shortcake_bow"] = {
        ["name"] = "Strawberry Shortcake Bow",
        ["image"] = "rbxassetid://11583537381",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Winter2022StrawberryShortcakeBow"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)