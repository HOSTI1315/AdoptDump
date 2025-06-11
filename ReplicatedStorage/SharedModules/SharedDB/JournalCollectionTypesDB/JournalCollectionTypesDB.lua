--// ReplicatedStorage.SharedModules.SharedDB.JournalCollectionTypesDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InventoryDB")
local v3 = v1("package:t")
local function v_u_5(p4)
    if p4.category == "pets" then
        if not (v_u_2[p4.category] or {})[p4.kind].is_egg then
            return (p4.properties.neon and 6 or 0) + p4.properties.age
        end
    end
end
local v6 = {}
local v7 = {
    ["create_new_entry"] = function(_)
        return {
            ["date_acquired"] = os.time()
        }
    end,
    ["get_update_changes"] = function(_, _)
        return {}
    end,
    ["validate_entry"] = v3.strictInterface({
        ["date_acquired"] = v3.optional(v3.integer)
    })
}
v6.default = v7
local v14 = {
    ["create_new_entry"] = function(p8)
        return {
            ["date_acquired"] = os.time(),
            ["age"] = v_u_5(p8),
            ["friendship_level"] = p8.properties.friendship_level or 0,
            ["hatched"] = 0,
            ["mega_neon"] = p8.properties.mega_neon
        }
    end,
    ["get_update_changes"] = function(p9, p10)
        local v11 = {}
        local v12 = v_u_5(p9)
        if not p10.age or v12 and p10.age < v12 then
            v11.age = v12
        end
        local v13 = p9.properties.friendship_level or 0
        if not p10.friendship_level or v13 and p10.friendship_level < v13 then
            v11.friendship_level = v13
        end
        if not p10.mega_neon and p9.properties.mega_neon then
            v11.mega_neon = true
        end
        return v11
    end,
    ["validate_entry"] = v3.strictInterface({
        ["date_acquired"] = v3.optional(v3.integer),
        ["age"] = v3.optional(v3.integer),
        ["friendship_level"] = v3.optional(v3.integer),
        ["hatched"] = v3.optional(v3.integer),
        ["mega_neon"] = v3.optional(v3.boolean)
    })
}
v6.pets = v14
return v6