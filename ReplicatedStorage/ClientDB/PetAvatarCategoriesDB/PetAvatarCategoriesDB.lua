--// ReplicatedStorage.ClientDB.PetAvatarCategoriesDB (ModuleScript)

local v1 = {}
local v2 = {
    ["all"] = {
        ["name"] = "Pet Wear",
        ["image"] = 4441747558,
        ["subcategories"] = { "General" },
        ["soft_category"] = true
    },
    ["hats"] = {
        ["name"] = "Hats",
        ["image"] = 2644702738,
        ["subcategories"] = { "General" },
        ["equip_limit"] = 3
    },
    ["glasses"] = {
        ["name"] = "Glasses",
        ["image"] = 2644687550,
        ["subcategories"] = { "General" },
        ["equip_limit"] = 2
    },
    ["collar"] = {
        ["name"] = "Collars",
        ["image"] = 4441747802,
        ["subcategories"] = { "General" },
        ["equip_limit"] = 2
    },
    ["neck"] = {
        ["name"] = "Neck Accessories",
        ["image"] = 4441747668,
        ["subcategories"] = { "General" },
        ["equip_limit"] = 2
    },
    ["chest"] = {
        ["name"] = "Chest Accessories",
        ["image"] = 4441747924,
        ["subcategories"] = { "General" },
        ["equip_limit"] = 2
    },
    ["back"] = {
        ["name"] = "Back Accessories",
        ["image"] = 10776916055,
        ["subcategories"] = { "General" },
        ["equip_limit"] = 2
    },
    ["shoes"] = {
        ["name"] = "Shoes",
        ["image"] = 5451644782,
        ["subcategories"] = { "General" },
        ["one_at_a_time"] = true
    },
    ["wings"] = {
        ["name"] = "Wings",
        ["image"] = 2644687663,
        ["subcategories"] = { "General" },
        ["one_at_a_time"] = true
    }
}
v1.categories = v2
v1.ordered_categories = {
    "all",
    "hats",
    "glasses",
    "collar",
    "neck",
    "chest",
    "back",
    "shoes",
    "wings"
}
for v3, v4 in pairs(v1.categories) do
    v4.category = v3
end
return v1