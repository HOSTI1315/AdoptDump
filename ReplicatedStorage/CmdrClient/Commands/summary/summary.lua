--// ReplicatedStorage.CmdrClient.Commands.summary (ModuleScript)

local v1 = {
    ["Name"] = "summary",
    ["Aliases"] = {},
    ["Description"] = "Summarizes changes to an account\'s inventory over time",
    ["Group"] = "Admin",
    ["AutoExec"] = { "alias copy_last_summary dialog ${var .summary_report}" },
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "Player"
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Range start",
            ["Description"] = "How long ago to begin search range (Ex: 5days) Default: 5days",
            ["Optional"] = true
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Range end",
            ["Description"] = "How long ago to end search range (Ex: 1days) Default: now",
            ["Optional"] = true
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Timeout",
            ["Description"] = "How long until search should be cancelled and found results returned (Ex: 60seconds) Default: 60seconds",
            ["Optional"] = true
        }
    }
}
return v1