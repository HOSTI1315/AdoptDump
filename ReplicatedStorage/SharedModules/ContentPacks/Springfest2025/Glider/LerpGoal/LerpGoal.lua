--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.Glider.LerpGoal (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("Class")("LerpGoal")
function v1.__init(p2, p3, p4)
    local v5 = type(p4) == "number"
    assert(v5, "LerpGoal currently only supports number types.")
    p2.speed = p3
    p2.position = p4
    p2.goal = p4
end
function v1.update(p6, p7)
    local v8 = p6.position
    local v9 = p6.goal
    local v10 = p7 * p6.speed
    p6.position = v8 + (v9 - v8) * v10
    return p6.position
end
function v1.set_goal(p11, p12)
    p11.goal = p12
end
function v1.set_position(p13, p14)
    p13.position = p14
    p13.goal = p14
end
function v1.get_position(p15)
    return p15.position
end
function v1.reset(p16, p17)
    p16.position = p17
    p16.goal = p17
end
return v1