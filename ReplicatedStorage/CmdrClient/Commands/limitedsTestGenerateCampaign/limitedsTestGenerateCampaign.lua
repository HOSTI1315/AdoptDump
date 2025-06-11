--// ReplicatedStorage.CmdrClient.Commands.limitedsTestGenerateCampaign (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("DeveloperProductDB")
return {
    ["Name"] = "limitedsTestGenerateCampaign",
    ["Aliases"] = {},
    ["Description"] = "Generate a test campaign and assign it to some developer products. NOTE: GENERATED CAMPAIGNS ARE ONLY ACTIVE FOR THIS SERVER.",
    ["Group"] = "Debug",
    ["Args"] = { function(p2)
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("Preset", {
                    "one_reservation",
                    "two_reservations",
                    "starts_soon",
                    "one_per_player",
                    "two_per_player",
                    "simultaneous_drops",
                    "oversold_stock_protection",
                    "prediction_at_zero"
                }),
                ["Name"] = "Campaign Type",
                ["Description"] = "The type of campaign to generate."
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