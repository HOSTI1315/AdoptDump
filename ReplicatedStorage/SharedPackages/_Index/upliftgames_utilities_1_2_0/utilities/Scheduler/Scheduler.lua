--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.Scheduler (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = {}
local v_u_3 = {}
local v_u_4 = require(script.Parent.FixedCapacityQueue).new(2000)
local v_u_5 = nil
local v_u_6 = nil
local function v_u_15(p7, p8, p9, p_u_10)
    local v11 = v_u_3
    local v12 = {
        ["callback"] = p7,
        ["startTime"] = os.time() + p8,
        ["repeats"] = p9 == true,
        ["delay"] = p8,
        ["id"] = p_u_10
    }
    table.insert(v11, v12)
    table.sort(v_u_3, function(p13, p14)
        return p13.startTime < p14.startTime
    end)
    if v_u_5 == nil then
        v_u_6()
    end
    return {
        ["cancel"] = function()
            v_u_4:push(p_u_10)
        end
    }
end
local function v_u_17()
    local v_u_16 = v_u_3[1]
    if os.time() >= v_u_16.startTime then
        table.remove(v_u_3, 1)
        if not v_u_4:contains(v_u_16.id) then
            coroutine.wrap(function()
                pcall(v_u_16.callback)
                if v_u_16.repeats then
                    v_u_15(v_u_16.callback, v_u_16.delay, v_u_16.repeats, v_u_16.id)
                end
            end)()
        end
        if #v_u_3 == 0 then
            v_u_5:disconnect()
            v_u_5 = nil
        end
    end
end
v_u_6 = function()
    local v18 = v_u_5 == nil
    assert(v18)
    v_u_5 = v_u_1.Heartbeat:connect(v_u_17)
end
function v2.scheduleWithFixedDelay(p19, p20, p21)
    return v_u_15(p19, p20, p21, (game:GetService("HttpService"):GenerateGUID(false)))
end
return v2