--// ReplicatedStorage.CmdrClient.Commands.minigamelobby (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
return {
    ["Name"] = "minigamelobby",
    ["Aliases"] = { "l" },
    ["Description"] = "Attempt to create a new minigame lobby.",
    ["Group"] = "Debug",
    ["Args"] = { function(p2)
            return {
                ["Type"] = p2.Cmdr.Registry:GetStore("InstancedArgTypes").minigameId(),
                ["Name"] = "Minigame Id",
                ["Description"] = "The id of the minigame."
            }
        end },
    ["ClientRun"] = function(_, p3)
        return v_u_1("MinigameLobbyClient").try_create_lobby(p3) and "Created lobby." or "Failed to create lobby."
    end
}