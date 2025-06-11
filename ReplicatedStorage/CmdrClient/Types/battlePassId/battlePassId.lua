--// ReplicatedStorage.CmdrClient.Types.battlePassId (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("BattlePassDB")
local v_u_3 = v1("package:Sift")
return function(p_u_4)
    p_u_4:GetStore("InstancedArgTypes").battlePassId = function()
        local v5 = v_u_3.Dictionary.keys(v_u_2)
        return p_u_4.Cmdr.Util.MakeEnumType("BattlePassId", v5)
    end
end