--// ReplicatedStorage.CmdrClient.Commands.devbackuprestore (ModuleScript)

local v4 = {
    ["Name"] = "devBackupRestore",
    ["Aliases"] = {},
    ["Description"] = "Restores a backup made with devbackup.",
    ["Group"] = "Admin",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("option", { "mine", "shared" }),
                ["Name"] = "From",
                ["Description"] = "Which backup list to pull from"
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
            ["Description"] = "The player to apply the backup to (default: you)",
            ["Optional"] = true
        },
        function(p2)
            local v3 = game:GetService("RunService"):IsStudio() and "no_teleport" or "reserved_server"
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("option", { "reserved_server", "public_server", "no_teleport" }),
                ["Name"] = "Teleport",
                ["Description"] = "Where to teleport the player to so that a new session starts (default: " .. v3 .. ")",
                ["Optional"] = true
            }
        end,
        {
            ["Type"] = "boolean",
            ["Name"] = "ForceProduction",
            ["Description"] = "Force the command to run on production servers.\nThis command is not transaction safe, and should typically only be used on developers or development server.",
            ["Optional"] = true
        }
    }
}
return v4