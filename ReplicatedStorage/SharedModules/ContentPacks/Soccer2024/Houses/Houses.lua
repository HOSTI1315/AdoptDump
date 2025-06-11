--// ReplicatedStorage.SharedModules.ContentPacks.Soccer2024.Houses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
v1("package:t")
local v2 = {
    ["soccer_house"] = {
        ["name"] = "Soccer Stadium",
        ["model_name"] = "SoccerHouse",
        ["image"] = "rbxassetid://18318564804",
        ["order"] = 307,
        ["gamepass"] = "soccer_2024_soccer_house_gamepass",
        ["is_for_sale"] = false,
        ["rarity"] = "house"
    }
}
return v1("EntryHelper").houses(v2)