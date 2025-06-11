--// ReplicatedStorage.SharedModules.ContentPacks.Woodland2022.Furniture (ModuleScript)

local v1 = {
    ["woodland_2022_bench"] = {
        ["name"] = "Bench",
        ["model_name"] = "Woodland2022Bench"
    },
    ["woodland_2022_sleeping_bag"] = {
        ["name"] = "Sleeping Bag",
        ["model_name"] = "Woodland2022SleepingBag"
    },
    ["woodland_2022_camping_tent"] = {
        ["name"] = "Camping Tent",
        ["model_name"] = "Woodland2022CampingTent"
    },
    ["woodland_2022_premium_camping_tent"] = {
        ["name"] = "Premium Camping Tent",
        ["model_name"] = "Woodland2022PremiumCampingTent"
    },
    ["woodland_2022_premium_log_bench"] = {
        ["name"] = "Premium Log Bench",
        ["model_name"] = "Woodland2022PremiumLogBench"
    },
    ["woodland_2022_premium_fire_pit"] = {
        ["name"] = "Premium Fire Pit",
        ["model_name"] = "Woodland2022PremiumFirePit"
    },
    ["woodland_2022_marshmallow_stand"] = {
        ["name"] = "Marshmallow Stand",
        ["model_name"] = "Woodland2022MarshmallowStand"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)