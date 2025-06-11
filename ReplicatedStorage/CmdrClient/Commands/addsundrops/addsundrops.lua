--// ReplicatedStorage.CmdrClient.Commands.addsundrops (ModuleScript)

local v1 = {
    ["Name"] = "addsundrops",
    ["Aliases"] = {},
    ["Description"] = "Adds sundrops",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "number",
            ["Name"] = "Amount",
            ["Description"] = "The amount to give.",
            ["Optional"] = false
        },
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The player to give the quest to.",
            ["Optional"] = true
        }
    }
}
return v1