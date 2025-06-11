--// ReplicatedStorage.new.modules.Ailments.PreferenceItemGroupsDB (ModuleScript)

local v1 = {}
for _, v2 in {
    { "sandwich-default", "sandwich", "schospital_refresh_2023_cafeteria_sandwich" },
    { "apple-default", "apple", "teachers_apple" },
    { "squeaky_bone_default", "squeaky_bone" },
    { "ham", "ham_vip" },
    { "chocolate_milk", "chocolate_milk_vip" },
    { "popcorn", "popcorn_vip" },
    {
        "water",
        "water_vip",
        "water_paper_cup",
        "soda_fountain_water"
    },
    {
        "tea",
        "green_tea_cup",
        "oolong_tea_cup",
        "jasmine_tea_cup"
    },
    { "coffee", "coffee_paper_cup" },
    { "pizza", "free_pizza", "pizza_shop_pizza" }
} do
    local v3 = {}
    for _, v4 in v2 do
        v3[v4] = true
    end
    for _, v5 in v2 do
        v1[v5] = v3
    end
end
return v1