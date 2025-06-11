--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("ContentPackHelper")
local v3 = v1("EntryHelper")
local v4 = v1("FurnitureUseHelperDB")
local v5 = v2.load_module("Springfest2025", "DanceArcadeStandBehavior")
local v6 = v3.furniture
local v7 = {}
local v8 = {
    ["name"] = "Invisible Blanket",
    ["model_name"] = "Spring2025InvisibleBlanket",
    ["behavior"] = v4.BASIC_FURNITURE({
        ["use_text"] = "Sit",
        ["animation"] = "Sit2"
    })
}
v7.spring_2025_invisible_blanket = v8
local v9 = {
    ["name"] = "Invisible Blanket",
    ["model_name"] = "Spring2025InvisibleBlanketSquare",
    ["behavior"] = v4.BASIC_FURNITURE({
        ["use_text"] = "Sit",
        ["animation"] = "Sit2"
    })
}
v7.spring_2025_invisible_blanket_square = v9
v7.spring_2025_dance_arcade_stand = {
    ["name"] = "Dance Arcade Stand",
    ["model_name"] = "Spring2025DanceArcadeStand",
    ["behavior"] = v5()
}
return v6(v7)