--// ReplicatedStorage.SharedModules.ContentPacks.FriendWeek2025.CloudValueSchemas.friend_multiplier (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("package:t")
local v2 = v1.strictInterface({
    ["year"] = v1.intersection(v1.numberMin(2024), v1.integer),
    ["month"] = v1.intersection(v1.numberPositive, v1.integer),
    ["day"] = v1.intersection(v1.numberPositive, v1.integer),
    ["hour"] = v1.intersection(v1.numberMin(0), v1.integer),
    ["minute"] = v1.optional(v1.intersection(v1.numberMin(0), v1.integer))
})
local v3 = {
    ["enabled"] = {
        ["type"] = v1.boolean,
        ["safeDefault"] = false,
        ["replicated"] = true
    }
}
local v4 = {
    ["type"] = v1.strictInterface({
        ["bucks"] = v1.numberPositive,
        ["aging"] = v1.numberPositive
    }),
    ["safeDefault"] = {
        ["bucks"] = 1,
        ["aging"] = 1
    },
    ["replicated"] = true
}
v3.multiplier = v4
v3.friend_count_required = {
    ["type"] = v1.integer,
    ["safeDefault"] = 1,
    ["replicated"] = true
}
local v5 = {
    ["type"] = v1.strictInterface({
        ["start_time"] = v2,
        ["expiration_time"] = v2
    })
}
local v6 = {
    ["start_time"] = {
        ["year"] = 2025,
        ["month"] = 5,
        ["day"] = 27,
        ["hour"] = 7
    },
    ["expiration_time"] = {
        ["year"] = 2025,
        ["month"] = 5,
        ["day"] = 30,
        ["hour"] = 7
    }
}
v5.safeDefault = v6
v5.replicated = true
v3.schedule = v5
return v3