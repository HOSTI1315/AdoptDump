--// ReplicatedStorage.CmdrClient.Commands.openPlayerProfile (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v5 = {
    ["Name"] = "open_player_profile",
    ["Aliases"] = { "pp" },
    ["Description"] = "Opens the player profile for a given user",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player whose profile to open.",
            ["Optional"] = true
        }
    },
    ["ClientRun"] = function(p2, p3)
        local v4 = p3 or p2.Executor.UserId
        if v_u_1("UIManager").apps.PlayerProfileApp:open_player_profile_for_user_id(v4) then
            return ("Opened player profile for %s"):format(v4)
        else
            return ("Could not open player profile for %s"):format(v4)
        end
    end
}
return v5