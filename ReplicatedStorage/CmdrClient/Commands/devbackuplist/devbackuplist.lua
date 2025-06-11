--// ReplicatedStorage.CmdrClient.Commands.devbackuplist (ModuleScript)

local v3 = {
    ["Name"] = "devBackupList",
    ["Aliases"] = {},
    ["Description"] = "Lists backups made with devbackup.",
    ["Group"] = "Admin",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("option", { "mine", "shared" }),
                ["Name"] = "From",
                ["Description"] = "Which backup list to show"
            }
        end,
        function(p2)
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("option", {
                    "created_desc",
                    "created_asc",
                    "alpha_desc",
                    "alpha_asc"
                }),
                ["Name"] = "Sort",
                ["Description"] = "How to sort the list (default: created_desc)",
                ["Optional"] = true
            }
        end,
        {
            ["Type"] = "string",
            ["Name"] = "Filter",
            ["Description"] = "A filter to apply to the list.\nSearch is case-insensitive. * acts as wildcard.\nSearch specific properties using \'property:value\' or \'property:*value\'\nProperties: name, branch, universe, creator, target, created\nApply multiple filters by separating them with a space.",
            ["Optional"] = true
        }
    }
}
return v3