--// ReplicatedStorage.CmdrClient.Commands.removelicense (ModuleScript)

local v1 = {
    ["Name"] = "removelicense",
    ["Aliases"] = {},
    ["Description"] = "Remove Trade License from a player\'s inventory.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player to take it from.",
            ["Optional"] = true
        }
    }
}
return v1