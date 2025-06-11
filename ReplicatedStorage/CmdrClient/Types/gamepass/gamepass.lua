--// ReplicatedStorage.CmdrClient.Types.gamepass (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("GamepassDB")
return function(p4)
    local v5 = p4.Cmdr.Util.MakeEnumType("Gamepass", v_u_2.Dictionary.keys(v_u_3))
    p4:RegisterType("gamepass", v5)
    p4:RegisterType("gamepasses", p4.Cmdr.Util.MakeListableType(v5))
end