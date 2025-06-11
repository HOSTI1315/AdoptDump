--// ReplicatedStorage.CmdrClient.Types.itemCategory (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("InventoryDB")
return function(p4)
    local v5 = v_u_2.Dictionary.keys(v_u_3)
    p4:RegisterType("itemCategory", p4.Cmdr.Util.MakeEnumType("ItemCategory", v5))
end