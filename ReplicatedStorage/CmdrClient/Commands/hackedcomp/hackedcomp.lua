--// ReplicatedStorage.CmdrClient.Commands.hackedcomp (ModuleScript)

local v1 = {
    ["Name"] = "hackedcomp",
    ["Aliases"] = {},
    ["Description"] = "Adds a \"hacked compensation package\" to the given user.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "number",
            ["Name"] = "Tier",
            ["Description"] = "The tier of compensation between 1 and 3"
        },
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player that gets the compensation package"
        }
    }
}
return v1