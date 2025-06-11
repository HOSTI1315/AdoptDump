--// ReplicatedStorage.CmdrClient.Commands.tool (ModuleScript)

local v1 = {
    ["Name"] = "tool",
    ["Aliases"] = {},
    ["Description"] = "Give a tool to player(s)",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "tool",
            ["Name"] = "Tool name",
            ["Description"] = "The tool to give"
        },
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players to give the tool to",
            ["Optional"] = true
        }
    }
}
return v1