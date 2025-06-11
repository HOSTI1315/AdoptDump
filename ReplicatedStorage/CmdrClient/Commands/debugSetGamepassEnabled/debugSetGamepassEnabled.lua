--// ReplicatedStorage.CmdrClient.Commands.debugSetGamepassEnabled (ModuleScript)

local v1 = {
    ["Name"] = "debugSetGamepassEnabled",
    ["Description"] = "Temporarily enables/disables a gamepass.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "gamepass",
            ["Name"] = "Gamepass",
            ["Description"] = "The Gamepass kind to enable."
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "Enabled",
            ["Description"] = "Whether to enable or disable the gamepass. Defaults to true.",
            ["Optional"] = true
        }
    }
}
return v1