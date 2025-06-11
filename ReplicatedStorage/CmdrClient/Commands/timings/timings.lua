--// ReplicatedStorage.CmdrClient.Commands.timings (ModuleScript)

local v6 = {
    ["Name"] = "timings",
    ["Aliases"] = {},
    ["Description"] = "Prints logged internal timings for different scenarios",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("TimingsScenario", { "initial_client_load", "interiorsm_enter_last" }),
                ["Name"] = "Timings Scenario",
                ["Description"] = "The scenario to print the timings for."
            }
        end,
        {
            ["Type"] = "number",
            ["Name"] = "Min Value",
            ["Description"] = "The minimum value necessary to print a misc timing. Defaults to 0.2",
            ["Optional"] = true
        }
    },
    ["Run"] = function(_, p2, p3)
        local v4 = require(game.ReplicatedFirst.Load.LoadTimers)
        local v5 = ("Primary Timings:\n%*\n\nMisc Timings:\n%*"):format(v4.get_primary_timer_values_str(p2), (v4.get_misc_timer_values_str(p2, {
            ["sort_type"] = "key",
            ["min_value"] = p3 or 0.2
        })))
        print(v5)
        return v5
    end
}
return v6