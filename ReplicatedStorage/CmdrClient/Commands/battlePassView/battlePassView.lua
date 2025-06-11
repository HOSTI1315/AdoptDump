--// ReplicatedStorage.CmdrClient.Commands.battlePassView (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
return {
    ["Name"] = "battlePassView",
    ["Description"] = "Views a Battle Pass\' GUI.",
    ["Group"] = "Debug",
    ["Args"] = { function(p2)
            return {
                ["Type"] = p2.Cmdr.Registry:GetStore("InstancedArgTypes").battlePassId(),
                ["Name"] = "Battle Pass Id",
                ["Description"] = "The id of the battle pass to view."
            }
        end },
    ["ClientRun"] = function(_, p3)
        v_u_1("UIManager").apps.BattlePassApp:view(p3)
        return "Viewed Battle Pass"
    end
}