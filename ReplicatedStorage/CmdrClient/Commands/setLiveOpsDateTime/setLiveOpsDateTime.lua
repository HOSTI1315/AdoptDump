--// ReplicatedStorage.CmdrClient.Commands.setLiveOpsDateTime (ModuleScript)

local v3 = {
    ["Name"] = "setLiveOpsDateTime",
    ["Aliases"] = {},
    ["Description"] = "Sets the Live Ops time to a specific date and time in PT.",
    ["Group"] = "DeveloperDebug",
    ["Args"] = {
        {
            ["Type"] = "date",
            ["Name"] = "Date",
            ["Description"] = "The target date."
        },
        {
            ["Type"] = "time24",
            ["Name"] = "Time",
            ["Description"] = "The target time (24 hour clock)."
        }
    },
    ["Data"] = function(_, p1, p2)
        return require(game.ReplicatedStorage.Fsys).load("TimeZoneHelper").from_region_datetime("PT", p1.year, p1.month, p1.day, p2.hour, p2.minute, p2.second)
    end
}
return v3