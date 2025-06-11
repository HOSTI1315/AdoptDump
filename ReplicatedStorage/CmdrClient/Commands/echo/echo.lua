--// ReplicatedStorage.CmdrClient.Commands.echo (ModuleScript)

local v2 = {
    ["Name"] = "echo",
    ["Aliases"] = { "=" },
    ["Description"] = "Echoes your text back to you.",
    ["Group"] = "DefaultUtil",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "Text",
            ["Description"] = "The text."
        }
    },
    ["ClientRun"] = function(_, p1)
        return p1
    end
}
return v2