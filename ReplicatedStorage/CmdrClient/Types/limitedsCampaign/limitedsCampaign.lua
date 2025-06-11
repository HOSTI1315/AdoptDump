--// ReplicatedStorage.CmdrClient.Types.limitedsCampaign (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = require(game.ReplicatedStorage.Fsys).load
return function(p_u_3)
    p_u_3:GetStore("InstancedArgTypes").limitedsCampaign = function()
        local v4 = {}
        if v_u_1:IsServer() then
            for v5, _ in v_u_2("new:LimitedsDisplayServer").get_all_server_stats() do
                table.insert(v4, v5)
            end
            table.sort(v4)
        else
            for v6, _ in v_u_2("new:LimitedsDisplayClient").get_all_client_stats() do
                table.insert(v4, v6)
            end
            table.sort(v4)
        end
        return p_u_3.Cmdr.Util.MakeEnumType("Campaign", v4)
    end
    p_u_3:GetStore("InstancedArgTypes").limitedsCampaigns = function()
        return p_u_3.Cmdr.Util.MakeListableType(p_u_3:GetStore("InstancedArgTypes").limitedsCampaign())
    end
end