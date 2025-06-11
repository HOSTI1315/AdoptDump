--// ReplicatedStorage.ClientModules.Game.PetEntities.TopScoreFinder (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")("TopScoreFinder")
function v1.__init(p2, p3, ...)
    p2._highest_score = p3
    p2._highest_tuple = table.pack(...)
end
function v1.replace_if_better(p4, p5, ...)
    if not p4._highest_score or p4._highest_score <= p5 then
        p4._highest_score = p5
        p4._highest_tuple = table.pack(...)
    end
end
function v1.unpack(p6)
    local v7 = p6._highest_score
    local v8 = p6._highest_tuple
    local v9 = p6._highest_tuple.n
    return v7, unpack(v8, 1, v9)
end
return v1