--// ReplicatedStorage.CmdrClient.Commands.progresspet (ModuleScript)

local v1 = {
    ["Name"] = "progresspet",
    ["Aliases"] = {},
    ["Description"] = "Progresses your pet by the given amount.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "number",
            ["Name"] = "Pet XP",
            ["Description"] = "The amount of ailments to complete on the pet."
        }
    }
}
return v1