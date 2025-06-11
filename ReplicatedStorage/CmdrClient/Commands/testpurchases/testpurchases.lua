--// ReplicatedStorage.CmdrClient.Commands.testpurchases (ModuleScript)

return {
    ["Name"] = "testPurchases",
    ["Aliases"] = {},
    ["Description"] = "Runs a developer product purchase test",
    ["Group"] = "Debug",
    ["Args"] = { function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("Test", {
                    "success_single",
                    "success_many",
                    "success_many_rejoin",
                    "failure_single",
                    "failure_one_of_many"
                }),
                ["Name"] = "Test",
                ["Description"] = "The test to run."
            }
        end }
}