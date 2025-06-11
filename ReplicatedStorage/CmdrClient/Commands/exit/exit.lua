--// ReplicatedStorage.CmdrClient.Commands.exit (ModuleScript)

return {
    ["Name"] = "exit",
    ["Aliases"] = {},
    ["Description"] = "Closes Cmdr",
    ["Group"] = "EveryoneOnRobloxInTesting",
    ["Args"] = {},
    ["ClientRun"] = function(p1)
        p1.Cmdr:Hide()
        return ""
    end
}