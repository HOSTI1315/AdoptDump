--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.QuestApp.QuestTabDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("WelcomeWeekClient")
local v2 = {
    {
        ["name"] = "default",
        ["text"] = "TASK BOARD",
        ["icon"] = "rbxassetid://109593436409007"
    },
    {
        ["name"] = "welcome_week",
        ["text"] = "WELCOME TASKS",
        ["icon"] = "rbxassetid://92359954165995",
        ["render"] = v1.render_tab,
        ["is_visible"] = v1.is_active
    }
}
for v3, v4 in v2 do
    v4.index = v3
end
return v2