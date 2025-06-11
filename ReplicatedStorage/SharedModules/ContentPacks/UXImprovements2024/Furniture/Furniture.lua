--// ReplicatedStorage.SharedModules.ContentPacks.UXImprovements2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("EntryHelper")
local v3 = v1("FurnitureUseHelperDB")
local v4 = v2.furniture
local v5 = {}
local v6 = {
    ["name"] = "Cole",
    ["model_name"] = "TransportRecolorNPC",
    ["behavior"] = v3.RECOLOR_NPC({
        ["name"] = "Cole",
        ["price"] = 50,
        ["visible_backpack_categories"] = { "transport" },
        ["no_results_text"] = "You do not have any recolorable vehicles."
    })
}
v5.transport_recolor_npc = v6
return v4(v5)