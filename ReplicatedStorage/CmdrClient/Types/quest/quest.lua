--// ReplicatedStorage.CmdrClient.Types.quest (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("QuestsDB")
return function(p4)
    local v5 = p4.Cmdr.Util.MakeEnumType("Quest", v_u_2.Dictionary.keys(v_u_3.all_quests))
    p4:RegisterType("quest", v5)
    p4:RegisterType("quests", p4.Cmdr.Util.MakeListableType(v5))
end