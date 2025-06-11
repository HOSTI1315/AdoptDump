--// ReplicatedStorage.ClientDB.WindowDB (ModuleScript)

local v_u_1 = {}
local v2 = {
    ["tutorial"] = {
        ["visible"] = true
    },
    ["radio"] = {
        ["visible"] = false
    }
}
v_u_1.windows = v2
local v_u_3 = {
    100000,
    200000,
    300000,
    400000,
    500000,
    600000,
    700000,
    800000,
    900000,
    1000000
}
function v_u_1.focus(p4)
    local v5 = v_u_1.windows[p4].display_order_tier
    v_u_3[v5] = v_u_3[v5] + 1
    return v_u_3[v5]
end
return v_u_1