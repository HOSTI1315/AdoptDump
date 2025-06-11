--// ReplicatedStorage.new.modules.Limiteds.LimitedsDisplayClient (ModuleScript)

local v_u_1 = game:GetService("TextChatService")
local v_u_2 = require(script.Parent.LimitedsSharedTypes)
local v_u_3 = require(script.Parent.Parent.LegacyLoad)
local v_u_4 = v_u_3("RouterClient")
local v5 = v_u_3("Signal")
local v_u_6 = v_u_3("ServerType")
local v_u_7 = {
    ["stats_updated"] = v5.new()
}
local v_u_8 = {}
local function v_u_10()
    v_u_4.get("LimitedsAPI/ShowSystemChatMessage").OnClientEvent:Connect(function(p9)
        v_u_1:WaitForChild("TextChannels"):WaitForChild("RBXGeneral"):DisplaySystemMessage(p9)
    end)
end
local function v_u_18()
    for v11, v12 in v_u_4.get("LimitedsAPI/LimitedsStatsInitial").OnClientEvent:Wait() do
        v_u_8[v11] = v12
    end
    v_u_4.get("LimitedsAPI/LimitedsStatsUpdated").OnClientEvent:Connect(function(p13, p14)
        local v15 = v_u_8[p13]
        if not v15 then
            v15 = {}
            v_u_8[p13] = v15
        end
        assert(v15, "typehint")
        for v16, v17 in p14 do
            if v17 == v_u_2.None then
                v15[v16] = nil
            else
                v15[v16] = v17
            end
        end
        v_u_7.stats_updated:Fire(p13, v15)
    end)
end
local function v_u_23()
    if not v_u_6.use_production_behavior() then
        v_u_4.get("LimitedsAPI/AssignTestCampaigns").OnClientEvent:Connect(function(p19)
            local v20 = v_u_3("DeveloperProductDB")
            for v21, v22 in p19 do
                v20[v21].limiteds_campaign = v22
            end
        end)
    end
end
function v_u_7.start()
    task.spawn(v_u_10)
    task.spawn(v_u_18)
    task.spawn(v_u_23)
end
function v_u_7.get_client_stats(p24)
    return v_u_8[p24]
end
function v_u_7.get_all_client_stats()
    return table.clone(v_u_8)
end
return v_u_7