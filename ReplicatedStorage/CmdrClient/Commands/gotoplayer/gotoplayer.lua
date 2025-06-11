--// ReplicatedStorage.CmdrClient.Commands.gotoplayer (ModuleScript)

local v1 = {
    ["Name"] = "goto-player",
    ["Aliases"] = {},
    ["Description"] = "Follows a player",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player to follow."
        },
        {
            ["Type"] = "players",
            ["Name"] = "WhoToTeleport",
            ["Description"] = "Which players should be teleported. [Default: just you]",
            ["Optional"] = true
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "CanLeavePlace",
            ["Description"] = "Whether teleporting outside of the current place is allowed. [Default: false]",
            ["Optional"] = true
        }
    }
}
return v1