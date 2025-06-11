--// ReplicatedStorage.CmdrClient.Commands.offsetLiveOpsTime (ModuleScript)

local v1 = {
    ["Name"] = "offsetLiveOpsTime",
    ["Aliases"] = {},
    ["Description"] = "Adjusts the Live Ops time offset.",
    ["Group"] = "DeveloperDebug",
    ["Args"] = {
        {
            ["Type"] = "duration",
            ["Name"] = "Adjustment",
            ["Description"] = "How much to adjust the Live Ops time by."
        }
    }
}
return v1