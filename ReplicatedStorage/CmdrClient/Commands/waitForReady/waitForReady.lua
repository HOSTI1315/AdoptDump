--// ReplicatedStorage.CmdrClient.Commands.waitForReady (ModuleScript)

return {
    ["Name"] = "wait-for-ready",
    ["Aliases"] = {},
    ["Description"] = "Waits for the player character to be ready",
    ["Group"] = "EveryoneOnRobloxInTesting",
    ["Args"] = {},
    ["ClientRun"] = function(p1)
        if not p1.Executor.Character then
            p1.Executor.CharacterAdded:Wait()
        end
        return ""
    end
}