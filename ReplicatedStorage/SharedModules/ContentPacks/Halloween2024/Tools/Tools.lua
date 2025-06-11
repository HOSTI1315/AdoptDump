--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v6 = {
    ["NetzookaTool"] = {
        ["ignore_server_use_on_tool"] = true,
        ["client_use"] = function(p2, _, _, _, p3)
            v_u_1("NetzookaHelper").client_use(p2, p3)
        end,
        ["equipped"] = function(p4, _, p5)
            v_u_1("NetzookaHelper").equip(p4, p5)
        end,
        ["unequipped"] = function()
            v_u_1("NetzookaHelper").unequip()
        end
    }
}
return v6