--// ReplicatedStorage.CmdrClient.Commands.duplicatecheck (ModuleScript)

local v2 = {
    ["Name"] = "duplicateCheck",
    ["Aliases"] = {},
    ["Description"] = "Check and fix duplicates for players",
    ["Group"] = "Admin",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("RunMode", { "check", "fix" }),
                ["Name"] = "RunMode",
                ["Description"] = "What to do with the processed files."
            }
        end,
        {
            ["Type"] = "string",
            ["Name"] = "Players",
            ["Description"] = "The player ids to check and fix duplicates for (comma-separated list)"
        }
    }
}
return v2