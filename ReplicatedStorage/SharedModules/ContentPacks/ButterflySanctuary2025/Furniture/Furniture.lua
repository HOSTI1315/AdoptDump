--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("NPCHelper")
local v4 = v2.furniture
local v5 = {
    ["butterfly_2025_cricket"] = {
        ["name"] = "Cricket",
        ["model_name"] = "Butterfly2025Cricket",
        ["behavior"] = v3.NPC_SIMPLE("butterfly_2025_cricket")
    },
    ["butterfly_2025_joni"] = {
        ["name"] = "Joni",
        ["model_name"] = "Butterfly2025Joni",
        ["behavior"] = v3.NPC_SIMPLE("butterfly_2025_joni")
    }
}
return v4(v5)