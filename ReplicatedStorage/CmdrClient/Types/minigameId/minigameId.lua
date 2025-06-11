--// ReplicatedStorage.CmdrClient.Types.minigameId (ModuleScript)

local v1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3
if v1:IsClient() then
    v_u_3 = v2("MinigameClientManager")
else
    v_u_3 = v2("MinigameServerManager")
end
return function(p_u_4)
    p_u_4:GetStore("InstancedArgTypes").minigameId = function()
        return p_u_4.Cmdr.Util.MakeEnumType("MinigameId", v_u_3.get_all_ids())
    end
end