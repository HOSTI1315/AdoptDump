--// ReplicatedStorage.CmdrClient.Commands.showstarterpack (ModuleScript)

return {
    ["Name"] = "show_starter_pack",
    ["Aliases"] = {},
    ["Description"] = "Shows the starter pack dialog.",
    ["Group"] = "Debug",
    ["Args"] = {},
    ["ClientRun"] = function(_)
        require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager").apps.FTUEStarterPackApp:try_show()
        return "Showed StarterPackApp"
    end
}