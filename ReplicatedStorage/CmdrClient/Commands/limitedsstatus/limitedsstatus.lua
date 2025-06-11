--// ReplicatedStorage.CmdrClient.Commands.limitedsstatus (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
return {
    ["Name"] = "limitedsStatus",
    ["Aliases"] = {},
    ["Description"] = "Views status of limiteds campaigns",
    ["Group"] = "Debug",
    ["Args"] = { function(p2)
            return {
                ["Type"] = p2.Cmdr.Registry:GetStore("InstancedArgTypes").limitedsCampaigns(),
                ["Name"] = "Campaigns",
                ["Description"] = "The campaigns you want to view."
            }
        end, function(p3)
            return {
                ["Type"] = p3.Cmdr.Util.MakeEnumType("Machine", { "server", "client" }),
                ["Name"] = "Machine",
                ["Description"] = "Server or client"
            }
        end },
    ["ClientRun"] = function(p4, p5, p6)
        local v7 = v_u_1("new:LimitedsDisplayClient")
        local v8 = v_u_1("package:inspect")
        if p6 ~= "server" then
            for _, v9 in p5 do
                local v10 = ("CAMPAIGN %*"):format(v9)
                p4:Reply(v10)
                print(v10)
                local v11 = v7.get_client_stats(v9)
                local v12 = string.rep("  ", 1)
                local v13 = v12 .. string.gsub("STATS:", "\n", "\n" .. v12)
                p4:Reply(v13)
                print(v13)
                local v14 = v8(v11)
                local v15 = string.rep("  ", 2)
                local v16 = v15 .. string.gsub(v14, "\n", "\n" .. v15)
                p4:Reply(v16)
                print(v16)
            end
            return ""
        end
    end
}