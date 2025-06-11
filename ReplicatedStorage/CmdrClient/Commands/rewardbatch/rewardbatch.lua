--// ReplicatedStorage.CmdrClient.Commands.rewardbatch (ModuleScript)

return {
    ["Name"] = "rewardBatch",
    ["Aliases"] = { "r" },
    ["Description"] = "Performs batch reward operations.",
    ["Group"] = "Debug",
    ["Args"] = { function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("action", {
                    "s",
                    "start",
                    "c",
                    "commit",
                    "d",
                    "discard"
                }),
                ["Name"] = "Action",
                ["Description"] = "The meta-action to perform:\n- start begins a reward bundle\n- commit runs all actions in the bundle\n- discard cancels the bundle and discards all actions"
            }
        end }
}