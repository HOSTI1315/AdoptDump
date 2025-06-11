--// ReplicatedStorage.CmdrClient.Commands.killTutorial (ModuleScript)

return {
    ["Name"] = "killTutorial",
    ["Aliases"] = {},
    ["Description"] = "Ends the tutorial if active.",
    ["Group"] = "Debug",
    ["Args"] = {},
    ["ClientRun"] = function(_)
        return require(game.ReplicatedStorage.Fsys).load("LegacyTutorial").cancel_tutorial() and "Successfully killed the tutorial" or "Failed to kill the tutorial"
    end
}