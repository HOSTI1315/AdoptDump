--// ReplicatedStorage.SharedModules.SharedDB.SpecialMultipliersDB (ModuleScript)

local v1 = {
    ["bucks"] = {},
    ["aging"] = {}
}
require(game.ReplicatedStorage.Fsys).load("ContentPackHelper").merge("SpecialMultipliers", {
    ["bucks"] = v1.bucks,
    ["aging"] = v1.aging
}, true)
return v1