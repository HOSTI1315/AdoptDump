--// ReplicatedStorage.CmdrClient.Commands.settradepolicydeadline (ModuleScript)

local v1 = {
    ["Name"] = "settradepolicydeadline",
    ["Aliases"] = {},
    ["Description"] = "Set the trade policy enforcement deadline for testing purposes",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "TimestampUTC",
            ["Description"] = "When trade policy enforcement will become active"
        }
    }
}
return v1