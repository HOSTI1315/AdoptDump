--// ReplicatedStorage.CmdrClient.Types.itemKind (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("InventoryDB")
return function(p_u_4)
    local v_u_5 = {}
    for v6, v7 in v_u_3 do
        v_u_5[v6] = v_u_2.Dictionary.keys(v7)
    end
    p_u_4:GetStore("InstancedArgTypes").itemKind = function(p8)
        return p_u_4.Cmdr.Util.MakeEnumType(p8 and (("ItemKind%*%*"):format(p8:sub(1, 1):upper(), (p8:sub(2))) or "ItemKind") or "ItemKind", p8 and v_u_5[p8] or {})
    end
end