--// ReplicatedStorage.SharedModules.ContentPacks.Jokes2024.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "jokes_2024_gift_box"
    }
}
local v3 = {}
local v4 = {
    ["chance"] = 0.175,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "jokes_2024_arrow_through_head_hat"
        }
    }
}
local v5 = {
    ["chance"] = 0.175,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "jokes_2024_disguise_glasses"
        }
    }
}
local v6 = {
    ["chance"] = 0.3,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "jokes_2024_chattering_teeth"
        }
    }
}
local v7 = {
    ["chance"] = 0.2,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "jokes_2024_squirty_flower"
        }
    }
}
local v8 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "jokes_2024_firecrackers"
        }
    }
}
local v9 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "jokes_2024_whoopee_cushion"
        }
    }
}
__set_list(v3, 1, {v4, v5, v6, v7, v8, v9})
v2.possible_loot = v3
v1.jokes_2024_gift_box = v2
return v1