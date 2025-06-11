--// ReplicatedStorage.SharedModules.ContentPacks.Woodland2022.InventorySubDB.Toys (ModuleScript)

local v1 = {
    ["woodland_2022_bench"] = {
        ["name"] = "Bench",
        ["image"] = "rbxassetid://9107294987",
        ["rarity"] = "uncommon",
        ["cost"] = 900,
        ["model_handle"] = "Woodland2022Bench",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    },
    ["woodland_2022_camping_tent"] = {
        ["name"] = "Camping Tent",
        ["image"] = "rbxassetid://9107295612",
        ["rarity"] = "uncommon",
        ["cost"] = 1200,
        ["colorable"] = true,
        ["model_handle"] = "Woodland2022CampingTent",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    },
    ["woodland_2022_marshmallow_stand"] = {
        ["name"] = "Marshmallow Stand",
        ["image"] = "rbxassetid://9108007966",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "Woodland2022MarshmallowStand",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    },
    ["woodland_2022_premium_camping_tent"] = {
        ["name"] = "Premium Camping Tent",
        ["image"] = "rbxassetid://9108008630",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "Woodland2022PremiumCampingTent",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    },
    ["woodland_2022_premium_fire_pit"] = {
        ["name"] = "Premium Fire Pit",
        ["image"] = "rbxassetid://9108007641",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "Woodland2022PremiumFirePit",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    },
    ["woodland_2022_premium_log_bench"] = {
        ["name"] = "Premium Log Bench",
        ["image"] = "rbxassetid://9108008367",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "Woodland2022PremiumLogBench",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    },
    ["woodland_2022_sleeping_bag"] = {
        ["name"] = "Sleeping Bag",
        ["image"] = "rbxassetid://9107295273",
        ["rarity"] = "uncommon",
        ["cost"] = 1100,
        ["colorable"] = true,
        ["model_handle"] = "Woodland2022SleepingBag",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys(v1)