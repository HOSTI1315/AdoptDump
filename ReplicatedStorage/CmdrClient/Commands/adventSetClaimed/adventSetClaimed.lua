--// ReplicatedStorage.CmdrClient.Commands.adventSetClaimed (ModuleScript)

local v1 = {
    ["Name"] = "adventSetClaimed",
    ["Aliases"] = {},
    ["Description"] = "Sets current advent claimed count",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "Amount",
            ["Description"] = "The number of rewards to set claimed to"
        }
    }
}
return v1