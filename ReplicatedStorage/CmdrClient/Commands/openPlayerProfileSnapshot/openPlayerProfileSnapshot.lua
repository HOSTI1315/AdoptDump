--// ReplicatedStorage.CmdrClient.Commands.openPlayerProfileSnapshot (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = {
    ["Name"] = "open_player_profile_snapshot",
    ["Aliases"] = { "pps" },
    ["Description"] = "Opens the given player profile snapshot",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "Snapshot",
            ["Description"] = "JSON Encoded snapshot."
        }
    },
    ["ClientRun"] = function(_, p2)
        return v_u_1("UIManager").apps.PlayerProfileApp:open_player_profile_snapshot(p2) and "Opened player profile snapshot." or "Could not open player profile snapshot."
    end
}
return v3