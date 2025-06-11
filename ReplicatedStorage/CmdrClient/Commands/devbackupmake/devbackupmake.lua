--// ReplicatedStorage.CmdrClient.Commands.devbackupmake (ModuleScript)

local v2 = {
    ["Name"] = "devBackupMake",
    ["Aliases"] = {},
    ["Description"] = "Backup the player\'s data to be restored later.",
    ["Group"] = "Admin",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("option", { "mine", "shared" }),
                ["Name"] = "To",
                ["Description"] = "Whose list to save to"
            }
        end,
        {
            ["Type"] = "string",
            ["Name"] = "Name",
            ["Description"] = "The name of the backup"
        },
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player whose data to backup (default: you)",
            ["Optional"] = true
        }
    }
}
return v2