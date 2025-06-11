--// ReplicatedStorage.CmdrClient.Commands.flag (ModuleScript)

local v1 = {
    ["Name"] = "flag",
    ["Aliases"] = {},
    ["Description"] = "Sets the value of a gameplay flag",
    ["Group"] = "Staff",
    ["Args"] = {
        {
            ["Type"] = "flag",
            ["Name"] = "Flag",
            ["Description"] = "The flag to set."
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "State",
            ["Description"] = "The flag\'s new value.",
            ["Optional"] = true
        }
    }
}
return v1