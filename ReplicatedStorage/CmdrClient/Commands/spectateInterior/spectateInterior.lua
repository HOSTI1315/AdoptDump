--// ReplicatedStorage.CmdrClient.Commands.spectateInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
return {
    ["Name"] = "spectate_interior",
    ["Aliases"] = {},
    ["Description"] = "Spectate all other valid players in the current interior",
    ["Group"] = "Debug",
    ["Args"] = {},
    ["Run"] = function(_)
        local v2 = v_u_1("UIManager")
        local v3 = false
        for _, v4 in game.Players:GetPlayers() do
            if v2.apps.PlayerSpectateApp:can_watch(v4) then
                v2.apps.PlayerSpectateApp:watch(v4)
                v3 = true
            end
        end
        if not v3 then
            return "No valid players to spectate!"
        end
        v2.set_app_visibility("PlayerSpectateApp", true)
        return "Spectating players in current interior!"
    end
}