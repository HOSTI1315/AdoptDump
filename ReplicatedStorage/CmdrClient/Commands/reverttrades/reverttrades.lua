--// ReplicatedStorage.CmdrClient.Commands.reverttrades (ModuleScript)

local v1 = {
    ["Name"] = "reverttrades",
    ["Aliases"] = {},
    ["Description"] = "Reverts all the user\'s reported trades in the given timeframe.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Victim player",
            ["Description"] = "The player whose reported trades should be reverted."
        },
        {
            ["Type"] = "scamReportReason",
            ["Name"] = "Scam Report Reason",
            ["Description"] = "Revert all trades with the given report reason only."
        },
        {
            ["Type"] = "date",
            ["Name"] = "Start Date",
            ["Description"] = "The start date of the timeframe."
        },
        {
            ["Type"] = "date",
            ["Name"] = "End Date",
            ["Description"] = "The end date of the timeframe (defaults to now).",
            ["Optional"] = true
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Untradeable Period (Days)",
            ["Description"] = "The amount of time the returned items will be untradeable, in days.",
            ["Default"] = 30
        }
    }
}
return v1