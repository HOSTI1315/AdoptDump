--// ReplicatedStorage.ClientDB.BattlePass.BattlePassDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("ContentPackHelper")
local v3 = v1("package:t")
local v4 = v3.strictInterface
local v5 = {
    ["display_name"] = v3.string,
    ["event_id"] = v3.optional(v3.string),
    ["event_end_timestamp"] = v3.optional(v3.number),
    ["event_has_ended"] = v3.optional(v3.boolean),
    ["icon_image"] = v3.string,
    ["minigame_reward_image"] = v3.optional(v3.strictInterface({
        ["phone"] = v3.string,
        ["desktop"] = v3.string
    })),
    ["sprout_images"] = v3.optional(v3.strictInterface({
        ["A"] = v3.string,
        ["B"] = v3.string
    })),
    ["hint_text"] = v3.optional(v3.string),
    ["event_end_reset_prompt"] = v3.optional(v3.string)
}
local v6 = v3.optional
local v7 = v3.interface
local v8 = {
    ["can_reset"] = v3.optional(v3.boolean),
    ["daily_reset_limit"] = v3.optional(v3.number),
    ["can_reset_until_timestamp"] = v3.optional(v3.integer),
    ["reset_prompt"] = v3.optional(v3.string),
    ["cost"] = v3.optional(v3.strictInterface({
        ["kind"] = v3.optional(v3.string),
        ["amount"] = v3.intersection(v3.integer, v3.numberPositive)
    }))
}
v5.reset_options = v6(v7(v8))
local v9 = v3.array
local v10 = v3.strictInterface
local v11 = {
    ["xp_needed"] = v3.intersection(v3.integer, v3.numberPositive),
    ["reward"] = v3.strictInterface({
        ["category"] = v3.string,
        ["kind"] = v3.string,
        ["properties"] = v3.optional(v3.any),
        ["amount"] = v3.intersection(v3.integer, v3.numberPositive)
    })
}
v5.track = v9(v10(v11))
local v12 = v4(v5)
local v13 = {}
v2.merge("BattlePasses", v13)
for v14, v15 in v13 do
    local v16 = { v12(v15) }
    local v17 = "Validation failed for " .. v14 .. " because: {CAUSE}"
    local v18, v19 = unpack(v16)
    local v20 = tostring(v19)
    assert(v18, v17:gsub("{CAUSE}", v20))
    local v21 = 0
    for _, v22 in v15.track do
        local v23 = v22.xp_needed
        v22.xp_needed = v22.xp_needed + v21
        v21 = v21 + v23
    end
end
return v13