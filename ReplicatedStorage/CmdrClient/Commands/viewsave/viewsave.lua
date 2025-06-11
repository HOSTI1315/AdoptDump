--// ReplicatedStorage.CmdrClient.Commands.viewsave (ModuleScript)

local v1 = {
    ["Name"] = "viewsave",
    ["Aliases"] = { "v" },
    ["Description"] = "View the current save of a user.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player to view the backups of."
        }
    }
}
return v1