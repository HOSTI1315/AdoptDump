--// ReplicatedStorage.ClientModules.Core.DoorsM.DoorsM (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Nearest")
local v_u_3 = v1("Door")
local v4 = v1("Signal")
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = nil
local v_u_8 = v4.new()
local function v_u_12()
    local v9 = {}
    for _, v10 in pairs(script.Parent:WaitForChild("Doors"):GetChildren()) do
        local v11 = require
        table.insert(v9, v11(v10))
    end
    return v9
end
function v_u_5.get_door(p13)
    local v14 = p13 ~= nil
    assert(v14)
    if not v_u_6[p13] then
        v_u_6[p13] = v_u_3.new(p13, v_u_8)
    end
    return v_u_6[p13]
end
function v_u_5.refresh_doors()
    local v15 = v_u_7:get_all_within_range({
        ["max_dist"] = 27
    })
    for _, v16 in pairs(v15) do
        v_u_5.get_door(v16.door_model):open()
    end
end
function v_u_5.get_door_entering_signal()
    return v_u_8
end
function v_u_5.init()
    v_u_7 = v_u_2.new()
    v_u_7:register((v_u_12()))
    spawn(function()
        while true do
            wait(60)
            for v17, _ in pairs(v_u_6) do
                if v17.Parent == nil then
                    v_u_6[v17] = nil
                end
            end
        end
    end)
end
return v_u_5