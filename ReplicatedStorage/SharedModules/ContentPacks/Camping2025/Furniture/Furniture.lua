--// ReplicatedStorage.SharedModules.ContentPacks.Camping2025.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("NPCHelper")
local v4 = v2.furniture
local v5 = {
    ["camping_2025_miece"] = {
        ["name"] = "Miece",
        ["model_name"] = "Camping2025Miece",
        ["behavior"] = v3.NPC_SIMPLE("camping_2025_miece")
    }
}
return v4(v5)