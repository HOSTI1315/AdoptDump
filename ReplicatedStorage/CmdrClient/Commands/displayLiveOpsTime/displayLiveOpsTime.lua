--// ReplicatedStorage.CmdrClient.Commands.displayLiveOpsTime (ModuleScript)

local v3 = {
    ["Name"] = "displayLiveOpsTime",
    ["Aliases"] = {},
    ["Description"] = "Displays the current live ops time to the cmdr console.",
    ["Group"] = "DeveloperDebug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "As date time",
            ["Description"] = "Show live ops time as a date and time",
            ["Default"] = true
        }
    },
    ["ClientRun"] = function(_, p1)
        local v2 = require(game.ReplicatedStorage.Fsys).load("LiveOpsTime").now()
        if p1 then
            return DateTime.fromUnixTimestamp(v2):ToIsoDate()
        else
            return v2
        end
    end
}
return v3