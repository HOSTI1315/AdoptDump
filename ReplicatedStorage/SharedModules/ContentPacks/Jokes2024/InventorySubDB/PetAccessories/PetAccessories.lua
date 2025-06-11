--// ReplicatedStorage.SharedModules.ContentPacks.Jokes2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["jokes_2024_disguise_glasses"] = {
        ["name"] = "Disguise Glasses",
        ["image"] = "rbxassetid://18526838347",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Jokes2024DisguiseGlasses"
    },
    ["jokes_2024_arrow_through_head_hat"] = {
        ["name"] = "Arrow Head",
        ["image"] = "rbxassetid://18526838266",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Jokes2024ArrowThroughHeadHat"
    }
}
local v2 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)
for _, v3 in v2 do
    v3.tags = { "Jokes2024" }
end
return v2