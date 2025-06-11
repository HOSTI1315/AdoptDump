--// ReplicatedStorage.CmdrClient.Commands.limitedsTestClaimReservation (ModuleScript)

local v3 = {
    ["Name"] = "limitedsTestClaimReservation",
    ["Aliases"] = {},
    ["Description"] = "Claims a reservation.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").limitedsCampaign(),
                ["Name"] = "Campaign",
                ["Description"] = "The campaign to claim under"
            }
        end,
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "Player to claim for."
        },
        function(p2)
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("Type", { "PurchasePrompt", "Prefetch", "ReleaseLate" }),
                ["Name"] = "Claim Type",
                ["Description"] = "The type of claim to perform.\n PurchasePrompt: normal reservation, any number per player.\n Prefetch: one reservation per player, cleared when player presses no on pre-purchase prompt prompt.\n ReleaseLate: one reservation per player, cleared when player re-joins the game."
            }
        end
    }
}
return v3