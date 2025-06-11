--// ReplicatedStorage.CmdrClient.Commands.setailmentspawningpaused (ModuleScript)

return {
    ["Name"] = "setailmentspawningpaused",
    ["Aliases"] = {},
    ["Description"] = "Enable or disable ailment spawning.",
    ["Group"] = "Debug",
    ["Args"] = { function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("PauseMode", {
                    "pause_all",
                    "pause_random",
                    "pause_guaranteed",
                    "enable_all"
                }),
                ["Name"] = "Pause Mode",
                ["Description"] = "Ailment spawning pause mode",
                ["Default"] = { "pause_all" }
            }
        end }
}