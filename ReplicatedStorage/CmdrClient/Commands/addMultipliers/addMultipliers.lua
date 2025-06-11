--// ReplicatedStorage.CmdrClient.Commands.addMultipliers (ModuleScript)

local v1 = {
    ["Name"] = "addmultipliers",
    ["Aliases"] = { "add_bonus" },
    ["Description"] = "Adds server multipliers.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "Bucks",
            ["Description"] = "Bucks multiplier.",
            ["Optional"] = true
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Aging",
            ["Description"] = "Aging multiplier.",
            ["Optional"] = true
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Duration",
            ["Description"] = "Duration for multipliers to last, in seconds.",
            ["Optional"] = true
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Offset",
            ["Description"] = "If a duration and offset are set, the multiplier will start an offset time from now.",
            ["Optional"] = true
        },
        {
            ["Type"] = "string",
            ["Name"] = "Key",
            ["Description"] = "Unique multiplier key.",
            ["Optional"] = true
        }
    }
}
return v1