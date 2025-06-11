--// ReplicatedStorage.CmdrClient.Commands.announce (ModuleScript)

local v1 = {
    ["Name"] = "announce",
    ["Aliases"] = { "m" },
    ["Description"] = "Makes a server-wide announcement.",
    ["Group"] = "DefaultAdmin",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "text",
            ["Description"] = "The announcement text."
        }
    }
}
return v1