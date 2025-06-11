--// ReplicatedStorage.CmdrClient.Commands.groupRewardOverride (ModuleScript)

local v1 = {
    ["Name"] = "groupRewardOverride",
    ["Aliases"] = {},
    ["Description"] = "Set different group to test the like + group reward with.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "Group ID",
            ["Description"] = "ID of group to use for testing",
            ["Optional"] = true
        }
    }
}
return v1