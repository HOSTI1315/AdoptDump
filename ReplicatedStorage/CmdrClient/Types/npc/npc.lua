--// ReplicatedStorage.CmdrClient.Types.npc (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("NPCDB")
local v_u_3 = v1("FurnitureDB")
local v_u_4 = v1("InventoryDB")
return function(p5)
    local v6 = {}
    for v7, _ in v_u_2 do
        if v_u_3[v7] and not v_u_4.pets[v7] then
            table.insert(v6, v7)
        end
    end
    table.sort(v6)
    p5:RegisterType("npc", (p5.Cmdr.Util.MakeEnumType("NPC", v6)))
end