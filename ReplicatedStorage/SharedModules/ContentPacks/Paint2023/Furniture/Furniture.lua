--// ReplicatedStorage.SharedModules.ContentPacks.Paint2023.Furniture (ModuleScript)

local v1 = {
    ["paint_sealer_npc"] = {
        ["name"] = "Rusty",
        ["model_name"] = "PaintSealerNPC"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)