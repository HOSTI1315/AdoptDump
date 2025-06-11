--// ReplicatedStorage.CmdrClient.Commands.time (ModuleScript)

local v1 = {
    ["Name"] = "time",
    ["Aliases"] = {},
    ["Description"] = "Set the in-game time",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "timeOfDay",
            ["Name"] = "Time",
            ["Description"] = "Time of Day"
        }
    }
}
return v1