--// ReplicatedStorage.CmdrClient.Commands.currency (ModuleScript)

local v1 = {
    ["Name"] = "currency",
    ["Aliases"] = { "c" },
    ["Description"] = "Sets the amount of currency that you have.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "currency",
            ["Name"] = "Currency",
            ["Description"] = "The type of currency to set."
        },
        {
            ["Type"] = "operator",
            ["Name"] = "Operator",
            ["Description"] = "The operation to perform."
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Amount",
            ["Description"] = "The amount of currency to set."
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