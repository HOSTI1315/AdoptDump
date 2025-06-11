--// ReplicatedStorage.CmdrClient.Commands.viewbackup (ModuleScript)

local v1 = {
    ["Name"] = "viewbackup",
    ["Aliases"] = {},
    ["Description"] = "View the backup of a user.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "Backup number",
            ["Description"] = "The result number that you see from the `backups` command."
        },
        {
            ["Type"] = "filter",
            ["Name"] = "Filter Pattern",
            ["Description"] = "Filters result",
            ["Optional"] = true
        }
    }
}
return v1