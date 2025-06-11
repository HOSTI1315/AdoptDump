--// ReplicatedStorage.CmdrClient.Commands.devbackupdelete (ModuleScript)

local v2 = {
    ["Name"] = "devBackupDelete",
    ["Aliases"] = {},
    ["Description"] = "Deletes a backup made with devbackup.",
    ["Group"] = "Admin",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("option", { "mine", "shared" }),
                ["Name"] = "From",
                ["Description"] = "Which backup list to delete from"
            }
        end,
        {
            ["Type"] = "string",
            ["Name"] = "Name",
            ["Description"] = "The name of the backup"
        }
    }
}
return v2