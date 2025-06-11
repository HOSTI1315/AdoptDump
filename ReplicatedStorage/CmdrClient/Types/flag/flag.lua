--// ReplicatedStorage.CmdrClient.Types.flag (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("Flags")
return function(p4)
    p4:RegisterType("flag", p4.Cmdr.Util.MakeEnumType("Flag", v_u_2.Dictionary.keys(v_u_3)))
end