--// ReplicatedStorage.CmdrClient.Commands.setpolicy (ModuleScript)

local v1 = {
    ["Name"] = "setpolicy",
    ["Aliases"] = {},
    ["Description"] = "Set a compliance policy for testing",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "policy",
            ["Name"] = "Policy",
            ["Description"] = "The policy to set"
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "Value",
            ["Description"] = "The policy\'s new value"
        },
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players to affect.",
            ["Optional"] = true
        }
    }
}
return v1