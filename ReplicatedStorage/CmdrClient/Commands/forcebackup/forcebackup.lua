--// ReplicatedStorage.CmdrClient.Commands.forcebackup (ModuleScript)

local v1 = {
    ["Name"] = "forcebackup",
    ["Aliases"] = {},
    ["Description"] = "Force a backup to be made of the user\'s data",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player whose data to backup"
        }
    }
}
return v1