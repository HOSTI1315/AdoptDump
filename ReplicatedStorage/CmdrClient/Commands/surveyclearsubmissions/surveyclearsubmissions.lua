--// ReplicatedStorage.CmdrClient.Commands.surveyclearsubmissions (ModuleScript)

local v1 = {
    ["Name"] = "surveyclearsubmissions",
    ["Description"] = "Clear all Survey Submissions",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "The player to clear all survey submissions of.",
            ["Optional"] = true
        }
    }
}
return v1