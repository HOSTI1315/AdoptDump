--// ReplicatedStorage.CmdrClient.Commands.limitedsTestSetEnabled (ModuleScript)

local v1 = {
    ["Name"] = "limitedsTestSetEnabled",
    ["Aliases"] = {},
    ["Description"] = "Test functionality of limiteds system when enabled vs disabled.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "Enabled",
            ["Description"] = "Whether the limiteds system is enabled.",
            ["Optional"] = true
        }
    }
}
return v1