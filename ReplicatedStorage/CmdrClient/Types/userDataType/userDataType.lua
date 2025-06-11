--// ReplicatedStorage.CmdrClient.Types.userDataType (ModuleScript)

return function(p1)
    p1:RegisterType("userDataType", p1.Cmdr.Util.MakeEnumType("User Data Type", {
        {
            ["Name"] = "AllData",
            ["Custom"] = "cleardata"
        },
        {
            ["Name"] = "Houses",
            ["Reward"] = "clearhouses"
        },
        {
            ["Name"] = "ManualRewards",
            ["Custom"] = "clear_manual_rewards"
        },
        {
            ["Name"] = "ABTests",
            ["Reward"] = "clearabdata"
        }
    }))
end