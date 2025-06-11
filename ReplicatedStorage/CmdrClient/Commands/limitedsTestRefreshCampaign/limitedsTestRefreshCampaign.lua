--// ReplicatedStorage.CmdrClient.Commands.limitedsTestRefreshCampaign (ModuleScript)

return {
    ["Name"] = "limitedsTestRefreshCampaign",
    ["Aliases"] = {},
    ["Description"] = "Refreshes a campaign\'s information",
    ["Group"] = "Debug",
    ["Args"] = { function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").limitedsCampaign(),
                ["Name"] = "Campaign",
                ["Description"] = "The campaign to refresh"
            }
        end }
}