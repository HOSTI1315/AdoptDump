--// ReplicatedStorage.CmdrClient.Commands.version (ModuleScript)

return {
    ["Name"] = "version",
    ["Args"] = {},
    ["Description"] = "Shows the current version of Cmdr",
    ["Group"] = "DefaultDebug",
    ["ClientRun"] = function()
        return ("Cmdr Version %s"):format("v1.12.0")
    end
}