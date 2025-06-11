--// ReplicatedStorage.CmdrClient.Commands.viewpolicy (ModuleScript)

local v1 = {
    ["Name"] = "viewpolicy",
    ["Aliases"] = {},
    ["Description"] = "View compliance policy values",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players to show policy information for"
        }
    }
}
return v1