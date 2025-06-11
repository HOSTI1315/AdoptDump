--// ReplicatedStorage.CmdrClient.Commands.socialstones (ModuleScript)

local v1 = {
    ["Name"] = "socialstones",
    ["Aliases"] = {},
    ["Description"] = "Sets the amount of social stones that you have.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "operator",
            ["Name"] = "Operator",
            ["Description"] = "The operation to perform."
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Amount",
            ["Description"] = "The amount of social stones to set."
        },
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "The players to affect. Omit to affect yourself.",
            ["Optional"] = true
        }
    }
}
return v1