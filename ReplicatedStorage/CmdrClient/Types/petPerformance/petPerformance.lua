--// ReplicatedStorage.CmdrClient.Types.petPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("PetPerformanceName")
return function(p4)
    p4:RegisterType("petPerformance", (p4.Cmdr.Util.MakeEnumType("PetPerformance", v_u_2.Dictionary.keys(v_u_3))))
end