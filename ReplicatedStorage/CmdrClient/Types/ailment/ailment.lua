--// ReplicatedStorage.CmdrClient.Types.ailment (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("new:AilmentsDB")
local v_u_3 = v1("package:Sift")
return function(p4)
    local v5 = p4.Cmdr.Util.MakeEnumType("Ailment", v_u_3.Dictionary.keys(v_u_2))
    p4:RegisterType("ailment", v5)
    p4:RegisterType("ailments", p4.Cmdr.Util.MakeListableType(v5))
end