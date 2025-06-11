--// ReplicatedStorage.CmdrClient.Commands.addhouse (ModuleScript)

local v1 = {
    ["Name"] = "addhouse",
    ["Aliases"] = {},
    ["Description"] = "Adds a house to the given players.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "house",
            ["Name"] = "House",
            ["Description"] = "The house to add."
        },
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "The player to give the house to. If omitted, the house is added to you.",
            ["Optional"] = true
        }
    }
}
return v1