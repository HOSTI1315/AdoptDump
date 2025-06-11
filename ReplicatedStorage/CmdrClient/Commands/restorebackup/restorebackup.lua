--// ReplicatedStorage.CmdrClient.Commands.restorebackup (ModuleScript)

local v1 = {
    ["Name"] = "restorebackup",
    ["Aliases"] = {},
    ["Description"] = "Restore the backup of a user.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Confirm Player",
            ["Description"] = "Confirm the ID of the player who you are restoring a backup."
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Backup number",
            ["Description"] = "The result number that you see from the `backups` command."
        }
    }
}
return v1