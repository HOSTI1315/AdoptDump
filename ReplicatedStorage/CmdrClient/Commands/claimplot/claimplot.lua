--// ReplicatedStorage.CmdrClient.Commands.claimplot (ModuleScript)

local v1 = {
    ["Name"] = "claimplot",
    ["Aliases"] = {},
    ["Description"] = "Moves your house to the requested plot if available",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "plot",
            ["Name"] = "Plot",
            ["Description"] = "The plot to move to"
        }
    }
}
return v1