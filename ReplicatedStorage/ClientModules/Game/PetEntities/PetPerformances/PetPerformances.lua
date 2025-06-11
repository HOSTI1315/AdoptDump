--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformances (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("PetPerformanceName")
local v3 = {}
for _, v4 in pairs(v2) do
    v3[v4] = v1(v4 .. "Performance")
end
return v3