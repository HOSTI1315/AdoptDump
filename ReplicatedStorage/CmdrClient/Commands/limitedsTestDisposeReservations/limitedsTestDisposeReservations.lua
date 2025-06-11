--// ReplicatedStorage.CmdrClient.Commands.limitedsTestDisposeReservations (ModuleScript)

local v2 = {
    ["Name"] = "limitedsTestDisposeReservation",
    ["Aliases"] = {},
    ["Description"] = "Throws away reservations. Use to lower reservation count for testing.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").limitedsCampaign(),
                ["Name"] = "Campaign",
                ["Description"] = "The campaign to throw away reservations for"
            }
        end,
        {
            ["Type"] = "number",
            ["Name"] = "Count",
            ["Description"] = "The number of reservations to throw away"
        },
        {
            ["Type"] = "playerId",
            ["Name"] = "UserId",
            ["Description"] = "The user to claim reservations under",
            ["Optional"] = true
        }
    }
}
return v2