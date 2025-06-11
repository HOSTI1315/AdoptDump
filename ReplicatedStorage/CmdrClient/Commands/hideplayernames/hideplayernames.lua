--// ReplicatedStorage.CmdrClient.Commands.hideplayernames (ModuleScript)

local v2 = {
    ["Name"] = "hideplayernames",
    ["Aliases"] = {},
    ["Description"] = "Hide all player names for screenshots.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "State",
            ["Description"] = "Whether to hide all names.",
            ["Optional"] = false
        }
    },
    ["ClientRun"] = function(_, p1)
        require(game.ReplicatedStorage.Fsys).load("UIManager").apps.PlayerNameApp:set_hidden(p1)
        return "Set hidden to " .. tostring(p1) .. "."
    end
}
return v2