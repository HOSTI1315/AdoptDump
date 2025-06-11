--// ReplicatedStorage.CmdrClient.Commands.limitedsTestAssignCampaign (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("DeveloperProductDB")
return {
    ["Name"] = "limitedsTestAssignCampaign",
    ["Aliases"] = {},
    ["Description"] = "Assigns products to a campaign. NOTE: ASSIGNED CAMPAIGNS ARE ONLY ACCURATE FOR THIS SERVER.",
    ["Group"] = "Debug",
    ["Args"] = { function(p2)
            return {
                ["Type"] = p2.Cmdr.Registry:GetStore("InstancedArgTypes").limitedsCampaign(),
                ["Name"] = "Campaign",
                ["Description"] = "The campaign to assign products to."
            }
        end, function(p3)
            local v4 = {}
            for v5, _ in v_u_1 do
                table.insert(v4, v5)
            end
            table.sort(v4)
            return {
                ["Type"] = p3.Cmdr.Util.MakeListableType(p3.Cmdr.Util.MakeEnumType("Product", v4)),
                ["Name"] = "Products",
                ["Description"] = "The developer products to assign to the campaign."
            }
        end }
}