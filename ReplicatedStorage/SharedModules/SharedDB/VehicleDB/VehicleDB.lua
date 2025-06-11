--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Maid")
local v2 = require(script.VehicleRender)
local v3 = require(script.VehicleProperties)
local v4 = v2.default
local v5 = {}
for v6, v7 in v3 do
    local v8 = {
        ["client"] = {},
        ["server"] = {}
    }
    for _, v9 in v7.vehicle_render_effects do
        local v10 = v2[v9] or {}
        for v11, v_u_12 in {
            ["client"] = v10.client or v4.client,
            ["server"] = v10.server or v4.server
        } do
            local v13 = v8[v11]
            table.insert(v13, function(p14, p15, p16, p17)
                local v18 = v_u_1.new()
                p17:GiveTask(v18)
                return v_u_12(p14, p15, p16, v18)
            end)
        end
    end
    v7.kind = v6
    local v19 = {}
    local v_u_20 = v8.client
    v19.client = #v_u_20 > 0 and function(p21, p22, p23, p24)
        local v_u_25 = {}
        for _, v26 in v_u_20 do
            local v27 = v26(p21, p22, p23, p24)
            table.insert(v_u_25, v27)
        end
        return function()
            for _, v28 in v_u_25 do
                v28()
            end
        end
    end or v4.client
    local v_u_29 = v8.server
    v19.server = #v_u_29 > 0 and function(p30, p31, p32, p33)
        local v_u_34 = {}
        for _, v35 in v_u_29 do
            local v36 = v35(p30, p31, p32, p33)
            table.insert(v_u_34, v36)
        end
        return function()
            for _, v37 in v_u_34 do
                v37()
            end
        end
    end or v4.server
    v7.render_behavior = v19
    v5[v6] = v7
end
return v5