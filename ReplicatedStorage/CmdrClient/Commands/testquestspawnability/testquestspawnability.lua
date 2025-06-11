--// ReplicatedStorage.CmdrClient.Commands.testquestspawnability (ModuleScript)

local v1 = {
    ["Name"] = "testQuestSpawnability",
    ["Aliases"] = {},
    ["Description"] = "Choose whether to test spawnability. See the cmdr window when spawning a new quest for info.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "Test",
            ["Description"] = "Whether to test spawnability.",
            ["Optional"] = false
        }
    }
}
return v1