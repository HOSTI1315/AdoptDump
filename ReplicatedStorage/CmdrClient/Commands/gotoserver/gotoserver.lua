--// ReplicatedStorage.CmdrClient.Commands.gotoserver (ModuleScript)

local v1 = {
    ["Name"] = "goto-server",
    ["Aliases"] = {},
    ["Description"] = "Teleports to a server of the current game.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "JobId(s)",
            ["Description"] = "The server id to teleport to. Provide a comma-separated list to try multiple servers. Prefix each job id with \'placeid:\' to specify place."
        },
        {
            ["Type"] = "players",
            ["Name"] = "WhoToTeleport",
            ["Description"] = "Which players should be teleported. [Default: just you]",
            ["Optional"] = true
        },
        {
            ["Type"] = "integer",
            ["Name"] = "PlaceId",
            ["Description"] = "The place id to teleport to. [Default: the current place]",
            ["Optional"] = true
        }
    }
}
return v1