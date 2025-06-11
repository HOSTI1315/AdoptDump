--// ReplicatedStorage.CmdrClient.Commands.limitedsTestChatMessage (ModuleScript)

local v1 = {
    ["Name"] = "limitedsTestChatMessage",
    ["Aliases"] = {},
    ["Description"] = "Test chat message functionality of the limiteds system by inserting a dummy limited with a chat message scheduled for 10 seconds from now.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "Message",
            ["Description"] = "The message to display",
            ["Optional"] = true
        }
    }
}
return v1