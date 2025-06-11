--// ReplicatedStorage.CmdrClient.Commands.showNewsApp (ModuleScript)

return {
    ["Name"] = "show_news_app",
    ["Aliases"] = {},
    ["Description"] = "Shows the news app",
    ["Group"] = "Debug",
    ["Args"] = {},
    ["ClientRun"] = function(_, _)
        require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager").apps.NewsApp:show_news()
        return "Showed news app"
    end
}