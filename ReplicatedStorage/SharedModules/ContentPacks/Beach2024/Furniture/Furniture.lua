--// ReplicatedStorage.SharedModules.ContentPacks.Beach2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("NPCHelper")
local v4 = v2.furniture
local v5 = {
    ["beach_2024_captain_hambeard"] = {
        ["name"] = "Captain Hambeard",
        ["model_name"] = "Beach2024CaptainHambeard",
        ["behavior"] = v3.NPC_SIMPLE("beach_2024_captain_hambeard")
    },
    ["beach_2024_log"] = {
        ["name"] = "Log",
        ["model_name"] = "Beach2024Log",
        ["image_id"] = 2465951471
    }
}
return v4(v5)