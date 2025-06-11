--// ReplicatedStorage.ClientModules.Game.Minigames.DebugMinigameClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
return v1("Class")("TestMinigameClient", (v1("MinigameClient"))).new({
    ["minigame_id"] = "debug_minigame",
    ["minigame_name"] = "Debug Minigame",
    ["minigame_destination_id"] = "DebugInterior",
    ["join_zone_destination_id"] = "MainMap",
    ["get_join_zone_model"] = function(p2)
        return p2:FindFirstChild("DebugMinigameJoinZone")
    end
})