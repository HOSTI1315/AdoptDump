--// ReplicatedStorage.CmdrClient.Commands.minigameRewards (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v8 = {
    ["Name"] = "minigame_rewards",
    ["Aliases"] = {},
    ["Description"] = "Shows minigame rewards",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "Number of rewards",
            ["Description"] = "Number of rewards to show",
            ["Default"] = 3
        }
    },
    ["ClientRun"] = function(_, p2)
        local v3 = v_u_1("UIManager")
        local v4 = {}
        for v5 = 1, p2 do
            local v6 = {
                ["title"] = "REWARD " .. v5,
                ["value"] = "x" .. v5 * 1000
            }
            table.insert(v4, v6)
        end
        local v7 = {
            ["reward"] = {
                ["title"] = "TEST REWARD!",
                ["currency"] = "gingerbread"
            },
            ["results"] = v4
        }
        v3.apps.MinigameRewardsApp:display(v7)
    end
}
return v8