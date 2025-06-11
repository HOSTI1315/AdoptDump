--// ReplicatedStorage.CmdrClient.Commands.testmissingproperties (ModuleScript)

local v1 = {
    ["Name"] = "testMissingProperties",
    ["Aliases"] = {},
    ["Description"] = "Tests if items are missing properties when added.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player to test on."
        },
        {
            ["Type"] = "number",
            ["Name"] = "Delay",
            ["Description"] = "The delay caused by the transaction. 0 = none"
        }
    }
}
return v1